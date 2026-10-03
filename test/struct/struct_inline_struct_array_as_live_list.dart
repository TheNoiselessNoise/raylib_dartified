import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  inlineStructArray,
}

class MyStruct extends RaylibStruct<MyStruct> {
  
  static final StructType<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .inlineStructArray: RArray(RStruct(Color.struct), 4),
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_inlineStructArray = structLayout.structArray<Color>(.inlineStructArray);

  late final StructLiveList<Color, RStruct> _inlineStructArray;
  StructLiveList<Color, RStruct> get inlineStructArray => _inlineStructArray;
  set inlineStructArray(List<Color> value) => _inlineStructArray.inner = value;

  MyStruct({
    super.op,
    List<Color>? inlineStructArray,
  }) {
    _inlineStructArray = .array(() => op, field_inlineStructArray, .generate(field_inlineStructArray.codec.type.count, (_) => .zero()));
  }

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(MemoryPointer p) {
    _inlineStructArray.readFrom(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _inlineStructArray.writeInto(p);
  }
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Live List - Inline Struct Array - after assignment", () {
    final List<Color> values = [.WHITE, .RED, .AQUA, .BLUE];
    final struct = MyStruct.struct.ptr(ptr).ref;
    struct.inlineStructArray = values;
    expect(struct.inlineStructArray.toString(), equals(values.toString()));
  });

  test("Live List - Inline Struct Array - read live data", () {
    final List<Color> values = [.WHITE, .RED, .AQUA, .BLUE];
    Color.struct.ptr(ptr.offsetBy(MyStruct.structLayout.offset(.inlineStructArray))).writeArray(values);
    expect(MyStruct.struct.ptr(ptr).ref.inlineStructArray.toString(), equals(values.toString()));
  });

  test("Live List - Inline Struct Array - write through live list and check live data", () {
    final List<Color> values = [.WHITE, .RED, .AQUA, .BLUE];
    final struct = MyStruct.struct.ptr(ptr).ref;
    struct.inlineStructArray = values;
    final result = Color.struct.ptr(ptr.offsetBy(MyStruct.structLayout.offset(.inlineStructArray)))
      .readArray(values.length);
    expect(result.toString(), values.toString());
  });

  test("Live List - Inline Struct Array - change element", () {
    final List<Color> values = [.WHITE, .RED, .AQUA, .BLUE];
    final List<Color> expected = .of(values);
    expected[1] = .YELLOW;

    final struct = MyStruct.struct.ptr(ptr).ref;
    struct.inlineStructArray = values;
    struct.inlineStructArray[1] = .YELLOW;

    // read as live data
    final result = Color.struct.ptr(ptr.offsetBy(MyStruct.structLayout.offset(.inlineStructArray)))
      .readArray(expected.length);

    expect(result.toString(), expected.toString());
  });

  tearDownAll(disposeRaylib);
}