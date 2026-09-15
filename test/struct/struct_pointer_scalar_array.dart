import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerScalarArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerScalarArray: RPointer(RInt()), // exactly 4
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_pointerScalarArray = structLayout.pointerScalarArray<int, RInt>(.pointerScalarArray);

  List<int> _pointerScalarArray;
  List<int> get pointerScalarArray => _pointerScalarArray = field_pointerScalarArray.readCountOr(op?.ptr, 4, _pointerScalarArray);
  set pointerScalarArray(List<int> value) => _pointerScalarArray = field_pointerScalarArray.writeCountIf(op?.ptr, value);

  MyStruct({
    super.op,
    List<int>? pointerScalarArray,
  }) : _pointerScalarArray = pointerScalarArray ?? .filled(4, 0);

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_pointerScalarArray.allocate(temp, p, key);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _pointerScalarArray = field_pointerScalarArray.readCount(p, 4, _pointerScalarArray);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_pointerScalarArray.writeCount(p, _pointerScalarArray);
  }
}

void main() {
  late RaylibTempStructAllocator<MyStruct> myStructAlloc;

  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    
    myStructAlloc = $.createStructAllocator(MyStruct.struct);
  });

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Pointer Scalar Array - after assignment", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.pointerScalarArray = values;
    expect(struct.pointerScalarArray, equals(values));
  });

  test("Pointer Scalar Array - reading live data", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.getOp().offsetBy(MyStruct.structLayout.offset(.pointerScalarArray)).readPtr().cast<RInt>().writeArray(values);
    expect(struct.pointerScalarArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}