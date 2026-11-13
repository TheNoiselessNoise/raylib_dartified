part of '../../raylib_dartified_unhinged.dart';

/// Adds removal lifecycle hooks to an ECS object.
///
/// Provides a three-phase removal contract:
/// - **before** => cancelable; any listener or override returning `false` aborts removal
/// - **on** => the operation is about to complete; listeners are notified before the act completes
/// - **after** => the operation has completed; side-effects and cleanup go here
mixin IsRemovable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Hook key for [IsRemovable]'s [onBeforeRemove] hooks.
  late final hookKey_onBeforeRemove = ECSHookKey<HookResult Function(E self)>(
    '$IsRemovable', 'onBeforeRemove'
  );

  /// Hook key for [IsRemovable]'s [onRemove] hooks.
  late final hookKey_onRemove = ECSHookKey<void Function(E self)>(
    '$IsRemovable', 'onRemove'
  );

  /// Hook key for [IsRemovable]'s [onAfterRemove] hooks.
  late final hookKey_onAfterRemove = ECSHookKey<void Function(E self)>(
    '$IsRemovable', 'onAfterRemove'
  );

  bool _isRemoved = false;

  /// Whether this object has been removed.
  bool get isRemoved => _isRemoved;

  /// Registers [fn] as a before-remove listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeRemove(HookResult Function(E self) fn) {
    addHook(hookKey_onBeforeRemove, fn);
    return self;
  }

  /// Registers [fn] as a remove listener.
  ///
  /// Called when the remove operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnRemove(void Function(E self) fn) {
    addHook(hookKey_onRemove, fn);
    return self;
  }

  /// Registers [fn] as an after-remove listener.
  ///
  /// Called only if removal was not canceled.
  @nonVirtual
  E listenOnAfterRemove(void Function(E self) fn) {
    addHook(hookKey_onAfterRemove, fn);
    return self;
  }

  /// Runs all before-remove listeners and [onBeforeRemove], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeRemove() {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeRemove)) {
      result = _mergeHookResult(result, f(self));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeRemove());
  }

  /// Runs all remove listeners and [onRemove].
  @mustCallSuper
  void _doOnRemove() {
    try {
      hooksOf(hookKey_onRemove).forEach((f) => f(self));
      onRemove();
    } finally {
      if (this case IsDisposable disposable) {
        disposable._doOnDispose();
      }
    }
  }

  /// Runs all after-remove listeners and [onAfterRemove].
  @mustCallSuper
  void _doOnAfterRemove() {
    hooksOf(hookKey_onAfterRemove).forEach((f) => f(self));
    onAfterRemove();
  }

  /// Notifies listeners and calls [onRemove] immediately before removal completes.
  ///
  /// Sets [isRemoved] and is a no-op if already removed.
  @mustCallSuper
  void _doRemove() {
    if (isRemoved) return;
    _isRemoved = true;
    if (this case IsAddable addable) addable._isAdded = false;
    _doOnRemove();
  }

  /// Override to intercept the before-remove phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeRemove] listeners.
  HookResult onBeforeRemove() => .proceed;

  /// Override to react after removal has completed.
  ///
  /// Called after all registered [listenOnAfterRemove] listeners.
  void onAfterRemove() {}

  /// Override to react when removal is about to complete.
  ///
  /// Called after all registered [listenOnRemove] listeners.
  void onRemove() {}
}