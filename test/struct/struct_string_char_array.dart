import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  stringCharArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .stringCharArray: RArray(RChar(), 32),
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_stringCharArray = structLayout.stringAsCharArray<RChar>(.stringCharArray);

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
  void structReadFrom(MemoryPointer p) {
    _stringCharArray = field_stringCharArray.read(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_stringCharArray.write(p, _stringCharArray);
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

  test("String Char Array - after assignment", () {
    final String value = "Hello, World!";
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.stringCharArray = value;
    expect(struct.stringCharArray, equals(value));
  });

  test("String Char Array - reading live data", () {
    final String value = "Hello, World!";
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.getOp().offsetBy(MyStruct.structLayout.offset(.stringCharArray)).cast<RChar>().writeString(value);
    expect(struct.stringCharArray, equals(value));
  });

  tearDownAll(disposeRaylib);
}