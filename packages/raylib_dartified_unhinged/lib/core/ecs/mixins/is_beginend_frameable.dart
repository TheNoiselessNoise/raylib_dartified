part of '../../raylib_dartified_unhinged.dart';

/// Adds begin-frame and end-frame lifecycle hooks to an ECS object.
///
/// The **on** phase only, frame boundaries are not cancelable.
mixin IsBeginEndFrameable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Hook key for [IsBeginEndFrameable]'s [onBeginFrame] hooks.
  late final hookKey_onBeginFrame = ECSHookKey<void Function(E self, double dt)>(
    '$IsBeginEndFrameable', 'onBeginFrame'
  );

  /// Hook key for [IsBeginEndFrameable]'s [onEndFrame] hooks.
  late final hookKey_onEndFrame = ECSHookKey<void Function(E self, double dt)>(
    '$IsBeginEndFrameable', 'onEndFrame'
  );

  /// Registers [fn] to be called at the start of each frame.
  @nonVirtual
  E listenOnBeginFrame(void Function(E self, double dt) fn) {
    addHook(hookKey_onBeginFrame, fn);
    return self;
  }

  /// Registers [fn] to be called at the end of each frame.
  @nonVirtual
  E listenOnEndFrame(void Function(E self, double dt) fn) {
    addHook(hookKey_onEndFrame, fn);
    return self;
  }

  /// Notifies all begin-frame listeners and calls [onBeginFrame].
  @mustCallSuper
  void _doBeginFrame(double dt) {
    hooksOf(hookKey_onBeginFrame).forEach((f) => f(self, dt));
    onBeginFrame(dt);
  }

  /// Notifies all end-frame listeners and calls [onEndFrame].
  @mustCallSuper
  void _doEndFrame(double dt) {
    hooksOf(hookKey_onEndFrame).forEach((f) => f(self, dt));
    onEndFrame(dt);
  }

  /// Override to react at the start of each frame.
  ///
  /// Called after all registered [listenOnBeginFrame] listeners.
  void onBeginFrame(double dt) {}

  /// Override to react at the end of each frame.
  ///
  /// Called after all registered [listenOnEndFrame] listeners.
  void onEndFrame(double dt) {}
}