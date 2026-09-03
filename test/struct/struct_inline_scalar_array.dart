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

  List<int> _inlineScalarArray;
  List<int> get inlineScalarArray => _inlineScalarArray = _inlineScalarArrayF.readOr(op?.ptr, _inlineScalarArray);
  set inlineScalarArray(List<int> value) {
    assert(value.length <= _inlineScalarArrayF.codec.type.count);
    _inlineScalarArray = _inlineScalarArrayF.writeIf(op?.ptr, value);
  }

  MyStruct({
    super.op,
    List<int>? inlineScalarArray,
  }) : _inlineScalarArray = inlineScalarArray ?? .filled(4, 0);

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(MemoryPointer p) {
    _inlineScalarArray = _inlineScalarArrayF.read(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _inlineScalarArrayF.write(p, _inlineScalarArray);
  }
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Inline Scalar Array - after assignment", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = MyStruct.pointer(ptr).ref;
    struct.inlineScalarArray = values;
    expect(struct.inlineScalarArray, equals(values));
  });

  test("Inline Scalar Array - read live data", () {
    final List<int> values = .generate(4, (i) => i);
    ptr.offsetBy(MyStruct.struct.offset(.inlineScalarArray)).cast<RInt>().writeArray(values);
    expect(MyStruct.pointer(ptr).ref.inlineScalarArray, equals(values));
  });

  tearDownAll(disposeRaylib);
}