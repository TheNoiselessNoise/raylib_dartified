part of '../../raylib_dartified_unhinged.dart';

/// Adds scene transition lifecycle hooks to an ECS object.
///
/// Covers three transition events: enter, leave, and the full transition arc (from > to), each with a full three-phase contract:
/// - **before** => cancelable; any listener or override returning `false` aborts the operation
/// - **on** => the operation is about to complete; called by the host (e.g. [App]) after all before-checks pass
/// - **after** => the operation has completed; side-effects and cleanup go here
mixin IsSceneTransitionable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Hook key for [IsSceneTransitionable]'s [onBeforeSceneEnter] hooks.
  late final hookKey_onBeforeSceneEnter = ECSHookKey<HookResult Function(E self, Scene<T> scene)>(
    '$IsSceneTransitionable', 'onBeforeSceneEnter'
  );

  /// Hook key for [IsSceneTransitionable]'s [onSceneEnter] hooks.
  late final hookKey_onSceneEnter = ECSHookKey<void Function(E self, Scene<T> scene)>(
    '$IsSceneTransitionable', 'onSceneEnter'
  );

  /// Hook key for [IsSceneTransitionable]'s [onAfterSceneEnter] hooks.
  late final hookKey_onAfterSceneEnter = ECSHookKey<void Function(E self, Scene<T> scene)>(
    '$IsSceneTransitionable', 'onAfterSceneEnter'
  );

  /// Hook key for [IsSceneTransitionable]'s [onBeforeSceneLeave] hooks.
  late final hookKey_onBeforeSceneLeave = ECSHookKey<HookResult Function(E self, Scene<T> scene)>(
    '$IsSceneTransitionable', 'onBeforeSceneLeave'
  );

  /// Hook key for [IsSceneTransitionable]'s [onSceneLeave] hooks.
  late final hookKey_onSceneLeave = ECSHookKey<void Function(E self, Scene<T> scene)>(
    '$IsSceneTransitionable', 'onSceneLeave'
  );

  /// Hook key for [IsSceneTransitionable]'s [onAfterSceneLeave] hooks.
  late final hookKey_onAfterSceneLeave = ECSHookKey<void Function(E self, Scene<T> scene)>(
    '$IsSceneTransitionable', 'onAfterSceneLeave'
  );

  /// Hook key for [IsSceneTransitionable]'s [onBeforeSceneTransition] hooks.
  late final hookKey_onBeforeSceneTransition = ECSHookKey<HookResult Function(E self, Scene<T> from, Scene<T> to)>(
    '$IsSceneTransitionable', 'onBeforeSceneTransition'
  );

  /// Hook key for [IsSceneTransitionable]'s [onSceneTransition] hooks.
  late final hookKey_onSceneTransition = ECSHookKey<void Function(E self, Scene<T> from, Scene<T> to)>(
    '$IsSceneTransitionable', 'onSceneTransition'
  );

  /// Hook key for [IsSceneTransitionable]'s [onAfterSceneTransition] hooks.
  late final hookKey_onAfterSceneTransition = ECSHookKey<void Function(E self, Scene<T> from, Scene<T> to)>(
    '$IsSceneTransitionable', 'onAfterSceneTransition'
  );

  /// Registers [fn] as a before-scene-enter listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeSceneEnter(HookResult Function(E self, Scene<T> scene) fn) {
    addHook(hookKey_onBeforeSceneEnter, fn);
    return self;
  }

  /// Registers [fn] as an enter listener.
  ///
  /// Called when the enter operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnSceneEnter(void Function(E self, Scene<T> scene) fn) {
    addHook(hookKey_onSceneEnter, fn);
    return self;
  }

  /// Registers [fn] as an after-enter listener.
  ///
  /// Called only if the scene enter was not canceled.
  @nonVirtual
  E listenOnAfterSceneEnter(void Function(E self, Scene<T> scene) fn) {
    addHook(hookKey_onAfterSceneEnter, fn);
    return self;
  }

  /// Registers [fn] as a before-scene-leave listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeSceneLeave(HookResult Function(E self, Scene<T> scene) fn) {
    addHook(hookKey_onBeforeSceneLeave, fn);
    return self;
  }

  /// Registers [fn] as a leave listener.
  ///
  /// Called when the leave operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnSceneLeave(void Function(E self, Scene<T> scene) fn) {
    addHook(hookKey_onSceneLeave, fn);
    return self;
  }

  /// Registers [fn] as an after-leave listener.
  ///
  /// Called only if the scene leave was not canceled.
  @nonVirtual
  E listenOnAfterSceneLeave(void Function(E self, Scene<T> scene) fn) {
    addHook(hookKey_onAfterSceneLeave, fn);
    return self;
  }

  /// Registers [fn] as a before-scene-transition listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeSceneTransition(HookResult Function(E self, Scene<T> from, Scene<T> to) fn) {
    addHook(hookKey_onBeforeSceneTransition, fn);
    return self;
  }

  /// Registers [fn] as a transition listener.
  ///
  /// Called when the transition operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnSceneTransition(void Function(E self, Scene<T> from, Scene<T> to) fn) {
    addHook(hookKey_onSceneTransition, fn);
    return self;
  }

  /// Registers [fn] as an after-transition listener.
  ///
  /// Called only if the scene transition was not canceled.
  @nonVirtual
  E listenOnAfterSceneTransition(void Function(E self, Scene<T> from, Scene<T> to) fn) {
    addHook(hookKey_onAfterSceneTransition, fn);
    return self;
  }

  /// Runs all before-scene-enter listeners and [onBeforeSceneEnter], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeSceneEnter(Scene<T> scene) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeSceneEnter)) {
      result = _mergeHookResult(result, f(self, scene));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeSceneEnter(scene));
  }

  /// Runs all enter listeners and [onSceneEnter].
  @mustCallSuper
  void _doOnSceneEnter(Scene<T> scene) {
    hooksOf(hookKey_onSceneEnter).forEach((f) => f(self, scene));
    onSceneEnter(scene);
  }

  /// Runs all after-enter listeners and [onAfterSceneEnter].
  @mustCallSuper
  void _doOnAfterSceneEnter(Scene<T> scene) {
    hooksOf(hookKey_onAfterSceneEnter).forEach((f) => f(self, scene));
    onAfterSceneEnter(scene);
  }

  /// Runs all before-scene-leave listeners and [onBeforeSceneLeave], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeSceneLeave(Scene<T> scene) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeSceneLeave)) {
      result = _mergeHookResult(result, f(self, scene));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeSceneLeave(scene));
  }

  /// Runs all leave listeners and [onSceneLeave].
  @mustCallSuper
  void _doOnSceneLeave(Scene<T> scene) {
    hooksOf(hookKey_onSceneLeave).forEach((f) => f(self, scene));
    onSceneLeave(scene);
  }

  /// Runs all after-leave listeners and [onAfterSceneLeave].
  @mustCallSuper
  void _doOnAfterSceneLeave(Scene<T> scene) {
    hooksOf(hookKey_onAfterSceneLeave).forEach((f) => f(self, scene));
    onAfterSceneLeave(scene);
  }

  /// Runs all before-scene-transition listeners and [onBeforeSceneTransition], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeSceneTransition(Scene<T> from, Scene<T> to) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeSceneTransition)) {
      result = _mergeHookResult(result, f(self, from, to));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeSceneTransition(from, to));
  }

  /// Runs all transition listeners and [onSceneTransition].
  @mustCallSuper
  void _doOnSceneTransition(Scene<T> from, Scene<T> to) {
    hooksOf(hookKey_onSceneTransition).forEach((f) => f(self, from, to));
    onSceneTransition(from, to);
  }

  /// Runs all after-transition listeners and [onAfterSceneTransition].
  @mustCallSuper
  void _doOnAfterSceneTransition(Scene<T> from, Scene<T> to) {
    hooksOf(hookKey_onAfterSceneTransition).forEach((f) => f(self, from, to));
    onAfterSceneTransition(from, to);
  }

  /// Override to intercept the before-scene-enter phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeSceneEnter] listeners.
  HookResult onBeforeSceneEnter(Scene<T> scene) => .proceed;

  /// Override to react when a scene enter is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  void onSceneEnter(Scene<T> scene) {}

  /// Override to react after a scene enter has completed.
  ///
  /// Called after all registered [listenOnAfterSceneEnter] listeners.
  void onAfterSceneEnter(Scene<T> scene) {}

  /// Override to intercept the before-scene-leave phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeSceneLeave] listeners.
  HookResult onBeforeSceneLeave(Scene<T> scene) => .proceed;

  /// Override to react when a scene leave is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  void onSceneLeave(Scene<T> scene) {}

  /// Override to react after a scene leave has completed.
  ///
  /// Called after all registered [listenOnAfterSceneLeave] listeners.
  void onAfterSceneLeave(Scene<T> scene) {}

  /// Override to intercept the before-scene-transition phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeSceneTransition] listeners.
  HookResult onBeforeSceneTransition(Scene<T> from, Scene<T> to) => .proceed;

  /// Override to react when a scene transition is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  void onSceneTransition(Scene<T> from, Scene<T> to) {}

  /// Override to react after a scene transition has completed.
  ///
  /// Called after all registered [listenOnAfterSceneTransition] listeners.
  void onAfterSceneTransition(Scene<T> from, Scene<T> to) {}
}