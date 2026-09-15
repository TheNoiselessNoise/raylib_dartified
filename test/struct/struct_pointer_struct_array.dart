import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerStructArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerStructArray: RPointer(RStruct(ColorD.struct)), // exactly 2
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_pointerStructArray = structLayout.pointerStructArray<ColorD>(.pointerStructArray);

  List<ColorD> _pointerStructArray;
  List<ColorD> get pointerStructArray => _pointerStructArray = field_pointerStructArray.readCountOr(op?.ptr, 2, _pointerStructArray);
  set pointerStructArray(List<ColorD> value) => _pointerStructArray = field_pointerStructArray.writeCountIf(op?.ptr, value);

  MyStruct({
    super.op,
    List<ColorD>? pointerStructArray,
  }) : _pointerStructArray = pointerStructArray ?? .generate(2, (_) => .zero());

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_pointerStructArray.allocate(temp, p, key);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _pointerStructArray = field_pointerStructArray.readCount(p, 2, _pointerStructArray);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_pointerStructArray.writeCount(p, _pointerStructArray);
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

  test("Pointer Struct Array - after assignment", () {
    final List<ColorD> values = [.WHITE, .RED];
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.pointerStructArray = values;
    expect(struct.pointerStructArray.toString(), equals(values.toString()));
  });

  test("Pointer Struct Array - reading live data", () {
    final List<ColorD> values = [.WHITE, .RED];
    final struct = myStructAlloc.Allocate(.new()).ref;
    ColorD.struct.ptr(struct.getOp().offsetBy(MyStruct.structLayout.offset(.pointerStructArray)).readPtr()).writeArray(values);
    expect(struct.pointerStructArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}