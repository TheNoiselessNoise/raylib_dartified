import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  enumField,
}

class MyStruct extends RaylibStruct<MyStruct> {

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .enumField: RInt(),
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _enumFieldF = struct.enumValue<KeyboardKey, RInt>(.enumField, KeyboardKey.fromValue);

  KeyboardKey _enumField;
  KeyboardKey get enumField => _enumField = _enumFieldF.readOr(op?.ptr, _enumField);
  set enumField(KeyboardKey value) => _enumField = _enumFieldF.writeIf(op?.ptr, value);

  MyStruct({
    super.op,
    KeyboardKey enumField = .KEY_NULL,
  }) : _enumField = enumField;

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(MemoryPointer p) {
    _enumField = _enumFieldF.read(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _enumFieldF.write(p, _enumField);
  }
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Enum - after assignment", () {
    final value = KeyboardKey.KEY_DELETE; // 261
    final struct = MyStruct.pointer(ptr).ref;
    struct.enumField = value;
    expect(struct.enumField, equals(value));
  });

  test("Enum - read live data", () {
    final value = KeyboardKey.KEY_DELETE;
    ptr.offsetBy(MyStruct.struct.offset(.enumField)).writeInt(value.value);
    expect(MyStruct.pointer(ptr).ref.enumField, value);
  });

  tearDownAll(disposeRaylib);
}