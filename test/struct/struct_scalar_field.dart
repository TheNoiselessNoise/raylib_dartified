import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  scalarField,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .new(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .scalarField: RInt(),
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_scalarField = structLayout.scalar<int, RInt>(.scalarField);

  int _scalarField;
  int get scalarField => _scalarField = field_scalarField.readOr(op?.ptr, _scalarField);
  set scalarField(int value) => _scalarField = field_scalarField.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    int scalarField = 0,
  }) : _scalarField = scalarField;

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structReadFrom(MemoryPointer p) {
    _scalarField = field_scalarField.read(p);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_scalarField.write(p, _scalarField);
  }
}

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late MemoryPointer<RStruct> ptr;
  setUp(() => ptr = MemoryPointer.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Scalar - after assignment", () {
    final value = 42;
    final struct = MyStruct.struct.ptr(ptr).ref;
    struct.scalarField = value;
    expect(struct.scalarField, equals(value));
  });

  test("Scalar - read live data", () {
    final value = 42;
    ptr.offsetBy(MyStruct.structLayout.offset(.scalarField)).writeInt(value);
    expect(MyStruct.struct.ptr(ptr).ref.scalarField, value);
  });

  tearDownAll(disposeRaylib);
}