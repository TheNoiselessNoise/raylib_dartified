import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';
import 'dart:math' as math;

final math.Random random = .new();

enum MyStructField with XFields {
  intField,
  colorField,
  inlineIntArray,
  pointerIntArray,
  inlineStructArray,
  pointerStructArray,
}

const int intArray_COUNT = 4;
const int structArray_COUNT = 2;

final class MyStruct extends XStruct<MyStruct> {

  static final XStructDef<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .intField: XInt(),
      .colorField: XStructType(Color.struct),
      .inlineIntArray: XArray(XInt(), intArray_COUNT),
      .pointerIntArray: XPtrType(XInt()),
      .inlineStructArray: XArray(XStructType(Color.struct), structArray_COUNT),
      .pointerStructArray: XPtrType(XStructType(Color.struct)),
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_intField = _l.scalar<int, XInt>(.intField);
  static final field_colorField = _l.struct<Color>(.colorField);
  static final field_inlineIntArray = _l.scalarArray<int, XInt>(.inlineIntArray);
  static final field_pointerIntArray = _l.ptrScalarArray<int, XInt>(.pointerIntArray);
  static final field_inlineStructArray = _l.structArray<Color>(.inlineStructArray);
  static final field_pointerStructArray = _l.ptrStructArray<Color>(.pointerStructArray);

  int _intField;
  int get intField => _intField = field_intField.readOr(op?.ptr, _intField);
  set intField(int value) => _intField = field_intField.writeOr(op?.ptr, value);

  Color _colorField;
  Color get colorField => _colorField = field_colorField.readOr(op?.ptr, _colorField);
  set colorField(Color value) => _colorField = field_colorField.writeOr(op?.ptr, value);

  List<int> _inlineIntArray;
  List<int> get inlineIntArray => _inlineIntArray = field_inlineIntArray.readOr(op?.ptr, _inlineIntArray);
  set inlineIntArray(List<int> value) => _inlineIntArray = field_inlineIntArray.writeOr(op?.ptr, value);

  List<int> _pointerIntArray;
  List<int> get pointerIntArray => _pointerIntArray = field_pointerIntArray.readCountOr(op?.ptr, intArray_COUNT, _pointerIntArray);
  set pointerIntArray(List<int> value) => _pointerIntArray = field_pointerIntArray.writeCountIf(op?.ptr, value);

  List<Color> _inlineStructArray;
  List<Color> get inlineStructArray => _inlineStructArray = field_inlineStructArray.readOr(op?.ptr, _inlineStructArray);
  set inlineStructArray(List<Color> value) => _inlineStructArray = field_inlineStructArray.writeOr(op?.ptr, value);

  List<Color> _pointerStructArray;
  List<Color> get pointerStructArray => _pointerStructArray = field_pointerStructArray.readCountOr(op?.ptr, structArray_COUNT, _pointerStructArray);
  set pointerStructArray(List<Color> value) => _pointerStructArray = field_pointerStructArray.writeCountIf(op?.ptr, value);

  MyStruct({
    super.op,
    this._intField = 0,
    Color? colorField,
    List<int>? inlineIntArray,
    List<int>? pointerIntArray,
    List<Color>? inlineStructArray,
    List<Color>? pointerStructArray,
  }) :
    _colorField = colorField ?? .zero(),
    _inlineIntArray = inlineIntArray ?? .filled(field_inlineIntArray.codec.type.count, 0),
    _pointerIntArray = pointerIntArray ?? .filled(intArray_COUNT, 0),
    _inlineStructArray = inlineStructArray ?? .generate(field_inlineStructArray.codec.type.count, (_) => .zero()),
    _pointerStructArray = pointerStructArray ?? .generate(structArray_COUNT, (_) => .zero());

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(XPtr p, String key) {
    field_pointerIntArray.allocate(p, '${key}_pointerIntArray');
    field_pointerStructArray.allocate(p, '${key}_pointerStructArray');
  }

  @override
  void structReadFrom(XPtr p) {
    intField = field_intField.read(p);
    colorField = field_colorField.read(p);
    inlineIntArray = field_inlineIntArray.read(p);
    pointerIntArray = field_pointerIntArray.readCount(p, intArray_COUNT, pointerIntArray);
    inlineStructArray = field_inlineStructArray.read(p);
    pointerStructArray = field_pointerStructArray.readCount(p, structArray_COUNT, pointerStructArray);
  }

  @override
  void structWriteInto(XPtr p) {
    field_intField.write(p, intField);
    field_colorField.write(p, colorField);
    field_inlineIntArray.write(p, inlineIntArray);
    field_pointerIntArray.writeCount(p, pointerIntArray);
    field_inlineStructArray.write(p, inlineStructArray);
    field_pointerStructArray.writeCount(p, pointerStructArray);
  }
}

void main() {
  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    XStructDefinitions.register(MyStruct.struct);
  });

  late XPtr<XStructType> ptr;
  setUp(() => ptr = XPtr.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Scalar - after assignment", () {
    final struct = MyStruct.struct.ptr(ptr).ref;
    final value = 42;
    struct.intField = value;
    expect(struct.intField, equals(value));
  });

  test("Scalar - read live data", () {
    final value = 42;
    ptr.offsetBy(MyStruct._l.offset(.intField)).writeInt(value);
    expect(MyStruct.struct.ptr(ptr).ref.intField, value);
  });

  test("Struct - after assignment", () {
    final struct = MyStruct.struct.ptr(ptr).ref;
    final color = Color.AQUA;
    struct.colorField = color;
    expect(struct.colorField.toString(), equals(color.toString()));
  });

  test("Struct - read live data", () {
    final color = Color.AQUA;
    color.structWriteInto(ptr.offsetBy(MyStruct._l.offset(.colorField)));
    expect(MyStruct.struct.ptr(ptr).ref.colorField.toString(), equals(color.toString()));
  });

  test("Inline Scalar Array - after assignment", () {
    final struct = MyStruct.struct.ptr(ptr).ref;
    final List<int> values = .generate(intArray_COUNT, (i) => i);
    struct.inlineIntArray = values;
    expect(struct.inlineIntArray, equals(values));
  });

  test("Inline Scalar Array - read live data", () {
    final List<int> values = .generate(intArray_COUNT, (i) => i);
    ptr.offsetBy(MyStruct._l.offset(.inlineIntArray)).cast<XInt>().writeArray(values);
    expect(MyStruct.struct.ptr(ptr).ref.inlineIntArray, equals(values));
  });

  test("Pointer Scalar Array - after assignment", () {
    final List<int> values = .generate(intArray_COUNT, (i) => i);
    final struct = structAllocator<MyStruct>().$new;
    struct.pointerIntArray = values;
    expect(struct.pointerIntArray, equals(values));
  });

  test("Pointer Scalar Array - reading live data", () {
    final List<int> values = .generate(intArray_COUNT, (i) => i);
    final struct = structAllocator<MyStruct>().$new;
    struct.getOp().offsetBy(MyStruct._l.offset(.pointerIntArray)).readPtr().cast<XInt>().writeArray(values);
    expect(struct.pointerIntArray.toString(), equals(values.toString()));
  });

  List<Color> generateColors() => .generate(structArray_COUNT, (i) => .color(
    (rand() * 256).toInt(),
    (rand() * 256).toInt(),
    (rand() * 256).toInt(),
    255,
  ));

  test("Inline Struct Array - after assignment", () {
    final struct = MyStruct.struct.ptr(ptr).ref;
    final List<Color> values = generateColors();
    struct.inlineStructArray = values;
    expect(struct.inlineStructArray.toString(), equals(values.toString()));
  });

  test("Inline Struct Array - read live data", () {
    final List<Color> values = generateColors();
    Color.struct.ptr(ptr.offsetBy(MyStruct._l.offset(.inlineStructArray))).writeArray(values);
    expect(MyStruct.struct.ptr(ptr).ref.inlineStructArray.toString(), equals(values.toString()));
  });

  test("Pointer Struct Array - after assignment", () {
    final List<Color> values = generateColors();
    final struct = structAllocator<MyStruct>().$new;
    struct.pointerStructArray = values;
    expect(struct.pointerStructArray.toString(), equals(values.toString()));
  });

  test("Pointer Struct Array - reading live data", () {
    final List<Color> values = generateColors();
    final struct = structAllocator<MyStruct>().$new;
    Color.struct.ptr(struct.getOp().offsetBy(MyStruct._l.offset(.pointerStructArray)).readPtr()).writeArray(values);
    expect(struct.pointerStructArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}