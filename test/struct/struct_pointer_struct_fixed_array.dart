import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerStructFixedArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .pointerStructFixedArray: RPointer(RArray(RStruct(ColorD.struct), 2)),
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _pointerStructFixedArrayF = struct.pointerStructFixedArray<ColorD>(.pointerStructFixedArray, ColorD.pointer);

  List<ColorD> _pointerStructFixedArray;
  List<ColorD> get pointerStructFixedArray => _pointerStructFixedArray = _pointerStructFixedArrayF.readOr(op?.ptr, _pointerStructFixedArray);
  set pointerStructFixedArray(List<ColorD> value) => _pointerStructFixedArray = _pointerStructFixedArrayF.writeIf(op?.ptr, value);

  MyStruct({
    super.op,
    List<ColorD>? pointerStructFixedArray,
  }) : _pointerStructFixedArray = pointerStructFixedArray ?? .generate(2, (_) => .zero());

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    _pointerStructFixedArrayF.allocate(temp, p, key);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _pointerStructFixedArray = _pointerStructFixedArrayF.readSafe(p, _pointerStructFixedArray);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _pointerStructFixedArrayF.write(p, _pointerStructFixedArray);
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

  test("Pointer Struct Array - after assignment", () {
    final List<ColorD> values = [.WHITE, .RED];
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.pointerStructFixedArray = values;
    expect(struct.pointerStructFixedArray.toString(), equals(values.toString()));
  });

  test("Pointer Struct Array - reading live data", () {
    final List<ColorD> values = [.WHITE, .RED];
    final struct = myStructAlloc.Allocate(.new()).ref;
    ColorD.pointer(struct.getOp().offsetBy(MyStruct.struct.offset(.pointerStructFixedArray)).readPtr()).writeArray(values);
    expect(struct.pointerStructFixedArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}