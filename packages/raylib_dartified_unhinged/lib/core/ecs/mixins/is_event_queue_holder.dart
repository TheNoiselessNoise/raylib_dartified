part of '../../raylib_dartified_unhinged.dart';

typedef IsAnyEventQueueHolder<T extends App<T>> = IsEventQueueHolder<T, ECSBase<T>>;

mixin IsEventQueueHolder<
  T extends App<T>,
  E extends ECSBase<T>
> on
  IsEventEmittable<T, E>
{
  /// State key for [IsEventQueueHolder]'s [_eventQueue].
  late final stateKey_eventQueue = ECSStateKey<List<Event<T>>>(
    '$IsEventQueueHolder', 'eventQueue',
    get: () => .from(_eventQueue),
    set: (value) => _eventQueue = value,
  );

  @override
  @mustCallSuper
  void _registerBuiltinStateKeys() {
    super._registerBuiltinStateKeys();
    registerStateKey(stateKey_eventQueue);
  }

  /// Pending events sorted by priority, drained at the start of each update.
  List<Event<T>> _eventQueue = [];

  @visibleForTesting
  List<Event<T>> get eventQueueForTesting => _eventQueue;

  @override
  void _enqueueEvent(Event<T> event) {
    assert(event.origin != null);
    _eventQueue.add(event);
    _eventQueue = _eventQueue.sortedBy((e) => e.priority);
  }

  /// Drains event queue in priority order, dispatching each event.
  bool _processEvents() {
    bool didSomething = false;
    while (_eventQueue.isNotEmpty) {
      _propagate(_eventQueue.removeAt(0));
      didSomething = true;
    }
    return didSomething;
  }

  /// Clears event queue.
  void clearEventQueue() => _eventQueue.clear();

  /// Synchronously drains the pending event queue.
  ///
  /// Intended for tests that need deterministic control over when queued
  /// events are processed, decoupled from [Scene._doDrainLoopEnd]'s callback
  /// interleaving. Not meant for production code.
  @visibleForTesting
  bool processQueuedEventsForTest() => _processEvents();
}