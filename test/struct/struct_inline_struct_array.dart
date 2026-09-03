import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  inlineStructArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .inlineStructArray: RArray(RStruct(ColorD.struct), 2),
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _inlineStructArrayF = struct.structArray<ColorD>(.inlineStructArray, ColorD.pointer);

  List<ColorD> _inlineStructArray;
  List<ColorD> get inlineStructArray => _inlineStructArray = _inlineStructArrayF.readOr(op?.ptr, _inlineStructArray);
  set inlineStructArray(List<ColorD> value) {
    assert(value.length <= _inlineStructArrayF.codec.type.count);
    _inlineStructArray = _inlineStructArrayF.writeIf(op?.ptr, value);
  }

  MyStruct({
    super.op,
    List<ColorD>? inlineStructArray,
  }) : _inlineStructArray = inlineStructArray ?? .generate(_inlineStructArrayF.codec.type.count, (_) => .zero());

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(MemoryPointer p) {
    _inlineStructArray = _inlineStructArrayF.read(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _inlineStructArrayF.write(p, _inlineStructArray);
  }
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Inline Struct Array - after assignment", () {
    final List<ColorD> values = [.WHITE, .RED];
    final struct = MyStruct.pointer(ptr).ref;
    struct.inlineStructArray = values;
    expect(struct.inlineStructArray.toString(), equals(values.toString()));
  });

  test("Inline Struct Array - read live data", () {
    final List<ColorD> values = [.WHITE, .RED];
    ColorD.pointer(ptr.offsetBy(MyStruct.struct.offset(.inlineStructArray))).writeArray(values);
    expect(MyStruct.pointer(ptr).ref.inlineStructArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}