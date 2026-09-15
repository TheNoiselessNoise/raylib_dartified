import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerStructArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .pointerStructArray: RPointer(RStruct(ColorD.struct)), // exactly 2
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _pointerStructArrayF = struct.pointerStructArray<ColorD>(.pointerStructArray, ColorD.pointer);

  List<ColorD> _pointerStructArray;
  List<ColorD> get pointerStructArray => _pointerStructArray = _pointerStructArrayF.readCountOr(op?.ptr, 2, _pointerStructArray);
  set pointerStructArray(List<ColorD> value) => _pointerStructArray = _pointerStructArrayF.writeCountIf(op?.ptr, value);

  MyStruct({
    super.op,
    List<ColorD>? pointerStructArray,
  }) : _pointerStructArray = pointerStructArray ?? .generate(2, (_) => .zero());

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    _pointerStructArrayF.allocate(temp, p, key);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _pointerStructArray = _pointerStructArrayF.readCount(p, 2, _pointerStructArray);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _pointerStructArrayF.writeCount(p, _pointerStructArray);
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

  test("Pointer Struct Array - after assignment", () {
    final List<ColorD> values = [.WHITE, .RED];
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.pointerStructArray = values;
    expect(struct.pointerStructArray.toString(), equals(values.toString()));
  });

  test("Pointer Struct Array - reading live data", () {
    final List<ColorD> values = [.WHITE, .RED];
    final struct = myStructAlloc.Allocate(.new()).ref;
    ColorD.pointer(struct.getOp().offsetBy(MyStruct.struct.offset(.pointerStructArray)).readPtr()).writeArray(values);
    expect(struct.pointerStructArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}