import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  color,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .color: RStruct(ColorD.struct),
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_color = structLayout.struct<ColorD>(.color);

  ColorD _color;
  ColorD get color => _color = field_color.readOr(op?.ptr, _color);
  set color(ColorD value) => _color = field_color.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    ColorD? color,
  }) : _color = color ?? .zero();

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(MemoryPointer p) {
    _color = field_color.read(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_color.write(p, _color);
  }
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Struct - after assignment", () {
    final struct = MyStruct.struct.ptr(ptr).ref;
    final color = ColorD.AQUA;
    struct.color = color;
    expect(struct.color.toString(), equals(color.toString()));
  });

  test("Struct - read live data", () {
    final color = ColorD.AQUA;
    color.structWriteInto(ptr.offsetBy(MyStruct.structLayout.offset(.color)));
    expect(MyStruct.struct.ptr(ptr).ref.color.toString(), equals(color.toString()));
  });

  tearDownAll(disposeRaylib);
}