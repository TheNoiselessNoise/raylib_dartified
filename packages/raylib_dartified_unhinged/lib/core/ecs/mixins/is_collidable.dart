part of '../../raylib_dartified_unhinged.dart';

/// Adds collision lifecycle hooks to an ECS object, from the object's own perspective.
///
/// Complements [CCollider]
/// (which hooks from the *host* side) by giving the object being collided its own three-phase contract:
/// - **before** => cancelable; any listener or override returning `false` aborts the operation
/// - **on** => the operation is about to complete; called by the host after all before-checks pass
/// - **after** => the operation has completed; side-effects and cleanup go here
mixin IsCollidable<
  T extends App<T>,
  E extends ECSBase<T>,
  C extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Hook key for [IsCollidable]'s [onBeforeCollision] hooks.
  late final hookKey_onBeforeCollision = ECSHookKey<HookResult Function(E self, C other)>(
    '$IsCollidable', 'onBeforeCollision'
  );

  /// Hook key for [IsCollidable]'s [onCollision] hooks.
  late final hookKey_onCollision = ECSHookKey<void Function(E self, C other)>(
    '$IsCollidable', 'onCollision'
  );

  /// Hook key for [IsCollidable]'s [onAfterCollision] hooks.
  late final hookKey_onAfterCollision = ECSHookKey<void Function(E self, C other)>(
    '$IsCollidable', 'onAfterCollision'
  );

  /// Registers [fn] as a before-collision listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeCollision(HookResult Function(E self, C other) fn) {
    addHook(hookKey_onBeforeCollision, fn);
    return self;
  }

  /// Registers [fn] as a collision listener.
  ///
  /// Called when the collision operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnCollision(void Function(E self, C other) fn) {
    addHook(hookKey_onCollision, fn);
    return self;
  }

  /// Registers [fn] as an after-collision listener.
  ///
  /// Called only if the collision was not canceled.
  @nonVirtual
  E listenOnAfterCollision(void Function(E self, C other) fn) {
    addHook(hookKey_onAfterCollision, fn);
    return self;
  }

  /// Runs all before-collision listeners and [onBeforeCollision], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeCollision(C other) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeCollision)) {
      result = _mergeHookResult(result, f(self, other));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeCollision(other));
  }

  /// Runs all collision listeners and [onCollision].
  @mustCallSuper
  void _doOnCollision(C other) {
    hooksOf(hookKey_onCollision).forEach((f) => f(self, other));
    onCollision(other);
  }

  /// Runs all after-collision listeners and [onAfterCollision].
  @mustCallSuper
  void _doOnAfterCollision(C other) {
    hooksOf(hookKey_onAfterCollision).forEach((f) => f(self, other));
    onAfterCollision(other);
  }

  /// Override to intercept the before-collision phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeCollision] listeners.
  HookResult onBeforeCollision(C other) => .proceed;

  /// Override to react when the collision is about to complete.
  ///
  /// Called after all registered [listenOnCollision] listeners.
  void onCollision(C other) {}

  /// Override to react after the collision has completed.
  ///
  /// Called after all registered [listenOnAfterCollision] listeners.
  void onAfterCollision(C other) {}
}