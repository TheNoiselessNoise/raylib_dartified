import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with XFields {
  pointerEnumField,
}

class MyStruct extends XStruct<MyStruct> {

  static final XStructType<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerEnumField: XRawPtr(XInt()),
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_pointerEnumField = _l.ptrEnumValue<KeyboardKey, XInt>(.pointerEnumField, KeyboardKey.fromValue);

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
  void structAllocateInto(XPtr p, String key) {
    field_pointerEnumField.allocate(p, key);
  }

  @override
  void structReadFrom(XPtr p) {
    pointerEnumField = field_pointerEnumField.readSafe(p, pointerEnumField);
  }

  @override
  void structWriteInto(XPtr p) {
    field_pointerEnumField.writeSafe(p, pointerEnumField);
  }
}

void main() {
  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    XStructTypes.register(MyStruct.struct);
  });

  test("Pointer Enum - after assignment", () {
    final value = KeyboardKey.KEY_DELETE; // 261

    final struct = structAllocator<MyStruct>().$new;
    struct.pointerEnumField = value;
    expect(struct.pointerEnumField, equals(value));
  });

  test("Pointer Enum - read live data", () {
    final value = KeyboardKey.KEY_DELETE;

    final struct = structAllocator<MyStruct>().$new;
    struct.getOp().offsetBy(MyStruct._l.offset(.pointerEnumField)).readPtr().writeInt(value.value);
    expect(struct.pointerEnumField, value);
  });

  tearDownAll(disposeRaylib);
}