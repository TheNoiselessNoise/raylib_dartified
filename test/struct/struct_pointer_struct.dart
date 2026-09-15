import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerStruct,
}

class MyStruct extends RaylibStruct<MyStruct> {

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .pointerStruct: RPointer(RStruct(ColorD.struct)), // exactly 1 value
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _pointerStructF = struct.pointerStruct<ColorD>(.pointerStruct, ColorD.pointer);

  ColorD _pointerStruct;
  ColorD get pointerStruct => _pointerStruct = _pointerStructF.readOr(op?.ptr, _pointerStruct);
  set pointerStruct(ColorD value) => _pointerStruct = _pointerStructF.writeIf(op?.ptr, value);

  MyStruct({
    super.op,
    ColorD? pointerStruct,
  }) : _pointerStruct = pointerStruct ?? .zero();

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    _pointerStructF.allocate(temp, p, key);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _pointerStruct = _pointerStructF.readSafe(p, _pointerStruct);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _pointerStructF.writeSafe(p, _pointerStruct);
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

  test("Pointer Struct - after assignment", () {
    final ColorD value = .AQUA;
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.pointerStruct = value;
    expect(struct.pointerStruct.toString(), equals(value.toString()));
  });

  test("Pointer Struct - reading live data", () {
    final ColorD value = .AQUA;
    final struct = myStructAlloc.Allocate(.new()).ref;
    final colorPtr = struct.getOp().offsetBy(MyStruct.struct.offset(.pointerStruct)).readPtr();
    ColorD.pointer(colorPtr).ref = value;
    expect(struct.pointerStruct.toString(), equals(value.toString()));
  });

  tearDownAll(disposeRaylib);
}