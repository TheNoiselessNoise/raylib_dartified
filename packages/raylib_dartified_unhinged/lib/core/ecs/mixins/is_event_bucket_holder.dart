part of '../../raylib_dartified_unhinged.dart';

/// Defines how the event system handles event delivery.
enum EventSystemMode {
  /// Enables legacy event handling.
  ///
  /// Every event type is considered wanted, even when no matching
  /// subscriptions are registered.
  legacy,

  /// Enables subscription-based event handling.
  ///
  /// Events are considered wanted only when matching subscriptions
  /// are registered.
  subscription,
}

/// Represents an event subscription registered with an [App].
///
/// A subscription holds a reference to its event handler and optional
/// [owner], allowing event delivery to respect the ownership and scope
/// rules of the ECS hierarchy.
///
/// Subscriptions remain active until [cancel] is called. Cancelling a
/// subscription prevents further event delivery and marks it for removal
/// from its internal subscription bucket.
class EventSubscription<T extends App<T>> {
  EventSubscription._(this._bucket, this._handler, this.owner);

  final _Bucket<T> _bucket;
  final void Function(Event<T>) _handler;

  /// The ECS node that registered this subscription.
  ///
  /// Used to determine whether an event reaches this subscriber according
  /// to the event's scope. A `null` owner represents an app-level
  /// subscription.
  final ECSBase<T>? owner;

  bool _active = true;

  /// Whether this subscription is currently active.
  ///
  /// Inactive subscriptions no longer receive events and are eventually
  /// removed from their subscription bucket.
  bool get active => _active;

  /// Cancels this subscription.
  ///
  /// Prevents the handler from receiving subsequent events and marks the
  /// subscription bucket for cleanup.
  ///
  /// Calling this method multiple times has no additional effect.
  void cancel() {
    if (!_active) return;
    _active = false;
    _bucket.live--;
    _bucket.dirty = true;
  }
}

/// Stores and dispatches subscriptions for a particular event type.
///
/// Maintains a list of subscriptions alongside counters used to track
/// active subscriptions and nested dispatch operations.
///
/// Inactive subscriptions are lazily removed after the outermost dispatch
/// completes, avoiding modifications to the subscription list while it
/// is being iterated.
class _Bucket<T extends App<T>> {
  /// All subscriptions registered in this bucket, including inactive ones
  /// awaiting cleanup.
  final subs = <EventSubscription<T>>[];

  /// Number of currently active subscriptions.
  int live = 0;

  /// Number of currently nested dispatch operations.
  ///
  /// Prevents subscription cleanup while an active dispatch is iterating
  /// over the subscription list.
  int depth = 0;

  /// Whether the subscription list contains inactive entries awaiting
  /// removal.
  bool dirty = false;

  /// Dispatches [e] to active subscriptions whose owners are reached by
  /// the supplied [reaches] predicate.
  ///
  /// Iterates only over subscriptions present at the beginning of this
  /// dispatch. Subscriptions cancelled during dispatch are skipped, while
  /// newly registered subscriptions are deferred until a subsequent
  /// dispatch.
  ///
  /// Dispatch stops when an eligible handler cancels [e]. Inactive
  /// subscriptions are removed once the outermost dispatch completes.
  void dispatch(Event<T> e, bool Function(Event<T>, ECSBase<T>?) reaches) {
    depth++;
    final n = subs.length;
    for (var i = 0; i < n; i++) {
      final s = subs[i];
      if (!s._active) continue;
      if (!reaches(e, s.owner)) continue;
      s._handler(e);
      if (e._isCanceled) break;
    }
    if (--depth == 0 && dirty) {
      subs.removeWhere((s) => !s._active);
      dirty = false;
    }
  }
}

/// A shorthand for an [IsEventBucketHolder] whose subscriber type is
/// [ECSBase].
///
/// Used by app-level event bucket holders that support subscriptions
/// from any ECS node.
typedef IsAnyEventBucketHolder<T extends App<T>> = IsEventBucketHolder<T, ECSBase<T>>;

/// Provides event subscription storage and dispatching capabilities.
///
/// Maintains separate subscription buckets for individual event types and
/// a shared bucket for subscribers interested in all event types.
/// 
/// Event delivery is filtered according to the event's [Event.scope],
/// subscriber ownership, and the hierarchy of the event's origin.
///
/// The [eventSystemMode] determines whether event handling follows
/// legacy behavior or relies exclusively on registered subscriptions.
mixin IsEventBucketHolder<
  T extends App<T>,
  E extends ECSBase<T>
> on IsEventEmittable<T, E> {

  /// Subscription buckets indexed by their concrete event types.
  final _buckets = <Type, _Bucket<T>>{};

  /// Shared subscription bucket for handlers registered through [onAny].
  final _Bucket<T> _anyBucket = .new();

  /// Determines how the event system handles event delivery.
  EventSystemMode get eventSystemMode => .legacy;

  /// Whether events of type [X] should be processed.
  ///
  /// Returns `true` when legacy event handling is enabled, at least one
  /// active subscription exists for [X], or at least one active
  /// catch-all subscription exists.
  bool wants<X extends Event<T>>()
    => eventSystemMode == .legacy || (_buckets[X]?.live ?? 0) > 0 || _anyBucket.live > 0;

  /// Registers a handler for events of type [X].
  ///
  /// The [handler] is invoked when an event matching [X] is dispatched
  /// and its scope allows it to reach [owner].
  ///
  /// If [owner] is omitted, the subscription is treated as app-level.
  ///
  /// Returns an [EventSubscription] that can be used to inspect or cancel
  /// the subscription.
  EventSubscription<T> on<X extends Event<T>>(
    void Function(X event) handler, {
    ECSBase<T>? owner,
  }) {
    final b = _buckets.putIfAbsent(X, _Bucket<T>.new);
    final s = EventSubscription<T>._(b, (e) => handler(e as X), owner);
    b.subs.add(s);
    b.live++;
    return s;
  }

  /// Registers a handler for all event types.
  ///
  /// The [handler] is invoked whenever an event is dispatched and its
  /// scope allows it to reach [owner].
  ///
  /// If [owner] is omitted, the subscription is treated as app-level.
  ///
  /// Returns an [EventSubscription] that can be used to inspect or cancel
  /// the subscription.
  EventSubscription<T> onAny(
    void Function(Event<T> event) handler, {
    ECSBase<T>? owner,
  }) {
    final b = _anyBucket;
    final s = EventSubscription<T>._(b, (e) => handler(e), owner);
    b.subs.add(s);
    b.live++;
    return s;
  }

  /// Delivers [e] to its matching event-type and catch-all subscribers.
  ///
  /// Event-type subscribers are notified first, followed by catch-all
  /// subscribers. Both buckets independently apply their subscriber
  /// ownership and event scope checks.
  void _deliver(Event<T> e) {
    _buckets[e.runtimeType]?.dispatch(e, _reaches);
    _anyBucket.dispatch(e, _reaches);
  }

  /// Determines whether an event originating from [Event.origin] reaches
  /// the specified [owner] according to its event scope.
  ///
  /// The event must have a non-null origin and scope.
  ///
  /// Returns whether [owner] is eligible to receive the event.
  bool _reaches(Event<T> e, ECSBase<T>? owner) {
    assert(e.origin != null && e.scope != null);

    final origin = e.origin!;
    bool root() => owner == null || owner is T || owner is AppSystem<T>;
    bool local() => owner != null && owner.isSelfOrDescendantOf(origin);
    bool scene() => owner != null && owner.scene == origin.scene;
    bool sceneOnly() => (owner is Scene<T> || owner is SceneSystem<T>) && scene();

    return switch (e.scope!) {
      .self             => owner == origin,
      .local            => local(),
      .root             => root(),
      .rootAndLocal     => root() || local(),
      .scene            => scene(),
      .sceneOnly        => sceneOnly(),
      .global           => root() || scene(),
      .globalNoEntities => root() || sceneOnly(),
    };
  }
}