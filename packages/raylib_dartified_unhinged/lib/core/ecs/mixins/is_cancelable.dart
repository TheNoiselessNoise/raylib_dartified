part of '../../raylib_dartified_unhinged.dart';

/// Adds cancelation lifecycle hooks to an ECS object, from the object's own perspective.
///
/// Cancelation is a one-way transition: once canceled, the object stays canceled.
/// The [cancel] method drives the full lifecycle: guards, listeners, and state change.
mixin IsCancelable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// State key for [IsCancelable]'s [_isCanceled].
  late final stateKey_isCanceled = ECSStateKey<bool>(
    '$IsCancelable', 'isCanceled',
    get: () => _isCanceled,
    set: (value) => _isCanceled = value,
  );

  @override
  @mustCallSuper
  void _registerBuiltinStateKeys() {
    super._registerBuiltinStateKeys();
    registerStateKey(stateKey_isCanceled);
  }

  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██   ░██         
  // ░██████████ ░██     ░██ ░██     ░██ ░███████     ░████████  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██           ░██ 
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   

  /// Hook key for [IsCancelable]'s [onBeforeCancel] hooks.
  late final hookKey_onBeforeCancel = ECSHookKey<HookResult Function(E self)>(
    '$IsCancelable', 'onBeforeCancel'
  );

  /// Hook key for [IsCancelable]'s [onCancel] hooks.
  late final hookKey_onCancel = ECSHookKey<void Function(E self)>(
    '$IsCancelable', 'onCancel'
  );

  /// Hook key for [IsCancelable]'s [onAfterCancel] hooks.
  late final hookKey_onAfterCancel = ECSHookKey<void Function(E self)>(
    '$IsCancelable', 'onAfterCancel'
  );

  /// Registers [fn] as a before-cancel listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeCancel(HookResult Function(E self) fn) {
    addHook(hookKey_onBeforeCancel, fn);
    return self;
  }

  /// Registers [fn] as a cancel listener.
  ///
  /// Called when the cancel operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnCancel(void Function(E self) fn) {
    addHook(hookKey_onCancel, fn);
    return self;
  }

  /// Registers [fn] as an after-cancel listener.
  ///
  /// Called only if the cancel was not canceled.
  @nonVirtual
  E listenOnAfterCancel(void Function(E self) fn) {
    addHook(hookKey_onAfterCancel, fn);
    return self;
  }

  /// Runs all before-cancel listeners and [onBeforeCancel], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeCancel() {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeCancel)) {
      result = _mergeHookResult(result, f(self));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeCancel());
  }

  /// Runs all cancel listeners and [onCancel].
  @mustCallSuper
  void _doOnCancel() {
    hooksOf(hookKey_onCancel).forEach((f) => f(self));
    onCancel();
  }

  /// Runs all after-cancel listeners and [onAfterCancel].
  @mustCallSuper
  void _doOnAfterCancel() {
    hooksOf(hookKey_onAfterCancel).forEach((f) => f(self));
    onAfterCancel();
  }

  /// Override to intercept the before-cancel phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeCancel] listeners.
  HookResult onBeforeCancel() => .proceed;

  /// Override to react when the cancel is about to complete.
  ///
  /// Called after all registered [listenOnCancel] listeners.
  void onCancel() {}

  /// Override to react after the cancel has completed.
  ///
  /// Called after all registered [listenOnAfterCancel] listeners.
  void onAfterCancel() {}

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  bool _isCanceled = false;

  /// Whether this object has been canceled.
  bool get isCanceled => _isCanceled;

  /// Attempts to cancel this object.
  ///
  /// Returns `true` if cancelation succeeded, `false` if it was already
  /// canceled or any `before` hooks listeners vetoed it.
  bool cancel() {
    if (_isCanceled) return false;
    HookResult result = _doOnBeforeCancel();
    if (result == .cancel) return false;
    if (result == .proceed) _doOnCancel();
    _isCanceled = true;
    _doOnAfterCancel();
    return true;
  }
}