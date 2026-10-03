import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerStructFixedArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerStructFixedArray: RPointer(RArray(RStruct(Color.struct), 2)),
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_pointerStructFixedArray = structLayout.pointerStructFixedArray<Color>(.pointerStructFixedArray);

  List<Color> _pointerStructFixedArray;
  List<Color> get pointerStructFixedArray => _pointerStructFixedArray = field_pointerStructFixedArray.readOr(op?.ptr, _pointerStructFixedArray);
  set pointerStructFixedArray(List<Color> value) => _pointerStructFixedArray = field_pointerStructFixedArray.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    List<Color>? pointerStructFixedArray,
  }) : _pointerStructFixedArray = pointerStructFixedArray ?? .generate(2, (_) => .zero());

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_pointerStructFixedArray.allocate(temp, p, key);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _pointerStructFixedArray = field_pointerStructFixedArray.readSafe(p, _pointerStructFixedArray);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_pointerStructFixedArray.write(p, _pointerStructFixedArray);
  }
}

void main() {
  late RaylibTempStructAllocator<MyStruct> myStructAlloc;

  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    
    myStructAlloc = structAllocator(MyStruct.struct);
  });

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Pointer Struct Array - after assignment", () {
    final List<Color> values = [.WHITE, .RED];
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.pointerStructFixedArray = values;
    expect(struct.pointerStructFixedArray.toString(), equals(values.toString()));
  });

  test("Pointer Struct Array - reading live data", () {
    final List<Color> values = [.WHITE, .RED];
    final struct = myStructAlloc.Allocate(.new()).ref;
    Color.struct.ptr(struct.getOp().offsetBy(MyStruct.structLayout.offset(.pointerStructFixedArray)).readPtr()).writeArray(values);
    expect(struct.pointerStructFixedArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}