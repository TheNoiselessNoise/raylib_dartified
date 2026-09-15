import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerScalar,
}

class MyStruct extends RaylibStruct<MyStruct> {

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .pointerScalar: RPointer(RInt()), // exactly 1 value
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _pointerScalarF = struct.pointerScalar<int, RInt>(.pointerScalar);

  int _pointerScalar;
  int get pointerScalar => _pointerScalar = _pointerScalarF.readOr(op?.ptr, _pointerScalar);
  set pointerScalar(int value) => _pointerScalar = _pointerScalarF.writeIf(op?.ptr, value);

  MyStruct({
    super.op,
    int pointerScalar = 0,
  }) : _pointerScalar = pointerScalar;

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    _pointerScalarF.allocate(temp, p, key);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _pointerScalar = _pointerScalarF.readSafe(p, _pointerScalar);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _pointerScalarF.writeSafe(p, _pointerScalar);
  }
}

void main() {
  late RaylibTempStructAllocator<MyStruct> myStructAlloc;

  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    
    myStructAlloc = $.createStructAllocator(
      layout: MyStruct.struct,
      factory: MyStruct.new,
      pointerFactory: MyStruct.pointer,
    );
  });

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Pointer Scalar - after assignment", () {
    final int value = 456;
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.pointerScalar = value;
    expect(struct.pointerScalar, equals(value));
  });

  test("Pointer Scalar - reading live data", () {
    final int value = 456;
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.getOp().offsetBy(MyStruct.struct.offset(.pointerScalar)).readPtr().writeInt(value);
    expect(struct.pointerScalar, equals(value));
  });

  tearDownAll(disposeRaylib);
}