part of '../../raylib_dartified_unhinged.dart';

/// Defines when a scheduled callback is executed relative to the current frame.
enum CallbackTiming {
  /// Executes at the beginning of the next frame.
  begin,

  /// Executes at the end of the current frame.
  ///
  /// This is the default timing.
  end,
}

/// Adds a callback processing capabilities to an ECS object.
///
/// Callbacks are queued and executed in a controlled pipeline each frame.
mixin IsCallbackProcessable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  HasAppAccess<T>,
  IsEventEmittable<T, E>
{
  /// State key for [IsCallbackProcessable]'s [_beginCallbackQueue].
  late final stateKey_beginCallbackQueue = ECSStateKey<List<void Function()>>(
    '$IsCallbackProcessable', 'beginCallbackQueue',
    get: () => .from(_beginCallbackQueue),
    set: (value) => _beginCallbackQueue = value,
  );

  /// State key for [IsCallbackProcessable]'s [_endCallbackQueue].
  late final stateKey_endCallbackQueue = ECSStateKey<List<void Function()>>(
    '$IsCallbackProcessable', 'endCallbackQueue',
    get: () => .from(_endCallbackQueue),
    set: (value) => _endCallbackQueue = value,
  );

  @override
  @mustCallSuper
  void _registerBuiltinStateKeys() {
    super._registerBuiltinStateKeys();
    registerStateKey(stateKey_beginCallbackQueue);
    registerStateKey(stateKey_endCallbackQueue);
  }

  List<void Function()> _beginCallbackQueue = [];
  List<void Function()> _endCallbackQueue = [];

  /// Schedules [callback] for execution at the specified [timing].
  ///
  /// The callback is executed once and removed from the queue afterward.
  @override
  void callback(void Function() callback, [CallbackTiming timing = .end]) => switch (timing) {
    .begin => _beginCallbackQueue.add(callback),
    .end => _endCallbackQueue.add(callback),
  };

  /// Drains and executes all pending callbacks, then clears the queue.
  bool _processCallbacks(CallbackTiming timing) {
    bool didSomething = false;
    switch (timing) {
      case .begin:
        while (_beginCallbackQueue.isNotEmpty) {
          _beginCallbackQueue.removeAt(0).call();
          didSomething = true;
        }
      case .end:
        while (_endCallbackQueue.isNotEmpty) {
          _endCallbackQueue.removeAt(0).call();
          didSomething = true;
        }
    }
    return didSomething;
  }

  /// Clears callback queue.
  void clearCallbackQueue([CallbackTiming timing = .end]) => switch(timing) {
    .begin => _beginCallbackQueue.clear(),
    .end => _endCallbackQueue.clear(),
  };

  /// Synchronously drains the pending callback queue.
  ///
  /// Intended for tests that need deterministic control over when queued
  /// callbacks are processed, decoupled from [Scene._doDrainLoopEnd]'s callback
  /// interleaving. Not meant for production code.
  @visibleForTesting
  bool processCallbackQueueForTest([CallbackTiming timing = .end]) => _processCallbacks(timing);
}