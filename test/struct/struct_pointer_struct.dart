import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

enum MyStructField with StructFields {
  pointerStruct,
}

class MyStruct extends RaylibStruct<MyStruct> {

  static final StructType<MyStruct> struct = .create(
    factory: MyStruct.new,
    layout: .aligned<MyStructField>({
      .pointerStruct: RPointer(RStruct(Color.struct)), // exactly 1 value
    }),
  );

  static final StructLayout<MyStructField> structLayout = struct.layoutOf();
  static final field_pointerStruct = structLayout.pointerStruct<Color>(.pointerStruct);

  Color _pointerStruct;
  Color get pointerStruct => _pointerStruct = field_pointerStruct.readOr(op?.ptr, _pointerStruct);
  set pointerStruct(Color value) => _pointerStruct = field_pointerStruct.writeOr(op?.ptr, value);

  MyStruct({
    super.op,
    Color? pointerStruct,
  }) : _pointerStruct = pointerStruct ?? .zero();

  @override
  MyStruct clone() => .new(op: op);

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_pointerStruct.allocate(temp, p, key);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    pointerStruct = field_pointerStruct.readSafe(p, pointerStruct);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_pointerStruct.writeSafe(p, pointerStruct);
  }
}

void main() {
  setUpAll(() {
    findRaylib('raylib-6.0_linux_amd64/lib', silent: true);
    StructTypes.register(MyStruct.struct);
  });

  test("Pointer Struct - after assignment", () {
    final Color value = .AQUA;
    final struct = structAllocator<MyStruct>().$new;
    struct.pointerStruct = value;
    expect(struct.pointerStruct.toString(), equals(value.toString()));
  });

  test("Pointer Struct - reading live data", () {
    final Color value = .AQUA;
    final struct = structAllocator<MyStruct>().$new;
    final colorPtr = struct.getOp().offsetBy(MyStruct.structLayout.offset(.pointerStruct)).readPtr();
    Color.struct.ptr(colorPtr).ref = value;
    expect(struct.pointerStruct.toString(), equals(value.toString()));
  });

  tearDownAll(disposeRaylib);
}