import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';
import 'dart:math' as math;

final math.Random random = .new();

enum MyStructField with StructFields {
  intField,
  colorField,
  inlineIntArray,
  pointerIntArray,
  inlineStructArray,
  pointerStructArray,
}

const int intArray_COUNT = 4;
const int structArray_COUNT = 2;

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .intField: RInt(),
      .colorField: RStruct(ColorD.struct),
      .inlineIntArray: RArray(RInt(), intArray_COUNT),
      .pointerIntArray: RPointer(RInt()),
      .inlineStructArray: RArray(RStruct(ColorD.struct), structArray_COUNT),
      .pointerStructArray: RPointer(RStruct(ColorD.struct)),
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_intField = structLayout.scalar<int, RInt>(.intField);
  static final field_colorField = structLayout.struct<ColorD>(.colorField);
  static final field_inlineIntArray = structLayout.scalarArray<int, RInt>(.inlineIntArray);
  static final field_pointerIntArray = structLayout.pointerScalarArray<int, RInt>(.pointerIntArray);
  static final field_inlineStructArray = structLayout.structArray<ColorD>(.inlineStructArray);
  static final field_pointerStructArray = structLayout.pointerStructArray<ColorD>(.pointerStructArray);

  int _intField;
  int get intField => _intField = field_intField.readOr(op?.ptr, _intField);
  set intField(int value) => _intField = field_intField.writeOr(op?.ptr, value);

  ColorD _colorField;
  ColorD get colorField => _colorField = field_colorField.readOr(op?.ptr, _colorField);
  set colorField(ColorD value) => _colorField = field_colorField.writeOr(op?.ptr, value);

  List<int> _inlineIntArray;
  List<int> get inlineIntArray => _inlineIntArray = field_inlineIntArray.readOr(op?.ptr, _inlineIntArray);
  set inlineIntArray(List<int> value) => _inlineIntArray = field_inlineIntArray.writeOr(op?.ptr, value);

  List<int> _pointerIntArray;
  List<int> get pointerIntArray => _pointerIntArray = field_pointerIntArray.readCountOr(op?.ptr, intArray_COUNT, _pointerIntArray);
  set pointerIntArray(List<int> value) => _pointerIntArray = field_pointerIntArray.writeCountIf(op?.ptr, value);

  List<ColorD> _inlineStructArray;
  List<ColorD> get inlineStructArray => _inlineStructArray = field_inlineStructArray.readOr(op?.ptr, _inlineStructArray);
  set inlineStructArray(List<ColorD> value) => _inlineStructArray = field_inlineStructArray.writeOr(op?.ptr, value);

  List<ColorD> _pointerStructArray;
  List<ColorD> get pointerStructArray => _pointerStructArray = field_pointerStructArray.readCountOr(op?.ptr, structArray_COUNT, _pointerStructArray);
  set pointerStructArray(List<ColorD> value) => _pointerStructArray = field_pointerStructArray.writeCountIf(op?.ptr, value);

  MyStruct({
    super.op,
    int intField = 0,
    ColorD? colorField,
    List<int>? inlineIntArray,
    List<int>? pointerIntArray,
    List<ColorD>? inlineStructArray,
    List<ColorD>? pointerStructArray,
  }) :
    _intField = intField,
    _colorField = colorField ?? .zero(),
    _inlineIntArray = inlineIntArray ?? .filled(field_inlineIntArray.codec.type.count, 0),
    _pointerIntArray = pointerIntArray ?? .filled(intArray_COUNT, 0),
    _inlineStructArray = inlineStructArray ?? .generate(field_inlineStructArray.codec.type.count, (_) => .zero()),
    _pointerStructArray = pointerStructArray ?? .generate(structArray_COUNT, (_) => .zero());

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_pointerIntArray.allocate(temp, p, '${key}_pointerIntArray');
    field_pointerStructArray.allocate(temp, p, '${key}_pointerStructArray');
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _intField = field_intField.read(p);
    _colorField = field_colorField.read(p);
    _inlineIntArray = field_inlineIntArray.read(p);
    _pointerIntArray = field_pointerIntArray.readCount(p, intArray_COUNT, _pointerIntArray);
    _inlineStructArray = field_inlineStructArray.read(p);
    _pointerStructArray = field_pointerStructArray.readCount(p, structArray_COUNT, _pointerStructArray);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_intField.write(p, _intField);
    field_colorField.write(p, _colorField);
    field_inlineIntArray.write(p, _inlineIntArray);
    field_pointerIntArray.writeCount(p, _pointerIntArray);
    field_inlineStructArray.write(p, _inlineStructArray);
    field_pointerStructArray.writeCount(p, _pointerStructArray);
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

  test("Scalar - after assignment", () {
    final struct = MyStruct.struct.ptr(ptr).ref;
    final value = 42;
    struct.intField = value;
    expect(struct.intField, equals(value));
  });

  test("Scalar - read live data", () {
    final value = 42;
    ptr.offsetBy(MyStruct.structLayout.offset(.intField)).writeInt(value);
    expect(MyStruct.struct.ptr(ptr).ref.intField, value);
  });

  test("Struct - after assignment", () {
    final struct = MyStruct.struct.ptr(ptr).ref;
    final color = ColorD.AQUA;
    struct.colorField = color;
    expect(struct.colorField.toString(), equals(color.toString()));
  });

  test("Struct - read live data", () {
    final color = ColorD.AQUA;
    color.structWriteInto(ptr.offsetBy(MyStruct.structLayout.offset(.colorField)));
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
    ptr.offsetBy(MyStruct.structLayout.offset(.inlineIntArray)).cast<RInt>().writeArray(values);
    expect(MyStruct.struct.ptr(ptr).ref.inlineIntArray, equals(values));
  });

  test("Pointer Scalar Array - after assignment", () {
    final List<int> values = .generate(intArray_COUNT, (i) => i);
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.pointerIntArray = values;
    expect(struct.pointerIntArray, equals(values));
  });

  test("Pointer Scalar Array - reading live data", () {
    final List<int> values = .generate(intArray_COUNT, (i) => i);
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.getOp().offsetBy(MyStruct.structLayout.offset(.pointerIntArray)).readPtr().cast<RInt>().writeArray(values);
    expect(struct.pointerIntArray.toString(), equals(values.toString()));
  });

  List<ColorD> generateColors() => .generate(structArray_COUNT, (i) => .color(
    (rand() * 256).toInt(),
    (rand() * 256).toInt(),
    (rand() * 256).toInt(),
    255,
  ));

  test("Inline Struct Array - after assignment", () {
    final struct = MyStruct.struct.ptr(ptr).ref;
    final List<ColorD> values = generateColors();
    struct.inlineStructArray = values;
    expect(struct.inlineStructArray.toString(), equals(values.toString()));
  });

  test("Inline Struct Array - read live data", () {
    final List<ColorD> values = generateColors();
    ColorD.struct.ptr(ptr.offsetBy(MyStruct.structLayout.offset(.inlineStructArray))).writeArray(values);
    expect(MyStruct.struct.ptr(ptr).ref.inlineStructArray.toString(), equals(values.toString()));
  });

  test("Pointer Struct Array - after assignment", () {
    final List<ColorD> values = generateColors();
    final struct = myStructAlloc.Allocate(.new()).ref;
    struct.pointerStructArray = values;
    expect(struct.pointerStructArray.toString(), equals(values.toString()));
  });

  test("Pointer Struct Array - reading live data", () {
    final List<ColorD> values = generateColors();
    final struct = myStructAlloc.Allocate(.new()).ref;
    ColorD.struct.ptr(struct.getOp().offsetBy(MyStruct.structLayout.offset(.pointerStructArray)).readPtr()).writeArray(values);
    expect(struct.pointerStructArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}