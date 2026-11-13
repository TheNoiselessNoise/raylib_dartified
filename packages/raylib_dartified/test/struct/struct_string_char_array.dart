import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with XFields {
  stringCharArray,
}

class MyStruct extends XStruct<MyStruct> {

  static final XStructType<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .stringCharArray: XArray(XChar(), 32),
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_stringCharArray = _l.stringAsCharArray<XChar>(.stringCharArray);

  String _stringCharArray;
  String get stringCharArray => _stringCharArray = field_stringCharArray.readOr(op?.ptr, _stringCharArray);
  set stringCharArray(String value) => _stringCharArray = field_stringCharArray.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    String stringCharArray = '',
  }) : _stringCharArray = stringCharArray;

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(XPtr p) {
    stringCharArray = field_stringCharArray.read(p);
  }

  @override
  void structWriteInto(XPtr p) {
    field_stringCharArray.write(p, stringCharArray);
  }
}

void main() {
  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    XStructTypes.register(MyStruct.struct);
  });

  test("String Char Array - after assignment", () {
    final String value = "Hello, World!";
    final struct = structAllocator<MyStruct>().$new;
    struct.stringCharArray = value;
    expect(struct.stringCharArray, equals(value));
  });

  test("String Char Array - reading live data", () {
    final String value = "Hello, World!";
    final struct = structAllocator<MyStruct>().$new;
    struct.getOp().offsetBy(MyStruct._l.offset(.stringCharArray)).cast<XChar>().writeString(value);
    expect(struct.stringCharArray, equals(value));
  });

  tearDownAll(disposeRaylib);
}