import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerScalarFixedArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .pointerScalarFixedArray: RPointer(RArray(RInt(), 4)),
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _pointerScalarFixedArrayF = struct.pointerScalarFixedArray<int, RInt>(.pointerScalarFixedArray);

  List<int> _pointerScalarFixedArray;
  List<int> get pointerScalarFixedArray => _pointerScalarFixedArray = _pointerScalarFixedArrayF.readOr(op?.ptr, _pointerScalarFixedArray);
  set pointerScalarFixedArray(List<int> value) => _pointerScalarFixedArray = _pointerScalarFixedArrayF.writeIf(op?.ptr, value);

  MyStruct({
    super.op,
    List<int>? pointerScalarFixedArray,
  }) : _pointerScalarFixedArray = pointerScalarFixedArray ?? .filled(4, 0);

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    _pointerScalarFixedArrayF.allocate(temp, p, key);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _pointerScalarFixedArray = _pointerScalarFixedArrayF.readSafe(p, _pointerScalarFixedArray);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _pointerScalarFixedArrayF.write(p, _pointerScalarFixedArray);
  }
}

void main() {
  late RaylibTempStructAllocator<MyStruct> myStructAlloc;

  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    
    myStructAlloc = rl.Temp.createStructAllocator(
      byteSize: MyStruct.struct.byteSize,
      factory: MyStruct.new,
      pointerFactory: MyStruct.pointer,
    );
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
    struct.getOp().offsetBy(MyStruct.struct.offset(.pointerScalarFixedArray)).readPtr().cast<RInt>().writeArray(values);
    expect(struct.pointerScalarFixedArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}