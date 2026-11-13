part of '../raylib_dartified_unhinged.dart';

/// A self-contained scene, the primary organizational unit of the ECS.
///
/// ## Key
///
/// Each scene has a [key] used to identify it in the app's scene registry.
/// If not supplied at construction, defaults to `'$runtimeType.$id'`.
class Scene<T extends App<T>> extends ECSBase<T> with

  // identity
  Self<Scene<T>>,

  // has
  HasOwnParent<T, Scene<T>>,
  HasVars<T, Scene<T>>,

  // is
  IsAddable<T, Scene<T>>,
  IsBeginEndFrameable<T, Scene<T>>,
  IsCloneable<T, Scene<T>>,
  IsDisposable<T, Scene<T>>,
  IsDrawable<T, Scene<T>>,
  IsEnterable<T, Scene<T>>,
  IsEntityManagable<T, Scene<T>, Entity<T>>,
  IsEventSubscriber<T>,
  IsEventEmittable<T, Scene<T>>,
  IsEventHistoryHolder<T, Scene<T>>,
  IsInputHandleable<T, Scene<T>>,
  IsLeavable<T, Scene<T>>,
  IsMorphable<T, Scene<T>>,
  IsPanicable<T, Scene<T>>,
  IsPrePostDrawable<T, Scene<T>>,
  IsPrePostUpdatable<T, Scene<T>>, // pre scene systems and post scene systems
  IsRemovable<T, Scene<T>>,
  IsSceneSystemManagable<T, Scene<T>>,
  IsStartable<T, Scene<T>>,
  IsTaskProcessable<T, Scene<T>>,

  // special
  IsCallbackProcessable<T, Scene<T>>,
  IsStateHolder<T, Scene<T>, AnySceneSnapshot<T>>,
  IsPersistable<T, Scene<T>, AnySceneSnapshot<T>>,
  IsDebuggable<T, Scene<T>>

{
  @override
  final T app;

  /// Unique identifier for this scene within the app's scene registry.
  ///
  /// Defaults to [ECSBase.namedId] if not provided at construction.
  late final String key;

  /// Creates a new scene bound to [app].
  ///
  /// Automatically registers a [TransformSyncSystem] and emits
  /// [EventSceneInitialized].
  Scene(this.app, {
    String? key,
    bool populateDefaults = true,
  }) {
    this.populateDefaults = populateDefaults;
    this.key = key ?? namedId;
    if (populateDefaults) {
      addSystem(TransformSyncSystem(app));
    }
    emit(EventSceneInitialized(app, this));
  }

  @override
  late Bounds sceneBounds = .bounds(0, 0, screenHeight, screenWidth);

  @override
  Scene<T> get scene => this;

  @override
  InputSystem<T> get input => app.input;

  //   ░██████  ░██           ░██████   ░███    ░██ ░██████████ 
  //  ░██   ░██ ░██          ░██   ░██  ░████   ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██░██  ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██ ░██ ░██ ░█████████  
  // ░██        ░██         ░██     ░██ ░██  ░██░██ ░██         
  //  ░██   ░██ ░██          ░██   ░██  ░██   ░████ ░██         
  //   ░██████  ░██████████   ░██████   ░██    ░███ ░██████████ 

  @override
  @nonVirtual
  void _doOnClone(Scene<T> copy, [ClonePolicy<T>? policy]) {
    emit(EventSceneCloning(app, self, copy));

    _entities.forEach((e) {
      if (!(policy?.allowEntity(copy, e) ?? true)) return;
      copy.addEntity(e.clone(policy));
    });

    _systems.forEach((s) {
      if (!(policy?.allowSceneSystem(copy, s) ?? true)) return;
      copy.replaceSystem(s.clone(policy));
    });

    super._doOnClone(copy, policy);
  }

  @override
  @nonVirtual
  void _doCloneAfter(Scene<T> target, [ClonePolicy<T>? policy]) {
    super._doCloneAfter(target, policy);
    emit(EventSceneCloned(app, self, target));
  }

  // clone

  @override
  Scene<T> createInstance() => .new(app);

  // state

  @override
  AnySceneSnapshot<T> createSnapshot() => .new(namedId);  

  @override
  @nonVirtual
  AnySceneSnapshot<T> captureSnapshot() {
    final snapshot = createSnapshot();
    snapshot.systemSnapshots = _systems
      .map((c) => c.captureSnapshot())
      .toList();
    snapshot.entitySnapshots = _entities
      .map((c) => c.captureSnapshot())
      .toList();
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant AnySceneSnapshot<T> snapshot) {
    _restoreSnapshotList(
      originSnapshot: snapshot,
      sourceList: _systems.toList(),
      sourceSnapshots: snapshot.systemSnapshots,
      onRecreate: (x) => addSystem(x),
      onRestore: (x, s) => x.restoreSnapshot(s),
      onRemove: _removeSceneSystemInstance,
    );

    _restoreSnapshotList(
      originSnapshot: snapshot,
      sourceList: _entities.toList(),
      sourceSnapshots: snapshot.entitySnapshots,
      onRecreate: (x) => addEntity(x),
      onRestore: (x, s) => x.restoreSnapshot(s),
      onRemove: removeEntity,
    );
  }

  // persistence

  static const typeId = '__scene__';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),

    ECSPersistentKeys.sceneSystems: _storePersistableJsonObjectMap(_systems, force: force),
    ECSPersistentKeys.entities: _storePersistableJsonObjectMap(_entities, force: force),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    _restorePersistableJsonObjectMap(
      data: data,
      key: ECSPersistentKeys.sceneSystems,
      factory: app.factories.sceneSystem,
      onRestored: addSystem,
    );

    _restorePersistableJsonObjectMap(
      data: data,
      key: ECSPersistentKeys.entities,
      factory: app.factories.entity,
      onRestored: addEntity,
    );
  }

  //   ░██████   ░██     ░██ ░██████████ ░█████████  ░██     ░██ 
  //  ░██   ░██  ░██     ░██ ░██         ░██     ░██  ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██         ░██     ░██   ░██ ░██   
  // ░██     ░██ ░██     ░██ ░█████████  ░█████████     ░████    
  // ░██     ░██ ░██     ░██ ░██         ░██   ░██       ░██     
  //  ░██   ░██   ░██   ░██  ░██         ░██    ░██      ░██     
  //   ░██████     ░██████   ░██████████ ░██     ░██     ░██     
  //        ░██                                                   

  /// Returns a fresh [QueryEntity] scoped to this scene.
  ///
  /// Entry point for the **Query-like DSL**.
  QueryEntities<T, Scene<T>> get QueryEntity => .new(app, self);

  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██   ░██         
  // ░██████████ ░██     ░██ ░██     ░██ ░███████     ░████████  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██           ░██ 
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   

  /// Hook key for [Scene]'s [onDrawBackground] hooks.
  late final hookKey_onDrawBackground = ECSHookKey<void Function(Scene<T> self, double dt)>(
    '$Scene', 'onDrawBackground'
  );

  /// Hook key for [Scene]'s [onDrawForeground] hooks.
  late final hookKey_onDrawForeground = ECSHookKey<void Function(Scene<T> self, double dt)>(
    '$Scene', 'onDrawForeground'
  );

  /// Registers [fn] to be called each frame during the background draw pass,
  /// before [onDrawBackground]. Returns `self` for chaining.
  @nonVirtual
  Scene<T> listenOnDrawBackground(void Function(Scene<T> self, double dt) fn) {
    addHook(hookKey_onDrawBackground, fn);
    return self;
  }

  /// Registers [fn] to be called each frame during the foreground draw pass,
  /// before [onDrawForeground]. Returns `self` for chaining.
  @nonVirtual
  Scene<T> listenOnDrawForeground(void Function(Scene<T> self, double dt) fn) {
    addHook(hookKey_onDrawForeground, fn);
    return self;
  }

  @nonVirtual
  void _doDrawBackground(double dt) {
    hooksOf(hookKey_onDrawBackground).forEach((f) => f(self, dt));
    onDrawBackground();
  }

  @nonVirtual
  void _doDrawForeground(double dt) {
    hooksOf(hookKey_onDrawForeground).forEach((f) => f(self, dt));
    onDrawForeground();
  }

  /// Override to draw content behind entities on the [RenderLayers.background]
  /// layer. Called after all [listenOnDrawBackground] listeners.
  void onDrawBackground() {}

  /// Override to draw content in front of entities on the
  /// [RenderLayers.foreground] layer. Called after all
  /// [listenOnDrawForeground] listeners.
  void onDrawForeground() {}

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  String? renderLayerOverride;

  /// Runs one update tick:
  /// `pre-update` > `systems (pre)` > `entities` > `systems (post)` > `post-update`.
  void _updateScene(double dt) => _runSafely(() {
    final result = _doOnPreUpdate(dt);

    if (result == .cancel) return;

    if (result == .proceed) {
      int ran = 0;
      HookResult sysResult = .proceed;
      for (final s in _systems) {
        ran++;
        final res = s._doOnPreUpdate(dt);
        if (res == .cancel) { sysResult = res; break; }
        if (res == .skip) sysResult = res;
      }
      if (sysResult == .proceed) _updateEntities(dt);
      for (int i = ran - 1; i >= 0; i--) {
        _systems[i]._doOnPostUpdate(dt);
      }
    }

    _doOnPostUpdate(dt);
  });

  @override
  @nonVirtual
  void _doOnAfterEntityAttach(Entity<T> entity) {
    _indexEntity(entity);
    super._doOnAfterEntityAttach(entity);
  }

  @override
  @nonVirtual
  void _doOnAfterEntityDetach(Entity<T> entity) {
    _unindexEntity(entity);
    super._doOnAfterEntityDetach(entity);
  }

  @override
  @nonVirtual
  void _doOnAfterEntityAdd(Entity<T> entity) {
    _indexEntity(entity);
    super._doOnAfterEntityAdd(entity);
  }

  @override
  @nonVirtual
  void _doOnAfterEntityRemove(Entity<T> entity) {
    _unindexEntity(entity);
    super._doOnAfterEntityRemove(entity);
  }

  @override
  @nonVirtual
  void _doOnInput() {
    _systems.forEach((e) => e._doOnInput());
    super._doOnInput();
  }

  /// Called by the app each frame to draw the scene.
  ///
  /// Iterates [Renderer.layers] in order, dispatching background/foreground
  /// hooks on the appropriate layers and calling system and entity draw methods
  /// for each layer.
  @override
  @nonVirtual
  void _doDraw(double dt) => _runSafely(() {
    final result = _doOnPreDraw(dt);

    if (result == .cancel) return;

    if (result == .proceed) {
      _doDrawBackground(dt);

      for (final layer in renderer.layers) {
        renderer.setLayer(layer.name);

        int ran = 0;
        HookResult sysResult = .proceed;
        for (final s in _systems) {
          ran++;
          final res = s._doOnPreDraw(dt);
          if (res == .cancel) { sysResult = res; break; }
          if (res == .skip) sysResult = res;
        }
        if (sysResult == .proceed) _drawLayeredEntities(dt, renderLayerOverride);
        for (int i = ran - 1; i >= 0; i--) {
          _systems[i]._doOnPostDraw(dt);
        }
      }

      super._doDraw(dt);

      _doDrawForeground(dt);
    }

    _doOnPostDraw(dt);
  });

  @override
  @mustCallSuper
  void _doBeginFrame(double dt) {
    super._doBeginFrame(dt);
    _systems.forEach((s) => s._doBeginFrame(dt));
    _doDrainLoopBegin();
  }

  @mustCallSuper
  void _doDrainLoopBegin() {
    const maxIterations = 8;
    var iterations = 0;
    bool hadWork;
    do {
      hadWork = false;
      hadWork |= _processCallbacks(.begin);
      iterations++;
    } while (hadWork && iterations < maxIterations);
  }

  @mustCallSuper
  void _doDrainLoopEnd() {
    const maxIterations = 8;
    var iterations = 0;
    bool hadWork;
    do {
      hadWork = false;
      hadWork |= _processCallbacks(.end);
      hadWork |= app._processEvents();
      iterations++;
    } while (hadWork && iterations < maxIterations);
  }

  /// Synchronously runs the drain loop.
  ///
  /// Intended for tests. Not meant for production code.
  @visibleForTesting
  void processDrainLoopForTest() => _doDrainLoopEnd();

  @visibleForTesting
  bool get isDrainLoopEmptyForTest => (
    _endCallbackQueue.isEmpty &&
    app._eventQueue.isEmpty
  );

  @visibleForTesting
  bool get isTaskQueueEmptyForTest => (
    _taskQueue.isEmpty &&
    _pendingTaskQueue.isEmpty
  );

  /// Called by the app at the very end of each frame, after update and render.
  ///
  /// Drains the callback queue, then events.
  @override
  @mustCallSuper
  void _doEndFrame(double dt) {
    _doDrainLoopEnd();
    _processTasks(dt);
    _doDrainLoopEnd();
    _systems.forEach((s) => s._doEndFrame(dt));
    super._doEndFrame(dt);
  }

  @override
  @mustCallSuper
  void _doOnRemove() {
    super._doOnRemove();
    // NOTE: toList() is important
    _entities.toList().forEach(removeEntity);
    _systems.toList().forEach(_removeSceneSystemInstance);
  }

  // ░██████████ ░██    ░██ ░██████████ ░███    ░██ ░██████████  ░██████   
  // ░██         ░██    ░██ ░██         ░████   ░██     ░██     ░██   ░██  
  // ░██         ░██    ░██ ░██         ░██░██  ░██     ░██    ░██         
  // ░█████████  ░██    ░██ ░█████████  ░██ ░██ ░██     ░██     ░████████  
  // ░██          ░██  ░██  ░██         ░██  ░██░██     ░██            ░██ 
  // ░██           ░██░██   ░██         ░██   ░████     ░██     ░██   ░██  
  // ░██████████    ░███    ░██████████ ░██    ░███     ░██      ░██████   

  @override
  @mustCallSuper
  bool _doEventLocal(Event<T> event) {
    if (event.scope == .root) return false;

    if (event.scope == .rootAndLocal && event.origin != self) return false;
    
    if (_doEventVisitedCheck(event)) return true;
    if (event.isStopped) return true;

    if (_doEventSelfCheck(event)) return true;
    if (event.isStopped) return true;

    // `local` check
    if (event.scope == .local) {
      if (event.origin == self) {
        _doOnEvent(event);

        for (final s in _systems) {
          if (event.isStopped) return true;
          s._propagate(event);
        }

        return true;
      }
    }

    // `rootAndLocal` check, same cascade as `.local`, but must NOT stop here
    if (event.scope == .rootAndLocal) {
      _doOnEvent(event);

      for (final s in _systems) {
        if (event.isStopped) return true;
        s._propagate(event);
      }

      if (event.isStopped) return true;
    }

    // Scene Systems
    if (
      event.scope != .self &&
      event.scope != .local &&
      event.scope != .rootAndLocal
    ) {
      _doOnEvent(event);

      for (final s in _systems) {
        if (event.isStopped) return true;
        s._propagate(event);
      }
    }

    // defer to Entities
    if (event.isStopped) return true;
    if (
      event.scope != .local &&
      event.scope != .rootAndLocal &&
      event.scope != .sceneOnly &&
      event.scope != .globalNoEntities
    ) {
      for (final entity in _entities) {
        if (event.isStopped) return true;
        entity._propagate(event);
      }
    }

    if (event.isStopped) return true;

    return event.origin != self;
  }

  @override
  @mustCallSuper
  void _doOnDispose() {
    _entities.forEach((s) => s._doOnDispose());
    _systems.forEach((s) => s._doOnDispose());
    super._doOnDispose();
  }
}

/// A [Scene] that wraps each frame in a Raylib drawing context.
///
/// Calls [RaylibCore.BeginDrawing] and [RaylibCore.ClearBackground] at the start of every frame,
/// and [RaylibCore.EndDrawing] at the end. Override [backgroundColor] to control the
/// clear color (defaults to [Color.BLACK]).
///
/// This is the correct base class for any scene that renders directly to the
/// screen; use [Scene] only if you need manual control over the drawing
/// lifecycle.
class DrawScene<T extends App<T>> extends Scene<T> {
  DrawScene(super.app, {super.key});

  Color get backgroundColor => .BLACK;

  @override
  @mustCallSuper
  void _doBeginFrame(double dt) {
    backend.render.beginDrawing();
    backend.render.clearBackground(backgroundColor);
    super._doBeginFrame(dt);
  }

  @override
  @mustCallSuper
  void _doEndFrame(double dt) {
    super._doEndFrame(dt);
    backend.render.endDrawing();
  }
}

typedef AnySceneSnapshot<T extends App<T>> = SceneSnapshot<T, Scene<T>>;

class SceneSnapshot<T extends App<T>, S extends Scene<T>> extends StateSnapshot<T, S> {
  late List<AnySceneSystemSnapshot<T>> systemSnapshots;
  late List<AnyEntitySnapshot<T>> entitySnapshots;

  SceneSnapshot(super.id);

  @override
  S createInstance(T app) => Scene<T>(app) as S;
}