import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with XFields {
  inlineStructArray,
}

class MyStruct extends XStruct<MyStruct> {

  static final XStructType<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .inlineStructArray: XArray(XRawStruct(Color.struct), 2),
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_inlineStructArray = _l.structArray<Color>(.inlineStructArray);

  List<Color> _inlineStructArray;
  List<Color> get inlineStructArray => _inlineStructArray = field_inlineStructArray.readOr(op?.ptr, _inlineStructArray);
  set inlineStructArray(List<Color> value) => _inlineStructArray = field_inlineStructArray.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    List<Color>? inlineStructArray,
  }) : _inlineStructArray = inlineStructArray ?? .generate(field_inlineStructArray.codec.type.count, (_) => .zero());

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(XPtr p) {
    inlineStructArray = field_inlineStructArray.read(p);
  }

  @override
  void structWriteInto(XPtr p) {
    field_inlineStructArray.write(p, inlineStructArray);
  }
}

void main() {
  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    XStructTypes.register(MyStruct.struct);
  });

  late XPtr<XRawStruct> ptr;
  setUp(() => ptr = XPtr.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Inline Struct Array - after assignment", () {
    final List<Color> values = [.WHITE, .RED];
    final struct = MyStruct.struct.ptr(ptr).ref;
    struct.inlineStructArray = values;
    expect(struct.inlineStructArray.toString(), equals(values.toString()));
  });

  test("Inline Struct Array - read live data", () {
    final List<Color> values = [.WHITE, .RED];
    Color.struct.ptr(ptr.offsetBy(MyStruct._l.offset(.inlineStructArray))).writeArray(values);
    expect(MyStruct.struct.ptr(ptr).ref.inlineStructArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}