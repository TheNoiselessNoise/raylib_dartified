import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  inlineStructArray,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .inlineStructArray: RArray(RStruct(ColorD.struct), 2),
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_inlineStructArray = structLayout.structArray<ColorD>(.inlineStructArray);

  List<ColorD> _inlineStructArray;
  List<ColorD> get inlineStructArray => _inlineStructArray = field_inlineStructArray.readOr(op?.ptr, _inlineStructArray);
  set inlineStructArray(List<ColorD> value) => _inlineStructArray = field_inlineStructArray.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    List<ColorD>? inlineStructArray,
  }) : _inlineStructArray = inlineStructArray ?? .generate(field_inlineStructArray.codec.type.count, (_) => .zero());

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(MemoryPointer p) {
    _inlineStructArray = field_inlineStructArray.read(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_inlineStructArray.write(p, _inlineStructArray);
  }
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Inline Struct Array - after assignment", () {
    final List<ColorD> values = [.WHITE, .RED];
    final struct = MyStruct.struct.ptr(ptr).ref;
    struct.inlineStructArray = values;
    expect(struct.inlineStructArray.toString(), equals(values.toString()));
  });

  test("Inline Struct Array - read live data", () {
    final List<ColorD> values = [.WHITE, .RED];
    ColorD.struct.ptr(ptr.offsetBy(MyStruct.structLayout.offset(.inlineStructArray))).writeArray(values);
    expect(MyStruct.struct.ptr(ptr).ref.inlineStructArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}