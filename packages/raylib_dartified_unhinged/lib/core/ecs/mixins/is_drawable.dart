part of '../../raylib_dartified_unhinged.dart';

/// Adds a draw lifecycle hook to an ECS object.
///
/// The **on** phase only, drawing is not cancelable.
mixin IsDrawable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Hook key for [IsDrawable]'s [onDraw] hooks.
  late final hookKey_onDraw = ECSHookKey<void Function(E self, double dt)>(
    '$IsDrawable', 'onDraw'
  );

  /// Registers [fn] to be called during the draw phase each frame.
  @nonVirtual
  E listenOnDraw(void Function(E self, double dt) fn) {
    addHook(hookKey_onDraw, fn);
    return self;
  }

  /// Propagates the draw phase through listeners and the [onDraw] hook.
  @mustCallSuper
  void _doDraw(double dt) {
    hooksOf(hookKey_onDraw).forEach((f) => f(self, dt));
    onDraw(dt);
  }

  /// Override to react during the draw phase each frame.
  ///
  /// Called after all registered [listenOnDraw] listeners.
  void onDraw(double dt) {}
}