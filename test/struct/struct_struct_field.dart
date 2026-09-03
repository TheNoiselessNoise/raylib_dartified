import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  color,
}

class MyStruct extends RaylibStruct<MyStruct> {

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .color: RStruct(ColorD.struct),
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _colorF = struct.struct(.color, ColorD.pointer);

  ColorD _color;
  ColorD get color => _color = _colorF.readOr(op?.ptr, _color);
  set color(ColorD value) => _color = _colorF.writeIf(op?.ptr, value);

  MyStruct({
    super.op,
    ColorD? color,
  }) : _color = color ?? .zero();

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(MemoryPointer p) {
    _color = _colorF.read(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _colorF.write(p, _color);
  }
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Struct - after assignment", () {
    final struct = MyStruct.pointer(ptr).ref;
    final color = ColorD.AQUA;
    struct.color = color;
    expect(struct.color.toString(), equals(color.toString()));
  });

  test("Struct - read live data", () {
    final color = ColorD.AQUA;
    color.structWriteInto(ptr.offsetBy(MyStruct.struct.offset(.color)));
    expect(MyStruct.pointer(ptr).ref.color.toString(), equals(color.toString()));
  });

  tearDownAll(disposeRaylib);
}