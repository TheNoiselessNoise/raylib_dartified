import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerStructFixedArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerStructFixedArray: RPointer(RArray(RStruct(ColorD.struct), 2)),
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_pointerStructFixedArray = structLayout.pointerStructFixedArray<ColorD>(.pointerStructFixedArray);

  List<ColorD> _pointerStructFixedArray;
  List<ColorD> get pointerStructFixedArray => _pointerStructFixedArray = field_pointerStructFixedArray.readOr(op?.ptr, _pointerStructFixedArray);
  set pointerStructFixedArray(List<ColorD> value) => _pointerStructFixedArray = field_pointerStructFixedArray.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    List<ColorD>? pointerStructFixedArray,
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
    
    myStructAlloc = $.createStructAllocator(MyStruct.struct);
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
    ColorD.struct.ptr(struct.getOp().offsetBy(MyStruct.structLayout.offset(.pointerStructFixedArray)).readPtr()).writeArray(values);
    expect(struct.pointerStructFixedArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}