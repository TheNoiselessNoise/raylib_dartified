import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with XFields {
  inlineScalarArray,
}

final class MyStruct extends XStruct<MyStruct> {

  static final XStructDef<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .inlineScalarArray: XArray(XInt(), 4),
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_inlineScalarArray = _l.scalarArray<int, XInt>(.inlineScalarArray);

  List<int> _inlineScalarArray;
  List<int> get inlineScalarArray => _inlineScalarArray = field_inlineScalarArray.readOr(op?.ptr, _inlineScalarArray);
  set inlineScalarArray(List<int> value) => _inlineScalarArray = field_inlineScalarArray.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    List<int>? inlineScalarArray,
  }) : _inlineScalarArray = inlineScalarArray ?? .filled(4, 0);

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(XPtr p) {
    inlineScalarArray = field_inlineScalarArray.read(p);
  }

  @override
  void structWriteInto(XPtr p) {
    field_inlineScalarArray.write(p, inlineScalarArray);
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

  test("Inline Scalar Array - after assignment", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = MyStruct.struct.ptr(ptr).ref;
    struct.inlineScalarArray = values;
    expect(struct.inlineScalarArray, equals(values));
  });

  test("Inline Scalar Array - read live data", () {
    final List<int> values = .generate(4, (i) => i);
    ptr.offsetBy(MyStruct._l.offset(.inlineScalarArray)).cast<XInt>().writeArray(values);
    expect(MyStruct.struct.ptr(ptr).ref.inlineScalarArray, equals(values));
  });

  tearDownAll(disposeRaylib);
}