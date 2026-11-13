part of '../raylib_dartified_unhinged.dart';

/// Defines how an [Event] is handled by the event system.
enum EventDispatchMode {
  /// Dispatches the event immediately, during the current execution flow.
  dispatch,

  /// Queues the event for deferred dispatch at a later point in time.
  ///
  /// The event is dispatched once the event system processes its pending
  /// event queue (at the end of the frame, in the default implementation).
  emit,
}

/// Controls how far an [Event] propagates through the ECS hierarchy
/// once dispatched or emitted.
enum EventScope {
  /// App + AppSystems
  root,

  /// `root` + `local`
  rootAndLocal,

  /// `root` + `scene`
  global,

  /// `root` + `sceneOnly`
  globalNoEntities,

  /// Scene + SceneSystems + Entities + Components
  scene,

  /// Scene + SceneSystems
  sceneOnly,

  /// Just the emitter and it's children
  /// rules:
  ///   App         > App, AppSystems
  ///   AppSystem   > AppSystem
  ///   Scene       > Scene, SceneSystem
  ///   SceneSystem > SceneSystem
  ///   Entity      > Entity, all Components (even nested)
  ///   Component   > Component, all Components (even nested)
  local,

  /// Just the emitter, no propagation at all
  self;

  /// Gets the previous entry.
  EventScope get prev => switch (this) {
    .self => .local,
    .local => .sceneOnly,
    .sceneOnly => .scene,
    .scene => .globalNoEntities,
    .globalNoEntities => .global,
    .global => .rootAndLocal,
    .rootAndLocal => .root,
    .root => .self,
  };

  /// Gets the next entry.
  EventScope get next => switch (this) {
    .root => .rootAndLocal,
    .rootAndLocal => .global,
    .global => .globalNoEntities,
    .globalNoEntities => .scene,
    .scene => .sceneOnly,
    .sceneOnly => .local,
    .local => .self,
    .self => .global,
  };
}

/// A message dispatched or emitted through the ECS hierarchy.
///
/// Created once per occurrence and passed by reference through every node
/// it visits for the duration of a single [IsEventEmittable.dispatch] or
/// [IsEventEmittable.emit] call.
///
/// [Event.origin] is reset and propagation tracking is cleared at the
/// start of each [IsEventEmittable.dispatch]/[IsEventEmittable.emit] call,
/// so the same instance can safely be redispatched later. [Event.scope],
/// once set, is not reset between calls and will keep taking priority
/// over the scope passed at the call site.
abstract class Event<T extends App<T>> extends ECSBase<T> with
  Self<Event<T>>,
  IsCancelable<T, Event<T>>
{
  @override
  final T app;

  /// Nodes that have already processed this event during the current
  /// propagation pass, guarding against re-entrant dispatch cycles
  /// (e.g. App deferring to Scene deferring back to App).
  final Set<ECSBase<T>> _visited = {};

  /// How far this event should propagate.
  EventScope? scope;

  /// The node that originally emitted this event.
  ECSBase<T>? origin;

  /// Relative ordering priority used when processing queued events.
  /// Events with lower priority values are processed first.
  int priority = 0;

  Event(this.app);

  Event<T>? _linkedEvent;

  /// Reset this events state so it can be reused.
  void _reset() {
    _visited.clear();
    _isStopped = false;
    origin = null;

    _dispatchMode = null;
    _originRecorded = false;
    _rootRecorded = false;
    _propagationStarted = false;
  }

  /// Links this event to [link] so that stopping propagation on one
  /// (via [stopPropagation]) also stops the other.
  void setLink(Event<T> link) => _linkedEvent = link;

  bool _isStopped = false;

  /// Whether propagation has been halted via [stopPropagation].
  bool get isStopped => _isStopped || _isCanceled;

  /// Halts further propagation of this event (and any event linked via
  /// [setLink]). Already-visited nodes are unaffected; only handlers
  /// further down the propagation chain are skipped.
  void stopPropagation() {
    _isStopped = true;
    _linkedEvent?._isStopped = true; 
  }

  EventDispatchMode? _dispatchMode;
  bool _originRecorded = false;
  bool _rootRecorded = false;
  bool _propagationStarted = false;

  /// Cancels this event, preventing it from ever being enqueued or
  /// propagated. Only meaningful when called from
  /// [IsEventEmittable.onBeforeEventEmit] / [IsEventEmittable.onBeforeEventDispatch].
  /// By the time [IsEventEmittable.onEvent] runs, the event is already underway and
  /// [stopPropagation] is the correct tool instead.
  @override
  bool cancel() {
    if (_propagationStarted) return false;
    if (isStopped) return false;
    return super.cancel();
  }
}

// BASE EVENTS

abstract class EventCloning<T extends App<T>, E extends ECSBase<T>> extends Event<T> {
  final E original;
  final E cloning;

  EventCloning(super.app, this.original, this.cloning);
}

abstract class EventCloned<T extends App<T>, E extends ECSBase<T>> extends Event<T> {
  final E original;
  final E cloned;

  EventCloned(super.app, this.original, this.cloned);
}

class EventAdding<T extends App<T>, D extends ECSBase<T>, I extends ECSBase<T>> extends Event<T> {
  final D destination;
  final I item;
  EventAdding(super.app, this.destination, this.item);
}

class EventAddCancelled<T extends App<T>, D extends ECSBase<T>, I extends ECSBase<T>> extends Event<T> {
  final D destination;
  final I item;
  EventAddCancelled(super.app, this.destination, this.item);
}

class EventAdded<T extends App<T>, D extends ECSBase<T>, I extends ECSBase<T>> extends Event<T> {
  final D destination;
  final I item;
  EventAdded(super.app, this.destination, this.item);
}

class EventRemoving<T extends App<T>, D extends ECSBase<T>, I extends ECSBase<T>> extends Event<T> {
  final D destination;
  final I item;
  EventRemoving(super.app, this.destination, this.item);
}

class EventRemoveCancelled<T extends App<T>, D extends ECSBase<T>, I extends ECSBase<T>> extends Event<T> {
  final D destination;
  final I item;
  EventRemoveCancelled(super.app, this.destination, this.item);
}

class EventRemoved<T extends App<T>, D extends ECSBase<T>, I extends ECSBase<T>> extends Event<T> {
  final D destination;
  final I item;
  EventRemoved(super.app, this.destination, this.item);
}

// APP SPECIFIC EVENTS

class EventFPSChanged<T extends App<T>> extends Event<T> {
  final int oldFps;
  final int newFps;
  EventFPSChanged(super.app, this.oldFps, this.newFps);
}

// ENTITY SPECIFIC EVENTS

class EventEntityInitialized<T extends App<T>> extends Event<T> {
  final Entity<T> entity;
  EventEntityInitialized(super.app, this.entity);
}

// ADDING AN ENTITY

class EventEntityAdding<T extends App<T>> extends EventAdding<T, ECSBase<T>, Entity<T>> {
  EventEntityAdding(super.app, super.destination, super.entity);
}

class EventEntityAddCancelled<T extends App<T>> extends EventAddCancelled<T, ECSBase<T>, Entity<T>> {
  EventEntityAddCancelled(super.app, super.destination, super.entity);
}

class EventEntityAdded<T extends App<T>> extends EventAdded<T, ECSBase<T>, Entity<T>> {
  EventEntityAdded(super.app, super.destination, super.entity);
}

// REMOVING AN ENTITY

class EventEntityRemoving<T extends App<T>> extends EventRemoving<T, ECSBase<T>, Entity<T>> {
  EventEntityRemoving(super.app, super.destination, super.entity);
}

class EventEntityRemoveCancelled<T extends App<T>> extends EventRemoveCancelled<T, ECSBase<T>, Entity<T>> {
  EventEntityRemoveCancelled(super.app, super.destination, super.entity);
}

class EventEntityRemoved<T extends App<T>> extends EventRemoved<T, ECSBase<T>, Entity<T>> {
  EventEntityRemoved(super.app, super.destination, super.entity);
}

// ATTACHING AN ENTITY

class EventEntityAttaching<T extends App<T>> extends EventAdding<T, ECSBase<T>, Entity<T>> {
  EventEntityAttaching(super.app, super.destination, super.entity);
}

class EventEntityAttachCancelled<T extends App<T>> extends EventAddCancelled<T, ECSBase<T>, Entity<T>> {
  EventEntityAttachCancelled(super.app, super.destination, super.entity);
}

class EventEntityAttached<T extends App<T>> extends EventAdded<T, ECSBase<T>, Entity<T>> {
  EventEntityAttached(super.app, super.destination, super.entity);
}

// DETACHING AN ENTITY

class EventEntityDetaching<T extends App<T>> extends EventRemoving<T, ECSBase<T>, Entity<T>> {
  EventEntityDetaching(super.app, super.destination, super.entity);
}

class EventEntityDetachCancelled<T extends App<T>> extends EventRemoveCancelled<T, ECSBase<T>, Entity<T>> {
  EventEntityDetachCancelled(super.app, super.destination, super.entity);
}

class EventEntityDetached<T extends App<T>> extends EventRemoved<T, ECSBase<T>, Entity<T>> {
  EventEntityDetached(super.app, super.destination, super.entity);
}

// CLONING AN ENTITY

class EventEntityCloning<T extends App<T>> extends EventCloning<T, Entity<T>> {
  EventEntityCloning(super.app, super.original, super.cloning);
}

class EventEntityCloned<T extends App<T>> extends EventCloned<T, Entity<T>> {
  EventEntityCloned(super.app, super.original, super.cloned);
}

// ADDING AN COMPONENT

class EventCompAdding<T extends App<T>> extends EventAdding<T, Entity<T>, Comp<T>> {
  EventCompAdding(super.app, super.entity, super.component);
}

class EventCompAddCancelled<T extends App<T>> extends EventAddCancelled<T, Entity<T>, Comp<T>> {
  EventCompAddCancelled(super.app, super.entity, super.component);
}

class EventCompAdded<T extends App<T>> extends EventAdded<T, Entity<T>, Comp<T>> {
  EventCompAdded(super.app, super.entity, super.component);
}

// REMOVING AN COMPONENT

class EventCompRemoving<T extends App<T>> extends EventRemoving<T, Entity<T>, Comp<T>> {
  EventCompRemoving(super.app, super.entity, super.component);
}

class EventCompRemoveCancelled<T extends App<T>> extends EventRemoveCancelled<T, Entity<T>, Comp<T>> {
  EventCompRemoveCancelled(super.app, super.entity, super.component);
}

class EventCompRemoved<T extends App<T>> extends EventRemoved<T, Entity<T>, Comp<T>> {
  EventCompRemoved(super.app, super.entity, super.component);
}

// CLONING AN COMPONENT

class EventCompCloning<T extends App<T>> extends EventCloning<T, Comp<T>> {
  EventCompCloning(super.app, super.original, super.cloning);
}

class EventCompCloned<T extends App<T>> extends EventCloned<T, Comp<T>> {
  EventCompCloned(super.app, super.original, super.cloned);
}

// APP SPECIFIC EVENTS

class EventAppInitializing<T extends App<T>> extends Event<T> {
  EventAppInitializing(super.app);
}

class EventAppInitialized<T extends App<T>> extends Event<T> {
  EventAppInitialized(super.app);
}

class EventAppExiting<T extends App<T>> extends Event<T> {
  EventAppExiting(super.app);
}

class EventAppExited<T extends App<T>> extends Event<T> {
  EventAppExited(super.app);
}

// CLONING AN APP

class EventAppCloning<T extends App<T>> extends EventCloning<T, T> {
  EventAppCloning(super.app, super.original, super.cloning);
}

class EventAppCloned<T extends App<T>> extends EventCloned<T, T> {
  EventAppCloned(super.app, super.original, super.cloned);
}

// ADDING AN APP SYSTEM

class EventAppSystemAdding<T extends App<T>> extends EventAdding<T, T, AppSystem<T>> {
  EventAppSystemAdding(T app, AppSystem<T> system) : super(app, app, system);
}

class EventAppSystemAddCancelled<T extends App<T>> extends EventAddCancelled<T, T, AppSystem<T>> {
  EventAppSystemAddCancelled(T app, AppSystem<T> system) : super(app, app, system);
}

class EventAppSystemAdded<T extends App<T>> extends EventAdded<T, T, AppSystem<T>> {
  EventAppSystemAdded(T app, AppSystem<T> system) : super(app, app, system);
}

// ADDING AN APP SYSTEM

class EventAppSystemRemoving<T extends App<T>> extends EventRemoving<T, T, AppSystem<T>> {
  EventAppSystemRemoving(T app, AppSystem<T> system) : super(app, app, system);
}

class EventAppSystemRemoveCancelled<T extends App<T>> extends EventRemoveCancelled<T, T, AppSystem<T>> {
  EventAppSystemRemoveCancelled(T app, AppSystem<T> system) : super(app, app, system);
}

class EventAppSystemRemoved<T extends App<T>> extends EventRemoved<T, T, AppSystem<T>> {
  EventAppSystemRemoved(T app, AppSystem<T> system) : super(app, app, system);
}

// CLONING AN APP SYSTEM

class EventAppSystemCloning<T extends App<T>> extends EventCloning<T, AppSystem<T>> {
  EventAppSystemCloning(super.app, super.original, super.cloning);
}

class EventAppSystemCloned<T extends App<T>> extends EventCloned<T, AppSystem<T>> {
  EventAppSystemCloned(super.app, super.original, super.cloned);
}

// SCENE SPECIFIC EVENTS

// NOTE: all of these needs to be handled on App level

class EventSceneInitialized<T extends App<T>> extends Event<T> {
  final Scene<T> initializedScene;
  
  EventSceneInitialized(super.app, this.initializedScene);
}

// ADDING A SCENE

// NOTE: all of these needs to be handled on App level

class EventSceneAdding<T extends App<T>> extends EventAdding<T, T, Scene<T>> {
  EventSceneAdding(T app, Scene<T> scene) : super(app, app, scene);
}

class EventSceneAddCancelled<T extends App<T>> extends EventAddCancelled<T, T, Scene<T>> {
  EventSceneAddCancelled(T app, Scene<T> scene) : super(app, app, scene);
}

class EventSceneAdded<T extends App<T>> extends EventAdded<T, T, Scene<T>> {
  EventSceneAdded(T app, Scene<T> scene) : super(app, app, scene);
}

// REMOVING A SCENE

// NOTE: all of these needs to be handled on App level

class EventSceneRemoving<T extends App<T>> extends EventRemoving<T, T, Scene<T>> {
  EventSceneRemoving(T app, Scene<T> scene) : super(app, app, scene);
}

class EventSceneRemoveCancelled<T extends App<T>> extends EventRemoveCancelled<T, T, Scene<T>> {
  EventSceneRemoveCancelled(T app, Scene<T> scene) : super(app, app, scene);
}

class EventSceneRemoved<T extends App<T>> extends EventRemoved<T, T, Scene<T>> {
  EventSceneRemoved(T app, Scene<T> scene) : super(app, app, scene);
}

// ENTERING A SCENE

// NOTE: all of these needs to be handled on App level

class EventSceneEntering<T extends App<T>> extends Event<T> {
  final Scene<T> enteringScene;
  
  EventSceneEntering(super.app, this.enteringScene);
}

class EventSceneEnterCancelled<T extends App<T>> extends Event<T> {
  final Scene<T> enteringCancelledScene;
  
  EventSceneEnterCancelled(super.app, this.enteringCancelledScene);
}

class EventSceneEntered<T extends App<T>> extends Event<T> {
  final Scene<T> enteredScene;
  
  EventSceneEntered(super.app, this.enteredScene);
}

// LEAVING A SCENE

// NOTE: all of these needs to be handled on App level

class EventSceneLeaving<T extends App<T>> extends Event<T> {
  final Scene<T> leavingScene;
  
  EventSceneLeaving(super.app, this.leavingScene);
}

class EventSceneLeaveCancelled<T extends App<T>> extends Event<T> {
  final Scene<T> leavingCancelledScene;
  
  EventSceneLeaveCancelled(super.app, this.leavingCancelledScene);
}

class EventSceneLeft<T extends App<T>> extends Event<T> {
  final Scene<T> leftScene;
  
  EventSceneLeft(super.app, this.leftScene);
}

// TRANSITIONING SCENE `FROM` to `TO`

// NOTE: all of these needs to be handled on App level

class EventSceneTransitioning<T extends App<T>> extends Event<T> {
  final Scene<T> from;
  final Scene<T> to;
  EventSceneTransitioning(super.app, this.from, this.to);
}

class EventSceneTransitionCancelled<T extends App<T>> extends Event<T> {
  final Scene<T> from;
  final Scene<T> to;
  EventSceneTransitionCancelled(super.app, this.from, this.to);
}

class EventSceneTransitioned<T extends App<T>> extends Event<T> {
  final Scene<T> from;
  final Scene<T> to;
  EventSceneTransitioned(super.app, this.from, this.to);
}

// CLONING A SCENE

class EventSceneCloning<T extends App<T>> extends EventCloning<T, Scene<T>> {
  EventSceneCloning(super.app, super.original, super.cloning);
}

class EventSceneCloned<T extends App<T>> extends EventCloned<T, Scene<T>> {
  EventSceneCloned(super.app, super.original, super.cloned);
}

// ADDING A SCENE SYSTEM

class EventSceneSystemAdding<T extends App<T>> extends EventAdding<T, Scene<T>, SceneSystem<T>> {
  EventSceneSystemAdding(super.app, super.scene, super.system);
}

class EventSceneSystemAddCancelled<T extends App<T>> extends EventAddCancelled<T, Scene<T>, SceneSystem<T>> {
  EventSceneSystemAddCancelled(super.app, super.scene, super.system);
}

class EventSceneSystemAdded<T extends App<T>> extends EventAdded<T, Scene<T>, SceneSystem<T>> {
  EventSceneSystemAdded(super.app, super.scene, super.system);
}

// REMOVING A SCENE SYSTEM

class EventSceneSystemRemoving<T extends App<T>> extends EventRemoving<T, Scene<T>, SceneSystem<T>> {
  EventSceneSystemRemoving(super.app, super.scene, super.system);
}

class EventSceneSystemRemoveCancelled<T extends App<T>> extends EventRemoveCancelled<T, Scene<T>, SceneSystem<T>> {
  EventSceneSystemRemoveCancelled(super.app, super.scene, super.system);
}

class EventSceneSystemRemoved<T extends App<T>> extends EventRemoved<T, Scene<T>, SceneSystem<T>> {
  EventSceneSystemRemoved(super.app, super.scene, super.system);
}

// CLONING A SCENE SYSTEM

class EventSceneSystemCloning<T extends App<T>> extends EventCloning<T, SceneSystem<T>> {
  EventSceneSystemCloning(super.app, super.original, super.cloning);
}

class EventSceneSystemCloned<T extends App<T>> extends EventCloned<T, SceneSystem<T>> {
  EventSceneSystemCloned(super.app, super.original, super.cloned);
}

// TASK EVENTS

class EventTaskStarting<T extends App<T>> extends Event<T> {
  final Task<T> startingTask;

  EventTaskStarting(super.app, this.startingTask);
}

class EventTaskCancelled<T extends App<T>> extends Event<T> {
  final Task<T> cancelledTask;

  EventTaskCancelled(super.app, this.cancelledTask);
}

class EventTaskFinished<T extends App<T>> extends Event<T> {
  final Task<T> finishedTask;

  EventTaskFinished(super.app, this.finishedTask);
}

// SPECIAL EVENTS

class EventDebugMessage<T extends App<T>> extends Event<T> {
  final ECSDebugMessage message;

  EventDebugMessage(super.app, this.message);
}

// COLLISION

class EventCollision<T extends App<T>> extends Event<T> with WithCollisionResolver<T, Entity<T>> {
  @override
  final Entity<T> a;
  
  @override
  final Entity<T> b;
  
  final Vector2 normal; // from a -> b
  
  final double penetration;

  EventCollision(
    super.app,
    this.a,
    this.b,
    this.normal,
    this.penetration,
  );
}
