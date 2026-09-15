import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerScalarFixedArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerScalarFixedArray: RPointer(RArray(RInt(), 4)),
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_pointerScalarFixedArray = structLayout.pointerScalarFixedArray<int, RInt>(.pointerScalarFixedArray);

  List<int> _pointerScalarFixedArray;
  List<int> get pointerScalarFixedArray => _pointerScalarFixedArray = field_pointerScalarFixedArray.readOr(op?.ptr, _pointerScalarFixedArray);
  set pointerScalarFixedArray(List<int> value) => _pointerScalarFixedArray = field_pointerScalarFixedArray.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    List<int>? pointerScalarFixedArray,
  }) : _pointerScalarFixedArray = pointerScalarFixedArray ?? .filled(4, 0);

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_pointerScalarFixedArray.allocate(temp, p, key);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _pointerScalarFixedArray = field_pointerScalarFixedArray.readSafe(p, _pointerScalarFixedArray);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_pointerScalarFixedArray.write(p, _pointerScalarFixedArray);
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
    struct.pointerScalarFixedArray = values;
    expect(struct.pointerScalarFixedArray, equals(values));
  });

  test("Pointer Scalar Array - reading live data", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.getOp().offsetBy(MyStruct.structLayout.offset(.pointerScalarFixedArray)).readPtr().cast<RInt>().writeArray(values);
    expect(struct.pointerScalarFixedArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}