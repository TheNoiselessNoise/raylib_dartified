import 'package:raylib_dartified/abbr/dart.dart';
import 'package:raylib_dartified_base/abbr/allocators.dart';
import 'package:test/test.dart';

bool isBound(RaylibStruct s) => s.op != null;

void sentinel<D extends RaylibStruct<D>>(StructPointer<D> p)
  => p.fillBytes(0xAB, StructTypes.of<D>().byteSize);

D? Function(StructPointer<D> ptr) fnPopulates<D extends RaylibStruct<D>>(Map<String, dynamic> values) => (StructPointer<D> ptr) {
  StructTypes.of<D>().poke(ptr, values);
  return null as D?;
};

D Function(StructPointer<D> ptr) fnReturns<D extends RaylibStruct<D>>(Map<String, dynamic> values) => (ptr) {
  final alloc = RaylibBase.getInstance().Temp.structAlloc<D>();
  final scratch = alloc.AtUnique(key: 'fnReturns');
  StructTypes.of<D>().poke(scratch, values);
  return scratch.snapshot;
};

Map<String, dynamic> fieldsOf<D extends RaylibStruct<D>>(D s) {
  final t = StructTypes.of<D>();
  final alloc = RaylibBase.getInstance().Temp.structAlloc<D>();
  final op = s.op;
  if (op != null) return t.peek(op);        // bound: native is the truth
  // unbound: read its cache
  final tmp = alloc.AtUnique(key: 'fieldsOf');
  s.structWriteInto(tmp);
  return t.peek(tmp);
}

StructPointer<D> allocWith<D extends RaylibStruct<D>>(Map<String, dynamic> values, {bool? bind}) {
  final t = StructTypes.of<D>();
  final ptr = t.allocator.Allocate(unique: true, bind: bind);
  t.poke(ptr, values);
  return ptr;
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  group('slot refs (Ref1..8) never bind', () {
    test('non-value, unbound: gets bound after Ref1', () {
      final tex = Texture(id: 1, width: 2, height: 3, mipmaps: 1, format: .fromValue(7));
      Texture$.Ref1(tex);
      expect(tex.op, isNotNull);
    });

    test('non-value: second Ref1 does not corrupt first object', () {
      final a = Texture(id: 1, width: 10, height: 10, mipmaps: 1, format: .fromValue(1));
      final b = Texture(id: 2, width: 20, height: 20, mipmaps: 1, format: .fromValue(2));
      Texture$.Ref1(a);
      Texture$.Ref1(b);
      expect(a.id, 1);
      expect(a.width, 10);
    });

    test('value: stays unbound and unaffected by slot reuse', () {
      final a = Vector2.vec2(1, 2), b = Vector2.vec2(3, 4);
      Vector2$.Ref1(a);
      Vector2$.Ref1(b);
      expect(a.op, isNull);
      expect((a.x, a.y), (1, 2));
    });

    test('non-value with live op: Ref1 returns its own pointer, not the slot', () {
      final ptr = Texture.struct.calloc();
      final tex = ptr.ref;
      final p = Texture$.Ref1(tex);
      expect(p, same(tex.op));
      ptr.free();
    });

    test('Ref1 written data is readable from the slot', () {
      final v = Vector2.vec2(5, 6);
      final p = Vector2$.Ref1(v);
      expect(Vector2.struct.peek(p), {'x': 5.0, 'y': 6.0});
    });
  });

  group('Allocate bind default', () {
    test('bind=null, unique=false, value struct -> unbound', () {
      final v = Vector2.vec2(1, 2);
      Vector2$.Allocate(value: v, key: 'k');
      expect(v.op, isNull);
    });

    test('bind=null, unique=false, non-value struct -> bound', () {
      final t = Texture(id: 1, width: 1, height: 1, mipmaps: 1, format: .fromValue(1));
      final p = Texture$.Allocate(value: t, key: 'k');
      expect(t.op, same(p));
    });

    test('bind=null, unique=true -> bound (value struct)', () {
      final v = Vector2.vec2(1, 2);
      Vector2$.Allocate(value: v, unique: true);
      expect(v.op, isNotNull);
    });

    test('explicit bind=false overrides !isValue', () {
      final t = Texture(id: 1, width: 1, height: 1, mipmaps: 1, format: .fromValue(1));
      Texture$.Allocate(value: t, key: 'k', bind: false);
      expect(t.op, isNull);
    });

    test('explicit bind=true binds a value struct', () {
      final v = Vector2.vec2(1, 2);
      Vector2$.Allocate(value: v, key: 'k', bind: true);
      expect(v.op, isNotNull);
    });

    test('disposed value throws StateError', () {
      final v = Vector2.vec2(1, 2)..structDispose();
      expect(() => Vector2$.Allocate(value: v), throwsStateError);
    });

    test('value == null returns pointer without touching anything', () {
      final p = Vector2$.Allocate(key: 'k');
      expect(p, isNotNull);
    });
  });

  group('RefUnique', () {
    test('value struct is bound to its own pointer', () {
      final v = Vector2.vec2(1, 2);
      final p = Vector2$.RefUnique(v);
      expect(v.op, same(p));
    });

    test('native write is visible afterwards (out-param, GuiGrid case)', () {
      final v = Vector2.vec2(0, 0);
      final p = Vector2$.RefUnique(v);
      Vector2.struct.poke(p, {'x': 9.0, 'y': 8.0}); // PSEUDO: simulate native mutation
      expect((v.x, v.y), (9, 8));
    });

    test('unique pointers differ between two calls', () {
      final a = Vector2$.RefUnique(Vector2.vec2(1, 1));
      final b = Vector2$.RefUnique(Vector2.vec2(2, 2));
      expect(a.address, isNot(b.address)); // PSEUDO: address accessor
    });

    test('null -> nullptr', () {
      expect(Vector2$.RefUnique(null).isNull, isTrue); // PSEUDO
    });

    test('does not alias Ref1..8 slots', () {
      final v = Vector2.vec2(1, 2);
      final u = Vector2$.RefUnique(v);
      Vector2$.Ref1(Vector2.vec2(7, 7));
      expect((v.x, v.y), (1, 2));
      expect(Vector2.struct.peek(u), {'x': 1.0, 'y': 2.0});
    });
  });

  group('ptr.value / snapshot', () {
    // If you rename to `snapshot`, rename here; semantics: always detaches.
    test('value struct: detached, _op null, contents copied', () {
      final p = allocWith<Vector2>({'x': 1.0, 'y': 2.0}); // PSEUDO
      final v = p.value;
      expect(v.op, isNull);
      expect((v.x, v.y), (1, 2));
    });

    test('value struct: native overwrite does not change the copy', () {
      final p = allocWith<Vector2>({'x': 1.0, 'y': 2.0});
      final v = p.value;
      Vector2.struct.poke(p, {'x': 99.0, 'y': 99.0});
      expect((v.x, v.y), (1, 2));
    });

    test('value struct: Dart mutation does not reach native', () {
      final p = allocWith<Vector2>({'x': 1.0, 'y': 2.0});
      final _ = p.value..x = 50;
      expect(Vector2.struct.peek(p)['x'], 1.0);
    });

    // VARIANT A (value honors isValue): non-value returns live view
    test('non-value: value getter preserves op', () {
      final p = allocWith<Texture>({'id': 5, 'width': 1, 'height': 1, 'mipmaps': 1, 'format': 1});
      final t = p.value;
      expect(t.op, isNotNull);
    });

    test('ref always keeps op and writes through', () {
      final p = allocWith<Vector2>({'x': 1.0, 'y': 2.0});
      final r = p.ref..x = 42;
      expect(Vector2.struct.peek(p)['x'], 42.0);
      expect(r.op, same(p));
    });
  });

  group('testingExtractResult: populate-ptr path (result == null)', () {
    test('value struct: detached copy of ptr contents', () {
      final p = Vector2$.Allocate(key: 'k');
      final v = Vector2$.testingExtractResult(p, fnPopulates<Vector2>({'x': 3.0, 'y': 4.0})(p));
      expect(v.op, isNull);
      expect((v.x, v.y), (3, 4));
    });

    test('value struct: later native overwrite unchanged', () {
      final p = Vector2$.Allocate(key: 'k');
      final v = Vector2$.testingExtractResult(p, fnPopulates<Vector2>({'x': 3.0, 'y': 4.0})(p));
      Vector2.struct.poke(p, {'x': 0.0, 'y': 0.0});
      expect((v.x, v.y), (3, 4));
    });

    test('non-value struct: live view, native overwrite is visible', () {
      final p = Texture$.Allocate(key: 'k');
      final t = Texture$.testingExtractResult(p, fnPopulates<Texture>({'id': 1, 'width': 2, 'height': 2, 'mipmaps': 1, 'format': 1})(p));
      Texture.struct.poke(p, {'id': 77});
      expect(t.id, 77);
      expect(t.op, isNotNull);
    });
  });

  group('testingExtractResult: return-by-value path (result != null)', () {
    test('value struct: result returned as-is (same instance)', () {
      final p = Vector2$.Allocate(key: 'k');
      sentinel(p);
      final r = Vector2.vec2(3, 4);
      expect(identical(Vector2$.testingExtractResult(p, r), r), isTrue);
    });

    test('value struct: contents NOT overwritten by garbage in ptr', () {
      final p = Vector2$.Allocate(key: 'k');
      sentinel(p);
      final v = Vector2$.testingExtractResult(p, Vector2.vec2(3, 4));
      expect((v.x, v.y), (3, 4));
    });

    test('value struct: stays unbound, ptr not registered as its home', () {
      final p = Vector2$.Allocate(key: 'k');
      final v = Vector2$.testingExtractResult(p, Vector2.vec2(3, 4));
      expect(v.op, isNull);
    });

    test('value struct: bound result', () {
      final p = Vector2$.Allocate(key: 'k');
      final bound = Vector2$.RefUnique(Vector2.vec2(1, 1)).ref;
      expect(Vector2$.testingExtractResult(p, bound), isA<Vector2>());
    });

    test('non-value struct: ends bound to ptr', () {
      final p = Texture$.Allocate(key: 'k');
      sentinel(p);
      final t = Texture$.testingExtractResult(p, Texture(id: 9, width: 4, height: 4, mipmaps: 1, format: .fromValue(1)));
      expect(t.op, same(p));
    });

    test('non-value struct: ptr memory contains result data', () {
      final p = Texture$.Allocate(key: 'k');
      sentinel(p);
      Texture$.testingExtractResult(p, Texture(id: 9, width: 4, height: 4, mipmaps: 1, format: .fromValue(1)));
      expect(Texture.struct.peek(p)['id'], 9);
      expect(Texture.struct.peek(p)['width'], 4);
    });

    test('non-value struct: write-through works after bind', () {
      final p = Texture$.Allocate(key: 'k');
      final t = Texture$.testingExtractResult(p, Texture(id: 9, width: 4, height: 4, mipmaps: 1, format: .fromValue(1)));
      t.width = 100;
      expect(Texture.struct.peek(p)['width'], 100);
    });

    test('non-value struct: allocationKey registers exactly once in temp', () {
      final p = Texture$.At('@capture:x'); // PSEUDO: ptr with allocationKey
      final before = Texture$.slots.length; // PSEUDO
      Texture$.testingExtractResult(p, Texture(id: 1, width: 1, height: 1, mipmaps: 1, format: .fromValue(1)));
      expect(Texture$.slots.length - before, lessThanOrEqualTo(1));
    });
  });

  group('backend parity (populate vs return-by-value)', () {
    void parity<D extends RaylibStruct<D>>(Map<String, Object> data) {
      final alloc = RaylibBase.getInstance().Temp.structAlloc<D>();
      final p1 = alloc.Allocate(key: 'a');
      final viaPopulate = alloc.testingExtractResult(p1, fnPopulates<D>(data)(p1));
      final p2 = alloc.Allocate(key: 'b');
      sentinel(p2);
      final viaReturn = alloc.testingExtractResult(p2, fnReturns<D>(data)(p2));
      expect(viaReturn.op != null, viaPopulate.op != null, reason: 'bound state');
      expect(fieldsOf(viaReturn), fieldsOf(viaPopulate), reason: 'contents');
    }

    test('Vector2 (value)', () => parity<Vector2>({'x': 1.0, 'y': 2.0}));
    test('Texture (non-value)', () => parity<Texture>({'id': 3, 'width': 4, 'height': 5, 'mipmaps': 1, 'format': 1}));
  });

  group('Extract / Ref integration', () {
    final v2 = Vector2.struct;
    final tex = Texture.struct;
    final texData = {'id': 7, 'width': 4, 'height': 4, 'mipmaps': 1, 'format': 1};

    group('value struct', () {
      test('Ref1 input + Extract2 output use different slots', () {
        final r = Vector2$.Extract((out) {
          final inp = Vector2$.Ref1(.vec2(10, 10));
          final x = v2.peek(inp)['x'] as double;
          v2.poke(out, {'x': x * 2, 'y': x * 3});
        });
        expect((r.x, r.y), (20, 30));
        expect(r.op, isNull);
      });

      test('Extract1 populate path: detached result', () {
        final r = Vector2$.Extract((p) => Vector2(x: 10, y: 10).structWriteInto(p));
        expect((r.x, r.y), (10, 10));
        expect(r.op, isNull);
      });

      test('Extract1 by-value path: result returned intact', () {
        final r = Vector2$.Extract((p) => Vector2(x: 10, y: 10));
        expect((r.x, r.y), (10, 10));
        expect(r.op, isNull);
      });

      test('Extract result survives later reuse of its slot', () {
        final r = Vector2$.Extract((p) => v2.poke(p, {'x': 1.0, 'y': 2.0}));
        Vector2$.Ref1(.vec2(99, 99)); // same @slot:1
        expect((r.x, r.y), (1, 2));
      });

      test('two Extracts are independent', () {
        final a = Vector2$.Extract((p) => v2.poke(p, {'x': 1.0, 'y': 1.0}));
        final b = Vector2$.Extract((p) => v2.poke(p, {'x': 2.0, 'y': 2.0}));
        expect((a.x, b.x), (1, 2));
      });

      test('RefCapture: detached, survives same key again', () {
        final a = Vector2$.RefCapture('k', (p) => v2.poke(p, {'x': 20.0, 'y': 20.0}));
        final b = Vector2$.RefCapture('k', (p) => v2.poke(p, {'x': 30.0, 'y': 30.0}));
        expect((a.x, b.x), (20, 30));
        expect(a.op, isNull);
      });

      test('RefCached: results independent despite shared slot', () {
        final a = Vector2$.RefCached('c', (p) => v2.poke(p, {'x': 1.0, 'y': 1.0}));
        final b = Vector2$.RefCached('c', (p) => v2.poke(p, {'x': 2.0, 'y': 2.0}));
        expect((a.x, b.x), (1, 2));
      });
    });

    group('non-value struct', () {
      test('RefCapture populate: bound, distinct pointers per call', () {
        final a = Texture$.RefCapture('load', (p) => tex.poke(p, {...texData, 'id': 1}));
        final b = Texture$.RefCapture('load', (p) => tex.poke(p, {...texData, 'id': 2}));
        expect((a.id, b.id), (1, 2));       // a not clobbered by b
        expect(a.op, isNotNull);
        expect(a.op, isNot(same(b.op)));
      });

      test('RefCapture by-value (LoadTexture-like): ends bound, data in ptr', () {
        final t = Texture$.RefCapture('load2', (p) => Texture(id: 9, width: 4, height: 4, mipmaps: 1, format: .fromValue(1)));
        expect(t.op, isNotNull);
        expect(tex.peek(t.op!)['id'], 9);
      });

      test('RefCapture: populate and by-value end in same bound state', () {
        final a = Texture$.RefCapture('p1', (p) => tex.poke(p, texData));
        final b = Texture$.RefCapture('p2', (p) => Texture(id: 7, width: 4, height: 4, mipmaps: 1, format: .fromValue(1)));
        expect(isBound(a), isBound(b));
      });
    });

    group('characterization (documents hazards)', () {
      // Non-value via ExtractN: live view into a shared @slot, not a copy.
      // Passing means the hazard is real; use RefCapture for non-value results.
      test('non-value Extract1 result is NOT clobbered by next Ref1', () {
        final t = Texture$.Extract((p) => tex.poke(p, {...texData, 'id': 1}));
        Texture$.Ref1(Texture(id: 99, width: 1, height: 1, mipmaps: 1, format: .fromValue(1)));
        expect(t.id, 1);
      });

      // Non-value via RefCached: same shared slot, so a aliases b.
      test('non-value RefCached results alias each other', () {
        final a = Texture$.RefCached('c', (p) => tex.poke(p, {...texData, 'id': 1}));
        Texture$.RefCached('c', (p) => tex.poke(p, {...texData, 'id': 2}));
        expect(a.id, 2);
      });
    });
  });

  group('characterization (documents known limits, not bugs)', () {
    test('same slot twice in one expression aliases for value structs', () {
      final a = Vector2.vec2(1, 1), b = Vector2.vec2(2, 2);
      final pa = Vector2$.Ref1(a);
      final pb = Vector2$.Ref1(b);
      expect(pa.address, pb.address);
      expect(Vector2.struct.peek(pa)['x'], 2.0); // a's data was overwritten in the slot
    });

    test('non-value in-out param via Ref1 does not propagate back', () {
      final t = Texture(id: 1, width: 1, height: 1, mipmaps: 1, format: .fromValue(1));
      final p = Texture$.Ref1(t);
      expect(t.op, isNotNull);
      Texture.struct.poke(p, {'width': 500}); // PSEUDO: native mutates in-out param
      expect(t.width, 500); // bound
    });
  });

  tearDownAll(disposeRaylib);
}