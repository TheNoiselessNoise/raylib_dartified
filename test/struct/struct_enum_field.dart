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

  static final enumFieldF = struct.enumValue<KeyboardKey, RInt>(.enumField, KeyboardKey.fromValue);

  KeyboardKey _enumField;
  KeyboardKey get enumField => _enumField = enumFieldF.readOr(op?.ptr, _enumField);
  set enumField(KeyboardKey value) => _enumField = enumFieldF.writeIf(op?.ptr, value);

  MyStruct({
    super.op,
    KeyboardKey enumField = .KEY_NULL,
  }) : _enumField = enumField;

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(MemoryPointer p) {
    _enumField = enumFieldF.read(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    enumFieldF.write(p, _enumField);
  }
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  final value = KeyboardKey.KEY_DELETE; // 261

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Enum - through getter and setter", () {
    final struct = MyStruct.pointer(ptr).ref;
    struct.enumField = value;
    expect(struct.enumField, equals(value));
  });

  test("Enum - through offsets", () {
    ptr.offsetBy(MyStruct.struct.offset(.enumField)).writeInt(value.value);
    final value1 = ptr.offsetBy(MyStruct.struct.offset(.enumField)).readInt();
    final value2 = ptr.readInt(MyStruct.struct.offset(.enumField));
    expect(KeyboardKey.fromValue(value1), value);
    expect(KeyboardKey.fromValue(value2), value);
  });

  test("Enum - through static field", () {
    MyStruct.enumFieldF.write(ptr, value);
    expect(MyStruct.enumFieldF.read(ptr), value);
  });

  test("Enum - through pointer (as reference - keeps pointer)", () {
    MyStruct.enumFieldF.write(ptr, value);
    expect(MyStruct.pointer(ptr).ref.enumField, value);
  });

  test("Enum - through pointer (as value - discards pointer)", () {
    MyStruct.enumFieldF.write(ptr, value);
    // `detached` is like `value` (without underlying memory), but it will actually
    // throw an exception if it's used on structs which REQUIRES underlying memory pointer
    final struct = MyStruct.pointer(ptr).detached; 
    // now let's test our Dart side
    expect(struct.enumField, value);
  });

  test("Enum - reference is live, detached is a snapshot", () {
    final reference = MyStruct.pointer(ptr).ref;
    final detached = MyStruct.pointer(ptr).detached;

    reference.enumField = .KEY_DELETE;

    expect(reference.enumField, KeyboardKey.KEY_DELETE);
    expect(detached.enumField, KeyboardKey.KEY_NULL);

    detached.enumField = .KEY_NULL;

    expect(reference.enumField, KeyboardKey.KEY_DELETE);
  });

  test("Enum - detached is initialized from memory", () {
    MyStruct.enumFieldF.write(ptr, .KEY_DELETE);

    final detached = MyStruct.pointer(ptr).detached;

    expect(detached.enumField, KeyboardKey.KEY_DELETE);
  });

  tearDownAll(disposeRaylib);
}