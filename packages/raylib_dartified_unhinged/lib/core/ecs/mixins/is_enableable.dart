part of '../../raylib_dartified_unhinged.dart';

typedef IsAnyEnableable<T extends App<T>> = IsEnableable<T, ECSBase<T>>;

/// Adds active/disabled state and activation lifecycle hooks to an ECS object.
///
/// The **on** phase only, activation is not cancelable.
mixin IsEnableable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// State key for [IsEnableable]'s [_isEnabled].
  late final stateKey_isEnabled = ECSStateKey<bool>(
    '$IsEnableable', 'isEnabled',
    get: () => _isEnabled,
    set: (value) => _isEnabled = value,
  );

  @override
  @mustCallSuper
  void _registerBuiltinStateKeys() {
    super._registerBuiltinStateKeys();
    registerStateKey(stateKey_isEnabled);
  }

  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██   ░██         
  // ░██████████ ░██     ░██ ░██     ░██ ░███████     ░████████  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██           ░██ 
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   

  /// Hook key for [IsEnableable]'s [onEnable] hooks.
  late final hookKey_onEnable = ECSHookKey<void Function(E self)>(
    '$IsEnableable', 'onEnable'
  );

  /// Registers [fn] to be called whenever the active state changes.
  @nonVirtual
  E listenOnEnable(void Function(E self) fn) {
    addHook(hookKey_onEnable, fn);
    return self;
  }

  /// Notifies all listeners and calls [onEnable].
  @mustCallSuper
  void _doOnEnable() {
    hooksOf(hookKey_onEnable).forEach((f) => f(self));
    onEnable();
  }

  /// Override to react when the active state changes.
  ///
  /// Called after all registered [listenOnEnable] listeners.
  /// Check [isEnabled] or [isDisabled] to determine the new state.
  void onEnable() {}

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  bool _isEnabled = true;

  /// Whether this object is currently enabled.
  bool get isEnabled => _isEnabled;

  /// Whether this object is currently disabled.
  bool get isDisabled => !_isEnabled;

  /// Sets the enabled state to [enabled] and fires the hook.
  @mustCallSuper
  E setEnabled(bool enabled) {
    _isEnabled = enabled;
    _doOnEnable();
    return self;
  }

  /// Toggles the enabled state and fires the hook.
  @mustCallSuper
  E toggleEnabled() {
    _isEnabled = !_isEnabled;
    _doOnEnable();
    return self;
  }
}