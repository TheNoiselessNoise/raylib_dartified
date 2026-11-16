import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with XFields {
  stringPointerChar,
}

final class MyStruct extends XStruct<MyStruct> {

  static final XStructDef<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .stringPointerChar: XPtrType(XChar()),
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_stringPointerChar = _l.stringAsPtrChar<XChar>(.stringPointerChar);

  String _stringPointerChar;
  String get stringPointerChar => _stringPointerChar = field_stringPointerChar.readOr(op?.ptr, _stringPointerChar);
  set stringPointerChar(String value) => _stringPointerChar = field_stringPointerChar.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    this._stringPointerChar = '',
  });

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(XPtr p, String key) {
    field_stringPointerChar.allocate(p, key, count: 32);
  }

  @override
  void structReadFrom(XPtr p) {
    stringPointerChar = field_stringPointerChar.readSafe(p, stringPointerChar);
  }

  @override
  void structWriteInto(XPtr p) {
    field_stringPointerChar.write(p, stringPointerChar);
  }
}

void main() {
  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    XStructDefinitions.register(MyStruct.struct);
  });

  test("String Pointer Char - after assignment", () {
    final String value = "Hello, World!";
    final struct = structAllocator<MyStruct>().$new;
    struct.stringPointerChar = value;
    expect(struct.stringPointerChar, equals(value));
  });

  test("String Pointer Char - reading live data", () {
    final String value = "Hello, World!";
    final struct = structAllocator<MyStruct>().$new;
    struct.getOp().offsetBy(MyStruct._l.offset(.stringPointerChar)).readPtr().cast<XChar>().writeString(value);
    expect(struct.stringPointerChar, equals(value));
  });

  tearDownAll(disposeRaylib);
}