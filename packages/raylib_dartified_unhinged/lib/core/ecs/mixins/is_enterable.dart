part of '../../raylib_dartified_unhinged.dart';

/// Adds an enter lifecycle hook to an ECS object.
/// 
/// - **before** => cancelable; any listener or override returning `false` aborts the operation
/// - **on** => the operation is about to complete; called by the host after all before-checks pass
/// - **after** => the operation has completed; side-effects and cleanup go here
mixin IsEnterable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Hook key for [IsEnterable]'s [onBeforeEnter] hooks.
  late final hookKey_onBeforeEnter = ECSHookKey<HookResult Function(E self)>(
    '$IsEnterable', 'onBeforeEnter'
  );

  /// Hook key for [IsEnterable]'s [onEnter] hooks.
  late final hookKey_onEnter = ECSHookKey<void Function(E self)>(
    '$IsEnterable', 'onEnter'
  );

  /// Hook key for [IsEnterable]'s [onAfterEnter] hooks.
  late final hookKey_onAfterEnter = ECSHookKey<void Function(E self)>(
    '$IsEnterable', 'onAfterEnter'
  );

  /// Registers [fn] as a before-enter listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeEnter(HookResult Function(E self) fn) {
    addHook(hookKey_onBeforeEnter, fn);
    return self;
  }

  /// Registers [fn] to be called when this object is entered.
  /// 
  /// Called when the enter operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnEnter(void Function(E self) fn) {
    addHook(hookKey_onEnter, fn);
    return self;
  }

  /// Registers [fn] as an after-enter listener.
  ///
  /// Called only if the enter was not canceled.
  @nonVirtual
  E listenOnAfterEnter(void Function(E self) fn) {
    addHook(hookKey_onAfterEnter, fn);
    return self;
  }

  /// Runs all before-enter listeners and [onBeforeEnter], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeEnter() {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeEnter)) {
      result = _mergeHookResult(result, f(self));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeEnter());
  }

  /// Runs all enter listeners and [onEnter].
  @mustCallSuper
  void _doOnEnter() {
    hooksOf(hookKey_onEnter).forEach((f) => f(self));
    onEnter();
  }

  /// Runs all after-enter listeners and [onAfterEnter].
  @mustCallSuper
  void _doOnAfterEnter() {
    hooksOf(hookKey_onAfterEnter).forEach((f) => f(self));
    onAfterEnter();
  }

  /// Override to intercept the before-enter phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeEnter] listeners.
  HookResult onBeforeEnter() => .proceed;

  /// Override to react when an enter is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  /// 
  /// Called after all registered [listenOnEnter] listeners.
  void onEnter() {}

  /// Override to react after an enter has completed.
  ///
  /// Called after all registered [listenOnAfterEnter] listeners.
  void onAfterEnter() {}
}