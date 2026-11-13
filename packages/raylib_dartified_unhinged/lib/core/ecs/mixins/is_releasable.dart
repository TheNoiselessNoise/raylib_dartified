part of '../../raylib_dartified_unhinged.dart';

// NOTE: not used yet

/// Adds acquire/release lifecycle hooks to an ECS object.
///
/// Unlike [IsDisposable], the object may go through acquire -> release
/// any number of times. Everything freed in [onRelease] must be
/// recreated in [onAcquire].
mixin IsReleasable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Hook key for [IsReleasable]'s [onAcquire] hooks.
  late final hookKey_onAcquire = ECSHookKey<void Function(E self)>(
    '$IsReleasable', 'onAcquire'
  );
  /// Hook key for [IsReleasable]'s [onRelease] hooks.
  late final hookKey_onRelease = ECSHookKey<void Function(E self)>(
    '$IsReleasable', 'onRelease'
  );

  bool _acquired = false;

  bool get isAcquired => _acquired;

  /// Permanent: survives release/acquire cycles.
  @nonVirtual
  E listenOnAcquire(void Function(E self) fn) {
    addHook(hookKey_onAcquire, fn);
    return self;
  }

  /// Permanent: survives release/acquire cycles.
  @nonVirtual
  E listenOnRelease(void Function(E self) fn) {
    addHook(hookKey_onRelease, fn);
    return self;
  }

  // ignore: unused_element
  void _doOnAcquire() {
    if (_acquired) return;
    _acquired = true; // set first: a throw below leaves it releasable
    onAcquire();
    hooksOf(hookKey_onAcquire).forEach((f) => f(self));
  }

  // ignore: unused_element
  void _doOnRelease() {
    if (!_acquired) return;
    _acquired = false; // set first: reentrant release is a no-op
    try {
      hooksOf(hookKey_onRelease).forEach((f) => f(self));
    } finally {
      onRelease();
    }
  }

  /// Create resources here. Called before [listenOnAcquire] listeners.
  void onAcquire() {}

  /// Free resources here and null out pointers.
  /// Called after [listenOnRelease] listeners.
  void onRelease() {}
}