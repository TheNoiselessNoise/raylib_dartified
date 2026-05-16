part of 'raylib.dart';

typedef RaylibLookup = Pointer<T> Function<T extends NativeType>(String symbolName);
typedef RaylibModuleConstructor<T> = T Function(Raylib);

abstract class RaylibModule with RaylibModuleBase {
  @override
  final Raylib rl;
  
  RaylibModule(this.rl);

  bool _isLoaded = false;
  void _doLoad() {
    if (_isLoaded) return;
    _isLoaded = true;
    load();
  }

  void load() {}

  Logger get logger => rl.logger;

  bool _debugEnabled = false;
  void debug(bool v) => _debugEnabled = v;

  bool _debugTime = false;
  void debugTime(bool v) => _debugTime = true;
  
  void logInfo(String message) => logger.info(message);
  void logWarn(String message) => logger.warning(message);

  final List<bool Function(String)> _debugFilters = [];
  void debugFilter(bool Function(String) filter) => _debugFilters.add(filter);
  bool _matchesFilters(String message) => _debugFilters.isEmpty || _debugFilters.any((f) => f(message));

  void debugInfo(String message) { if (_debugEnabled && _matchesFilters(message)) logInfo(message); }
  void debugWarn(String message) { if (_debugEnabled && _matchesFilters(message)) logWarn(message); }

  T disableSync<T>(T Function() f) {
    final oldSyncing = rl.Temp.doSync;
    rl.Temp.enableSyncing(false);
    final result = f();
    rl.Temp.enableSyncing(oldSyncing);
    return result;
  }

  T run<T>(String Function() name, T Function() f) {
    if (_debugEnabled) {
      final label = '[$runtimeType] ${name()}';
      if (_matchesFilters(label)) {
        if (_debugTime) return rl.timeIt(label, f);
        logInfo(label);
      }
    }
    return f();
  }

  final List<void Function()> _onDisposeFns = [];
  void onDispose(void Function() fn) => _onDisposeFns.add(fn);

  @override
  @mustCallSuper
  void dispose() {
    _onDisposeFns.forEach((f) => f());
    _onDisposeFns.clear();
  }
}

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
abstract class StructD<D extends StructD<D, C>, C extends Struct> {
  /// The C-owned or RaylibTemp-owned native pointer for this struct, if any.
  ///
  /// Set automatically by [toC] on first allocation.
  Pointer<C>? originalPointer;

  String _pointerTag = 'default';

  /// The slot tag used to disambiguate [RaylibTemp] keys for this instance.
  ///
  /// Defaults to `'default'`. Change via [setTag] when the same struct must
  /// occupy multiple slots in the same frame.
  String get tag => _pointerTag;

  /// Sets [tag] to [newTag] and returns `this` for chaining.
  @nonVirtual
  D setTag(String newTag) {
    _pointerTag = newTag;
    return this as D;
  }

  String? _allocKey;

  /// The [RaylibTemp] slot key used during the most recent [toC] allocation.
  String? get allocKey => _allocKey;

  static int _internalIdCounter = 0;
  int _internalId = -1;

  /// A stable numeric ID assigned on first [toC] call for pointer-owning structs.
  ///
  /// Incorporated into slot keys to prevent collisions between distinct instances
  /// of the same struct type sharing the same [tag].
  int get internalId => _internalId;

  StructD({
    this.originalPointer,
  });

  /// The Dart-side type name of this struct
  String get structName => runtimeType.toString();

  /// Builds a [RaylibTemp] slot key from [structName], [tag], and an optional
  /// [inner] suffix.
  @nonVirtual
  String _getBaseKey([String? inner]) => '${structName}_${tag}_$inner';

  /// Like [_getBaseKey] but prefixed with [internalId], used for
  /// pointer-owning structs to prevent cross-instance key collisions.
  @nonVirtual
  String _getBaseKeyWithId([String? inner]) => '${internalId}_${_getBaseKey(inner)}';

  /// Copies the fields of the native struct [o] into this instance.
  D setC(C o);

  /// Copies the fields of the Dart struct [o] into this instance.
  D setD(D o);

  /// Returns a human-readable description of this struct's current field values.
  String signature();

  /// Returns a deep copy of this instance, preserving [originalPointer].
  D clone();

  /// Returns a deep copy of this instance without [originalPointer].
  ///
  /// Useful when you need an independent value that should not accidentally
  /// sync back into raylib-owned memory.
  D copy() {
    final clone = this.clone();
    clone.originalPointer = null;
    return clone;
  }

  /// Whether this struct requires an [originalPointer] to function correctly.
  ///
  /// `true` for resource structs (shaders, models, etc.); `false` for
  /// value-type structs (subclasses of [StructDLiteral]).
  bool get _requiresOriginalPointer => true;

  /// Returns the [RTempStructAlloc] for this struct type from [temp].
  ///
  /// Implementations delegate to the matching allocator field on [temp],
  /// e.g. `temp.<Type>`. Use the returned allocator to reserve and populate
  /// native memory slots.
  RTempStructAlloc<C, D> nativeAllocator(RaylibTemp temp);

  /// Syncs Dart-side fields into the already-allocated native pointer [p].
  ///
  /// Called by [toC] when [originalPointer] is set. The default implementation
  /// delegates to [nativeWriteInto]; override only when sync and full allocation
  /// differ (e.g. to skip re-allocating nested pointers).
  void nativeSyncInto(RaylibTemp temp, Pointer<C> p, String key)
    => nativeWriteInto(nativeAllocator(temp).refFunc(p));

  /// Writes all fields into the native struct at [p], allocating nested pointers
  /// into [temp] under [key] as needed.
  ///
  /// Called after [allocatePointer] to populate the zeroed memory (or reuse). For structs
  /// with no nested pointers this is typically equivalent to `writeInto(p.ref)`.
  void nativeAllocateInto(RaylibTemp temp, Pointer<C> p, String key)
    => nativeWriteInto(nativeAllocator(temp).refFunc(p));
  
  /// Writes all fields directly into the native struct reference [p].
  /// For nested structs, use `writeInto` as well.
  void nativeWriteInto(C p);

  bool _isDisposed = false;

  /// Whether [nativeMarkDisposed] has been called on this instance.
  bool get isDisposed => _isDisposed;

  /// Marks this instance as disposed and clears [originalPointer].
  ///
  /// Called internally after the native resource is unloaded. Accessing
  /// [getOriginalPointer] after disposal will throw.
  @nonVirtual
  void nativeMarkDisposed() {
    _isDisposed = true;
    originalPointer = null;
  }

  /// Returns [originalPointer], throwing a descriptive [StateError] if unavailable or this instance [isDisposed].
  @nonVirtual
  Pointer<C> getOriginalPointer() {
    if (isDisposed) {
      throw StateError(
        '$structName.getOriginalPointer() was called on a disposed struct. '
        'The pointer is no longer valid and cannot be accessed.'
      );
    }

    if (originalPointer == null) {
      if (!_requiresOriginalPointer) {
        throw StateError(
          '$structName.getOriginalPointer() was called on a value-type struct that never owns a pointer. '
          'This struct is meant to be passed by value via writeInto(), not by reference. '
          'If you need a pointer, use toC() to allocate one into Temp instead.'
        );
      } else {
        throw StateError(
          '$structName.getOriginalPointer() was called but originalPointer is null. '
          'This struct requires a raylib-owned pointer (e.g. from LoadShader, LoadModel, etc.) '
          'but none has been assigned yet or was already Unloaded. Make sure this struct '
          'was obtained via a Load* function and not constructed manually.'
        );
      }
    }
    return originalPointer!;
  }

  /// Returns [originalPointer] and immediately calls [nativeMarkDisposed].
  ///
  /// The canonical way to hand the pointer back to C and `unload`.
  /// Gets the pointer, then ensures this instance can no longer be used.
  @nonVirtual
  Pointer<C> getOriginalPointerAndDispose() {
    final pointer = getOriginalPointer();
    nativeMarkDisposed();
    return pointer;
  }

  /// Emits a debug warning if `this` is **NOT** [StructDLiteral] and
  /// [originalPointer] is not set.
  ///
  /// Called by [toC] before attempting allocation to catch structs that were
  /// constructed manually rather than obtained from C.
  @nonVirtual
  void _warnIfNoOriginalPointer(RaylibTemp temp) {
    if (_requiresOriginalPointer && originalPointer == null) {
      temp.debugWarn(
        "[WARNING]: $structName.toC() called without it's originalPointer set! "
        "This can result in UNDEFINED BEHAVIOR!!!"
      );
    }
  }

  /// Calls [callback] with [originalPointer] if it is set, otherwise no-ops.
  @nonVirtual
  void nativeOnOriginalPointer(void Function(Pointer<C> p) callback) {
    if (originalPointer != null) callback(originalPointer!);
  }

  /// Returns a native pointer for this struct, allocating or syncing as needed.
  ///
  /// This is the primary entry point for passing a `StructD` to a C call.
  /// The behavior depends on the struct type and state:
  ///
  /// - **Value-type** ([StructDLiteral]): always allocates a
  ///   fresh slot (or reuse) in [temp] and writes into it via [nativeAllocateInto].
  /// - **Pointer-owning, with [originalPointer]**: syncs Dart fields back into
  ///   the existing native pointer via [nativeSyncInto] and returns it directly.
  ///   Skipped entirely if the instance [isDisposed] or `temp.doSync` is false.
  /// - **Pointer-owning, without [originalPointer]**: allocates a new slot,
  ///   populates it via [nativeAllocateInto], and stores the result as [originalPointer].
  ///
  /// [key] is incorporated into the slot key to allow the same instance to
  /// occupy distinct slots within the same frame (see [setTag]).
  @nonVirtual
  Pointer<C> toC(RaylibTemp temp, String key) {
    String baseKey = _getBaseKey(key);

    if (!_requiresOriginalPointer) {
      _allocKey = baseKey;
      final alloc = nativeAllocator(temp);
      final p = alloc.At(baseKey);
      nativeAllocateInto(temp, p, baseKey);
      nativeSyncInto(temp, p, baseKey);
      return p;
    }

    if (_internalId == -1) _internalId = ++_internalIdCounter;
    if (!isDisposed) _warnIfNoOriginalPointer(temp);

    baseKey = _getBaseKeyWithId(key);

    if (originalPointer != null) {
      temp.debugSyncInfo('[SYNC] $structName.syncInto($baseKey)');
      if (isDisposed) return originalPointer!;
      if (!temp.doSync) return originalPointer!;
      
      nativeSyncInto(temp, originalPointer!, baseKey);
      return originalPointer!;
    }

    temp.debugSyncInfo('[SYNC] $structName.allocate($baseKey)');
    _allocKey = baseKey;
    final alloc = nativeAllocator(temp);
    final p = alloc.At(baseKey);
    nativeAllocateInto(temp, p, baseKey);
    nativeSyncInto(temp, p, baseKey);
    originalPointer = p;
    return originalPointer!;
  }

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
/// Implementations of [nativeAllocateInto] should simply redirect to `writeInto(p.ref)`.
abstract class StructDLiteral<D extends StructD<D, C>, C extends Struct> extends StructD<D, C> {
  StructDLiteral({
    super.originalPointer,
  });

  @override
  bool get _requiresOriginalPointer => false;
}

/// A read-only [StructD] that wraps an existing native pointer without owning it.
///
/// Constructed directly from a `Pointer<C>` (e.g. when iterating over a native
/// array), a `StructDView` exposes the live native memory through [ref] but
/// refuses all write operations. Attempting to call [setC], [setD],
/// [nativeAllocator], [nativeAllocateInto], or [nativeWriteInto] throws [UnsupportedError].
///
/// [nativeSyncInto] is a deliberate no-op, views never push changes back into native
/// memory.
abstract class StructDView<D extends StructD<D, C>, C extends Struct> extends StructD<D, C> {
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
  String signature() => '$structName()';

  @override
  @nonVirtual
  D setC(C o) => throw UnsupportedError('$runtimeType: is just a view; cannot write to it.');

  @override
  @nonVirtual
  D setD(D o) => throw UnsupportedError('$runtimeType: is just a view; cannot write to it.');

  @override
  @nonVirtual
  nativeAllocator(RaylibTemp temp)
    => throw UnsupportedError('$runtimeType: is just a view; cannot allocate it externally.');

  @override
  @nonVirtual
  void nativeSyncInto(RaylibTemp temp, Pointer<C> p, String key) {} // NOTE: do nothing

  @override
  @nonVirtual
  void nativeAllocateInto(RaylibTemp temp, Pointer<C> p, String key)
    => throw UnsupportedError('$runtimeType: is just a view; cannot allocate externally.');

  @override
  @nonVirtual
  void nativeWriteInto(C p)
    => throw UnsupportedError('$runtimeType: is just a view; cannot write externally.');
}