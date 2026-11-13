part of '../../raylib_dartified_unhinged.dart';

/// A mixin that allows an [ECSBase] instance to subscribe to events emitted
/// by its associated [App].
///
/// Subscriptions are automatically tracked and can be cancelled collectively
/// using [cancelEventSubscriptions].
mixin IsEventSubscriber<T extends App<T>> on ECSBase<T> {
  List<EventSubscription<T>>? _subs;

  /// Registers an [EventSubscription] for automatic lifecycle management.
  ///
  /// Initializes the subscription list on the first registration and, if
  /// this instance implements [IsAnyDisposable], registers a disposal
  /// callback to cancel all tracked subscriptions.
  ///
  /// Returns the registered [sub].
  EventSubscription<T> _registerSub(EventSubscription<T> sub) {
    if (_subs == null) {
      _subs = [];
      if (this case IsAnyDisposable<T> d) {
        d.listenOnDispose((_) => cancelEventSubscriptions());
      }
    }
    _subs!.add(sub);
    return sub;
  }

  /// Subscribes to events of type [X] emitted by the associated [App].
  ///
  /// The provided [h] handler is invoked whenever an event matching [X]
  /// is dispatched.
  ///
  /// The subscription is owned by this instance and is automatically
  /// cancelled when [cancelEventSubscriptions] is called or, if applicable,
  /// when this instance is disposed.
  ///
  /// Returns the created [EventSubscription].
  EventSubscription<T> listen<X extends Event<T>>(void Function(X) h)
    => _registerSub(app.on<X>(h, owner: this));

  /// Subscribes to all events emitted by the associated [App].
  ///
  /// The provided [h] handler is invoked whenever an event is dispatched,
  /// regardless of its concrete event type.
  ///
  /// The subscription is owned by this instance and is automatically
  /// cancelled when [cancelEventSubscriptions] is called or, if applicable,
  /// when this instance is disposed.
  ///
  /// Returns the created [EventSubscription].
  EventSubscription<T> listenAny(void Function(Event<T>) h)
    => _registerSub(app.onAny(h, owner: this));

  /// Cancels all event subscriptions registered through this mixin.
  ///
  /// This method can be called manually or is invoked automatically when
  /// the instance is disposed, provided it implements [IsAnyDisposable].
  ///
  /// Calling this method multiple times is safe. The subscription
  /// registry is retained and can be used to track new subscriptions.
  void cancelEventSubscriptions() {
    _subs?.forEach((s) => s.cancel());
    _subs?.clear();
  }
}