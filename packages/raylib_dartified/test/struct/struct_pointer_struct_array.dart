import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with XFields {
  pointerStructArray,
}

class MyStruct extends XStruct<MyStruct> {

  static final XStructType<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerStructArray: XRawPtr(XRawStruct(Color.struct)), // exactly 2
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_pointerStructArray = _l.ptrStructArray<Color>(.pointerStructArray);

  List<Color> _pointerStructArray;
  List<Color> get pointerStructArray => _pointerStructArray = field_pointerStructArray.readCountOr(op?.ptr, 2, _pointerStructArray);
  set pointerStructArray(List<Color> value) => _pointerStructArray = field_pointerStructArray.writeCountIf(op?.ptr, value);

  MyStruct({
    super.op,
    List<Color>? pointerStructArray,
  }) : _pointerStructArray = pointerStructArray ?? .generate(2, (_) => .zero());

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(XPtr p, String key) {
    field_pointerStructArray.allocate(p, key);
  }

  @override
  void structReadFrom(XPtr p) {
    pointerStructArray = field_pointerStructArray.readCount(p, 2, pointerStructArray);
  }

  @override
  void structWriteInto(XPtr p) {
    field_pointerStructArray.writeCount(p, pointerStructArray);
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
    struct.pointerStructArray = values;
    expect(struct.pointerStructArray.toString(), equals(values.toString()));
  });

  test("Pointer Struct Array - reading live data", () {
    final List<Color> values = [.WHITE, .RED];
    final struct = structAllocator<MyStruct>().$new;
    Color.struct.ptr(struct.getOp().offsetBy(MyStruct._l.offset(.pointerStructArray)).readPtr()).writeArray(values);
    expect(struct.pointerStructArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}