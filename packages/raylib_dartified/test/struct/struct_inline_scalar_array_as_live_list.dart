import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with XFields {
  inlineScalarArray,
}

class MyStruct extends XStruct<MyStruct> {

  static final XStructType<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .inlineScalarArray: XArray(XInt(), 4),
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_inlineScalarArray = _l.scalarArray<int, XInt>(.inlineScalarArray);

  late final XLiveList<int, XInt> _inlineScalarArray;
  XLiveList<int, XInt> get inlineScalarArray => _inlineScalarArray;
  set inlineScalarArray(List<int> value) => _inlineScalarArray.inner = value;

  MyStruct({
    super.op,
    List<int>? inlineScalarArray,
  }) {
    _inlineScalarArray = field_inlineScalarArray.live(() => op, .filled(4, 0));
  }

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(XPtr p) {
    inlineScalarArray.readFrom(p);
  }

  @override
  void structWriteInto(XPtr p) {
    inlineScalarArray.writeInto(p);
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

  test("Live List - Inline Scalar Array - after assignment", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = MyStruct.struct.ptr(ptr).ref;
    struct.inlineScalarArray = values;
    expect(struct.inlineScalarArray, equals(values));
  });

  test("Live List - Inline Scalar Array - read live data", () {
    final List<int> values = .generate(4, (i) => i);
    ptr.offsetBy(MyStruct._l.offset(.inlineScalarArray)).cast<XInt>().writeArray(values);
    expect(MyStruct.struct.ptr(ptr).ref.inlineScalarArray, equals(values));
  });

  test("Live List - Inline Scalar Array - write through live list and check live data", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = MyStruct.struct.ptr(ptr).ref;
    struct.inlineScalarArray = values;
    final result = ptr.offsetBy(MyStruct._l.offset(.inlineScalarArray))
      .cast<XInt>()
      .readArray(values.length);
    expect(result, values);
  });

  test("Live List - Inline Scalar Array - change element", () {
    final List<int> values = .generate(4, (i) => i);
    final List<int> expected = .of(values);
    expected[1] = 99;

    final struct = MyStruct.struct.ptr(ptr).ref;
    struct.inlineScalarArray = values;
    struct.inlineScalarArray[1] = 99;

    // read as live data
    final result = ptr.offsetBy(MyStruct._l.offset(.inlineScalarArray))
      .cast<XInt>()
      .readArray(expected.length);

    expect(result, expected);
  });

  tearDownAll(disposeRaylib);
}