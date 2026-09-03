import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  inlineScalarArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .inlineScalarArray: RArray(RInt(), 4),
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _inlineScalarArrayF = struct.scalarArray<int, RInt>(.inlineScalarArray);

  late final LiveStructList<int, RInt> _inlineScalarArray;
  LiveStructList<int, RInt> get inlineScalarArray => _inlineScalarArray;
  set inlineScalarArray(List<int> value) => _inlineScalarArray.inner = value;

  MyStruct({
    super.op,
    List<int>? inlineScalarArray,
  }) {
    _inlineScalarArray = _inlineScalarArrayF.live(() => op?.ptr, .filled(4, 0));
  }

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(MemoryPointer p) {
    _inlineScalarArray.readFrom(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _inlineScalarArray.writeInto(p);
  }
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Live List - Inline Scalar Array - after assignment", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = MyStruct.pointer(ptr).ref;
    struct.inlineScalarArray = values;
    expect(struct.inlineScalarArray, equals(values));
  });

  test("Live List - Inline Scalar Array - read live data", () {
    final List<int> values = .generate(4, (i) => i);
    ptr.offsetBy(MyStruct.struct.offset(.inlineScalarArray)).cast<RInt>().writeArray(values);
    expect(MyStruct.pointer(ptr).ref.inlineScalarArray, equals(values));
  });

  test("Live List - Inline Scalar Array - write through live list and check live data", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = MyStruct.pointer(ptr).ref;
    struct.inlineScalarArray = values;
    final result = ptr.offsetBy(MyStruct.struct.offset(.inlineScalarArray))
      .cast<RInt>()
      .readArray(values.length);
    expect(result, values);
  });

  test("Live List - Inline Scalar Array - change element", () {
    final List<int> values = .generate(4, (i) => i);
    final List<int> expected = .of(values);
    expected[1] = 99;

    final struct = MyStruct.pointer(ptr).ref;
    struct.inlineScalarArray = values;
    struct.inlineScalarArray[1] = 99;

    // read as live data
    final result = ptr.offsetBy(MyStruct.struct.offset(.inlineScalarArray))
      .cast<RInt>()
      .readArray(expected.length);

    expect(result, expected);
  });

  tearDownAll(disposeRaylib);
}