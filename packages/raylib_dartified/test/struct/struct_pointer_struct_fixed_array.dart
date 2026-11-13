import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with XFields {
  pointerStructFixedArray,
}

class MyStruct extends XStruct<MyStruct> {

  static final XStructType<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerStructFixedArray: XRawPtr(XArray(XRawStruct(Color.struct), 2)),
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_pointerStructFixedArray = _l.ptrStructFixedArray<Color>(.pointerStructFixedArray);

  List<Color> _pointerStructFixedArray;
  List<Color> get pointerStructFixedArray => _pointerStructFixedArray = field_pointerStructFixedArray.readOr(op?.ptr, _pointerStructFixedArray);
  set pointerStructFixedArray(List<Color> value) => _pointerStructFixedArray = field_pointerStructFixedArray.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    List<Color>? pointerStructFixedArray,
  }) : _pointerStructFixedArray = pointerStructFixedArray ?? .generate(2, (_) => .zero());

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(XPtr p, String key) {
    field_pointerStructFixedArray.allocate(p, key);
  }

  @override
  void structReadFrom(XPtr p) {
    pointerStructFixedArray = field_pointerStructFixedArray.readSafe(p, pointerStructFixedArray);
  }

  @override
  void structWriteInto(XPtr p) {
    field_pointerStructFixedArray.write(p, pointerStructFixedArray);
  }
}

void main() {
  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    XStructTypes.register(MyStruct.struct);
  });

  test("Pointer Struct Array - after assignment", () {
    final List<Color> values = [.WHITE, .RED];
    final struct = structAllocator<MyStruct>().$new;
    struct.pointerStructFixedArray = values;
    expect(struct.pointerStructFixedArray.toString(), equals(values.toString()));
  });

  test("Pointer Struct Array - reading live data", () {
    final List<Color> values = [.WHITE, .RED];
    final struct = structAllocator<MyStruct>().$new;
    Color.struct.ptr(struct.getOp().offsetBy(MyStruct._l.offset(.pointerStructFixedArray)).readPtr()).writeArray(values);
    expect(struct.pointerStructFixedArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}