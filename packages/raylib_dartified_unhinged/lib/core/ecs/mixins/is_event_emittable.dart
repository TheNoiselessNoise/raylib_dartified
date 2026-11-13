part of '../../raylib_dartified_unhinged.dart';

typedef IsAnyEventEmittable<T extends App<T>> = IsEventEmittable<T, ECSBase<T>>;

/// Adds event emitting and handling capabilities to an ECS object.
///
/// Provides two emission modes:
/// - [emit] => queued; added to the root's (App) event queue and processed in order
/// - [dispatch] => immediate; bypasses the queue and fires synchronously
///
/// Incoming events are propagated via [_doOnEvent], which notifies all registered
/// listeners before invoking the [onEvent] override. Any listener or the event
/// itself may stop propagation early via [Event.stopPropagation].
mixin IsEventEmittable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{

  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██   ░██         
  // ░██████████ ░██     ░██ ░██     ░██ ░███████     ░████████  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██           ░██ 
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   

  /// Hook key for [IsEventEmittable]'s [onBeforeEvent] hooks.
  late final hookKey_onBeforeEvent = ECSHookKey<bool Function(E self, Event<T> event)>(
    '$IsEventEmittable', 'onBeforeEvent'
  );

  /// Hook key for [IsEventEmittable]'s [onEvent] hooks.
  late final hookKey_onEvent = ECSHookKey<void Function(E self, Event<T> event)>(
    '$IsEventEmittable', 'onEvent'
  );

  /// Hook key for [IsEventEmittable]'s [onBeforeEventEmit] hooks.
  late final hookKey_onBeforeEventEmit = ECSHookKey<void Function(E self, Event<T> event)>(
    '$IsEventEmittable', 'onBeforeEventEmit'
  );

  /// Hook key for [IsEventEmittable]'s [onBeforeEventDispatch] hooks.
  late final hookKey_onBeforeEventDispatch = ECSHookKey<void Function(E self, Event<T> event)>(
    '$IsEventEmittable', 'onBeforeEventDispatch'
  );

  /// Registers [fn] as a before-event listener.
  ///
  /// [fn] returning `false` cancels the event handling.
  @nonVirtual
  E listenOnBeforeEvent(bool Function(E self, Event<T> event) fn) {
    addHook(hookKey_onBeforeEvent, fn);
    return self;
  }

  /// Registers [fn] to be called for every incoming event.
  ///
  /// Listeners are called in registration order and may stop propagation
  /// via [Event.stopPropagation], preventing subsequent listeners and [onEvent]
  /// from being reached.
  @nonVirtual
  E listenOnEvent(void Function(E self, Event<T> event) fn) {
    addHook(hookKey_onEvent, fn);
    return self;
  }

  /// Registers [fn] to be called for every incoming event before its emission.
  ///
  /// Listeners are called in registration order and may cancel event emission
  /// via [Event.cancel], preventing subsequent listeners from being reached.
  @nonVirtual
  E listenOnBeforeEventEmit(void Function(E self, Event<T> event) fn) {
    addHook(hookKey_onBeforeEventEmit, fn);
    return self;
  }

  /// Registers [fn] to be called for every incoming event before its dispatch.
  ///
  /// Listeners are called in registration order and may cancel event dispatch
  /// via [Event.cancel], preventing subsequent listeners from being reached.
  @nonVirtual
  E listenOnBeforeEventDispatch(void Function(E self, Event<T> event) fn) {
    addHook(hookKey_onBeforeEventDispatch, fn);
    return self;
  }

  /// Runs all before-event listeners and [onBeforeEvent].
  ///
  /// Returns `false` if any listener or the override cancels the event handling.
  @mustCallSuper
  bool _doOnBeforeEvent(Event<T> event) {
    if (!hooksOf(hookKey_onBeforeEvent).every((f) => f(self, event))) return false;
    return onBeforeEvent(event);
  }

  /// Runs [onBeforeEventEmit] first and then all before-event-emit listeners.
  @mustCallSuper
  void _doOnBeforeEventEmit(Event<T> event) {
    onBeforeEventEmit(event);
    if (event.isCanceled) return;

    for (final f in hooksOf(hookKey_onBeforeEventEmit)) {
      f(self, event);
      if (event.isCanceled) return;
    }
  }

  /// Runs [onBeforeEventDispatch] first and then all before-event-dispatch listeners.
  @mustCallSuper
  void _doOnBeforeEventDispatch(Event<T> event) {
    onBeforeEventDispatch(event);
    if (event.isCanceled) return;

    for (final f in hooksOf(hookKey_onBeforeEventDispatch)) {
      f(self, event);
      if (event.isCanceled) return;
    }
  }

  /// Propagates [event] through listeners and the [onEvent] hook.
  ///
  /// No-op if the event is already stopped. Sets [Event.parent] to `self`
  /// if not already assigned.
  @mustCallSuper
  void _doOnEvent(Event<T> event) {
    event.origin ??= self;

    if (event.isStopped) return;

    if (!_doOnBeforeEvent(event)) return;

    for (final f in hooksOf(hookKey_onEvent)) {
      if (event.isStopped) return;
      f(self, event);
    }
    
    if (event.isStopped) return;
    onEvent(event);
  }

  /// Override to cancel an event handling from within the class.
  ///
  /// Return `false` to abort. Called after all registered [listenOnBeforeEvent] listeners.
  bool onBeforeEvent(Event<T> event) => true;

  /// Override to handle incoming events within the class.
  ///
  /// Called after all registered [listenOnEvent] listeners, and only if
  /// propagation has not been stopped. By this stage the event has already
  /// been enqueued or dispatched, so [Event.cancel] no longer applies. Call
  /// [Event.stopPropagation] instead to prevent remaining listeners further
  /// down the chain from seeing it.
  void onEvent(Event<T> event) {}

  /// Called immediately when [emit] is invoked, before the [event] is
  /// enqueued for asynchronous processing.
  ///
  /// Override to inspect or act on the event at the earliest possible point. 
  ///
  /// Call [Event.cancel] here to prevent the event from ever being enqueued;
  /// [Event.stopPropagation] has no effect at this stage, since propagation
  /// hasn't started.
  ///
  /// Forwards to [app]'s [onBeforeEventEmit] so the app always has a single
  /// choke point to observe every emitted event, regardless of origin.
  @mustCallSuper
  void onBeforeEventEmit(Event<T> event) {
    if (!identical(this, app)) app.onBeforeEventEmit(event);
  }

  /// Called immediately when [dispatch] is invoked, before the [event] is
  /// synchronously propagated.
  ///
  /// Override to inspect or act on the event at the earliest possible point. 
  ///
  /// Call [Event.cancel] here to prevent the event from ever being propagated;
  /// [Event.stopPropagation] has no effect at this stage, since propagation
  /// hasn't started.
  ///
  /// Forwards to [app]'s [onBeforeEventDispatch] so the app always has a
  /// single choke point to observe every dispatched event, regardless of
  /// origin.
  @mustCallSuper
  void onBeforeEventDispatch(Event<T> event) {
    if (!identical(this, app)) app.onBeforeEventDispatch(event);
  }

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  /// Queues an [event] into the central application event queue for asynchronous processing.
  ///
  /// Stitches the [Event.origin] to `this` if it wasn't already set.
  void emit(Event<T> event, {EventScope scope = .rootAndLocal}) {
    event._reset();
    event.origin ??= self;
    event.scope ??= scope;
    event._dispatchMode = .emit;
    _doOnBeforeEventEmit(event);
    if (event.isCanceled) return;
    _enqueueEvent(event);
  }

  /// Dispatches an [event] immediately and synchronously, bypassing the central event queue.
  ///
  /// Stitches the [Event.origin] to `this` if it wasn't already set.
  void dispatch(Event<T> event, {EventScope scope = .rootAndLocal}) {
    event._reset();
    event.origin ??= self;
    event.scope ??= scope;
    event._dispatchMode = .dispatch;
    _doOnBeforeEventDispatch(event);
    if (event.isCanceled) return;
    _propagate(event);
  }

  void _propagate(Event<T> event) {
    assert(event.scope != null);

    event._propagationStarted = true;

    if (event._visited.isEmpty) {
      // First hop of a .local/.self event that didn't start here: jump
      // straight to the true origin instead of walking down from `self`.
      // Gated on `_visited.isEmpty` so this only fires once, later hops
      // (origin walking back down its own subtree) must not re-redirect,
      // or they'd bounce back to origin and get eaten by the visited-check.
      if (
        (event.scope == .rootAndLocal || event.scope == .local || event.scope == .self) &&
        event.origin != self
      ) {
        if (event.origin case IsAnyEventEmittable<T> origin) {
          origin._propagate(event);
          return;
        }
      }

      // Record this event into the origin's and root's history, keyed off
      // `event.origin` rather than `self`.
      //
      // This must live here, in `_propagate`, because `_propagate` is the one
      // choke point every `emit`/`dispatch` call passes through exactly once
      // as its first hop (before any scope-based branching in `_doEventLocal`
      // decides whether to stop, cascade locally, or bail out early). Gating
      // on `_visited.isEmpty` makes that "exactly once" guarantee explicit.
      if (event.origin case IsAnyEventHistoryHolder<T> holder) {
        holder._tryToRecordEvent(event);
      }

      // subscribers hear it exactly once, after the redirect,
      // so it's always evaluated from the true origin's hop.
      app._deliver(event);
      if (event.isStopped) return;
    }

    // skip the walk entirely if no node overrides onEvent
    if (app.eventSystemMode != .legacy) return;

    if (_doEventLocal(event)) return; // intercepted or bound locally
    _dispatchEvent(event);
  }

  /// Evaluates and processes the [event] at this specific layer's scope.
  ///
  /// Returns `true` if the event was fully handled, intercepted, or restricted by its 
  /// scope rules (e.g., [EventScope.self] or [EventScope.local]), signaling that propagation should stop.
  /// Returns `false` if the event is free to continue to the queue or a broader cascade.
  bool _doEventLocal(Event<T> event);

  // already processed by `self`
  @mustCallSuper
  bool _doEventVisitedCheck(Event<T> event) => !event._visited.add(self);

  @mustCallSuper
  bool _doEventSelfCheck(Event<T> event) {
    if (event.scope == .self) {
      if (event.origin == self) {
        _doOnEvent(event);
  
        return true; // 'self'
      }
    }

    return false;
  }

  /// Forwards the event to the top-level application engine queue.
  void _enqueueEvent(Event<T> event) => app._enqueueEvent(event);

  /// Forwards the event directly to the top-level application router for synchronous cascading.
  void _dispatchEvent(Event<T> event) => app._propagate(event);
}