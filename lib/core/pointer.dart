part of 'raylib_dartified.dart';

class NativeMemoryPointer<X extends RType> extends MemoryPointer<X> {
  final Pointer _ptr; // untyped pointer

  NativeMemoryPointer(this._ptr);

  /* --- NATIVE SPECIFIC --- */

  Pointer<R> asPointer<R extends NativeType>() => _ptr.cast<R>();

  static NativeMemoryPointer<Y>? orNull<Y extends RType>(Pointer? p)
    => p == null ? null : .new(p);

  /* --- --------------- --- */

  @override
  NativeMemoryPointer<Y> cast<Y extends RType>() => .new(_ptr);

  @override
  bool get isNull => isFreed || _ptr == nullptr;

  @override
  void free() {
    if (_ptr == nullptr) return;
    MemoryDebug.checkPointer(this, 'free');
    isFreed = true;
    ffi.malloc.free(_ptr);
  }

  @override
  int get address => _ptr.address;

  @override
  T to<T extends TypedDataList>(int length) {
    MemoryDebug.checkPointer(this, 'to', T, length);
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
    MemoryDebug.checkPointer(this, 'asView', T, length);
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
  Uint8List readBytes(int byteOffset, int length) =>
    (_ptr.cast<Uint8>() + byteOffset).asTypedList(length);

  @override
  NativeMemoryPointer<Y> offsetBy<Y extends RType>(int byteOffset) => .new(_at(byteOffset));

  Pointer<T> _at<T extends NativeType>(int byteOffset)
    => (_ptr.cast<Uint8>() + byteOffset).cast<T>();

  @override
  NativeMemoryPointer<Y> readPtr<Y extends RType>([int byteOffset = 0]) {
    MemoryDebug.checkPointer(this, 'readPtr', Y, byteOffset);
    return .new(.fromAddress(Pointer<IntPtr>.fromAddress(address + byteOffset).value));
  }

  @override
  void writePtr(MemoryPointer? value, [int byteOffset = 0]) {
    MemoryDebug.checkPointer(this, 'writePtr', value?.address, byteOffset);
    Pointer<IntPtr>.fromAddress(address + byteOffset).value = value?.address ?? nullptr.address;
  }

  @override int readSize([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readSize', byteOffset); final ptr = _at<Size>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Size', value); return value; }
  @override bool readBool([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readBool', byteOffset); final ptr = _at<Bool>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Bool', value); return value; }
  @override int readInt8([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readInt8', byteOffset); final ptr = _at<Int8>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Int8', value); return value; }
  @override int readUint8([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readUint8', byteOffset); final ptr = _at<Uint8>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Uint8', value); return value; }
  @override int readInt16([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readInt16', byteOffset); final ptr = _at<Int16>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Int16', value); return value; }
  @override int readUint16([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readUint16', byteOffset); final ptr = _at<Uint16>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Uint16', value); return value; }
  @override int readInt32([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readInt32', byteOffset); final ptr = _at<Int32>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Int32', value); return value; }
  @override int readUint32([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readUint32', byteOffset); final ptr = _at<Uint32>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Uint32', value); return value; }
  @override int readInt64([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readInt64', byteOffset); final ptr = _at<Int64>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Int64', value); return value; }
  @override int readUint64([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readUint64', byteOffset); final ptr = _at<Uint64>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Uint64', value); return value; }
  @override double readFloat32([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readFloat32', byteOffset); final ptr = _at<Float>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Float', value); return value; }
  @override double readFloat64([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readFloat64', byteOffset); final ptr = _at<Double>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Double', value); return value; }
  @override int readChar([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readChar', byteOffset); final ptr = _at<Char>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Char', value); return value; }
  @override int readUnsignedChar([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readUnsignedChar', byteOffset); final ptr = _at<UnsignedChar>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'UnsignedChar', value); return value; }
  @override int readShort([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readShort', byteOffset); final ptr = _at<Short>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Short', value); return value; }
  @override int readUnsignedShort([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readUnsignedShort', byteOffset); final ptr = _at<UnsignedShort>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'UnsignedShort', value); return value; }
  @override int readInt([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readInt', byteOffset); final ptr = _at<Int>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Int', value); return value; }
  @override int readUnsignedInt([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readUnsignedInt', byteOffset); final ptr = _at<UnsignedInt>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'UnsignedInt', value); return value; }
  @override double readFloat([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readFloat', byteOffset); final ptr = _at<Float>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Float', value); return value; }
  @override double readDouble([int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'readDouble', byteOffset); final ptr = _at<Double>(byteOffset); final value = ptr.value; MemoryTrace.checkRead(ptr.address, 'Double', value); return value; }

  @override void writeSize(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeSize', value, byteOffset); final ptr = _at<Size>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Size', value); }
  @override void writeBool(bool value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeBool', value, byteOffset); final ptr = _at<Bool>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Bool', value); }
  @override void writeInt8(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeInt8', value, byteOffset); final ptr = _at<Int8>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Int8', value); }
  @override void writeUint8(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeUint8', value, byteOffset); final ptr = _at<Uint8>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Uint8', value); }
  @override void writeInt16(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeInt16', value, byteOffset); final ptr = _at<Int16>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Int16', value); }
  @override void writeUint16(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeUint16', value, byteOffset); final ptr = _at<Uint16>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Uint16', value); }
  @override void writeInt32(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeInt32', value, byteOffset); final ptr = _at<Int32>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Int32', value); }
  @override void writeUint32(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeUint32', value, byteOffset); final ptr = _at<Uint32>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Uint32', value); }
  @override void writeInt64(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeInt64', value, byteOffset); final ptr = _at<Int64>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Int64', value); }
  @override void writeUint64(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeUint64', value, byteOffset); final ptr = _at<Uint64>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Uint64', value); }
  @override void writeFloat32(double value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeFloat32', value, byteOffset); final ptr = _at<Float>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Float', value); }
  @override void writeFloat64(double value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeFloat64', value, byteOffset); final ptr = _at<Double>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Double', value); }
  @override void writeChar(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeChar', value, byteOffset); final ptr = _at<Char>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Char', value); }
  @override void writeUnsignedChar(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeUnsignedChar', value, byteOffset); final ptr = _at<UnsignedChar>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'UnsignedChar', value); }
  @override void writeShort(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeShort', value, byteOffset); final ptr = _at<Short>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Short', value); }
  @override void writeUnsignedShort(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeUnsignedShort', value, byteOffset); final ptr = _at<UnsignedShort>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'UnsignedShort', value); }
  @override void writeInt(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeInt', value, byteOffset); final ptr = _at<Int>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Int', value); }
  @override void writeUnsignedInt(int value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeUnsignedInt', value, byteOffset); final ptr = _at<UnsignedInt>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'UnsignedInt', value); }
  @override void writeFloat(double value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeFloat', value, byteOffset); final ptr = _at<Float>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Float', value); }
  @override void writeDouble(double value, [int byteOffset = 0]) { MemoryDebug.checkPointer(this, 'writeDouble', value, byteOffset); final ptr = _at<Double>(byteOffset); ptr.value = value; MemoryTrace.checkWrite(ptr.address, 'Double', value); }
}

extension MemoryPointerAsNativePointer on MemoryPointer {
  Pointer<R> asNativePointer<R extends NativeType>() => (this as NativeMemoryPointer).asPointer();
}

extension StructPointerAsNativePointer on StructPointer {
  Pointer<R> asNativePointer<R extends NativeType>() => (ptr as NativeMemoryPointer).asNativePointer();
}

extension NativePointerAsMemoryPointer on Pointer {
  NativeMemoryPointer<R> asMemoryPointer<R extends RType>() => .new(this);
}