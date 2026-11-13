import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with XFields {
  pointerScalarArray,
}

class MyStruct extends XStruct<MyStruct> {

  static final XStructType<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerScalarArray: XRawPtr(XInt()), // exactly 4
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_pointerScalarArray = _l.ptrScalarArray<int, XInt>(.pointerScalarArray);

  List<int> _pointerScalarArray;
  List<int> get pointerScalarArray => _pointerScalarArray = field_pointerScalarArray.readCountOr(op?.ptr, 4, _pointerScalarArray);
  set pointerScalarArray(List<int> value) => _pointerScalarArray = field_pointerScalarArray.writeCountIf(op?.ptr, value);

  MyStruct({
    super.op,
    List<int>? pointerScalarArray,
  }) : _pointerScalarArray = pointerScalarArray ?? .filled(4, 0);

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(XPtr p, String key) {
    field_pointerScalarArray.allocate(p, key);
  }

  @override
  void structReadFrom(XPtr p) {
    pointerScalarArray = field_pointerScalarArray.readCount(p, 4, pointerScalarArray);
  }

  @override
  void structWriteInto(XPtr p) {
    field_pointerScalarArray.writeCount(p, pointerScalarArray);
  }
}

void main() {
  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    XStructTypes.register(MyStruct.struct);
  });

  test("Pointer Scalar Array - after assignment", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = structAllocator<MyStruct>().$new;
    struct.pointerScalarArray = values;
    expect(struct.pointerScalarArray, equals(values));
  });

  test("Pointer Scalar Array - reading live data", () {
    final List<int> values = .generate(4, (i) => i);
    final struct = structAllocator<MyStruct>().$new;
    struct.getOp().offsetBy(MyStruct._l.offset(.pointerScalarArray)).readPtr().cast<XInt>().writeArray(values);
    expect(struct.pointerScalarArray.toString(), equals(values.toString()));
  });

  tearDownAll(disposeRaylib);
}