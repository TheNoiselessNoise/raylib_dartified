part of '../../raylib_dartified_unhinged.dart';

typedef IsAnyDisposable<T extends App<T>> = IsDisposable<T, ECSBase<T>>;

/// Adds dispose lifecycle hooks to an ECS object.
///
/// The **on** phase only, disposal is not cancelable.
mixin IsDisposable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Hook key for [IsDisposable]'s [onDispose] hooks.
  late final hookKey_onDispose = ECSHookKey<void Function(E self)>(
    '$IsDisposable', 'onDispose'
  );

  /// Registers [fn] to be called at the disposal of the owned ECS object.
  @nonVirtual
  E listenOnDispose(void Function(E self) fn) {
    addHook(hookKey_onDispose, fn);
    return self;
  }

  /// Notifies all dispose listeners and calls [onDispose].
  @mustCallSuper
  void _doOnDispose() {
    hooksOf(hookKey_onDispose).forEach((f) => f(self));
    onDispose();
  }

  /// Override to react at the disposal.
  ///
  /// Called after all registered [listenOnDispose] listeners.
  void onDispose() {}

  /// Disposes this [ECSBase] object.
  void dispose() => _doOnDispose();
}