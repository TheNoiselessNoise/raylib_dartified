import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  enumField,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .enumField: RInt(),
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_enum = structLayout.enumValue<KeyboardKey, RInt>(.enumField, KeyboardKey.fromValue);

  KeyboardKey _enumField;
  KeyboardKey get enumField => _enumField = field_enum.readOr(op?.ptr, _enumField);
  set enumField(KeyboardKey value) => _enumField = field_enum.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    KeyboardKey enumField = .KEY_NULL,
  }) : _enumField = enumField;

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(MemoryPointer p) {
    _enumField = field_enum.read(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_enum.write(p, _enumField);
  }
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  final value = KeyboardKey.KEY_DELETE; // 261
  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Enum - through getter and setter", () {
    final struct = MyStruct.struct.ptr(ptr).ref;
    struct.enumField = value;
    expect(struct.enumField, equals(value));
  });

  test("Enum - through offsets", () {
    ptr.offsetBy(MyStruct.structLayout.offset(.enumField)).writeInt(value.value);
    final value1 = ptr.offsetBy(MyStruct.structLayout.offset(.enumField)).readInt();
    final value2 = ptr.readInt(MyStruct.structLayout.offset(.enumField));
    expect(KeyboardKey.fromValue(value1), value);
    expect(KeyboardKey.fromValue(value2), value);
  });

  test("Enum - through static field", () {
    MyStruct.field_enum.write(ptr, value);
    expect(MyStruct.field_enum.read(ptr), value);
  });

  test("Enum - through pointer (as reference - keeps pointer)", () {
    MyStruct.field_enum.write(ptr, value);
    expect(MyStruct.struct.ptr(ptr).ref.enumField, value);
  });

  test("Enum - through pointer (as value - discards pointer)", () {
    MyStruct.field_enum.write(ptr, value);
    // `detached` is like `value` (without underlying memory), but it will actually
    // throw an exception if it's used on structs which REQUIRES underlying memory pointer
    final struct = MyStruct.struct.ptr(ptr).detached; 
    // now let's test our Dart side
    expect(struct.enumField, value);
  });

  test("Enum - reference is live, detached is a snapshot", () {
    final reference = MyStruct.struct.ptr(ptr).ref;
    final detached = MyStruct.struct.ptr(ptr).detached;

    reference.enumField = .KEY_DELETE;

    expect(reference.enumField, KeyboardKey.KEY_DELETE);
    expect(detached.enumField, KeyboardKey.KEY_NULL);

    detached.enumField = .KEY_NULL;

    expect(reference.enumField, KeyboardKey.KEY_DELETE);
  });

  test("Enum - detached is initialized from memory", () {
    MyStruct.field_enum.write(ptr, .KEY_DELETE);

    final detached = MyStruct.struct.ptr(ptr).detached;

    expect(detached.enumField, KeyboardKey.KEY_DELETE);
  });

  tearDownAll(disposeRaylib);
}