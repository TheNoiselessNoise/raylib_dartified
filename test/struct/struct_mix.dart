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

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .intField: RInt(),
    .colorField: RStruct(ColorD.struct),
    .inlineIntArray: RArray(RInt(), intArray_COUNT),
    .pointerIntArray: RPointer(RInt()),
    .inlineStructArray: RArray(RStruct(ColorD.struct), structArray_COUNT),
    .pointerStructArray: RPointer(RStruct(ColorD.struct)),
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _intFieldF = struct.scalar<int, RInt>(.intField);
  static final _colorFieldF = struct.struct(.colorField, ColorD.pointer);
  static final _inlineIntArrayF = struct.scalarArray<int, RInt>(.inlineIntArray);
  static final _pointerIntArrayF = struct.pointerScalarArray<int, RInt>(.pointerIntArray);
  static final _inlineStructArrayF = struct.structArray<ColorD>(.inlineStructArray, ColorD.pointer);
  static final _pointerStructArrayF = struct.pointerStructArray<ColorD>(.pointerStructArray, ColorD.pointer);

  int _intField;
  int get intField => _intField = _intFieldF.readOr(op?.ptr, _intField);
  set intField(int value) => _intField = _intFieldF.writeIf(op?.ptr, value);

  ColorD _colorField;
  ColorD get colorField => _colorField = _colorFieldF.readOr(op?.ptr, _colorField);
  set colorField(ColorD value) => _colorField = _colorFieldF.writeIf(op?.ptr, value);

  List<int> _inlineIntArray;
  List<int> get inlineIntArray => _inlineIntArray = _inlineIntArrayF.readOr(op?.ptr, _inlineIntArray);
  set inlineIntArray(List<int> value) {
    assert(value.length <= _inlineIntArrayF.codec.type.count);
    _inlineIntArray = _inlineIntArrayF.writeIf(op?.ptr, value);
  }

  List<int> _pointerIntArray;
  List<int> get pointerIntArray => _pointerIntArray = _pointerIntArrayF.readCountOr(op?.ptr, intArray_COUNT, _pointerIntArray);
  set pointerIntArray(List<int> value) => _pointerIntArray = _pointerIntArrayF.writeCountIf(op?.ptr, value);

  List<ColorD> _inlineStructArray;
  List<ColorD> get inlineStructArray => _inlineStructArray = _inlineStructArrayF.readOr(op?.ptr, _inlineStructArray);
  set inlineStructArray(List<ColorD> value) {
    assert(value.length <= _inlineStructArrayF.codec.type.count);
    _inlineStructArray = _inlineStructArrayF.writeIf(op?.ptr, value);
  }

  List<ColorD> _pointerStructArray;
  List<ColorD> get pointerStructArray => _pointerStructArray = _pointerStructArrayF.readCountOr(op?.ptr, structArray_COUNT, _pointerStructArray);
  set pointerStructArray(List<ColorD> value) => _pointerStructArray = _pointerStructArrayF.writeCountIf(op?.ptr, value);

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
    _inlineIntArray = inlineIntArray ?? .filled(_inlineIntArrayF.codec.type.count, 0),
    _pointerIntArray = pointerIntArray ?? .filled(intArray_COUNT, 0),
    _inlineStructArray = inlineStructArray ?? .generate(_inlineStructArrayF.codec.type.count, (_) => .zero()),
    _pointerStructArray = pointerStructArray ?? .generate(structArray_COUNT, (_) => .zero());

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    _pointerIntArrayF.allocate(temp, p, '${key}_pointerIntArray');
    _pointerStructArrayF.allocate(temp, p, '${key}_pointerStructArray');
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _intField = _intFieldF.read(p);
    _colorField = _colorFieldF.read(p);
    _inlineIntArray = _inlineIntArrayF.read(p);
    _pointerIntArray = _pointerIntArrayF.readCount(p, intArray_COUNT, _pointerIntArray);
    _inlineStructArray = _inlineStructArrayF.read(p);
    _pointerStructArray = _pointerStructArrayF.readCount(p, structArray_COUNT, _pointerStructArray);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _intFieldF.write(p, _intField);
    _colorFieldF.write(p, _colorField);
    _inlineIntArrayF.write(p, _inlineIntArray);
    _pointerIntArrayF.writeCount(p, _pointerIntArray);
    _inlineStructArrayF.write(p, _inlineStructArray);
    _pointerStructArrayF.writeCount(p, _pointerStructArray);
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

  test("Scalar - after assignment", () {
    final struct = MyStruct.pointer(ptr).ref;
    final value = 42;
    struct.intField = value;
    expect(struct.intField, equals(value));
  });

  test("Scalar - read live data", () {
    final value = 42;
    ptr.offsetBy(MyStruct.struct.offset(.intField)).writeInt(value);
    expect(MyStruct.pointer(ptr).ref.intField, value);
  });

  test("Struct - after assignment", () {
    final struct = MyStruct.pointer(ptr).ref;
    final color = ColorD.AQUA;
    struct.colorField = color;
    expect(struct.colorField.toString(), equals(color.toString()));
  });

  test("Struct - read live data", () {
    final color = ColorD.AQUA;
    color.structWriteInto(ptr.offsetBy(MyStruct.struct.offset(.colorField)));
    expect(MyStruct.pointer(ptr).ref.colorField.toString(), equals(color.toString()));
  });

  test("Inline Scalar Array - after assignment", () {
    final struct = MyStruct.pointer(ptr).ref;
    final List<int> values = .generate(intArray_COUNT, (i) => i);
    struct.inlineIntArray = values;
    expect(struct.inlineIntArray, equals(values));
  });

  test("Inline Scalar Array - read live data", () {
    final List<int> values = .generate(intArray_COUNT, (i) => i);
    ptr.offsetBy(MyStruct.struct.offset(.inlineIntArray)).cast<RInt>().writeArray(values);
    expect(MyStruct.pointer(ptr).ref.inlineIntArray, equals(values));
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
    struct.getOp().offsetBy(MyStruct.struct.offset(.pointerIntArray)).readPtr().cast<RInt>().writeArray(values);
    expect(struct.pointerIntArray.toString(), equals(values.toString()));
  });

  List<ColorD> generateColors() => .generate(structArray_COUNT, (i) => .color(
    (rand() * 256).toInt(),
    (rand() * 256).toInt(),
    (rand() * 256).toInt(),
    255,
  ));

  test("Inline Struct Array - after assignment", () {
    final struct = MyStruct.pointer(ptr).ref;
    final List<ColorD> values = generateColors();
    struct.inlineStructArray = values;
    expect(struct.inlineStructArray.toString(), equals(values.toString()));
  });

  test("Inline Struct Array - read live data", () {
    final List<ColorD> values = generateColors();
    ColorD.pointer(ptr.offsetBy(MyStruct.struct.offset(.inlineStructArray))).writeArray(values);
    expect(MyStruct.pointer(ptr).ref.inlineStructArray.toString(), equals(values.toString()));
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
    ColorD.pointer(struct.getOp().offsetBy(MyStruct.struct.offset(.pointerStructArray)).readPtr()).writeArray(values);
    expect(struct.pointerStructArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}