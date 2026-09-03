import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  stringCharArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .stringCharArray: RArray(RChar(), 32),
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _stringCharArrayF = struct.stringAsCharArray<RChar>(.stringCharArray);

  String _stringCharArray;
  String get stringCharArray => _stringCharArray = _stringCharArrayF.readOr(op?.ptr, _stringCharArray);
  set stringCharArray(String value) => _stringCharArray = _stringCharArrayF.writeIf(op?.ptr, value);

  MyStruct({
    super.op,
    String stringCharArray = '',
  }) : _stringCharArray = stringCharArray;

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(MemoryPointer p) {
    _stringCharArray = _stringCharArrayF.read(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _stringCharArrayF.write(p, _stringCharArray);
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

  test("String Char Array - after assignment", () {
    final String value = "Hello, World!";
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.stringCharArray = value;
    expect(struct.stringCharArray, equals(value));
  });

  test("String Char Array - reading live data", () {
    final String value = "Hello, World!";
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.getOp().offsetBy(MyStruct.struct.offset(.stringCharArray)).cast<RChar>().writeString(value);
    expect(struct.stringCharArray, equals(value));
  });

  tearDownAll(disposeRaylib);
}