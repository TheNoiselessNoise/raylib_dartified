import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with XFields {
  scalarField,
}

class MyStruct extends XStruct<MyStruct> {

  static final XStructType<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .scalarField: XInt(),
    }),
  );

  static final XLayout<MyStructField> _l = struct.layoutOf();
  static final field_scalarField = _l.scalar<int, XInt>(.scalarField);

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
  void structReadFrom(XPtr p) {
    scalarField = field_scalarField.read(p);
  }

  @override
  void structWriteInto(XPtr p) {
    field_scalarField.write(p, scalarField);
  }
}

void main() {
  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    XStructTypes.register(MyStruct.struct);
  });

  late XPtr<XRawStruct> ptr;
  setUp(() => ptr = XPtr.calloc(1, MyStruct.struct.byteSize));
  tearDown(() => ptr.free());

  test("Scalar - after assignment", () {
    final value = 42;
    final struct = MyStruct.struct.ptr(ptr).ref;
    struct.scalarField = value;
    expect(struct.scalarField, equals(value));
  });

  test("Scalar - read live data", () {
    final value = 42;
    ptr.offsetBy(MyStruct._l.offset(.scalarField)).writeInt(value);
    expect(MyStruct.struct.ptr(ptr).ref.scalarField, value);
  });

  tearDownAll(disposeRaylib);
}