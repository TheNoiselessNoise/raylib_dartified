import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  stringPointerChar,
}

class MyStruct extends RaylibStruct<MyStruct> {

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .stringPointerChar: RPointer(RChar()),
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _stringPointerCharF = struct.stringAsPointerChar<RChar>(.stringPointerChar);

  String _stringPointerChar;
  String get stringPointerChar => _stringPointerChar = _stringPointerCharF.readOr(op?.ptr, _stringPointerChar);
  set stringPointerChar(String value) => _stringPointerChar = _stringPointerCharF.writeIf(op?.ptr, value);

  MyStruct({
    super.op,
    String stringPointerChar = '',
  }) : _stringPointerChar = stringPointerChar;

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    _stringPointerCharF.allocate(temp, p, key, 32);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _stringPointerChar = _stringPointerCharF.readSafe(p, _stringPointerChar);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _stringPointerCharF.write(p, _stringPointerChar);
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

  test("String Pointer Char - after assignment", () {
    final String value = "Hello, World!";
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.stringPointerChar = value;
    expect(struct.stringPointerChar, equals(value));
  });

  test("String Pointer Char - reading live data", () {
    final String value = "Hello, World!";
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.getOp().offsetBy(MyStruct.struct.offset(.stringPointerChar)).readPtr().cast<RChar>().writeString(value);
    expect(struct.stringPointerChar, equals(value));
  });

  tearDownAll(disposeRaylib);
}