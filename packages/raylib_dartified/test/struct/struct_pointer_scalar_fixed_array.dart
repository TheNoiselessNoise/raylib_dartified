import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with XFields {
  pointerScalarFixedArray,
}

final class MyStruct extends XStruct<MyStruct> {

  static final XStructDef<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerScalarFixedArray: XPtrType(XArray(XInt(), 4)),
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_pointerScalarFixedArray = _l.ptrScalarFixedArray<int, XInt>(.pointerScalarFixedArray);

  List<int> _pointerScalarFixedArray;
  List<int> get pointerScalarFixedArray => _pointerScalarFixedArray = field_pointerScalarFixedArray.readOr(op?.ptr, _pointerScalarFixedArray);
  set pointerScalarFixedArray(List<int> value) => _pointerScalarFixedArray = field_pointerScalarFixedArray.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    List<int>? pointerScalarFixedArray,
  }) : _pointerScalarFixedArray = pointerScalarFixedArray ?? .filled(4, 0);

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(XPtr p, String key) {
    field_pointerScalarFixedArray.allocate(p, key);
  }

  @override
  void structReadFrom(XPtr p) {
    pointerScalarFixedArray = field_pointerScalarFixedArray.readSafe(p, pointerScalarFixedArray);
  }

  @override
  void structWriteInto(XPtr p) {
    field_pointerScalarFixedArray.write(p, pointerScalarFixedArray);
  }
}

void main() {
  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    XStructDefinitions.register(MyStruct.struct);
  });

  test("Pointer Scalar Array - after assignment", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = structAllocator<MyStruct>().$new;
    struct.pointerScalarFixedArray = values;
    expect(struct.pointerScalarFixedArray, equals(values));
  });

  test("Pointer Scalar Array - reading live data", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = structAllocator<MyStruct>().$new;
    struct.getOp().offsetBy(MyStruct._l.offset(.pointerScalarFixedArray)).readPtr().cast<XInt>().writeArray(values);
    expect(struct.pointerScalarFixedArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}