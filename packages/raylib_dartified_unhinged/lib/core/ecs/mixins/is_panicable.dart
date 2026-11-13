part of '../../raylib_dartified_unhinged.dart';

/// Panic policy for handling exceptions.
enum PanicPolicy {
  /// Suppress the exception entirely and do nothing.
  swallow,

  /// Run standard panic handling.
  handle,

  /// Re-throw the exception so it bubbles up to the parent.
  rethrowError,
}

/// Adds a panic lifecycle hook to an ECS object.
mixin IsPanicable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Configures how this object reacts to unhandled exceptions by default.
  PanicPolicy get panicPolicy => .rethrowError;

  /// Hook key for [IsPanicable]'s [onBeforePanic] hooks.
  late final hookKey_onBeforePanic = ECSHookKey<HookResult Function(E self, Object error, StackTrace stack)>(
    '$IsPanicable', 'onBeforePanic'
  );

  /// Hook key for [IsPanicable]'s [onPanic] hooks.
  late final hookKey_onPanic = ECSHookKey<void Function(E self, Object error, StackTrace stack)>(
    '$IsPanicable', 'onPanic'
  );

  /// Hook key for [IsPanicable]'s [onAfterPanic] hooks.
  late final hookKey_onAfterPanic = ECSHookKey<void Function(E self, Object error, StackTrace stack)>(
    '$IsPanicable', 'onAfterPanic'
  );

  /// Registers [fn] as a before-panic listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforePanic(HookResult Function(E self, Object error, StackTrace stack) fn) {
    addHook(hookKey_onBeforePanic, fn);
    return self;
  }

  /// Registers [fn] to be called when this object is about to panic.
  /// 
  /// Called when the panic operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnPanic(void Function(E self, Object error, StackTrace stack) fn) {
    addHook(hookKey_onPanic, fn);
    return self;
  }

  /// Registers [fn] as an after-panic listener.
  ///
  /// Called only if the panic was not canceled.
  @nonVirtual
  E listenOnAfterPanic(void Function(E self, Object error, StackTrace stack) fn) {
    addHook(hookKey_onAfterPanic, fn);
    return self;
  }

  /// Runs all before-panic listeners and [onBeforePanic], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforePanic(Object error, StackTrace stack) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforePanic)) {
      result = _mergeHookResult(result, f(self, error, stack));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforePanic(error, stack));
  }

  /// Runs all panic listeners and [onPanic].
  @mustCallSuper
  void _doOnPanic(Object error, StackTrace stack) {
    hooksOf(hookKey_onPanic).forEach((f) => f(self, error, stack));
    onPanic(error, stack);
  }

  /// Runs all after-panic listeners and [onAfterPanic].
  @mustCallSuper
  void _doOnAfterPanic(Object error, StackTrace stack) {
    hooksOf(hookKey_onAfterPanic).forEach((f) => f(self, error, stack));
    onAfterPanic(error, stack);
  }

  /// Override to intercept the before-panic phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforePanic] listeners.
  HookResult onBeforePanic(Object error, StackTrace stack) => .proceed;

  /// Override to react when a panic is about to happen.
  ///
  /// Called by the host after all before-checks have passed.
  /// 
  /// Called after all registered [listenOnPanic] listeners.
  void onPanic(Object error, StackTrace stack) {}

  /// Override to react after a panic occured.
  ///
  /// Called after all registered [listenOnAfterPanic] listeners.
  void onAfterPanic(Object error, StackTrace stack) {}

  void _runSafely(void Function() action) {
    try {
      action();
    } catch (error, stack) {
      final result = _doOnBeforePanic(error, stack);
      if (result == .cancel) return;

      if (result == .proceed) {
        switch (panicPolicy) {
          case .swallow:
            // do nothing
            break;
          case .handle:
            _doOnPanic(error, stack);
            break;
          case .rethrowError:
            _doOnAfterPanic(error, stack);
            rethrow;
        }
      }

      if (result != .cancel) {
        _doOnAfterPanic(error, stack);
      }
    }
  }
}