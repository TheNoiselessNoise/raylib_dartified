import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerScalar,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerScalar: RPointer(RInt()), // exactly 1 value
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_pointerScalar = structLayout.pointerScalar<int, RInt>(.pointerScalar);

  int _pointerScalar;
  int get pointerScalar => _pointerScalar = field_pointerScalar.readOr(op?.ptr, _pointerScalar);
  set pointerScalar(int value) => _pointerScalar = field_pointerScalar.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    int pointerScalar = 0,
  }) : _pointerScalar = pointerScalar;

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_pointerScalar.allocate(temp, p, key);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _pointerScalar = field_pointerScalar.readSafe(p, _pointerScalar);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_pointerScalar.writeSafe(p, _pointerScalar);
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

  test("Pointer Scalar - after assignment", () {
    final int value = 456;
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.pointerScalar = value;
    expect(struct.pointerScalar, equals(value));
  });

  test("Pointer Scalar - reading live data", () {
    final int value = 456;
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.getOp().offsetBy(MyStruct.structLayout.offset(.pointerScalar)).readPtr().writeInt(value);
    expect(struct.pointerScalar, equals(value));
  });

  tearDownAll(disposeRaylib);
}