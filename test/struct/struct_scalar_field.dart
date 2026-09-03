import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  scalarField,
}

class MyStruct extends RaylibStruct<MyStruct> {

  @override
  StructLayout<MyStructField> get structLayout => struct;

  static final StructLayout<MyStructField> struct = .aligned({
    .scalarField: RInt(),
  });

  static StructPointer<MyStruct> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MyStruct.new, MyStruct.pointer);

  static final _scalarFieldF = struct.scalar<int, RInt>(.scalarField);

  int _scalarField;
  int get scalarField => _scalarField = _scalarFieldF.readOr(op?.ptr, _scalarField);
  set scalarField(int value) => _scalarField = _scalarFieldF.writeIf(op?.ptr, value);

  MyStruct({
    super.op,
    int scalarField = 0,
  }) : _scalarField = scalarField;

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(MemoryPointer p) {
    _scalarField = _scalarFieldF.read(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _scalarFieldF.write(p, _scalarField);
  }
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Scalar - after assignment", () {
    final value = 42;
    final struct = MyStruct.pointer(ptr).ref;
    struct.scalarField = value;
    expect(struct.scalarField, equals(value));
  });

  test("Scalar - read live data", () {
    final value = 42;
    ptr.offsetBy(MyStruct.struct.offset(.scalarField)).writeInt(value);
    expect(MyStruct.pointer(ptr).ref.scalarField, value);
  });

  tearDownAll(disposeRaylib);
}