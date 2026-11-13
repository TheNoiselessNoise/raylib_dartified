part of '../../raylib_dartified_unhinged.dart';

/// Adds a leave lifecycle hook to an ECS object.
///
/// - **before** => cancelable; any listener or override returning `false` aborts the operation
/// - **on** => the operation is about to complete; called by the host after all before-checks pass
/// - **after** => the operation has completed; side-effects and cleanup go here
mixin IsLeavable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Hook key for [IsLeavable]'s [onBeforeLeave] hooks.
  late final hookKey_onBeforeLeave = ECSHookKey<HookResult Function(E self)>(
    '$IsLeavable', 'onBeforeLeave'
  );

  /// Hook key for [IsLeavable]'s [onLeave] hooks.
  late final hookKey_onLeave = ECSHookKey<void Function(E self)>(
    '$IsLeavable', 'onLeave'
  );

  /// Hook key for [IsLeavable]'s [onAfterLeave] hooks.
  late final hookKey_onAfterLeave = ECSHookKey<void Function(E self)>(
    '$IsLeavable', 'onAfterLeave'
  );

  /// Registers [fn] as a before-leave listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeLeave(HookResult Function(E self) fn) {
    addHook(hookKey_onBeforeLeave, fn);
    return self;
  }

  /// Registers [fn] to be called when this object is left.
  /// 
  /// Called when the leave operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnLeave(void Function(E self) fn) {
    addHook(hookKey_onLeave, fn);
    return self;
  }

  /// Registers [fn] as an after-leave listener.
  ///
  /// Called only if the leave was not canceled.
  @nonVirtual
  E listenOnAfterLeave(void Function(E self) fn) {
    addHook(hookKey_onAfterLeave, fn);
    return self;
  }

  /// Runs all before-leave listeners and [onBeforeLeave], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeLeave() {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeLeave)) {
      result = _mergeHookResult(result, f(self));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeLeave());
  }

  /// Runs all leave listeners and [onLeave].
  @mustCallSuper
  void _doOnLeave() {
    hooksOf(hookKey_onLeave).forEach((f) => f(self));
    onLeave();
  }

  /// Runs all after-leave listeners and [onAfterLeave].
  @mustCallSuper
  void _doOnAfterLeave() {
    hooksOf(hookKey_onAfterLeave).forEach((f) => f(self));
    onAfterLeave();
  }

  /// Override to intercept the before-leave phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeLeave] listeners.
  HookResult onBeforeLeave() => .proceed;

  /// Override to react when an leave is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  /// 
  /// Called after all registered [listenOnLeave] listeners.
  void onLeave() {}

  /// Override to react after an leave has completed.
  ///
  /// Called after all registered [listenOnAfterLeave] listeners.
  void onAfterLeave() {}
}