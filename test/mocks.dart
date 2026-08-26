import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart' as ffi;
import 'package:raylib_dartified/raylib_dartified.dart';

NativeMemoryPointer<RVoid> _defaultFromBytes<T extends TypedDataList>(T data) {
  final byteLength = data.buffer.lengthInBytes - data.offsetInBytes;
  final ptr = ffi.malloc<Uint8>(byteLength);
  final asBytes = (data as TypedData).buffer.asUint8List(data.offsetInBytes, byteLength);
  ptr.asTypedList(byteLength).setAll(0, asBytes);
  return .new(ptr.cast());
}

NativeMemoryPointer<Y> _defaultNullptrFactory<Y extends RType>() => .new(nullptr);

NativeMemoryPointer<RUint8> _defaultFromString(String text, [int? bufferSize]) {
  final bytes = utf8.encode(text);
  final len = bytes.length + 1;
  final bufSize = bufferSize != null ? (bufferSize > len ? bufferSize : len) : len;
  final ptr = ffi.calloc<Uint8>(bufSize);
  ptr.asTypedList(bufSize).setRange(0, bytes.length, bytes);
  return .new(ptr);
}

NativeMemoryPointer<Y> _defaultMalloc<Y extends RType>(int size)
  => .new(ffi.malloc.allocate(size));

enum MockTestField { a, ptrField, b }

/// Minimal synthetic struct for exercising StructLayout + MemoryPointer
/// in isolation, independent of any real raylib struct's ownership semantics.
class MockTestStruct extends RaylibStruct<MockTestStruct> {
  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<MockTestField> structLayout = .aligned(structFields);
  static final Map<MockTestField, RType> structFields = {
    .a:        RUint32(),
    .ptrField: RPointer<RInt32>(),
    .b:        RUint32(),
  };

  static StructPointer<MockTestStruct> pointer([MemoryPointer? ptr])
    => .nullable(ptr, structLayout, MockTestStruct.new, MockTestStruct.pointer);

  int _a;
  int get a {
    structOnOp((p) => _a = p.readUint32(structLayout.offset(.a)));
    return _a;
  }
  set a(int value) {
    _a = value;
    structOnOp((p) => p.writeUint32(value, structLayout.offset(.a)));
  }

  // No LiveListPointerScalar here on purpose, raw pointer only, so a
  // failure isolates to StructLayout/MemoryPointer, not the live-array layer.
  MemoryPointer<RInt32> _ptrField;
  MemoryPointer<RInt32> get ptrField {
    structOnOp((p) => _ptrField = p.readPtr(structLayout.offset(.ptrField)));
    return _ptrField;
  }
  set ptrField(MemoryPointer<RInt32> value) {
    _ptrField = value;
    structOnOp((p) => p.writePtr(value, structLayout.offset(.ptrField)));
  }

  int _b;
  int get b {
    structOnOp((p) => _b = p.readUint32(structLayout.offset(.b)));
    return _b;
  }
  set b(int value) {
    _b = value;
    structOnOp((p) => p.writeUint32(value, structLayout.offset(.b)));
  }

  MockTestStruct({
    super.op,
    int a = 0,
    MemoryPointer<RInt32>? ptrField,
    int b = 0,
  }) :
    _a = a,
    _ptrField = ptrField ?? MemoryPointer.nullptr.cast(),
    _b = b;

  factory MockTestStruct.zero() => .new();

  @override
  MockTestStruct setD(MockTestStruct o) {
    a = o.a;
    ptrField = o.ptrField;
    b = o.b;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeUint32(_a, structLayout.offset(.a));
    p.writePtr(_ptrField, structLayout.offset(.ptrField));
    p.writeUint32(_b, structLayout.offset(.b));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _a = p.readUint32(structLayout.offset(.a));
    _ptrField = p.readPtr(structLayout.offset(.ptrField));
    _b = p.readUint32(structLayout.offset(.b));
  }

  @override
  MockTestStruct clone() => .new(op: op, a: a, ptrField: ptrField, b: b);

  @override
  String signature() => '$structName(a: $a, ptrField: $ptrField, b: $b)';
}

void initMocks() {
  RType.nativeWordSize = sizeOf<IntPtr>();
  MemoryPointer.fromBytes = _defaultFromBytes;
  MemoryPointer.fromString = _defaultFromString;
  MemoryPointer.nullptrFactory = _defaultNullptrFactory;
  MemoryPointer.malloc = _defaultMalloc;
}