import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with XFields {
  pointerScalar,
}

final class MyStruct extends XStruct<MyStruct> {

  static final XStructDef<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerScalar: XPtrType(XInt()), // exactly 1 value
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_pointerScalar = _l.ptrScalar<int, XInt>(.pointerScalar);

  int _pointerScalar;
  int get pointerScalar => _pointerScalar = field_pointerScalar.readOr(op?.ptr, _pointerScalar);
  set pointerScalar(int value) => _pointerScalar = field_pointerScalar.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    this._pointerScalar = 0,
  });

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(XPtr p, String key) {
    field_pointerScalar.allocate(p, key);
  }

  @override
  void structReadFrom(XPtr p) {
    pointerScalar = field_pointerScalar.readSafe(p, pointerScalar);
  }

  @override
  void structWriteInto(XPtr p) {
    field_pointerScalar.writeSafe(p, pointerScalar);
  }
}

void main() {
  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    XStructDefinitions.register(MyStruct.struct);
  });

  test("Pointer Scalar - after assignment", () {
    final int value = 456;
    final struct = structAllocator<MyStruct>().$new;
    struct.pointerScalar = value;
    expect(struct.pointerScalar, equals(value));
  });

  test("Pointer Scalar - reading live data", () {
    final int value = 456;
    final struct = structAllocator<MyStruct>().$new;
    struct.getOp().offsetBy(MyStruct._l.offset(.pointerScalar)).readPtr().writeInt(value);
    expect(struct.pointerScalar, equals(value));
  });

  tearDownAll(disposeRaylib);
}