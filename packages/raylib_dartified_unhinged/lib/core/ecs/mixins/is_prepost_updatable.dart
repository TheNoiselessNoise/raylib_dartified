part of '../../raylib_dartified_unhinged.dart';

/// Adds pre-update and post-update lifecycle hooks to an ECS object.
mixin IsPrePostUpdatable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Hook key for [IsPrePostUpdatable]'s [onPreUpdate] hooks.
  late final hookKey_onPreUpdate = ECSHookKey<HookResult Function(E self, double dt)>(
    '$IsPrePostUpdatable', 'onPreUpdate'
  );

  /// Hook key for [IsPrePostUpdatable]'s [onPostUpdate] hooks.
  late final hookKey_onPostUpdate = ECSHookKey<void Function(E self, double dt)>(
    '$IsPrePostUpdatable', 'onPostUpdate'
  );

  /// Registers [fn] as a pre-update listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  /// Registers [fn] to be called before the update phase each frame.
  @nonVirtual
  E listenOnPreUpdate(HookResult Function(E self, double dt) fn) {
    addHook(hookKey_onPreUpdate, fn);
    return self;
  }

  /// Registers [fn] to be called after the update phase each frame.
  @nonVirtual
  E listenOnPostUpdate(void Function(E self, double dt) fn) {
    addHook(hookKey_onPostUpdate, fn);
    return self;
  }

  /// Runs all pre-update listeners and [onPreUpdate], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnPreUpdate(double dt) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onPreUpdate)) {
      result = _mergeHookResult(result, f(self, dt));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onPreUpdate(dt));
  }

  /// Notifies all post-update listeners and calls [onPostUpdate].
  @mustCallSuper
  void _doOnPostUpdate(double dt) {
    hooksOf(hookKey_onPostUpdate).forEach((f) => f(self, dt));
    onPostUpdate(dt);
  }

  /// Override to intercept the pre-update phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnPreUpdate] listeners.
  HookResult onPreUpdate(double dt) => .proceed;

  /// Override to react after the update phase each frame.
  ///
  /// Called after all registered [listenOnPostUpdate] listeners.
  void onPostUpdate(double dt) {}
}