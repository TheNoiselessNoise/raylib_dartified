part of 'raylib_dartified.dart';

typedef RaylibLookup = Pointer<T> Function<T extends NativeType>(String symbolName);

/// A Dart-side wrapper around a [NativeCallable<C>], bridging a Dart function
/// of type [D] to a native callback of type [C].
///
/// Subclasses define the actual [function] and [registry] they belong to.
/// Each concrete callback type (e.g. `AudioCallbackD`) owns a static registry
/// that tracks all live instances, enabling bulk disposal via [disposeRegistry].
///
/// Initialization of the underlying [NativeCallable] is deferred to the first
/// access of [nativeFunction] rather than the constructor, to avoid preventing
/// proper [dispose] calls on app exit.
///
/// Typical usage:
/// ```dart
/// final cb = AudioCallbackD.function((buffer, frames) { ... });
/// rl.Audio.AttachAudioMixedProcessor(cb); // calls attach() internally
/// // ...
/// rl.Audio.DetachAudioMixedProcessor(cb); // calls detach() internally, disposes cb
/// ```
abstract class CallbackD<C extends Function, D extends Function> with RaylibCallbackBase {

  /// The underlying [NativeCallable] wrapping [function].
  ///
  /// Initialized lazily on first access of [nativeFunction].
  late final NativeCallable<C> _callable;

  bool _isDisposed = false;

  /// The Dart function exposed to the native side.
  ///
  /// Subclasses return their concrete callback implementation here.
  D get function;

  /// A human-readable name for this callback, used in [toString] and logging.
  ///
  /// Defaults to `runtimeType.toString()` if not provided.
  @override
  late String name;

  CallbackD([String? name]) {
    this.name = name ?? runtimeType.toString();
  }

  bool _initialized = false;

  /// Creates and returns the [NativeCallable<C>] wrapping [function].
  ///
  /// Called exactly once, on first access of [nativeFunction]. Subclasses
  /// must override this to provide the appropriate [NativeCallable] constructor,
  /// typically `.listener(function)`:
  ///
  /// ```dart
  /// @override
  /// initializer() => .listener(function);
  /// ```
  NativeCallable<C> initializer();

  /// Returns the native function pointer for this callback.
  ///
  /// Initializes the [NativeCallable] on first access. Asserts that the
  /// callback has not been [dispose]d.
  Pointer<NativeFunction<C>> get nativeFunction {
    if (!_initialized) {
      _initialized = true;
      _callable = initializer();
    }
    assert(!_isDisposed, '$runtimeType: has been disposed');
    return _callable.nativeFunction;
  }

  /// The registry of live callbacks for this callback type.
  ///
  /// Each concrete subclass owns a static `List<CallbackD>` and returns it
  /// here. The registry is used to track active callbacks and support bulk
  /// disposal via [disposeRegistry].
  List<CallbackD> get registry;

  /// Registers this callback and returns its native function pointer.
  ///
  /// Adds `this` to [registry] if not already present, then returns
  /// [nativeFunction]. Pass the result directly to the native attach API:
  ///
  /// ```dart
  /// rl.Audio.AttachAudioMixedProcessor(callback.attach());
  /// ```
  Pointer<NativeFunction<C>> attach() {
    if (!registry.contains(this)) registry.add(this);
    return nativeFunction;
  }

  /// Removes this callback from [registry], optionally disposes it, and
  /// returns its native function pointer.
  ///
  /// The pointer is returned so it can be passed directly to the native detach
  /// API in the same call. The native side needs the pointer to identify which
  /// callback to remove, even as we're tearing it down on the Dart side:
  ///
  /// ```dart
  /// rl.Audio.DetachAudioMixedProcessor(callback.detach());
  /// ```
  ///
  /// If [keepAlive] is `true`, the callback is neither removed from [registry]
  /// nor disposed, only the pointer is returned. Useful when temporarily
  /// detaching without releasing resources.
  Pointer<NativeFunction<C>> detach([bool keepAlive = false]) {
    if (keepAlive) return nativeFunction;
    registry.remove(this);
    dispose();
    return nativeFunction;
  }

  /// Closes the underlying [NativeCallable] and marks this instance as disposed.
  ///
  /// Safe to call multiple times, subsequent calls are no-ops. After disposal,
  /// accessing [nativeFunction] will trigger an assertion failure.
  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;
    _callable.close();
  }

  /// Disposes all callbacks in [registry] and clears it.
  ///
  /// Intended to be called at shutdown by each concrete callback type via a
  /// typed static wrapper:
  ///
  /// ```dart
  /// static void disposeRegistry() => CallbackD.disposeRegistry(_registry);
  /// ```
  static void disposeRegistry(List<CallbackD> registry) {
    registry.forEach((f) => f.dispose());
    registry.clear();
  }

  /// Returns [name].
  @override
  String toString() => name;
}

/// Abstract Dart-side mirror of a native struct of type [C].
///
/// [D] is the concrete subclass (CRTP pattern), [C] is the corresponding
/// [NativeType]. Every C struct that crosses the FFI boundary has a
/// paired `StructD` subclass that owns the Dart-visible fields and knows
/// how to read/write itself from/into native memory.
abstract class StructD<C extends Struct, D extends StructD<C, D>> extends RaylibStructBase<RaylibTemp, Pointer<C>, D> with RaylibStructObjectBase<D> {
  StructD({
    super.originalPointer,
  });

  C nativeGetReference(Pointer<C> p) => nativeGetIndexedReference(p, 0);

  C nativeGetIndexedReference(Pointer<C> p, int index);
  
  C nativeGetIndexedArrayReference(Array<C> p, int index);

  /// Syncs Dart-side fields into the already-allocated native pointer [p].
  ///
  /// Called by [Allocator.PointerTo] when [originalPointer] is set. The default implementation
  /// delegates to [nativeWriteInto]; override only when sync and full allocation
  /// differ (e.g. to skip re-allocating nested pointers).
  @override
  void structSyncInto(RaylibTemp temp, Pointer<C> p, String key)
    => nativeWriteInto(nativeGetReference(p));

  /// Writes all fields into the native struct at [p], allocating nested pointers
  /// into [temp] under [key] as needed.
  ///
  /// Called after [allocatePointer] to populate the zeroed memory (or reuse). For structs
  /// with no nested pointers this is typically equivalent to `writeInto(p.ref)`.
  @override
  void structAllocateInto(RaylibTemp temp, Pointer<C> p, String key)
    => nativeWriteInto(nativeGetReference(p));

  @override
  void structWriteInto(Pointer<C> p) {
    print('$structName writing into...');
    nativeWriteInto(nativeGetReference(p));
  }

  @override
  void structReadFrom(Pointer<C> p)
    => nativeReadFrom(nativeGetReference(p));

  /// Writes all fields directly into the native struct reference [p].
  /// For nested structs, use `writeInto` as well.
  void nativeWriteInto(C p);

  void nativeReadFrom(C p);

  @override
  void structSyncFromMemory()
    => nativeReadFrom(nativeGetReference(getOriginalPointer()));
  
  @override
  void structSyncToMemory()
    => nativeWriteInto(nativeGetReference(getOriginalPointer()));

  @override
  String toString() => signature();
}

/// A [StructD] for value-type structs that are always passed by value.
///
/// Subclasses never own an [originalPointer]. [toC] always allocates a
/// fresh [RaylibTemp] slot (or reuses) and writes into it. Typical examples are `Vector2`,
/// `Color`, `Rectangle`: small flat structs that raylib accepts and returns
/// by value rather than by pointer.
///
/// Implementations of [structAllocateInto] should simply redirect to `writeInto(p.ref)`.
abstract class StructDLiteral<C extends Struct, D extends StructD<C, D>> extends StructD<C, D> {
  StructDLiteral({
    super.originalPointer,
  });

  @override
  bool get structRequiresOriginalPointer => false;
}

/// A read-only [StructD] that wraps an existing native pointer without owning it.
///
/// Constructed directly from a `Pointer<C>` (e.g. when iterating over a native
/// array), a `StructDView` exposes the live native memory through [ref] but
/// refuses all write operations. Attempting to call [setC], [setD],
/// [nativeAllocator], [structAllocateInto], or [nativeWriteInto] throws [UnsupportedError].
///
/// [structSyncInto] is a deliberate no-op, views never push changes back into native
/// memory.
abstract class StructDView<C extends Struct, D extends StructD<C, D>> extends StructD<C, D> {
  StructDView(Pointer<C> originalPointer) : super(
    originalPointer: originalPointer,
  );

  /// Live reference into the native struct at [originalPointer].
  /// 
  /// You can literally implement it like so:
  /// ```dart
  /// @override
  /// C get ref => getOriginalPointer().ref;
  /// ```
  C get ref;

  @override
  @nonVirtual
  nativeGetReference(Pointer<C> p) => throw UnsupportedError('$runtimeType: is just a view; cannot dereference it.');

  @override
  @nonVirtual
  nativeGetIndexedReference(Pointer<C> p, int index) => throw UnsupportedError('$runtimeType: is just a view; cannot dereference it.');

  @override
  @nonVirtual
  nativeGetIndexedArrayReference(Array<C> p, int index) => throw UnsupportedError('$runtimeType: is just a view; cannot dereference it.');

  @override
  @nonVirtual
  void nativeReadFrom(C p) {} // NOTE: do nothing

  @override
  @nonVirtual
  D setD(D o) => throw UnsupportedError('$runtimeType: is just a view; cannot write to it.');

  @override
  @nonVirtual
  void structSyncInto(RaylibTemp temp, Pointer<C> p, String key) {} // NOTE: do nothing

  @override
  @nonVirtual
  void structAllocateInto(RaylibTemp temp, Pointer<C> p, String key)
    => throw UnsupportedError('$runtimeType: is just a view; cannot allocate externally.');

  @override
  @nonVirtual
  void nativeWriteInto(C p)
    => throw UnsupportedError('$runtimeType: is just a view; cannot write externally.');
}

// Lists

abstract class NativeLiveListPointer<C extends NativeType, E> extends RaylibLiveList<E> {
  Pointer<C>? ptr;

  NativeLiveListPointer(super.inner, [this.ptr]);

  @override
  void onElementSet(int index, E value) {
    if (ptr == null || ptr!.address == 0) return;
    _indexSetter(ptr!, index, value);
  }

  @override
  void onSet(List<E> value) {
    if (ptr == null || ptr!.address == 0) return;
    _arraySetter(ptr!, value);
  }

  @override
  E operator [](int index) {
    if (ptr != null) return _indexGetter(ptr!, index);
    return inner[index];
  }

  E _indexGetter(Pointer<C> ptr, int index);

  void _indexSetter(Pointer<C> ptr, int index, E value);

  void _arraySetter(Pointer<C> ptr, List<E> array);
}

abstract class NativeLiveListArray<C extends NativeType, E> extends RaylibLiveList<E> {
  Array<C>? ptr;

  NativeLiveListArray(super.inner, [this.ptr]);

  @override
  void onElementSet(int index, E value) {
    if (ptr == null) return;
    _indexSetter(ptr!, index, value);
  }

  @override
  void onSet(List<E> value) {
    if (ptr == null) return;
    _arraySetter(ptr!, value);
  }

  @override
  E operator [](int index) {
    if (ptr != null) return _indexGetter(ptr!, index);
    return inner[index];
  }

  E _indexGetter(Array<C> ptr, int index);

  void _indexSetter(Array<C> ptr, int index, E value);

  void _arraySetter(Array<C> ptr, List<E> array);
}

class NativeLiveListPointerStruct<
  C extends Struct,
  D extends StructD<C, D>
> extends NativeLiveListPointer<C, D> {

  NativeLiveListPointerStruct(super.inner, [super.ptr]);

  @override
  D _indexGetter(Pointer<C> ptr, int index) => inner[index];

  @override
  void _indexSetter(Pointer<C> ptr, int index, D value) {
    value.nativeWriteInto(value.nativeGetIndexedReference(ptr, index));
  }

  @override
  void _arraySetter(Pointer<C> ptr, List<D> array) {
    for (final (i, v) in array.indexed) {
      v.nativeWriteInto(v.nativeGetIndexedReference(ptr, i));
    }
  }
}

class NativeLiveListPointerPointerStruct<
  C extends Struct,
  D extends StructD<C, D>
> extends NativeLiveListPointer<Pointer<C>, NativeLiveListPointerStruct<C, D>> {

  NativeLiveListPointerPointerStruct(super.inner, [super.ptr]);

  Pointer<C>? innerPointer(int index) => ptr == null ? null : (ptr! + index).value;

  @override
  NativeLiveListPointerStruct<C, D> _indexGetter(Pointer<Pointer<C>> ptr, int index) => inner[index];

  @override
  void _indexSetter(Pointer<Pointer<C>> ptr, int index, NativeLiveListPointerStruct<C, D> value) {
    value.ptr = ptr[index]; // rewire inner list's pointer to correct frame
    value.onSet(value.inner); // flush inner list to that frame
  }

  @override
  void _arraySetter(Pointer<Pointer<C>> ptr, List<NativeLiveListPointerStruct<C, D>> array) {
    for (final (i, v) in array.indexed) {
      v.ptr = ptr[i]; // wire inner list to its frame
      v.onSet(v.inner); // flush inner list to memory
    }
  }

  static NativeLiveListPointerPointerStruct<C, D> fromList<
    C extends Struct, D extends StructD<C, D>
  >([List<List<D>>? list, Pointer<Pointer<C>>? ptr]) {
    return .new(
      .generate((list ?? []).length, (i) {
        final innerPtr = ptr != null ? (ptr + i).value : null;
        return .new((list ?? [])[i], innerPtr);
      }),
      ptr,
    );
  }
}

class NativeLiveListArrayStruct<
  C extends Struct,
  D extends StructD<C, D>
> extends NativeLiveListArray<C, D> {

  NativeLiveListArrayStruct(super.inner, [super.ptr]);

  @override
  D _indexGetter(Array<C> ptr, int index) => inner[index];

  @override
  void _indexSetter(Array<C> ptr, int index, D value) {
    value.nativeWriteInto(value.nativeGetIndexedArrayReference(ptr, index));
  }

  @override
  void _arraySetter(Array<C> ptr, List<D> array) {
    for (final (i, v) in array.indexed) {
      v.nativeWriteInto(v.nativeGetIndexedArrayReference(ptr, i));
    }
  }
}

abstract class _NativeLiveListIntegerPointer<C extends NativeType> extends NativeLiveListPointer<C, int> {
  _NativeLiveListIntegerPointer(super.inner, [super.ptr]);
}

abstract class _NativeLiveListDoublePointer<C extends NativeType> extends NativeLiveListPointer<C, double> {
  _NativeLiveListDoublePointer(super.inner, [super.ptr]);
}

abstract class _NativeLiveListIntegerArray<C extends NativeType> extends NativeLiveListArray<C, int> {
  _NativeLiveListIntegerArray(super.inner, [super.ptr]);
}

abstract class _NativeLiveListDoubleArray<C extends NativeType> extends NativeLiveListArray<C, double> {
  _NativeLiveListDoubleArray(super.inner, [super.ptr]);
}

class NativeLiveListArrayFloat extends _NativeLiveListDoubleArray<Float> {
  NativeLiveListArrayFloat(super.inner, [super.ptr]);

  @override
  double _indexGetter(Array<Float> ptr, int index) => ptr[index];

  @override
  void _indexSetter(Array<Float> ptr, int index, double value) => ptr[index] = value;

  @override
  void _arraySetter(Array<Float> ptr, List<double> array)
    => ptr.elements.setAll(0, array);
}

class NativeLiveListPointerFloat extends _NativeLiveListDoublePointer<Float> {
  NativeLiveListPointerFloat(super.inner, [super.ptr]);

  @override
  double _indexGetter(Pointer<Float> ptr, int index) => ptr[index];

  @override
  void _indexSetter(Pointer<Float> ptr, int index, double value) => ptr[index] = value;

  @override
  void _arraySetter(Pointer<Float> ptr, List<double> array)
    => ptr.asTypedList(array.length).setAll(0, array);
}

class NativeLiveListArrayInt extends _NativeLiveListIntegerArray<Int> {
  NativeLiveListArrayInt(super.inner, [super.ptr]);

  @override
  int _indexGetter(Array<Int> ptr, int index) => ptr[index];

  @override
  void _indexSetter(Array<Int> ptr, int index, int value) => ptr[index] = value;

  @override
  void _arraySetter(Array<Int> ptr, List<int> array)
    => ptr.elements.setAll(0, array);
}

class NativeLiveListPointerInt extends _NativeLiveListIntegerPointer<Int> {
  NativeLiveListPointerInt(super.inner, [super.ptr]);

  @override
  int _indexGetter(Pointer<Int> ptr, int index) => ptr[index];

  @override
  void _indexSetter(Pointer<Int> ptr, int index, int value) => ptr[index] = value;

  @override
  void _arraySetter(Pointer<Int> ptr, List<int> array)
    => ptr.cast<Int32>().asTypedList(array.length).setAll(0, array);
}

class NativeLiveListArrayUnsignedInt extends _NativeLiveListIntegerArray<UnsignedInt> {
  NativeLiveListArrayUnsignedInt(super.inner, [super.ptr]);

  @override
  int _indexGetter(Array<UnsignedInt> ptr, int index) => ptr[index];

  @override
  void _indexSetter(Array<UnsignedInt> ptr, int index, int value) => ptr[index] = value;

  @override
  void _arraySetter(Array<UnsignedInt> ptr, List<int> array)
    => ptr.elements.setAll(0, array);
}

class NativeLiveListPointerUnsignedInt extends _NativeLiveListIntegerPointer<UnsignedInt> {
  NativeLiveListPointerUnsignedInt(super.inner, [super.ptr]);

  @override
  int _indexGetter(Pointer<UnsignedInt> ptr, int index) => ptr[index];

  @override
  void _indexSetter(Pointer<UnsignedInt> ptr, int index, int value) => ptr[index] = value;

  @override
  void _arraySetter(Pointer<UnsignedInt> ptr, List<int> array)
    => ptr.cast<Uint32>().asTypedList(array.length).setAll(0, array);
}

class NativeLiveListArrayUnsignedChar extends _NativeLiveListIntegerArray<UnsignedChar> {
  NativeLiveListArrayUnsignedChar(super.inner, [super.ptr]);

  @override
  int _indexGetter(Array<UnsignedChar> ptr, int index) => ptr[index];

  @override
  void _indexSetter(Array<UnsignedChar> ptr, int index, int value) => ptr[index] = value;

  @override
  void _arraySetter(Array<UnsignedChar> ptr, List<int> array)
    => ptr.elements.setAll(0, array);
}

class NativeLiveListPointerUnsignedChar extends _NativeLiveListIntegerPointer<UnsignedChar> {
  NativeLiveListPointerUnsignedChar(super.inner, [super.ptr]);

  @override
  int _indexGetter(Pointer<UnsignedChar> ptr, int index) => ptr[index];

  @override
  void _indexSetter(Pointer<UnsignedChar> ptr, int index, int value) => ptr[index] = value;

  @override
  void _arraySetter(Pointer<UnsignedChar> ptr, List<int> array)
    => ptr.cast<Uint8>().asTypedList(array.length).setAll(0, array);
}

class NativeLiveListArrayUnsignedShort extends _NativeLiveListIntegerArray<UnsignedShort> {
  NativeLiveListArrayUnsignedShort(super.inner, [super.ptr]);

  @override
  int _indexGetter(Array<UnsignedShort> ptr, int index) => ptr[index];

  @override
  void _indexSetter(Array<UnsignedShort> ptr, int index, int value) => ptr[index] = value;

  @override
  void _arraySetter(Array<UnsignedShort> ptr, List<int> array)
    => ptr.elements.setAll(0, array);
}

class NativeLiveListPointerUnsignedShort extends _NativeLiveListIntegerPointer<UnsignedShort> {
  NativeLiveListPointerUnsignedShort(super.inner, [super.ptr]);

  @override
  int _indexGetter(Pointer<UnsignedShort> ptr, int index) => ptr[index];

  @override
  void _indexSetter(Pointer<UnsignedShort> ptr, int index, int value) => ptr[index] = value;

  @override
  void _arraySetter(Pointer<UnsignedShort> ptr, List<int> array)
    => ptr.cast<Uint16>().asTypedList(array.length).setAll(0, array);
}
