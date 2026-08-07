part of '../raylib_dartified.dart';

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
  NativeAlloc(super.temp, super.name, {
    required super.byteSize,
    required super.allocatorFunc,
    required super.printerFunc,
  }) : super(
    freeFunc: (ptr) => calloc.free(ptr),
    nullptrFactory: () => nullptr,
    pointerFactory: (ptr) => ptr,
    pointerToSource: (ptr) => ptr,
    isPointerNull: (ptr) => ptr == nullptr || ptr.address == 0,
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

  NativeLitAlloc(super.temp, super.name, {
    required super.byteSize,
    required super.allocatorFunc,
    required super.printerFunc,
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

  NativeLitTypedListAlloc(super.temp, super.name, {
    required super.byteSize,
    required super.allocatorFunc,
    required super.printerFunc,
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
  NativeLitIntAlloc(super.temp, super.name, {
    required super.byteSize,
    required super.allocatorFunc,
    required super.printerFunc,
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
  NativeLitFloatAlloc(super.temp, super.name, {
    required super.byteSize,
    required super.allocatorFunc,
    required super.printerFunc,
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

  NativeLitPtrAlloc(super.temp, super.name, {
    required super.allocatorFunc,
    required this.rawArrayFunc,
  }) : super(
    byteSize: sizeOf<Pointer>(),
    printerFunc: (ptr) => 'We can\'t print Pointer<Pointer<$C>> at this level',
  ) {
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

  NativeStructAlloc(super.temp, super.name, {
    required super.byteSize,
    required super.allocatorFunc,
    required super.printerFunc,
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

  NativeStructPtrAlloc(super.temp, super.name, {
    required super.allocatorFunc,
    required this.valueFunc,
    required this.rawArrayFunc,
  }) : super(
    byteSize: sizeOf<Pointer>(),
    printerFunc: (ptr) => 'We can\'t print Pointer<Pointer<$C>> at this level',
  ) {
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

  NativeStringAlloc(super.temp, super.name, {
    required this.slotCount,
    required super.allocatorFunc,
  }) : super(
    byteSize: sizeOf<Uint8>(),
    printerFunc: (ptr) => ptr.toD,
  ) {
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

    return .fromAddress(0); // not found -> nullptr
  }
}

class RaylibTemp extends RaylibTempBase<Raylib> {
  RaylibTemp(super.lib, { super.options });
  
  @override late NativeRaylibTempUtils Utils;

  @override late NativeTypedDataListAlloc TypedDataList$;

  @override late NativeStringAlloc String$;

  @override late NativeLitAlloc<bool, Bool> Bool$;
  @override late NativeLitPtrAlloc<bool, Bool> Ptr$Bool$;

  @override late NativeLitIntAlloc<Int8, Int8List> Int8$;
  @override late NativeLitPtrAlloc<int, Int8> Ptr$Int8$;
  @override late NativeLitIntAlloc<Uint8, Uint8List> Uint8$;
  @override late NativeLitPtrAlloc<int, Uint8> Ptr$Uint8$;
  @override late NativeLitIntAlloc<Int16, Int16List> Int16$;
  @override late NativeLitPtrAlloc<int, Int16> Ptr$Int16$;
  @override late NativeLitIntAlloc<Uint16, Uint16List> Uint16$;
  @override late NativeLitPtrAlloc<int, Uint16> Ptr$Uint16$;
  @override late NativeLitIntAlloc<Int32, Int32List> Int32$;
  @override late NativeLitPtrAlloc<int, Int32> Ptr$Int32$;
  @override late NativeLitIntAlloc<Uint32, Uint32List> Uint32$;
  @override late NativeLitPtrAlloc<int, Uint32> Ptr$Uint32$;
  @override late NativeLitIntAlloc<Int64, Int64List> Int64$;
  @override late NativeLitPtrAlloc<int, Int64> Ptr$Int64$;
  @override late NativeLitIntAlloc<Uint64, Uint64List> Uint64$;
  @override late NativeLitPtrAlloc<int, Uint64> Ptr$Uint64$;
  @override late NativeLitFloatAlloc<Float, Float32List> Float32$;
  @override late NativeLitPtrAlloc<double, Float> Ptr$Float32$;
  @override late NativeLitFloatAlloc<Double, Float64List> Float64$;
  @override late NativeLitPtrAlloc<double, Double> Ptr$Float64$;
  
  @override late NativeLitIntAlloc<Int, Int32List> Int$;
  @override late NativeLitPtrAlloc<int, Int> Ptr$Int$;
  @override late NativeLitIntAlloc<UnsignedInt, Uint32List> UnsignedInt$;
  @override late NativeLitPtrAlloc<int, UnsignedInt> Ptr$UnsignedInt$;
  @override late NativeLitIntAlloc<Char, Int8List> Char$;
  @override late NativeLitPtrAlloc<int, Char> Ptr$Char$;
  @override late NativeLitIntAlloc<UnsignedChar, Uint8List> UnsignedChar$;
  @override late NativeLitPtrAlloc<int, UnsignedChar> Ptr$UnsignedChar$;
  @override late NativeLitIntAlloc<Short, Int16List> Short$;
  @override late NativeLitPtrAlloc<int, Short> Ptr$Short$;
  @override late NativeLitIntAlloc<UnsignedShort, Uint16List> UnsignedShort$;
  @override late NativeLitPtrAlloc<int, UnsignedShort> Ptr$UnsignedShort$;
  
  @override late NativeStructAlloc<AutomationEventListC, AutomationEventListD> AutomationEventList$;
  @override late NativeStructPtrAlloc<AutomationEventListC, AutomationEventListD> Ptr$AutomationEventList$;
  @override late NativeStructAlloc<AutomationEventC, AutomationEventD> AutomationEvent$;
  @override late NativeStructPtrAlloc<AutomationEventC, AutomationEventD> Ptr$AutomationEvent$;
  @override late NativeStructAlloc<AudioStreamC, AudioStreamD> AudioStream$;
  @override late NativeStructPtrAlloc<AudioStreamC, AudioStreamD> Ptr$AudioStream$;
  @override late NativeStructAlloc<BoneInfoC, BoneInfoD> BoneInfo$;
  @override late NativeStructPtrAlloc<BoneInfoC, BoneInfoD> Ptr$BoneInfo$;
  @override late NativeStructAlloc<BoundingBoxC, BoundingBoxD> BoundingBox$;
  @override late NativeStructPtrAlloc<BoundingBoxC, BoundingBoxD> Ptr$BoundingBox$;
  @override late NativeStructAlloc<Camera2DC, Camera2DD> Camera2D$;
  @override late NativeStructPtrAlloc<Camera2DC, Camera2DD> Ptr$Camera2D$;
  @override late NativeStructAlloc<Camera3DC, Camera3DD> Camera3D$;
  @override late NativeStructPtrAlloc<Camera3DC, Camera3DD> Ptr$Camera3D$;
  @override late NativeStructAlloc<ColorC, ColorD> Color$;
  @override late NativeStructPtrAlloc<ColorC, ColorD> Ptr$Color$;
  @override late NativeStructAlloc<FilePathListC, FilePathListD> FilePathList$;
  @override late NativeStructPtrAlloc<FilePathListC, FilePathListD> Ptr$FilePathList$;
  @override late NativeStructAlloc<FontC, FontD> Font$;
  @override late NativeStructPtrAlloc<FontC, FontD> Ptr$Font$;
  @override late NativeStructAlloc<GestureEventC, GestureEventD> GestureEvent$;
  @override late NativeStructPtrAlloc<GestureEventC, GestureEventD> Ptr$GestureEvent$;
  @override late NativeStructAlloc<GlyphInfoC, GlyphInfoD> GlyphInfo$;
  @override late NativeStructPtrAlloc<GlyphInfoC, GlyphInfoD> Ptr$GlyphInfo$;
  @override late NativeStructAlloc<ImageC, ImageD> Image$;
  @override late NativeStructPtrAlloc<ImageC, ImageD> Ptr$Image$;
  @override late NativeStructAlloc<LightC, LightD> Light$;
  @override late NativeStructPtrAlloc<LightC, LightD> Ptr$Light$;
  @override late NativeStructAlloc<MaterialC, MaterialD> Material$;
  @override late NativeStructPtrAlloc<MaterialC, MaterialD> Ptr$Material$;
  @override late NativeStructAlloc<MaterialMapC, MaterialMapD> MaterialMap$;
  @override late NativeStructPtrAlloc<MaterialMapC, MaterialMapD> Ptr$MaterialMap$;
  @override late NativeStructAlloc<MatrixC, MatrixD> Matrix$;
  @override late NativeStructPtrAlloc<MatrixC, MatrixD> Ptr$Matrix$;
  @override late NativeStructAlloc<MeshC, MeshD> Mesh$;
  @override late NativeStructPtrAlloc<MeshC, MeshD> Ptr$Mesh$;
  @override late NativeStructAlloc<ModelC, ModelD> Model$;
  @override late NativeStructPtrAlloc<ModelC, ModelD> Ptr$Model$;
  @override late NativeStructAlloc<ModelAnimationC, ModelAnimationD> ModelAnimation$;
  @override late NativeStructPtrAlloc<ModelAnimationC, ModelAnimationD> Ptr$ModelAnimation$;
  @override late NativeStructAlloc<ModelSkeletonC, ModelSkeletonD> ModelSkeleton$;
  @override late NativeStructPtrAlloc<ModelSkeletonC, ModelSkeletonD> Ptr$ModelSkeleton$;
  @override late NativeStructAlloc<MusicC, MusicD> Music$;
  @override late NativeStructPtrAlloc<MusicC, MusicD> Ptr$Music$;
  @override late NativeStructAlloc<NPatchInfoC, NPatchInfoD> NPatchInfo$;
  @override late NativeStructPtrAlloc<NPatchInfoC, NPatchInfoD> Ptr$NPatchInfo$;
  @override late NativeStructAlloc<QuaternionC, QuaternionD> Quaternion$;
  @override late NativeStructPtrAlloc<QuaternionC, QuaternionD> Ptr$Quaternion$;
  @override late NativeStructAlloc<RectangleC, RectangleD> Rectangle$;
  @override late NativeStructPtrAlloc<RectangleC, RectangleD> Ptr$Rectangle$;
  @override late NativeStructAlloc<RlDrawCallC, RlDrawCallD> RlDrawCall$;
  @override late NativeStructPtrAlloc<RlDrawCallC, RlDrawCallD> Ptr$RlDrawCall$;
  @override late NativeStructAlloc<RlRenderBatchC, RlRenderBatchD> RlRenderBatch$;
  @override late NativeStructPtrAlloc<RlRenderBatchC, RlRenderBatchD> Ptr$RlRenderBatch$;
  @override late NativeStructAlloc<RlVertexBufferC, RlVertexBufferD> RlVertexBuffer$;
  @override late NativeStructPtrAlloc<RlVertexBufferC, RlVertexBufferD> Ptr$RlVertexBuffer$;
  @override late NativeStructAlloc<RayC, RayD> Ray$;
  @override late NativeStructPtrAlloc<RayC, RayD> Ptr$Ray$;
  @override late NativeStructAlloc<RayCollisionC, RayCollisionD> RayCollision$;
  @override late NativeStructPtrAlloc<RayCollisionC, RayCollisionD> Ptr$RayCollision$;
  @override late NativeStructAlloc<RenderTextureC, RenderTextureD> RenderTexture$;
  @override late NativeStructPtrAlloc<RenderTextureC, RenderTextureD> Ptr$RenderTexture$;
  @override late NativeStructAlloc<ShaderC, ShaderD> Shader$;
  @override late NativeStructPtrAlloc<ShaderC, ShaderD> Ptr$Shader$;
  @override late NativeStructAlloc<SoundC, SoundD> Sound$;
  @override late NativeStructPtrAlloc<SoundC, SoundD> Ptr$Sound$;
  @override late NativeStructAlloc<TextureC, TextureD> Texture$;
  @override late NativeStructPtrAlloc<TextureC, TextureD> Ptr$Texture$;
  @override late NativeStructAlloc<TransformC, TransformD> Transform$;
  @override late NativeStructPtrAlloc<TransformC, TransformD> Ptr$Transform$;
  @override late NativeStructAlloc<Vector2C, Vector2D> Vector2$;
  @override late NativeStructPtrAlloc<Vector2C, Vector2D> Ptr$Vector2$;
  @override late NativeStructAlloc<Vector3C, Vector3D> Vector3$;
  @override late NativeStructPtrAlloc<Vector3C, Vector3D> Ptr$Vector3$;
  @override late NativeStructAlloc<Vector4C, Vector4D> Vector4$;
  @override late NativeStructPtrAlloc<Vector4C, Vector4D> Ptr$Vector4$;
  @override late NativeStructAlloc<VrDeviceInfoC, VrDeviceInfoD> VrDeviceInfo$;
  @override late NativeStructPtrAlloc<VrDeviceInfoC, VrDeviceInfoD> Ptr$VrDeviceInfo$;
  @override late NativeStructAlloc<VrStereoConfigC, VrStereoConfigD> VrStereoConfig$;
  @override late NativeStructPtrAlloc<VrStereoConfigC, VrStereoConfigD> Ptr$VrStereoConfig$;
  @override late NativeStructAlloc<WaveC, WaveD> Wave$;
  @override late NativeStructPtrAlloc<WaveC, WaveD> Ptr$Wave$;

  // ===========================
  // ====== CUSTOM ALLOCS ======
  // ===========================

  NativeLitAlloc<X, C> allocLit<X, C extends NativeType>(String key) =>
    getCustomAllocatorOrThrow(key) as NativeLitAlloc<X, C>;

  NativeLitIntAlloc<C, L> allocIntList<X, C extends NativeType, L extends TypedDataList>(String key) =>
    getCustomAllocatorOrThrow(key) as NativeLitIntAlloc<C, L>;

  NativeLitFloatAlloc<C, L> allocFloatList<X, C extends NativeType, L extends TypedDataList>(String key) =>
    getCustomAllocatorOrThrow(key) as NativeLitFloatAlloc<C, L>;

  NativeLitPtrAlloc<X, C> allocLitPtr<X, C extends NativeType>(String key) =>
    getCustomAllocatorOrThrow(key) as NativeLitPtrAlloc<X, C>;

  NativeStructAlloc<C, D> allocStruct<C extends Struct, D extends StructD<C, D>>(String key) =>
    getCustomAllocatorOrThrow(key) as NativeStructAlloc<C, D>;

  NativeStructPtrAlloc<C, D> allocStructPtr<C extends Struct, D extends StructD<C, D>>(String key) =>
    getCustomAllocatorOrThrow(key) as NativeStructPtrAlloc<C, D>;

  // ============================
  // ====== INITIALIZATION ======
  // ============================

  @override
  void load() {
    super.load();

    Utils = .new(this);

    TypedDataList$ = .new(this);

    String$ = .new(this, 'String\$',
      allocatorFunc: ([count = 1]) => calloc<Char>(count),
      slotCount: options.stringCount,
    );

    Bool$ = .new(this, r'Bool$',
      byteSize: sizeOf<Bool>(),
      allocatorFunc: ([count = 1]) => calloc<Bool>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value,
      literalSetterFunc: (ptr, value) => ptr.value = value,
      printerFunc: (ptr) => ptr.value.toString(),
    );

    Ptr$Bool$ = .new(this, r'Ptr$Bool$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Bool>>(count),
      rawArrayFunc: Bool$.RawArray,
    );

    Int8$ = .new(this, r'Int8$',
      byteSize: sizeOf<Int8>(),
      allocatorFunc: ([count = 1]) => calloc<Int8>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt8List(offset, len),
    );

    Ptr$Int8$ = .new(this, r'Ptr$Int8$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Int8>>(count),
      rawArrayFunc: Int8$.RawArray,
    );

    Uint8$ = .new(this, r'Uint8$',
      byteSize: sizeOf<Uint8>(),
      allocatorFunc: ([count = 1]) => calloc<Uint8>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint8List(offset, len),
    );

    Ptr$Uint8$ = .new(this, r'Ptr$Uint8$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Uint8>>(count),
      rawArrayFunc: Uint8$.RawArray,
    );

    Int16$ = .new(this, r'Int16$',
      byteSize: sizeOf<Int16>(),
      allocatorFunc: ([count = 1]) => calloc<Int16>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt16List(offset, len),
    );

    Ptr$Int16$ = .new(this, r'Ptr$Int16$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Int16>>(count),
      rawArrayFunc: Int16$.RawArray,
    );

    Uint16$ = .new(this, r'Uint16$',
      byteSize: sizeOf<Uint16>(),
      allocatorFunc: ([count = 1]) => calloc<Uint16>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint16List(offset, len),
    );

    Ptr$Uint16$ = .new(this, r'Ptr$Uint16$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Uint16>>(count),
      rawArrayFunc: Uint16$.RawArray,
    );

    Int32$ = .new(this, r'Int32$',
      byteSize: sizeOf<Int32>(),
      allocatorFunc: ([count = 1]) => calloc<Int32>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt32List(offset, len),
    );

    Ptr$Int32$ = .new(this, r'Ptr$Int32$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Int32>>(count),
      rawArrayFunc: Int32$.RawArray,
    );

    Uint32$ = .new(this, r'Uint32$',
      byteSize: sizeOf<Uint32>(),
      allocatorFunc: ([count = 1]) => calloc<Uint32>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint32List(offset, len),
    );

    Ptr$Uint32$ = .new(this, r'Ptr$Uint32$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Uint32>>(count),
      rawArrayFunc: Uint32$.RawArray,
    );

    Int64$ = .new(this, r'Int64$',
      byteSize: sizeOf<Int64>(),
      allocatorFunc: ([count = 1]) => calloc<Int64>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt64List(offset, len),
    );

    Ptr$Int64$ = .new(this, r'Ptr$Int64$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Int64>>(count),
      rawArrayFunc: Int64$.RawArray,
    );

    Uint64$ = .new(this, r'Uint64$',
      byteSize: sizeOf<Uint64>(),
      allocatorFunc: ([count = 1]) => calloc<Uint64>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint64List(offset, len),
    );

    Ptr$Uint64$ = .new(this, r'Ptr$Uint64$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Uint64>>(count),
      rawArrayFunc: Uint64$.RawArray,
    );

    Float32$ = .new(this, r'Float32$',
      byteSize: sizeOf<Float>(),
      allocatorFunc: ([count = 1]) => calloc<Float>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toDouble(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toDouble(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<double>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asFloat32List(offset, len),
    );

    Ptr$Float32$ = .new(this, r'Ptr$Float32$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Float>>(count),
      rawArrayFunc: Float32$.RawArray,
    );

    Float64$ = .new(this, r'Float64$',
      byteSize: sizeOf<Double>(),
      allocatorFunc: ([count = 1]) => calloc<Double>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toDouble(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toDouble(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<double>().toList()),
      asView: (ptr, length) => ptr.asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asFloat64List(offset, len),
    );

    Ptr$Float64$ = .new(this, r'Ptr$Float64$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Double>>(count),
      rawArrayFunc: Float64$.RawArray,
    );

    Int$ = .new(this, r'Int$',
      byteSize: sizeOf<Int>(),
      allocatorFunc: ([count = 1]) => calloc<Int>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.cast<Int32>().asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt32List(offset, len),
    );

    Ptr$Int$ = .new(this, r'Ptr$Int$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Int>>(count),
      rawArrayFunc: Int$.RawArray,
    );

    UnsignedInt$ = .new(this, r'UnsignedInt$',
      byteSize: sizeOf<UnsignedInt>(),
      allocatorFunc: ([count = 1]) => calloc<UnsignedInt>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.cast<Uint32>().asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint32List(offset, len),
    );

    Ptr$UnsignedInt$ = .new(this, r'Ptr$UnsignedInt$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<UnsignedInt>>(count),
      rawArrayFunc: UnsignedInt$.RawArray,
    );

    Char$ = .new(this, r'Char$',
      byteSize: sizeOf<Char>(),
      allocatorFunc: ([count = 1]) => calloc<Char>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.cast<Int8>().asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt8List(offset, len),
    );

    Ptr$Char$ = .new(this, r'Ptr$Char$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Char>>(count),
      rawArrayFunc: Char$.RawArray,
    );

    UnsignedChar$ = .new(this, r'UnsignedChar$',
      byteSize: sizeOf<UnsignedChar>(),
      allocatorFunc: ([count = 1]) => calloc<UnsignedChar>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.cast<Uint8>().asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint8List(offset, len),
    );

    Ptr$UnsignedChar$ = .new(this, r'Ptr$UnsignedChar$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<UnsignedChar>>(count),
      rawArrayFunc: UnsignedChar$.RawArray,
    );

    Short$ = .new(this, r'Short$',
      byteSize: sizeOf<Short>(),
      allocatorFunc: ([count = 1]) => calloc<Short>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.cast<Int16>().asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asInt16List(offset, len),
    );

    Ptr$Short$ = .new(this, r'Ptr$Short$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Short>>(count),
      rawArrayFunc: Short$.RawArray,
    );

    UnsignedShort$ = .new(this, r'UnsignedShort$',
      byteSize: sizeOf<UnsignedShort>(),
      allocatorFunc: ([count = 1]) => calloc<UnsignedShort>(count),
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      literalSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      printerFunc: (ptr) => ptr.value.toString(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.cast<Uint16>().asTypedList(length),
      fromBuffer: (buf, offset, len) => buf.asUint16List(offset, len),
    );

    Ptr$UnsignedShort$ = .new(this, r'Ptr$UnsignedShort$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<UnsignedShort>>(count),
      rawArrayFunc: UnsignedShort$.RawArray,
    );

    AutomationEventList$ = .new(this, r'AutomationEventList$',
      byteSize:        sizeOf<AutomationEventListC>(),
      allocatorFunc:   ([count = 1]) => calloc<AutomationEventListC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$AutomationEventList$ = .new(this, r'Ptr$AutomationEventList$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<AutomationEventListC>>(count),
      valueFunc: AutomationEventList$.Value,
      rawArrayFunc: AutomationEventList$.RawArray,
    );

    AutomationEvent$ = .new(this, r'AutomationEvent$',
      byteSize:        sizeOf<AutomationEventC>(),
      allocatorFunc:   ([count = 1]) => calloc<AutomationEventC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$AutomationEvent$ = .new(this, r'Ptr$AutomationEvent$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<AutomationEventC>>(count),
      valueFunc: AutomationEvent$.Value,
      rawArrayFunc: AutomationEvent$.RawArray,
    );

    AudioStream$ = .new(this, r'AudioStream$',
      byteSize:        sizeOf<AudioStreamC>(),
      allocatorFunc:   ([count = 1]) => calloc<AudioStreamC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$AudioStream$ = .new(this, r'Ptr$AudioStream$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<AudioStreamC>>(count),
      valueFunc: AudioStream$.Value,
      rawArrayFunc: AudioStream$.RawArray,
    );

    BoneInfo$ = .new(this, r'BoneInfo$',
      byteSize:        sizeOf<BoneInfoC>(),
      allocatorFunc:   ([count = 1]) => calloc<BoneInfoC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$BoneInfo$ = .new(this, r'Ptr$BoneInfo$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<BoneInfoC>>(count),
      valueFunc: BoneInfo$.Value,
      rawArrayFunc: BoneInfo$.RawArray,
    );

    BoundingBox$ = .new(this, r'BoundingBox$',
      byteSize:        sizeOf<BoundingBoxC>(),
      allocatorFunc:   ([count = 1]) => calloc<BoundingBoxC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$BoundingBox$ = .new(this, r'Ptr$BoundingBox$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<BoundingBoxC>>(count),
      valueFunc: BoundingBox$.Value,
      rawArrayFunc: BoundingBox$.RawArray,
    );

    Camera2D$ = .new(this, r'Camera2D$',
      byteSize:        sizeOf<Camera2DC>(),
      allocatorFunc:   ([count = 1]) => calloc<Camera2DC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Camera2D$ = .new(this, r'Ptr$Camera2D$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Camera2DC>>(count),
      valueFunc: Camera2D$.Value,
      rawArrayFunc: Camera2D$.RawArray,
    );

    Camera3D$ = .new(this, r'Camera3D$',
      byteSize:        sizeOf<Camera3DC>(),
      allocatorFunc:   ([count = 1]) => calloc<Camera3DC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Camera3D$ = .new(this, r'Ptr$Camera3D$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Camera3DC>>(count),
      valueFunc: Camera3D$.Value,
      rawArrayFunc: Camera3D$.RawArray,
    );

    Color$ = .new(this, r'Color$',
      byteSize:        sizeOf<ColorC>(),
      allocatorFunc:   ([count = 1]) => calloc<ColorC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Color$ = .new(this, r'Ptr$Color$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<ColorC>>(count),
      valueFunc: Color$.Value,
      rawArrayFunc: Color$.RawArray,
    );

    FilePathList$ = .new(this, r'FilePathList$',
      byteSize:        sizeOf<FilePathListC>(),
      allocatorFunc:   ([count = 1]) => calloc<FilePathListC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$FilePathList$ = .new(this, r'Ptr$FilePathList$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<FilePathListC>>(count),
      valueFunc: FilePathList$.Value,
      rawArrayFunc: FilePathList$.RawArray,
    );

    Font$ = .new(this, r'Font$',
      byteSize:        sizeOf<FontC>(),
      allocatorFunc:   ([count = 1]) => calloc<FontC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Font$ = .new(this, r'Ptr$Font$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<FontC>>(count),
      valueFunc: Font$.Value,
      rawArrayFunc: Font$.RawArray,
    );

    GestureEvent$ = .new(this, r'GestureEvent$',
      byteSize:        sizeOf<GestureEventC>(),
      allocatorFunc:   ([count = 1]) => calloc<GestureEventC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$GestureEvent$ = .new(this, r'Ptr$GestureEvent$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<GestureEventC>>(count),
      valueFunc: GestureEvent$.Value,
      rawArrayFunc: GestureEvent$.RawArray,
    );

    GlyphInfo$ = .new(this, r'GlyphInfo$',
      byteSize:        sizeOf<GlyphInfoC>(),
      allocatorFunc:   ([count = 1]) => calloc<GlyphInfoC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$GlyphInfo$ = .new(this, r'Ptr$GlyphInfo$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<GlyphInfoC>>(count),
      valueFunc: GlyphInfo$.Value,
      rawArrayFunc: GlyphInfo$.RawArray,
    );

    Image$ = .new(this, r'Image$',
      byteSize:        sizeOf<ImageC>(),
      allocatorFunc:   ([count = 1]) => calloc<ImageC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Image$ = .new(this, r'Ptr$Image$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<ImageC>>(count),
      valueFunc: Image$.Value,
      rawArrayFunc: Image$.RawArray,
    );

    Light$ = .new(this, r'Light$',
      byteSize:        sizeOf<LightC>(),
      allocatorFunc:   ([count = 1]) => calloc<LightC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Light$ = .new(this, r'Ptr$Light$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<LightC>>(count),
      valueFunc: Light$.Value,
      rawArrayFunc: Light$.RawArray,
    );

    Material$ = .new(this, r'Material$',
      byteSize:        sizeOf<MaterialC>(),
      allocatorFunc:   ([count = 1]) => calloc<MaterialC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Material$ = .new(this, r'Ptr$Material$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<MaterialC>>(count),
      valueFunc: Material$.Value,
      rawArrayFunc: Material$.RawArray,
    );

    MaterialMap$ = .new(this, r'MaterialMap$',
      byteSize:        sizeOf<MaterialMapC>(),
      allocatorFunc:   ([count = 1]) => calloc<MaterialMapC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$MaterialMap$ = .new(this, r'Ptr$MaterialMap$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<MaterialMapC>>(count),
      valueFunc: MaterialMap$.Value,
      rawArrayFunc: MaterialMap$.RawArray,
    );

    Matrix$ = .new(this, r'Matrix$',
      byteSize:        sizeOf<MatrixC>(),
      allocatorFunc:   ([count = 1]) => calloc<MatrixC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Matrix$ = .new(this, r'Ptr$Matrix$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<MatrixC>>(count),
      valueFunc: Matrix$.Value,
      rawArrayFunc: Matrix$.RawArray,
    );

    Mesh$ = .new(this, r'Mesh$',
      byteSize:        sizeOf<MeshC>(),
      allocatorFunc:   ([count = 1]) => calloc<MeshC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Mesh$ = .new(this, r'Ptr$Mesh$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<MeshC>>(count),
      valueFunc: Mesh$.Value,
      rawArrayFunc: Mesh$.RawArray,
    );

    Model$ = .new(this, r'Model$',
      byteSize:        sizeOf<ModelC>(),
      allocatorFunc:   ([count = 1]) => calloc<ModelC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Model$ = .new(this, r'Ptr$Model$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<ModelC>>(count),
      valueFunc: Model$.Value,
      rawArrayFunc: Model$.RawArray,
    );

    ModelAnimation$ = .new(this, r'ModelAnimation$',
      byteSize:        sizeOf<ModelAnimationC>(),
      allocatorFunc:   ([count = 1]) => calloc<ModelAnimationC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$ModelAnimation$ = .new(this, r'Ptr$ModelAnimation$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<ModelAnimationC>>(count),
      valueFunc: ModelAnimation$.Value,
      rawArrayFunc: ModelAnimation$.RawArray,
    );

    ModelSkeleton$ = .new(this, r'ModelSkeleton$',
      byteSize:        sizeOf<ModelSkeletonC>(),
      allocatorFunc:   ([count = 1]) => calloc<ModelSkeletonC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$ModelSkeleton$ = .new(this, r'Ptr$ModelSkeleton$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<ModelSkeletonC>>(count),
      valueFunc: ModelSkeleton$.Value,
      rawArrayFunc: ModelSkeleton$.RawArray,
    );

    Music$ = .new(this, r'Music$',
      byteSize:        sizeOf<MusicC>(),
      allocatorFunc:   ([count = 1]) => calloc<MusicC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Music$ = .new(this, r'Ptr$Music$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<MusicC>>(count),
      valueFunc: Music$.Value,
      rawArrayFunc: Music$.RawArray,
    );

    NPatchInfo$ = .new(this, r'NPatchInfo$',
      byteSize:        sizeOf<NPatchInfoC>(),
      allocatorFunc:   ([count = 1]) => calloc<NPatchInfoC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$NPatchInfo$ = .new(this, r'Ptr$NPatchInfo$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<NPatchInfoC>>(count),
      valueFunc: NPatchInfo$.Value,
      rawArrayFunc: NPatchInfo$.RawArray,
    );

    Quaternion$ = .new(this, r'Quaternion$',
      byteSize:        sizeOf<QuaternionC>(),
      allocatorFunc:   ([count = 1]) => calloc<QuaternionC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Quaternion$ = .new(this, r'Ptr$Quaternion$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<QuaternionC>>(count),
      valueFunc: Quaternion$.Value,
      rawArrayFunc: Quaternion$.RawArray,
    );

    Rectangle$ = .new(this, r'Rectangle$',
      byteSize:        sizeOf<RectangleC>(),
      allocatorFunc:   ([count = 1]) => calloc<RectangleC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Rectangle$ = .new(this, r'Ptr$Rectangle$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<RectangleC>>(count),
      valueFunc: Rectangle$.Value,
      rawArrayFunc: Rectangle$.RawArray,
    );

    RlDrawCall$ = .new(this, r'RlDrawCall$',
      byteSize:        sizeOf<RlDrawCallC>(),
      allocatorFunc:   ([count = 1]) => calloc<RlDrawCallC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$RlDrawCall$ = .new(this, r'Ptr$RlDrawCall$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<RlDrawCallC>>(count),
      valueFunc: RlDrawCall$.Value,
      rawArrayFunc: RlDrawCall$.RawArray,
    );

    RlRenderBatch$ = .new(this, r'RlRenderBatch$',
      byteSize:        sizeOf<RlRenderBatchC>(),
      allocatorFunc:   ([count = 1]) => calloc<RlRenderBatchC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$RlRenderBatch$ = .new(this, r'Ptr$RlRenderBatch$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<RlRenderBatchC>>(count),
      valueFunc: RlRenderBatch$.Value,
      rawArrayFunc: RlRenderBatch$.RawArray,
    );

    RlVertexBuffer$ = .new(this, r'RlVertexBuffer$',
      byteSize:        sizeOf<RlVertexBufferC>(),
      allocatorFunc:   ([count = 1]) => calloc<RlVertexBufferC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$RlVertexBuffer$ = .new(this, r'Ptr$RlVertexBuffer$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<RlVertexBufferC>>(count),
      valueFunc: RlVertexBuffer$.Value,
      rawArrayFunc: RlVertexBuffer$.RawArray,
    );

    Ray$ = .new(this, r'Ray$',
      byteSize:        sizeOf<RayC>(),
      allocatorFunc:   ([count = 1]) => calloc<RayC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Ray$ = .new(this, r'Ptr$Ray$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<RayC>>(count),
      valueFunc: Ray$.Value,
      rawArrayFunc: Ray$.RawArray,
    );

    RayCollision$ = .new(this, r'RayCollision$',
      byteSize:        sizeOf<RayCollisionC>(),
      allocatorFunc:   ([count = 1]) => calloc<RayCollisionC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$RayCollision$ = .new(this, r'Ptr$RayCollision$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<RayCollisionC>>(count),
      valueFunc: RayCollision$.Value,
      rawArrayFunc: RayCollision$.RawArray,
    );

    RenderTexture$ = .new(this, r'RenderTexture$',
      byteSize:        sizeOf<RenderTextureC>(),
      allocatorFunc:   ([count = 1]) => calloc<RenderTextureC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$RenderTexture$ = .new(this, r'Ptr$RenderTexture$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<RenderTextureC>>(count),
      valueFunc: RenderTexture$.Value,
      rawArrayFunc: RenderTexture$.RawArray,
    );

    Shader$ = .new(this, r'Shader$',
      byteSize:        sizeOf<ShaderC>(),
      allocatorFunc:   ([count = 1]) => calloc<ShaderC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Shader$ = .new(this, r'Ptr$Shader$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<ShaderC>>(count),
      valueFunc: Shader$.Value,
      rawArrayFunc: Shader$.RawArray,
    );

    Sound$ = .new(this, r'Sound$',
      byteSize:        sizeOf<SoundC>(),
      allocatorFunc:   ([count = 1]) => calloc<SoundC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Sound$ = .new(this, r'Ptr$Sound$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<SoundC>>(count),
      valueFunc: Sound$.Value,
      rawArrayFunc: Sound$.RawArray,
    );

    Texture$ = .new(this, r'Texture$',
      byteSize:        sizeOf<TextureC>(),
      allocatorFunc:   ([count = 1]) => calloc<TextureC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Texture$ = .new(this, r'Ptr$Texture$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<TextureC>>(count),
      valueFunc: Texture$.Value,
      rawArrayFunc: Texture$.RawArray,
    );

    Transform$ = .new(this, r'Transform$',
      byteSize:        sizeOf<TransformC>(),
      allocatorFunc:   ([count = 1]) => calloc<TransformC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Transform$ = .new(this, r'Ptr$Transform$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<TransformC>>(count),
      valueFunc: Transform$.Value,
      rawArrayFunc: Transform$.RawArray,
    );

    Vector2$ = .new(this, r'Vector2$',
      byteSize:        sizeOf<Vector2C>(),
      allocatorFunc:   ([count = 1]) => calloc<Vector2C>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Vector2$ = .new(this, r'Ptr$Vector2$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Vector2C>>(count),
      valueFunc: Vector2$.Value,
      rawArrayFunc: Vector2$.RawArray,
    );

    Vector3$ = .new(this, r'Vector3$',
      byteSize:        sizeOf<Vector3C>(),
      allocatorFunc:   ([count = 1]) => calloc<Vector3C>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Vector3$ = .new(this, r'Ptr$Vector3$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Vector3C>>(count),
      valueFunc: Vector3$.Value,
      rawArrayFunc: Vector3$.RawArray,
    );

    Vector4$ = .new(this, r'Vector4$',
      byteSize:        sizeOf<Vector4C>(),
      allocatorFunc:   ([count = 1]) => calloc<Vector4C>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Vector4$ = .new(this, r'Ptr$Vector4$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<Vector4C>>(count),
      valueFunc: Vector4$.Value,
      rawArrayFunc: Vector4$.RawArray,
    );

    VrDeviceInfo$ = .new(this, r'VrDeviceInfo$',
      byteSize:        sizeOf<VrDeviceInfoC>(),
      allocatorFunc:   ([count = 1]) => calloc<VrDeviceInfoC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$VrDeviceInfo$ = .new(this, r'Ptr$VrDeviceInfo$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<VrDeviceInfoC>>(count),
      valueFunc: VrDeviceInfo$.Value,
      rawArrayFunc: VrDeviceInfo$.RawArray,
    );

    VrStereoConfig$ = .new(this, r'VrStereoConfig$',
      byteSize:        sizeOf<VrStereoConfigC>(),
      allocatorFunc:   ([count = 1]) => calloc<VrStereoConfigC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$VrStereoConfig$ = .new(this, r'Ptr$VrStereoConfig$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<VrStereoConfigC>>(count),
      valueFunc: VrStereoConfig$.Value,
      rawArrayFunc: VrStereoConfig$.RawArray,
    );

    Wave$ = .new(this, r'Wave$',
      byteSize:        sizeOf<WaveC>(),
      allocatorFunc:   ([count = 1]) => calloc<WaveC>(count),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      printerFunc:     (ptr)         => ptr.toD().signature(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    );

    Ptr$Wave$ = .new(this, r'Ptr$Wave$',
      allocatorFunc: ([count = 1]) => calloc<Pointer<WaveC>>(count),
      valueFunc: Wave$.Value,
      rawArrayFunc: Wave$.RawArray,
    );
  }
}