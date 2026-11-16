import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with XFields {
  color,
}

final class MyStruct extends XStruct<MyStruct> {

  static final XStructDef<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .color: XStructType(Color.struct),
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_color = _l.struct<Color>(.color);

  Color _color;
  Color get color => _color = field_color.readOr(op?.ptr, _color);
  set color(Color value) => _color = field_color.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    Color? color,
  }) : _color = color ?? .zero();

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(XPtr p) {
    color = field_color.read(p);
  }

  @override
  void structWriteInto(XPtr p) {
    field_color.write(p, color);
  }
}

void main() {
  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    XStructDefinitions.register(MyStruct.struct);
  });

  late XPtr<XStructType> ptr;
  setUp(() => ptr = XPtr.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Struct - after assignment", () {
    final struct = MyStruct.struct.ptr(ptr).ref;
    final color = Color.AQUA;
    struct.color = color;
    expect(struct.color.toString(), equals(color.toString()));
  });

  test("Struct - read live data", () {
    final color = Color.AQUA;
    color.structWriteInto(ptr.offsetBy(MyStruct._l.offset(.color)));
    expect(MyStruct.struct.ptr(ptr).ref.color.toString(), equals(color.toString()));
  });

  tearDownAll(disposeRaylib);
}