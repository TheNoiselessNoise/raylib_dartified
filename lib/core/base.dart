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
abstract class StructD<C extends Struct, D extends StructD<C, D>> extends RaylibStructBase<RaylibTemp, Pointer<C>, D> {
  StructD({
    super.originalPointer,
  });

  /// Copies the fields of the native struct [o] into this instance.
  D setC(C o);

  RTempStructAlloc<C, D> nativeAllocator(RaylibTemp temp);

  /// Syncs Dart-side fields into the already-allocated native pointer [p].
  ///
  /// Called by [toC] when [originalPointer] is set. The default implementation
  /// delegates to [nativeWriteInto]; override only when sync and full allocation
  /// differ (e.g. to skip re-allocating nested pointers).
  @override
  void structSyncInto(RaylibTemp temp, Pointer<C> p, String key)
    => nativeWriteInto(nativeAllocator(temp).refFunc(p));

  /// Writes all fields into the native struct at [p], allocating nested pointers
  /// into [temp] under [key] as needed.
  ///
  /// Called after [allocatePointer] to populate the zeroed memory (or reuse). For structs
  /// with no nested pointers this is typically equivalent to `writeInto(p.ref)`.
  @override
  void structAllocateInto(RaylibTemp temp, Pointer<C> p, String key)
    => nativeWriteInto(nativeAllocator(temp).refFunc(p));
  
  /// Writes all fields directly into the native struct reference [p].
  /// For nested structs, use `writeInto` as well.
  void nativeWriteInto(C p);

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