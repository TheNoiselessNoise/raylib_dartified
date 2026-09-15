import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  stringPointerChar,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .stringPointerChar: RPointer(RChar()),
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_stringPointerChar = structLayout.stringAsPointerChar<RChar>(.stringPointerChar);

  String _stringPointerChar;
  String get stringPointerChar => _stringPointerChar = field_stringPointerChar.readOr(op?.ptr, _stringPointerChar);
  set stringPointerChar(String value) => _stringPointerChar = field_stringPointerChar.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    String stringPointerChar = '',
  }) : _stringPointerChar = stringPointerChar;

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_stringPointerChar.allocate(temp, p, key, count: 32);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _stringPointerChar = field_stringPointerChar.readSafe(p, _stringPointerChar);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_stringPointerChar.write(p, _stringPointerChar);
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

  test("String Pointer Char - after assignment", () {
    final String value = "Hello, World!";
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.stringPointerChar = value;
    expect(struct.stringPointerChar, equals(value));
  });

  test("String Pointer Char - reading live data", () {
    final String value = "Hello, World!";
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.getOp().offsetBy(MyStruct.structLayout.offset(.stringPointerChar)).readPtr().cast<RChar>().writeString(value);
    expect(struct.stringPointerChar, equals(value));
  });

  tearDownAll(disposeRaylib);
}