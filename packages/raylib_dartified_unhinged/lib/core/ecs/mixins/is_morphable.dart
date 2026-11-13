part of '../../raylib_dartified_unhinged.dart';

/// Adds a morph lifecycle hook to an ECS object.
mixin IsMorphable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Hook key for [IsMorphable]'s [onBeforeMorph] hooks.
  late final hookKey_onBeforeMorph = ECSHookKey<HookResult Function(E self, Object data)>(
    '$IsMorphable', 'onBeforeMorph'
  );

  /// Hook key for [IsMorphable]'s [onMorph] hooks.
  late final hookKey_onMorph = ECSHookKey<void Function(E self, Object data)>(
    '$IsMorphable', 'onMorph'
  );

  /// Hook key for [IsMorphable]'s [onAfterMorph] hooks.
  late final hookKey_onAfterMorph = ECSHookKey<void Function(E self, Object data)>(
    '$IsMorphable', 'onAfterMorph'
  );

  /// Registers [fn] as a before-morph listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeMorph(HookResult Function(E self, Object data) fn) {
    addHook(hookKey_onBeforeMorph, fn);
    return self;
  }

  /// Registers [fn] to be called when this object is about to morph.
  /// 
  /// Called when the morph operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnMorph(void Function(E self, Object data) fn) {
    addHook(hookKey_onMorph, fn);
    return self;
  }

  /// Registers [fn] as an after-morph listener.
  ///
  /// Called only if the morph was not canceled.
  @nonVirtual
  E listenOnAfterMorph(void Function(E self, Object data) fn) {
    addHook(hookKey_onAfterMorph, fn);
    return self;
  }

  /// Runs all before-morph listeners and [onBeforeMorph], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeMorph(Object data) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeMorph)) {
      result = _mergeHookResult(result, f(self, data));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeMorph(data));
  }

  /// Runs all morph listeners and [onMorph].
  @mustCallSuper
  void _doOnMorph(Object data) {
    hooksOf(hookKey_onMorph).forEach((f) => f(self, data));
    onMorph(data);
  }

  /// Runs all after-morph listeners and [onAfterMorph].
  @mustCallSuper
  void _doOnAfterMorph(Object data) {
    hooksOf(hookKey_onAfterMorph).forEach((f) => f(self, data));
    onAfterMorph(data);
  }

  /// Override to intercept the before-morph phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeMorph] listeners.
  HookResult onBeforeMorph(Object data) => .proceed;

  /// Override to react when a morph is about to happen.
  ///
  /// Called by the host after all before-checks have passed.
  /// 
  /// Called after all registered [listenOnMorph] listeners.
  void onMorph(Object data) {}

  /// Override to react after a morph occured.
  ///
  /// Called after all registered [listenOnAfterMorph] listeners.
  void onAfterMorph(Object data) {}

  bool morphWith(Object data) {
    final result = _doOnBeforeMorph(data);
    if (result == .cancel) return false;
    if (result == .proceed) _doOnMorph(data);
    _doOnAfterMorph(data);
    return true;
  }
}