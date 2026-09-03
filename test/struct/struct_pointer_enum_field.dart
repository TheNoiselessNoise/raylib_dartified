import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerEnumField,
}

class MyStruct extends RaylibStruct<MyStruct> {

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .pointerEnumField: RPointer(RInt()),
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _pointerEnumFieldF = struct.pointerEnumValue<KeyboardKey, RInt>(.pointerEnumField, KeyboardKey.fromValue);

  KeyboardKey _pointerEnumField;
  KeyboardKey get pointerEnumField => _pointerEnumField = _pointerEnumFieldF.readOr(op?.ptr, _pointerEnumField);
  set pointerEnumField(KeyboardKey value) => _pointerEnumField = _pointerEnumFieldF.writeIf(op?.ptr, value);

  MyStruct({
    super.op,
    KeyboardKey pointerEnumField = .KEY_NULL,
  }) : _pointerEnumField = pointerEnumField;

  @override
  MyStruct clone() => .new(op: op);
  
  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    _pointerEnumFieldF.allocate(temp, p, key);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _pointerEnumField = _pointerEnumFieldF.readSafe(p, _pointerEnumField);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _pointerEnumFieldF.writeSafe(p, _pointerEnumField);
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

  test("Pointer Enum - after assignment", () {
    final value = KeyboardKey.KEY_DELETE; // 261
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.pointerEnumField = value;
    expect(struct.pointerEnumField, equals(value));
  });

  test("Pointer Enum - read live data", () {
    final value = KeyboardKey.KEY_DELETE;
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.getOp().offsetBy(MyStruct.struct.offset(.pointerEnumField)).readPtr().writeInt(value.value);
    expect(struct.pointerEnumField, value);
  });

  tearDownAll(disposeRaylib);
}