part of '../../raylib_dartified_unhinged.dart';

/// Adds add lifecycle hooks to an ECS object, from the object's own perspective.
///
/// Complements [IsAppSystemManagable], [IsSceneSystemManagable], [IsSceneManagable], [IsEntityManagable], [IsComponentManagable]
/// (which hooks from the *host* side) by giving the object being added its own three-phase contract:
/// - **before** => cancelable; any listener or override returning `false` aborts the operation
/// - **on** => the operation is about to complete; called by the host after all before-checks pass
/// - **after** => the operation has completed; side-effects and cleanup go here
mixin IsAddable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Hook key for [IsAddable]'s [onBeforeAdd] hooks.
  late final hookKey_onBeforeAdd = ECSHookKey<HookResult Function(E self, ECSBase<T> parent)>(
    '$IsAddable', 'onBeforeAdd'
  );

  /// Hook key for [IsAddable]'s [onAdd] hooks.
  late final hookKey_onAdd = ECSHookKey<void Function(E self, ECSBase<T> parent)>(
    '$IsAddable', 'onAdd'
  );

  /// Hook key for [IsAddable]'s [onAfterAdd] hooks.
  late final hookKey_onAfterAdd = ECSHookKey<void Function(E self, ECSBase<T> parent)>(
    '$IsAddable', 'onAfterAdd'
  );

  bool _isAdded = false;
  
  /// Whether this object has been added to a host.
  bool get isAdded => _isAdded;

  /// Registers [fn] as a before-add listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeAdd(HookResult Function(E self, ECSBase<T> parent) fn) {
    addHook(hookKey_onBeforeAdd, fn);
    return self;
  }

  /// Registers [fn] as an add listener.
  ///
  /// Called when the add operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnAdd(void Function(E self, ECSBase<T> parent) fn) {
    addHook(hookKey_onAdd, fn);
    return self;
  }

  /// Registers [fn] as an after-add listener.
  ///
  /// Called only if the add was not canceled.
  @nonVirtual
  E listenOnAfterAdd(void Function(E self, ECSBase<T> parent) fn) {
    addHook(hookKey_onAfterAdd, fn);
    return self;
  }

  /// Runs all before-add listeners and [onBeforeAdd], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeAdd(ECSBase<T> parent) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeAdd)) {
      result = _mergeHookResult(result, f(self, parent));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeAdd(parent));
  }

  /// Runs all add listeners and [onAdd].
  @mustCallSuper
  void _doOnAdd(ECSBase<T> parent) {
    hooksOf(hookKey_onAdd).forEach((f) => f(self, parent));
    onAdd(parent);
  }

  /// Runs all after-add listeners and [onAfterAdd].
  @mustCallSuper
  void _doOnAfterAdd(ECSBase<T> parent) {
    hooksOf(hookKey_onAfterAdd).forEach((f) => f(self, parent));
    onAfterAdd(parent);
  }

  /// Override to intercept the before-add phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeAdd] listeners.
  HookResult onBeforeAdd(ECSBase<T> parent) => .proceed;

  /// Override to react when the add is about to complete.
  ///
  /// Called after all registered [listenOnAdd] listeners.
  void onAdd(ECSBase<T> parent) {}

  /// Override to react after the add has completed.
  ///
  /// Called after all registered [listenOnAfterAdd] listeners.
  void onAfterAdd(ECSBase<T> parent) {}

  /// Commits the add: sets [isAdded], assigns [parent], and notifies listeners.
  ///
  /// No-op if already added.
  @mustCallSuper
  void _doAdd(ECSBase<T> parent) {
    if (isAdded) return;
    this.parent ??= parent;
    _isAdded = true;
    if (this case IsRemovable removable) removable._isRemoved = false;
    _doOnAdd(parent);
  }
}