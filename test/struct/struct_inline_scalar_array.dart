import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  inlineScalarArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .inlineScalarArray: RArray(RInt(), 4),
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_inlineScalarArray = structLayout.scalarArray<int, RInt>(.inlineScalarArray);

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
  void structReadFrom(MemoryPointer p) {
    _inlineScalarArray = field_inlineScalarArray.read(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_inlineScalarArray.write(p, _inlineScalarArray);
  }
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Inline Scalar Array - after assignment", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = MyStruct.struct.ptr(ptr).ref;
    struct.inlineScalarArray = values;
    expect(struct.inlineScalarArray, equals(values));
  });

  test("Inline Scalar Array - read live data", () {
    final List<int> values = .generate(4, (i) => i);
    ptr.offsetBy(MyStruct.structLayout.offset(.inlineScalarArray)).cast<RInt>().writeArray(values);
    expect(MyStruct.struct.ptr(ptr).ref.inlineScalarArray, equals(values));
  });

  tearDownAll(disposeRaylib);
}