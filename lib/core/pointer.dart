part of 'raylib_dartified.dart';

class NativeMemoryPointer<X extends RType> extends MemoryPointer<X> {
  final Pointer _ptr; // untyped pointer

  NativeMemoryPointer(this._ptr);

  /* --- NATIVE SPECIFIC --- */

  Pointer<R> asPointer<R extends NativeType>() => _ptr.cast<R>();

  static NativeMemoryPointer<Y>? orNull<Y extends RType>(Pointer? p)
    => p == null ? null : .new(p);

  /* --- --------------- --- */

  void _f() => throw StateError('MemoryPointer has been freed.');

  void _fd(String method, List<Object?> args)
    => throw StateError('Tried to do `$method(${args.join(', ')})` on freed pointer.');

  void _p(String method, [Object? arg1, Object? arg2]) {
    if (!_isFreed) return;
    MemoryPointer.debug ? _fd(method, [arg1, arg2]) : _f();
  }

  @override
  NativeMemoryPointer<Y> cast<Y extends RType>() => .new(_ptr);

  @override
  bool get isNull => _isFreed || _ptr == nullptr;

  bool _isFreed = false;

  @override
  void free() {
    if (_ptr == nullptr) return;
    _p('free');
    _isFreed = true;
    ffi.malloc.free(_ptr);
  }

  @override
  int get address => _ptr.address;

  @override
  T to<T extends TypedDataList>(int length) {
    _p('to', T, length);
    return switch (T) {
      const (Uint8List) => Uint8List.fromList(_ptr.cast<Uint8>().asTypedList(length)) as T,
      const (Int8List) => Int8List.fromList(_ptr.cast<Int8>().asTypedList(length)) as T,
      const (Uint16List) => Uint16List.fromList(_ptr.cast<Uint16>().asTypedList(length)) as T,
      const (Int16List) => Int16List.fromList(_ptr.cast<Int16>().asTypedList(length)) as T,
      const (Uint32List) => Uint32List.fromList(_ptr.cast<Uint32>().asTypedList(length)) as T,
      const (Int32List) => Int32List.fromList(_ptr.cast<Int32>().asTypedList(length)) as T,
      const (Uint64List) => Uint64List.fromList(_ptr.cast<Uint64>().asTypedList(length)) as T,
      const (Int64List) => Int64List.fromList(_ptr.cast<Int64>().asTypedList(length)) as T,
      const (Float32List) => Float32List.fromList(_ptr.cast<Float>().asTypedList(length)) as T,
      const (Float64List) => Float64List.fromList(_ptr.cast<Double>().asTypedList(length)) as T,
      _ => throw UnsupportedError('NativeMemoryPointer.to<$T> not implemented'),
    };
  }

  @override
  T asView<T extends TypedDataList>(int length) {
    _p('asView', T, length);
    return switch (T) {
      const (Uint8List) => _ptr.cast<Uint8>().asTypedList(length) as T,
      const (Int8List) => _ptr.cast<Int8>().asTypedList(length) as T,
      const (Uint16List) => _ptr.cast<Uint16>().asTypedList(length) as T,
      const (Int16List) => _ptr.cast<Int16>().asTypedList(length) as T,
      const (Uint32List) => _ptr.cast<Uint32>().asTypedList(length) as T,
      const (Int32List) => _ptr.cast<Int32>().asTypedList(length) as T,
      const (Uint64List) => _ptr.cast<Uint64>().asTypedList(length) as T,
      const (Int64List) => _ptr.cast<Int64>().asTypedList(length) as T,
      const (Float32List) => _ptr.cast<Float>().asTypedList(length) as T,
      const (Float64List) => _ptr.cast<Double>().asTypedList(length) as T,
      _ => throw UnsupportedError('NativeMemoryPointer.asView<$T> not implemented'),
    };
  }

  @override
  String toDartString() {
    _p('toDartString');
    return _ptr.cast<Utf8>().toDartString();
  }

  @override
  String toDartStringBounded(int maxLength) {
    _p('toDartStringBounded', maxLength);
    return _ptr.cast<Utf8>().toDartString(length: maxLength);
  }

  @override
  NativeMemoryPointer<Y> offsetBy<Y extends RType>(int byteOffset) => .new(_at(byteOffset));

  Pointer<T> _at<T extends NativeType>(int byteOffset)
    => (_ptr.cast<Uint8>() + byteOffset).cast<T>();

  @override
  NativeMemoryPointer<Y> readPtr<Y extends RType>([int byteOffset = 0]) {
    _p('readPtr', Y, byteOffset);
    return .new(.fromAddress(Pointer<IntPtr>.fromAddress(address + byteOffset).value));
  }

  @override
  void writePtr(MemoryPointer<RType>? value, [int byteOffset = 0]) {
    _p('writePtr', value?.address, byteOffset);
    Pointer<IntPtr>.fromAddress(address + byteOffset).value = value?.address ?? nullptr.address;
  }

  @override int readSize([int byteOffset = 0]) { _p('readSize', byteOffset); return _at<Size>(byteOffset).value; }
  @override bool readBool([int byteOffset = 0]) { _p('readBool', byteOffset); return _at<Bool>(byteOffset).value; }
  @override int readInt8([int byteOffset = 0]) { _p('readInt8', byteOffset); return _at<Int8>(byteOffset).value; }
  @override int readUint8([int byteOffset = 0]) { _p('readUint8', byteOffset); return _at<Uint8>(byteOffset).value; }
  @override int readInt16([int byteOffset = 0]) { _p('readInt16', byteOffset); return _at<Int16>(byteOffset).value; }
  @override int readUint16([int byteOffset = 0]) { _p('readUint16', byteOffset); return _at<Uint16>(byteOffset).value; }
  @override int readInt32([int byteOffset = 0]) { _p('readInt32', byteOffset); return _at<Int32>(byteOffset).value; }
  @override int readUint32([int byteOffset = 0]) { _p('readUint32', byteOffset); return _at<Uint32>(byteOffset).value; }
  @override int readInt64([int byteOffset = 0]) { _p('readInt64', byteOffset); return _at<Int64>(byteOffset).value; }
  @override int readUint64([int byteOffset = 0]) { _p('readUint64', byteOffset); return _at<Uint64>(byteOffset).value; }
  @override double readFloat32([int byteOffset = 0]) { _p('readFloat32', byteOffset); return _at<Float>(byteOffset).value; }
  @override double readFloat64([int byteOffset = 0]) { _p('readFloat64', byteOffset); return _at<Double>(byteOffset).value; }
  @override int readChar([int byteOffset = 0]) { _p('readChar', byteOffset); return _at<Char>(byteOffset).value; }
  @override int readUnsignedChar([int byteOffset = 0]) { _p('readUnsignedChar', byteOffset); return _at<UnsignedChar>(byteOffset).value; }
  @override int readShort([int byteOffset = 0]) { _p('readShort', byteOffset); return _at<Short>(byteOffset).value; }
  @override int readUnsignedShort([int byteOffset = 0]) { _p('readUnsignedShort', byteOffset); return _at<UnsignedShort>(byteOffset).value; }
  @override int readInt([int byteOffset = 0]) { _p('readInt', byteOffset); return _at<Int>(byteOffset).value; }
  @override int readUnsignedInt([int byteOffset = 0]) { _p('readUnsignedInt', byteOffset); return _at<UnsignedInt>(byteOffset).value; }
  @override double readFloat([int byteOffset = 0]) { _p('readFloat', byteOffset); return _at<Float>(byteOffset).value; }
  @override double readDouble([int byteOffset = 0]) { _p('readDouble', byteOffset); return _at<Double>(byteOffset).value; }

  @override void writeSize(int value, [int byteOffset = 0]) { _p('writeSize', value, byteOffset); _at<Size>(byteOffset).value = value; }
  @override void writeBool(bool value, [int byteOffset = 0]) { _p('writeBool', value, byteOffset); _at<Bool>(byteOffset).value = value; }
  @override void writeInt8(int value, [int byteOffset = 0]) { _p('writeInt8', value, byteOffset); _at<Int8>(byteOffset).value = value; }
  @override void writeUint8(int value, [int byteOffset = 0]) { _p('writeUint8', value, byteOffset); _at<Uint8>(byteOffset).value = value; }
  @override void writeInt16(int value, [int byteOffset = 0]) { _p('writeInt16', value, byteOffset); _at<Int16>(byteOffset).value = value; }
  @override void writeUint16(int value, [int byteOffset = 0]) { _p('writeUint16', value, byteOffset); _at<Uint16>(byteOffset).value = value; }
  @override void writeInt32(int value, [int byteOffset = 0]) { _p('writeInt32', value, byteOffset); _at<Int32>(byteOffset).value = value; }
  @override void writeUint32(int value, [int byteOffset = 0]) { _p('writeUint32', value, byteOffset); _at<Uint32>(byteOffset).value = value; }
  @override void writeInt64(int value, [int byteOffset = 0]) { _p('writeInt64', value, byteOffset); _at<Int64>(byteOffset).value = value; }
  @override void writeUint64(int value, [int byteOffset = 0]) { _p('writeUint64', value, byteOffset); _at<Uint64>(byteOffset).value = value; }
  @override void writeFloat32(double value, [int byteOffset = 0]) { _p('writeFloat32', value, byteOffset); _at<Float>(byteOffset).value = value; }
  @override void writeFloat64(double value, [int byteOffset = 0]) { _p('writeFloat64', value, byteOffset); _at<Double>(byteOffset).value = value; }
  @override void writeChar(int value, [int byteOffset = 0]) { _p('writeChar', value, byteOffset); _at<Char>(byteOffset).value = value; }
  @override void writeUnsignedChar(int value, [int byteOffset = 0]) { _p('writeUnsignedChar', value, byteOffset); _at<UnsignedChar>(byteOffset).value = value; }
  @override void writeShort(int value, [int byteOffset = 0]) { _p('writeShort', value, byteOffset); _at<Short>(byteOffset).value = value; }
  @override void writeUnsignedShort(int value, [int byteOffset = 0]) { _p('writeUnsignedShort', value, byteOffset); _at<UnsignedShort>(byteOffset).value = value; }
  @override void writeInt(int value, [int byteOffset = 0]) { _p('writeInt', value, byteOffset); _at<Int>(byteOffset).value = value; }
  @override void writeUnsignedInt(int value, [int byteOffset = 0]) { _p('writeUnsignedInt', value, byteOffset); _at<UnsignedInt>(byteOffset).value = value; }
  @override void writeFloat(double value, [int byteOffset = 0]) { _p('writeFloat', value, byteOffset); _at<Float>(byteOffset).value = value; }
  @override void writeDouble(double value, [int byteOffset = 0]) { _p('writeDouble', value, byteOffset); _at<Double>(byteOffset).value = value; }
}

extension MemoryPointerAsNativePointer on MemoryPointer {
  Pointer<R> asNativePointer<R extends NativeType>() => (this as NativeMemoryPointer).asPointer<R>();
}

extension StructPointerAsNativePointer on StructPointer {
  Pointer<R> asNativePointer<R extends NativeType>() => ptr.asNativePointer<R>();
}

extension NativePointerAsMemoryPointer on Pointer {
  NativeMemoryPointer<R> asMemoryPointer<R extends RType>() => .new(this);
}