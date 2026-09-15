import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerEnumField,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerEnumField: RPointer(RInt()),
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_pointerEnumField = structLayout.pointerEnumValue<KeyboardKey, RInt>(.pointerEnumField, KeyboardKey.fromValue);

  KeyboardKey _pointerEnumField;
  KeyboardKey get pointerEnumField => _pointerEnumField = field_pointerEnumField.readOr(op?.ptr, _pointerEnumField);
  set pointerEnumField(KeyboardKey value) => _pointerEnumField = field_pointerEnumField.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    KeyboardKey pointerEnumField = .KEY_NULL,
  }) : _pointerEnumField = pointerEnumField;

  @override
  MyStruct clone() => .new(op: op);
  
  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_pointerEnumField.allocate(temp, p, key);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _pointerEnumField = field_pointerEnumField.readSafe(p, _pointerEnumField);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_pointerEnumField.writeSafe(p, _pointerEnumField);
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

  test("Pointer Enum - after assignment", () {
    final value = KeyboardKey.KEY_DELETE; // 261
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.pointerEnumField = value;
    expect(struct.pointerEnumField, equals(value));
  });

  test("Pointer Enum - read live data", () {
    final value = KeyboardKey.KEY_DELETE;
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.getOp().offsetBy(MyStruct.structLayout.offset(.pointerEnumField)).readPtr().writeInt(value.value);
    expect(struct.pointerEnumField, value);
  });

  tearDownAll(disposeRaylib);
}