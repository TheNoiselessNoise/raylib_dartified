part of '../raylib_dartified.dart';

class NativeMemoryPointer<X extends RType> extends MemoryPointer<X> {
  final Pointer<Void> _ptr;

  NativeMemoryPointer(this._ptr);

  /* --- NATIVE SPECIFIC --- */

  Pointer<R> asPointer<R extends NativeType>() => _ptr.cast<R>();

  /* --- --------------- --- */

  @override
  NativeMemoryPointer<Y> cast<Y extends RType>() => .new(_ptr);

  @override
  bool get isNull => _ptr == nullptr;

  @override
  void free() { if (!isNull) malloc.free(_ptr); }

  @override
  int get address => _ptr.address;

  @override
  T to<T extends TypedDataList>(int length) {
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
  String toDartString() => _ptr.cast<Utf8>().toDartString();

  @override
  String toDartStringBounded(int maxLength) => _ptr.cast<Utf8>().toDartString(length: maxLength);

  Pointer<T> _at<T extends NativeType>(int byteOffset) => (_ptr.cast<Uint8>() + byteOffset).cast<T>();

  @override
  MemoryPointer<Y> readPointer<Y extends RType>([int byteOffset = 0])
    => NativeMemoryPointer<Y>(.fromAddress(address + byteOffset));

  @override
  void writePointer(MemoryPointer<RType> value, [int byteOffset = 0])
    => Pointer<IntPtr>.fromAddress(address + byteOffset).value = value.address;

  @override bool         readBool([int byteOffset = 0]) => _at<Bool>(byteOffset).value;
  @override int          readInt8([int byteOffset = 0]) => _at<Int8>(byteOffset).value;
  @override int         readUint8([int byteOffset = 0]) => _at<Uint8>(byteOffset).value;
  @override int         readInt16([int byteOffset = 0]) => _at<Int16>(byteOffset).value;
  @override int        readUint16([int byteOffset = 0]) => _at<Uint16>(byteOffset).value;
  @override int         readInt32([int byteOffset = 0]) => _at<Int32>(byteOffset).value;
  @override int        readUint32([int byteOffset = 0]) => _at<Uint32>(byteOffset).value;
  @override int         readInt64([int byteOffset = 0]) => _at<Int64>(byteOffset).value;
  @override int        readUint64([int byteOffset = 0]) => _at<Uint64>(byteOffset).value;
  @override double    readFloat32([int byteOffset = 0]) => _at<Float>(byteOffset).value;
  @override double    readFloat64([int byteOffset = 0]) => _at<Double>(byteOffset).value;
  @override int          readChar([int byteOffset = 0]) => _at<Char>(byteOffset).value;
  @override int  readUnsignedChar([int byteOffset = 0]) => _at<UnsignedChar>(byteOffset).value;
  @override int         readShort([int byteOffset = 0]) => _at<Short>(byteOffset).value;
  @override int readUnsignedShort([int byteOffset = 0]) => _at<UnsignedShort>(byteOffset).value;
  @override int           readInt([int byteOffset = 0]) => _at<Int>(byteOffset).value;
  @override int   readUnsignedInt([int byteOffset = 0]) => _at<UnsignedInt>(byteOffset).value;
  @override double      readFloat([int byteOffset = 0]) => _at<Float>(byteOffset).value;
  @override double     readDouble([int byteOffset = 0]) => _at<Double>(byteOffset).value;

  @override void          writeBool(bool value,   [int byteOffset = 0]) => _at<Bool>(byteOffset).value = value;
  @override void          writeInt8(int value,    [int byteOffset = 0]) => _at<Int8>(byteOffset).value = value;
  @override void         writeUint8(int value,    [int byteOffset = 0]) => _at<Uint8>(byteOffset).value = value;
  @override void         writeInt16(int value,    [int byteOffset = 0]) => _at<Int16>(byteOffset).value = value;
  @override void        writeUint16(int value,    [int byteOffset = 0]) => _at<Uint16>(byteOffset).value = value;
  @override void         writeInt32(int value,    [int byteOffset = 0]) => _at<Int32>(byteOffset).value = value;
  @override void        writeUint32(int value,    [int byteOffset = 0]) => _at<Uint32>(byteOffset).value = value;
  @override void         writeInt64(int value,    [int byteOffset = 0]) => _at<Int64>(byteOffset).value = value;
  @override void        writeUint64(int value,    [int byteOffset = 0]) => _at<Uint64>(byteOffset).value = value;
  @override void       writeFloat32(double value, [int byteOffset = 0]) => _at<Float>(byteOffset).value = value;
  @override void       writeFloat64(double value, [int byteOffset = 0]) => _at<Double>(byteOffset).value = value;
  @override void          writeChar(int value,    [int byteOffset = 0]) => _at<Char>(byteOffset).value = value;
  @override void  writeUnsignedChar(int value,    [int byteOffset = 0]) => _at<UnsignedChar>(byteOffset).value = value;
  @override void         writeShort(int value,    [int byteOffset = 0]) => _at<Short>(byteOffset).value = value;
  @override void writeUnsignedShort(int value,    [int byteOffset = 0]) => _at<UnsignedShort>(byteOffset).value = value;
  @override void           writeInt(int value,    [int byteOffset = 0]) => _at<Int>(byteOffset).value = value;
  @override void   writeUnsignedInt(int value,    [int byteOffset = 0]) => _at<UnsignedInt>(byteOffset).value = value;
  @override void         writeFloat(double value, [int byteOffset = 0]) => _at<Float>(byteOffset).value = value;
  @override void        writeDouble(double value, [int byteOffset = 0]) => _at<Double>(byteOffset).value = value;
}

/// A slot-based temporary memory allocator for a single native type [C].
///
/// Manages a named collection of `Pointer<C>` slots identified by string keys.
/// Each slot owns its allocation; slots are freed either manually via [Free]
/// or automatically when [dispose] is called.
///
/// Subclasses specialise this for literal values, structs, strings, etc.
abstract class NativeAlloc<
  C extends NativeType
> extends RaylibTempAllocatorBase<
  RaylibTemp, Pointer<C>, Pointer<C>
> {
  NativeAlloc(super.temp, {
    required super.byteSize,
  }) : super(
    freeFunc: (ptr) => calloc.free(ptr),
    nullptrFactory: () => nullptr,
    pointerFactory: (ptr) => ptr,
    pointerToSource: (ptr) => ptr,
    isPointerNull: (ptr) => ptr == nullptr || ptr.address == 0,
    allocatorFunc: ([count = 1]) => calloc.allocate(byteSize * count),
  );
}

/// A [NativeAlloc] that also knows how to write Dart values of type [X] into
/// native [C] memory, and supports typed-list array operations.
///
/// [X] is the Dart-side value type (e.g. `int`, `double`).
/// [C] is the corresponding [NativeType] (e.g. `Int32`, `Float`).
class NativeLitAlloc<
  X, C extends NativeType
> extends NativeAlloc<
  C
> with RaylibTempLiteralAllocatorBase<
  RaylibTemp, X, Pointer<C>, Pointer<C>
> {
  
  @override
  void Function(Pointer<C> ptr, X value) literalSetterFunc;
  
  @override
  void Function(Pointer<C> ptr, int i, X value) indexSetterFunc;

  NativeLitAlloc(super.temp, {
    required super.byteSize,
    required this.literalSetterFunc,
    required this.indexSetterFunc,
  });

  /// Fixed scratch slot holding a zero-initialized value of [C].
  ///
  /// This is effectively the native-memory equivalent of a Dart-layer
  /// `.zero()` constructor (e.g. `Vector2D.zero()`), a cheap, shared,
  /// always-zero buffer for call sites that just need to pass a zero value
  /// without allocating.
  ///
  /// **Read-only by convention.** Because this slot is shared (via [At])
  /// across every call site that touches [$zeroPtr], writing through it
  /// permanently corrupts the "zero" invariant for everyone else using it,
  /// there is no reset. Never write through this pointer; only read from it
  /// or pass it where the callee treats it as `const`. If you need a
  /// mutable zero-initialized buffer, use [$newPtr] (or write zero into
  /// [$1Ptr]..[$4Ptr] yourself) instead.
  Pointer<C> get $zeroPtr => At('__reusable__zero');

  /// Reusable single-element scratch slot, mutable (unlike [$zeroPtr]).
  Pointer<C> get $1Ptr => At('__reusable__1');
  
  /// Reusable single-element scratch slot, mutable (unlike [$zeroPtr]).
  ///
  /// Use when a call needs a second independent scratch pointer alongside
  /// [$1Ptr] (e.g. writing two out-parameters in the same FFI call).
  Pointer<C> get $2Ptr => At('__reusable__2');
  
  /// Reusable single-element scratch slot, mutable (unlike [$zeroPtr]).
  ///
  /// Use when a call needs a third independent scratch pointer alongside
  /// [$2Ptr] (e.g. writing two out-parameters in the same FFI call).
  Pointer<C> get $3Ptr => At('__reusable__3');
  
  /// Reusable single-element scratch slot, mutable (unlike [$zeroPtr]).
  ///
  /// Use when a call needs a fourth independent scratch pointer alongside
  /// [$3Ptr] (e.g. writing two out-parameters in the same FFI call).
  Pointer<C> get $4Ptr => At('__reusable__4');
  
  /// Fresh, independently-owned scratch pointer, unlike [$zeroPtr]..[$4Ptr].
  ///
  /// Each access gets its own slot via [AtUnique], keyed with a monotonic id,
  /// so it is safe even when the same call site may be active multiple times
  /// at once (recursion, re-entrant calls).
  Pointer<C> get $newPtr => AtUnique(key: '__reusable__newptr');
}

/// Extends [NativeLitAlloc] with typed-list bulk copy support.
///
/// [asView] bridges between the native pointer and a Dart [TypedDataList],
/// enabling zero-copy bulk memory operations.
abstract class NativeLitTypedListAlloc<
  X, C extends NativeType, L extends TypedDataList
> extends NativeLitAlloc<
  X, C
> with RaylibTempLiteralTypedListAllocatorBase<
  RaylibTemp, X, L, Pointer<C>, Pointer<C>
> {

  @override
  late final List<X> Function(Pointer<C> ptr, int length) asDartList;

  @override
  late final L Function(Pointer<C> ptr, int length) asTypedList;

  @override
  final L Function(Iterable<X> list) fromList;

  @override
  final L Function(Pointer<C> ptr, int length) asView;

  @override
  final L Function(ByteBuffer buffer, int offsetInBytes, int length) fromBuffer;

  NativeLitTypedListAlloc(super.temp, {
    required super.byteSize,
    required super.literalSetterFunc,
    required super.indexSetterFunc,
    required this.fromList,
    required this.asView,
    required this.fromBuffer,
  }) {
    asDartList = (ptr, length) => asView(ptr, length).toList().cast();
    asTypedList = (ptr, length) => fromList(asDartList(ptr, length));
  }
}

/// A typed-list allocator for integer native types (e.g. `Int32`, `Uint8`).
///
/// Adds byte-serialisation helpers that convert the native integer array to
/// big-endian or little-endian byte lists, useful for hashing and I/O.
class NativeLitIntAlloc<
  C extends NativeType, L extends TypedDataList
> extends NativeLitTypedListAlloc<
  num, C, L
> with RaylibTempLiteralIntAllocatorBase<
  RaylibTemp, L, Pointer<C>, Pointer<C>
> {
  NativeLitIntAlloc(super.temp, {
    required super.byteSize,
    required super.literalSetterFunc,
    required super.indexSetterFunc,
    required super.fromList,
    required super.asView,
    required super.fromBuffer,
  });
}

/// A typed-list allocator for floating-point native types (e.g. `Float`, `Double`).
class NativeLitFloatAlloc<
  C extends NativeType, L extends TypedDataList
> extends NativeLitTypedListAlloc<
  num, C, L
> with RaylibTempLiteralFloatAllocatorBase<
  RaylibTemp, L, Pointer<C>, Pointer<C>
> {
  NativeLitFloatAlloc(super.temp, {
    required super.byteSize,
    required super.literalSetterFunc,
    required super.indexSetterFunc,
    required super.fromList,
    required super.asView,
    required super.fromBuffer,
  });
}

/// A slot-based allocator for arrays of **pointers** to literal elements.
///
/// Manages `Pointer<Pointer<C>>` slots; each inner pointer is produced by
/// [rawArrayFunc] from a `List<X>`.
class NativeLitPtrAlloc<
  X, C extends NativeType
> extends NativeAlloc<
  Pointer<C>
> with RaylibTempLiteralPointerAllocatorBase<
  RaylibTemp, X, Pointer<Pointer<C>>, Pointer<C>, Pointer<Pointer<C>>
> {

  @override
  final Pointer<C> Function(List<X> array) rawArrayFunc;

  @override
  late final Function(Pointer<Pointer<C>> ptrptr, int i, Pointer<C> ptr) indexSetterFunc;

  NativeLitPtrAlloc(super.temp, {
    required this.rawArrayFunc,
  }) : super(byteSize: sizeOf<Pointer>()) {
    indexSetterFunc = (ptrptr, i, ptr) => ptrptr[i] = ptr;
  }
}

/// A slot-based allocator for native structs of type [C], accepting Dart-side
/// [StructD] wrappers of type [D].
///
/// Bridges between the ergonomic Dart [StructD] layer and raw `Pointer<C>`
/// memory, supporting both single-value and array slots.
class NativeStructAlloc<
  C extends Struct, D extends StructD<C, D>
> extends NativeAlloc<
  C
> with RaylibTempStructAllocatorBase<
  RaylibTemp, D, C, Pointer<C>, Pointer<C>
> {

  @override
  final C Function(Pointer<C> ptr) refFunc;

  @override
  final Pointer<C> Function(Pointer<C> ptr, C value) setRefFunc;

  @override
  late final void Function(Pointer<C> ptr, int i, D value) writeIntoIndexedFunc;
  
  @override
  late final void Function(Pointer<C> ptr, D value) writeIntoFunc;

  @override
  final void Function(Pointer<C> ptr, int i, C value) setCFunc;
  
  @override
  final C Function(Pointer<C> ptr, int i) indexerFunc;
  
  @override
  final void Function(Pointer<C> ptr, int i, C value) indexSetterFunc;

  @override
  final D Function(Pointer<C> ptr) pointerToStruct;

  @override
  final void Function(Pointer<C> ptr, D source) updateFunc;

  NativeStructAlloc(super.temp, {
    required super.byteSize,
    required this.refFunc,
    required this.setRefFunc,
    required this.setCFunc,
    required this.indexerFunc,
    required this.indexSetterFunc,
    required this.pointerToStruct,
    required this.updateFunc,
  }) {
    writeIntoIndexedFunc = (ptr, i, v) => v.nativeWriteInto(indexerFunc(ptr, i));
    writeIntoFunc = (ptr, v) => v.nativeWriteInto(refFunc(ptr));
  }

  /// Fixed scratch slot holding a zero-initialized [C] struct, by pointer.
  ///
  /// The native-memory equivalent of a Dart-layer `.zero()` constructor,
  /// a cheap, shared buffer for call sites that just need to pass a zero
  /// value without allocating. **Read-only by convention**: this slot is
  /// shared (via [At]) across every call site that touches it, so writing
  /// through it permanently corrupts the "zero" invariant for everyone else,
  /// there is no reset. Use [$1Ptr]..[$4Ptr] or [$newPtr] for a mutable slot.
  Pointer<C> get $zeroPtr => At('__reusable__zero');

  /// [C] view of [$zeroPtr]. Same read-only convention applies: do not
  /// mutate fields on this reference.
  C get $zero => refFunc($zeroPtr);

  /// Reusable single-element scratch slot, by pointer. Unlike [$zeroPtr],
  /// this is expected to be written through, it's a fixed shared buffer,
  /// not a zero-invariant one, so callers may freely overwrite its contents
  /// between uses.
  Pointer<C> get $1Ptr => At('__reusable__1');

  /// [C] view of [$1Ptr].
  C get $1 => refFunc($1Ptr);

  /// Reusable single-element scratch slot, parallel to [$1Ptr] under a
  /// distinct key. Use when a call needs a second independent scratch
  /// struct alongside [$1]/[$1Ptr] (e.g. two out-parameters in one call).
  Pointer<C> get $2Ptr => At('__reusable__2');

  /// [C] view of [$2Ptr].
  C get $2 => refFunc($2Ptr);

  /// Reusable single-element scratch slot, parallel to [$1Ptr]/[$2Ptr].
  Pointer<C> get $3Ptr => At('__reusable__3');

  /// [C] view of [$3Ptr].
  C get $3 => refFunc($3Ptr);

  /// Reusable single-element scratch slot, parallel to [$1Ptr]..[$3Ptr].
  ///
  /// With [$1Ptr] through [$4Ptr] this gives up to four fixed scratch slots
  /// (plus the read-only [$zeroPtr]) for call sites that need several
  /// simultaneous native struct out-parameters without allocating a fresh
  /// buffer each time.
  Pointer<C> get $4Ptr => At('__reusable__4');

  /// [C] view of [$4Ptr].
  C get $4 => refFunc($4Ptr);

  /// Fresh, independently-owned scratch pointer, unlike [$zeroPtr]/[$1Ptr]..[$4Ptr].
  ///
  /// Each access gets its own slot via [AtUnique], keyed with a monotonic id,
  /// so it is safe even when the same call site may be active multiple times
  /// at once (recursion, re-entrant calls).
  Pointer<C> get $newPtr => AtUnique(key: '__reusable__newptr');

  /// [C] view of [$newPtr].
  C get $new => refFunc($newPtr);
}


/// A slot-based allocator for arrays of **pointers** to native structs of type [C].
///
/// Manages `Pointer<Pointer<C>>` slots where each inner `Pointer<C>` is
/// produced from a `List<D>` via [rawArrayFunc].
class NativeStructPtrAlloc<
  C extends Struct, D extends StructD<C, D>
> extends NativeAlloc<
  Pointer<C>
> with RaylibTempStructPointerAllocatorBase<
  RaylibTemp, D, Pointer<Pointer<C>>, Pointer<C>, Pointer<Pointer<C>>
> {

  @override
  final Pointer<C> Function([D?, String?]) valueFunc;

  @override
  final Pointer<C> Function(List<D> array) rawArrayFunc;

  @override
  late final void Function(Pointer<Pointer<C>> ptr, int i, Pointer<C> value) indexSetterFunc;

  NativeStructPtrAlloc(super.temp, {
    required this.valueFunc,
    required this.rawArrayFunc,
  }) : super(byteSize: sizeOf<Pointer>()) {
    indexSetterFunc = (ptr, i, value) => ptr[i] = value;
  }
}

/// A specialised slot-based allocator for C strings ([Pointer\<Char>]).
///
/// Maintains two separate pools:
/// - **Anonymous slots** – a ring buffer of [slotCount] slots, cycled through
///   via [Value] without a key. Useful for transient strings within a single callsite.
/// - **Keyed slots** – named slots allocated on demand via [ValueAt] and
///   [Array], persisting until explicitly freed or [dispose] is called.
///
/// String memory is managed with [malloc] and is grown in-place when the
/// encoded UTF-8 length of a new string exceeds the current slot capacity,
/// avoiding unnecessary reallocations for strings of similar length.
final class NativeStringAlloc extends NativeAlloc<Char> with RaylibTempStringAllocatorBase<
  RaylibTemp, Pointer<Pointer<Char>>, Pointer<Char>, Pointer<Char>
> {

  /// Number of anonymous (ring-buffer) string slots pre-reserved on construction.
  @override final int slotCount;

  @override
  int get ptrByteSize => 1; // NOTE: ffi, calculates the size for us

  @override
  late final void Function(Pointer<Pointer<Char>> ptr) freePPFunc;

  @override
  late final Pointer<Char> Function(String text, [int? bufferSize]) strAllocatorFunc;

  @override
  late final Pointer<Pointer<Char>> Function(int count) ptrAllocatorFunc;

  @override
  late final void Function(Pointer<Pointer<Char>> ptrptr, int i, Pointer<Char> ptr) indexSetterFunc;

  NativeStringAlloc(super.temp, {
    required this.slotCount,
  }) : super(byteSize: sizeOf<Uint8>()) {
    reset();
    freePPFunc = (ptr) => calloc.free(ptr);
    strAllocatorFunc = (text, [bufferSize]) {
      final bytes = utf8.encode(text);
      final len = bytes.length + 1;
      final bufSize = bufferSize != null ? (bufferSize > len ? bufferSize : len) : len;
      final ptr = calloc<Uint8>(bufSize);
      ptr.asTypedList(bufSize).setRange(0, bytes.length, bytes);
      return ptr.cast();
    };
    ptrAllocatorFunc = (count) => calloc(ptrByteSize*count);
    indexSetterFunc = (ptrptr, i, ptr) => ptrptr[i] = ptr;
  }

  late Uint8List _lastBytes;

  @override
  int Length(String text, [int? bufferSize]) {
    _lastBytes = utf8.encode(text);
    return bufferSize ?? _lastBytes.length + 1;
  }

  @override
  Pointer<Char> writeToSlot(int slot, String text, [int? bufferSize]) {
    final requiredBytes = Length(text, bufferSize);
    
    reallocSlotIfRequired(slot, requiredBytes);

    final dst = stringSlots[slot]
      .cast<Uint8>()
      .asTypedList(requiredBytes);

    dst.setAll(0, _lastBytes);
    dst[_lastBytes.length] = 0;

    return stringSlots[slot];
  }
}

class NativeTypedDataListAlloc extends RaylibTempTypedDataListAllocator<
  RaylibTemp, Pointer<Void>
> {
  NativeTypedDataListAlloc(super.temp);
}

class NativeRaylibTempUtils extends RaylibTempUtilsBase<RaylibTemp, Pointer<Void>> {
  NativeRaylibTempUtils(super.temp);

  @override
  Pointer<Void> realloc(Pointer<Void> oldPtr, int oldSize, int newSize) {
  if (newSize == 0) {
    if (oldPtr != nullptr) malloc.free(oldPtr);
    return nullptr;
  }

  final newPtr = malloc<Uint8>(newSize);

  if (oldPtr != nullptr) {
    final copySize = oldSize < newSize ? oldSize : newSize;
    if (copySize > 0) {
      newPtr.asTypedList(copySize).setAll(0, oldPtr.cast<Uint8>().asTypedList(copySize));
    }
    malloc.free(oldPtr);
  }

  return newPtr.cast();
}

  @override
  void memset(Pointer<Void> ptr, int value, int size)
    => ptr.cast<Uint8>().asTypedList(size).fillRange(0, size, value);

  @override
  void memcpy(Pointer<Void> dest, Pointer<Void> src, int n) {
    dest.cast<Uint8>().asTypedList(n).setAll(0, src.cast<Uint8>().asTypedList(n));
  }

  @override
  int memcmp(Pointer<Void> a, Pointer<Void> b, int n) {
    final pa = a.cast<Uint8>();
    final pb = b.cast<Uint8>();

    for (int i = 0; i < n; i++) {
      final diff = pa[i] - pb[i];
      if (diff != 0) return diff;
    }

    return 0;
  }

  @override
  int strlen(Pointer<Void> ptr) {
    final p = ptr.cast<Uint8>();

    int i = 0;
    for (; p[i] != 0; i++) {}

    return i;
  }

  @override
  int strcmp(Pointer<Void> a, Pointer<Void> b) {
    final pa = a.cast<Uint8>();
    final pb = b.cast<Uint8>();

    int i = 0;
    for (; pa[i] != 0 && pa[i] == pb[i]; i++) {}

    return pa[i] - pb[i];
  }

  @override
  void strcpy(Pointer<Void> dest, Pointer<Void> src) {
    final d = dest.cast<Uint8>();
    final s = src.cast<Uint8>();

    int i = 0;
    for (; s[i] != 0; i++) {
      d[i] = s[i];
    }
    d[i] = 0;
  }

  @override
  void strncpy(Pointer<Void> dest, Pointer<Void> src, int n) {
    final d = dest.cast<Uint8>();
    final s = src.cast<Uint8>();

    int i = 0;
    for (; i < n && s[i] != 0; i++) {
      d[i] = s[i];
    }
    for (; i < n; i++) {
      d[i] = 0;
    }
  }

  @override
  int strnlen(Pointer<Void> ptr, int maxLen) {
    final p = ptr.cast<Uint8>();

    int i = 0;
    for (; i < maxLen && p[i] != 0; i++) {}

    return i;
  }

  @override
  void strncat(Pointer<Void> dest, Pointer<Void> src, int n) {
    final d = dest.cast<Uint8>();
    final s = src.cast<Uint8>();

    int destEnd = 0;
    while (d[destEnd] != 0) {
      destEnd++;
    }

    int i = 0;
    for (; i < n && s[i] != 0; i++) {
      d[destEnd + i] = s[i];
    }
    d[destEnd + i] = 0;
  }

  @override
  Pointer<Void> strstr(Pointer<Void> haystack, Pointer<Void> needle) {
    final h = haystack.cast<Uint8>();
    final n = needle.cast<Uint8>();

    // empty needle matches at the start of haystack
    if (n[0] == 0) return haystack;

    for (int i = 0; h[i] != 0; i++) {
      int j = 0;
      for (; n[j] != 0 && h[i + j] == n[j]; j++) {}
      if (n[j] == 0) return (h + i).cast<Void>();
    }

    return nullptr;
  }
}

class NativeLitAllocators<
  X, C extends NativeType
> extends RaylibTempLitAllocators<
  NativeLitAlloc<X, C>, NativeLitPtrAlloc<X, C>
> {
  NativeLitAllocators(NativeLitAlloc<X, C> val) : super(
    val: val,
    ptr: .new(val.temp,
      rawArrayFunc: val.RawArray,
    ),
  );
}

class NativeLitIntAllocators<
  C extends NativeType, L extends TypedDataList
> extends RaylibTempLitIntAllocators<
  NativeLitIntAlloc<C, L>, NativeLitPtrAlloc<int, C>
> {
  NativeLitIntAllocators(NativeLitIntAlloc<C, L> val) : super(
    val: val,
    ptr: .new(val.temp,
      rawArrayFunc: val.RawArray,
    ),
  );
}

class NativeLitFloatAllocators<
  C extends NativeType, L extends TypedDataList
> extends RaylibTempLitFloatAllocators<
  NativeLitFloatAlloc<C, L>, NativeLitPtrAlloc<double, C>
> {
  NativeLitFloatAllocators(NativeLitFloatAlloc<C, L> val) : super(
    val: val,
    ptr: .new(val.temp,
      rawArrayFunc: val.RawArray,
    ),
  );
}

class NativeStructAllocators<
  C extends Struct, D extends StructD<C, D>
> extends RaylibTempStructAllocators<
  NativeStructAlloc<C, D>, NativeStructPtrAlloc<C, D>
> {
  NativeStructAllocators(NativeStructAlloc<C, D> val) : super(
    val: val,
    ptr: .new(val.temp,
      valueFunc: val.Value,
      rawArrayFunc: val.RawArray,
    ),
  );
}

class RaylibTemp extends RaylibTempBase<Raylib> {
  RaylibTemp(super.lib, { super.options });
  
  @override late NativeRaylibTempUtils Utils;

  // special
  @override late NativeTypedDataListAlloc TypedDataList$;
  @override late NativeStringAlloc String$;

  // literals
  @override late NativeLitAllocators<bool, Bool> Bool$;
  @override late NativeLitIntAllocators<Int8, Int8List> Int8$;
  @override late NativeLitIntAllocators<Uint8, Uint8List> Uint8$;
  @override late NativeLitIntAllocators<Int16, Int16List> Int16$;
  @override late NativeLitIntAllocators<Uint16, Uint16List> Uint16$;
  @override late NativeLitIntAllocators<Int32, Int32List> Int32$;
  @override late NativeLitIntAllocators<Uint32, Uint32List> Uint32$;
  @override late NativeLitIntAllocators<Int64, Int64List> Int64$;
  @override late NativeLitIntAllocators<Uint64, Uint64List> Uint64$;
  @override late NativeLitFloatAllocators<Float, Float32List> Float32$;
  @override late NativeLitFloatAllocators<Double, Float64List> Float64$;
  // These allocate under FFI's ABI-defined C types (Int, UnsignedInt, Char,
  // Short, ...), NOT the fixed-width types above (Int32$, Uint8$, Int16$, ...).
  // They happen to share storage width on this backend's target ABI (hence
  // the matching TypedData lists), but the NativeType is distinct from its
  // fixed-width counterpart and must not be treated as an alias for it
  // e.g. sizeOf<Char>() vs sizeOf<Int8>() are only equal because of this
  // ABI's char width, not by definition. If a future target has a
  // different C type width, these allocators diverge from the fixed-width
  // ones in storage too, not just in name.
  @override late NativeLitIntAllocators<Char, Int8List> Char$;
  @override late NativeLitIntAllocators<UnsignedChar, Uint8List> UnsignedChar$;
  @override late NativeLitIntAllocators<Short, Int16List> Short$;
  @override late NativeLitIntAllocators<UnsignedShort, Uint16List> UnsignedShort$;
  @override late NativeLitIntAllocators<Int, Int32List> Int$;
  @override late NativeLitIntAllocators<UnsignedInt, Uint32List> UnsignedInt$;
  @override NativeLitFloatAllocators<Float, Float32List> get Float$ => Float32$;
  @override NativeLitFloatAllocators<Double, Float64List> get Double$ => Float64$;

  // structs
  @override late NativeStructAllocators<AutomationEventListC, AutomationEventListD> AutomationEventList$;
  @override late NativeStructAllocators<AutomationEventC, AutomationEventD> AutomationEvent$;
  @override late NativeStructAllocators<AudioStreamC, AudioStreamD> AudioStream$;
  @override late NativeStructAllocators<BoneInfoC, BoneInfoD> BoneInfo$;
  @override late NativeStructAllocators<BoundingBoxC, BoundingBoxD> BoundingBox$;
  @override late NativeStructAllocators<Camera2DC, Camera2DD> Camera2D$;
  @override late NativeStructAllocators<Camera3DC, Camera3DD> Camera3D$;
  @override late NativeStructAllocators<ColorC, ColorD> Color$;
  @override late NativeStructAllocators<FilePathListC, FilePathListD> FilePathList$;
  @override late NativeStructAllocators<FontC, FontD> Font$;
  @override late NativeStructAllocators<GestureEventC, GestureEventD> GestureEvent$;
  @override late NativeStructAllocators<GlyphInfoC, GlyphInfoD> GlyphInfo$;
  @override late NativeStructAllocators<ImageC, ImageD> Image$;
  @override late NativeStructAllocators<LightC, LightD> Light$;
  @override late NativeStructAllocators<MaterialC, MaterialD> Material$;
  @override late NativeStructAllocators<MaterialMapC, MaterialMapD> MaterialMap$;
  @override late NativeStructAllocators<MatrixC, MatrixD> Matrix$;
  @override late NativeStructAllocators<MeshC, MeshD> Mesh$;
  @override late NativeStructAllocators<ModelC, ModelD> Model$;
  @override late NativeStructAllocators<ModelAnimationC, ModelAnimationD> ModelAnimation$;
  @override late NativeStructAllocators<ModelSkeletonC, ModelSkeletonD> ModelSkeleton$;
  @override late NativeStructAllocators<MusicC, MusicD> Music$;
  @override late NativeStructAllocators<NPatchInfoC, NPatchInfoD> NPatchInfo$;
  @override late NativeStructAllocators<QuaternionC, QuaternionD> Quaternion$;
  @override late NativeStructAllocators<RectangleC, RectangleD> Rectangle$;
  @override late NativeStructAllocators<RlDrawCallC, RlDrawCallD> RlDrawCall$;
  @override late NativeStructAllocators<RlRenderBatchC, RlRenderBatchD> RlRenderBatch$;
  @override late NativeStructAllocators<RlVertexBufferC, RlVertexBufferD> RlVertexBuffer$;
  @override late NativeStructAllocators<RayC, RayD> Ray$;
  @override late NativeStructAllocators<RayCollisionC, RayCollisionD> RayCollision$;
  @override late NativeStructAllocators<RenderTextureC, RenderTextureD> RenderTexture$;
  @override late NativeStructAllocators<ShaderC, ShaderD> Shader$;
  @override late NativeStructAllocators<SoundC, SoundD> Sound$;
  @override late NativeStructAllocators<TextureC, TextureD> Texture$;
  @override late NativeStructAllocators<TransformC, TransformD> Transform$;
  @override late NativeStructAllocators<Vector2C, Vector2D> Vector2$;
  @override late NativeStructAllocators<Vector3C, Vector3D> Vector3$;
  @override late NativeStructAllocators<Vector4C, Vector4D> Vector4$;
  @override late NativeStructAllocators<VrDeviceInfoC, VrDeviceInfoD> VrDeviceInfo$;
  @override late NativeStructAllocators<VrStereoConfigC, VrStereoConfigD> VrStereoConfig$;
  @override late NativeStructAllocators<WaveC, WaveD> Wave$;

  // ===========================
  // ====== CUSTOM ALLOCS ======
  // ===========================

  NativeStructAlloc<C, D> allocStruct<C extends Struct, D extends StructD<C, D>>() => getAllocatorOrThrow();
  
  NativeStructPtrAlloc<C, D> allocPtrStruct<C extends Struct, D extends StructD<C, D>>() => getAllocatorOrThrow();

  // ============================
  // ====== INITIALIZATION ======
  // ============================

  @override
  void load() {
    super.load();

    Utils = .new(this);

    TypedDataList$ = .new(this);
    String$ = .new(this, slotCount: options.stringCount);

    _initLiteralAllocators();
    _initStructAllocators();
  }

  void _initLiteralAllocators() {
    Bool$ = .new(.new(this,
      byteSize: sizeOf<Bool>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value,
      literalSetterFunc: (ptr, value) => ptr.value = value,
    ));

    Int8$ = .new(.new(this,
      byteSize: sizeOf<Int8>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt8List(offset, len),
    ));

    Uint8$ = .new(.new(this,
      byteSize: sizeOf<Uint8>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint8List(offset, len),
    ));

    Int16$ = .new(.new(this,
      byteSize: sizeOf<Int16>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt16List(offset, len),
    ));

    Uint16$ = .new(.new(this,
      byteSize: sizeOf<Uint16>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint16List(offset, len),
    ));

    Int32$ = .new(.new(this,
      byteSize: sizeOf<Int32>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt32List(offset, len),
    ));

    Uint32$ = .new(.new(this,
      byteSize: sizeOf<Uint32>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint32List(offset, len),
    ));

    Int64$ = .new(.new(this,
      byteSize: sizeOf<Int64>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt64List(offset, len),
    ));

    Uint64$ = .new(.new(this,
      byteSize: sizeOf<Uint64>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint64List(offset, len),
    ));

    Float32$ = .new(.new(this,
      byteSize: sizeOf<Float>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toDouble(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toDouble(),
      fromList: (list) => .fromList(list.cast<double>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asFloat32List(offset, len),
    ));

    Float64$ = .new(.new(this,
      byteSize: sizeOf<Double>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toDouble(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toDouble(),
      fromList: (list) => .fromList(list.cast<double>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asFloat64List(offset, len),
    ));

    Char$ = .new(.new(this,
      byteSize: sizeOf<Char>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.cast<Int8>().asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt8List(offset, len),
    ));

    UnsignedChar$ = .new(.new(this,
      byteSize: sizeOf<UnsignedChar>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.cast<Uint8>().asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint8List(offset, len),
    ));

    Short$ = .new(.new(this,
      byteSize: sizeOf<Short>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.cast<Int16>().asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt16List(offset, len),
    ));

    UnsignedShort$ = .new(.new(this,
      byteSize: sizeOf<UnsignedShort>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.cast<Uint16>().asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint16List(offset, len),
    ));

    Int$ = .new(.new(this,
      byteSize: sizeOf<Int>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.cast<Int32>().asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt32List(offset, len),
    ));

    UnsignedInt$ = .new(.new(this,
      byteSize: sizeOf<UnsignedInt>(),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.cast<Uint32>().asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint32List(offset, len),
    ));
  }

  void _initStructAllocators() {
    AutomationEventList$ = .new(.new(this,
      byteSize:        sizeOf<AutomationEventListC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    AutomationEvent$ = .new(.new(this,
      byteSize:        sizeOf<AutomationEventC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    AudioStream$ = .new(.new(this,
      byteSize:        sizeOf<AudioStreamC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    BoneInfo$ = .new(.new(this,
      byteSize:        sizeOf<BoneInfoC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    BoundingBox$ = .new(.new(this,
      byteSize:        sizeOf<BoundingBoxC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Camera2D$ = .new(.new(this,
      byteSize:        sizeOf<Camera2DC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Camera3D$ = .new(.new(this,
      byteSize:        sizeOf<Camera3DC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Color$ = .new(.new(this,
      byteSize:        sizeOf<ColorC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    FilePathList$ = .new(.new(this,
      byteSize:        sizeOf<FilePathListC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Font$ = .new(.new(this,
      byteSize:        sizeOf<FontC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    GestureEvent$ = .new(.new(this,
      byteSize:        sizeOf<GestureEventC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    GlyphInfo$ = .new(.new(this,
      byteSize:        sizeOf<GlyphInfoC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Image$ = .new(.new(this,
      byteSize:        sizeOf<ImageC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Light$ = .new(.new(this,
      byteSize:        sizeOf<LightC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Material$ = .new(.new(this,
      byteSize:        sizeOf<MaterialC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    MaterialMap$ = .new(.new(this,
      byteSize:        sizeOf<MaterialMapC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Matrix$ = .new(.new(this,
      byteSize:        sizeOf<MatrixC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Mesh$ = .new(.new(this,
      byteSize:        sizeOf<MeshC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Model$ = .new(.new(this,
      byteSize:        sizeOf<ModelC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    ModelAnimation$ = .new(.new(this,
      byteSize:        sizeOf<ModelAnimationC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    ModelSkeleton$ = .new(.new(this,
      byteSize:        sizeOf<ModelSkeletonC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Music$ = .new(.new(this,
      byteSize:        sizeOf<MusicC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    NPatchInfo$ = .new(.new(this,
      byteSize:        sizeOf<NPatchInfoC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Quaternion$ = .new(.new(this,
      byteSize:        sizeOf<QuaternionC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Rectangle$ = .new(.new(this,
      byteSize:        sizeOf<RectangleC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    RlDrawCall$ = .new(.new(this,
      byteSize:        sizeOf<RlDrawCallC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    RlRenderBatch$ = .new(.new(this,
      byteSize:        sizeOf<RlRenderBatchC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    RlVertexBuffer$ = .new(.new(this,
      byteSize:        sizeOf<RlVertexBufferC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Ray$ = .new(.new(this,
      byteSize:        sizeOf<RayC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    RayCollision$ = .new(.new(this,
      byteSize:        sizeOf<RayCollisionC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    RenderTexture$ = .new(.new(this,
      byteSize:        sizeOf<RenderTextureC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Shader$ = .new(.new(this,
      byteSize:        sizeOf<ShaderC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Sound$ = .new(.new(this,
      byteSize:        sizeOf<SoundC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Texture$ = .new(.new(this,
      byteSize:        sizeOf<TextureC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Transform$ = .new(.new(this,
      byteSize:        sizeOf<TransformC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Vector2$ = .new(.new(this,
      byteSize:        sizeOf<Vector2C>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Vector3$ = .new(.new(this,
      byteSize:        sizeOf<Vector3C>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Vector4$ = .new(.new(this,
      byteSize:        sizeOf<Vector4C>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    VrDeviceInfo$ = .new(.new(this,
      byteSize:        sizeOf<VrDeviceInfoC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    VrStereoConfig$ = .new(.new(this,
      byteSize:        sizeOf<VrStereoConfigC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    Wave$ = .new(.new(this,
      byteSize:        sizeOf<WaveC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));
  }
}