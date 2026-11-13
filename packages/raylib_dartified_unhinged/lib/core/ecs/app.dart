part of '../raylib_dartified_unhinged.dart';

/// Tracks frame timing for an [App] instance: elapsed time, frame count,
/// time scaling, and target FPS.
///
/// Time values are updated once per frame via [_update], which is expected
/// to be driven by the app's main loop.
class AppTime<T extends App<T>> {
  final T app;

  AppTime(this.app);

  /// See [time].
  double _time = 0.0;

  /// Total elapsed time in seconds since the app started.
  ///
  /// Accumulated from raw, unscaled per-frame deltas, unlike [dt], this
  /// is unaffected by [timeScale].
  double get time => _time;

  /// See [timeScaled].
  double _timeScaled = 0.0;

  /// Total elapsed time in seconds since the app started, scaled by
  /// [timeScale].
  ///
  /// Unlike [time], this respects pausing and slow-motion/fast-forward.
  /// It accumulates [dt] rather than the raw frame delta, so it stalls
  /// while [timeScale] is `0` and advances faster/slower otherwise. Use
  /// this for anything that should track elapsed time from the game
  /// world's perspective (cooldowns, animations, particle lifetimes),
  /// as opposed to [time], which always ticks at real speed.
  double get timeScaled => _timeScaled;

  /// See [timeScale].
  double _timeScale = 1.0;

  /// Multiplier applied to the per-frame delta time ([dt]).
  ///
  /// `1.0` is normal speed, `0.0` pauses time progression, and values
  /// above `1.0` fast-forward.
  double get timeScale => _timeScale;

  /// See [frameCount].
  int _frameCount = 0;

  /// Number of frames rendered since the app started.
  int get frameCount => _frameCount;

  /// See [fps].
  int _fps = 60;

  /// The current target frames-per-second, as last set via [setFPS].
  int get fps => _fps;

  /// See [dt].
  double _dt = 0;

  /// Time elapsed since the previous frame, in seconds, already multiplied
  /// by [timeScale].
  ///
  /// Use this instead of the raw frame time for any per-frame
  /// calculation that should respect pausing/slow-motion/fast-forward.
  double get dt => _dt;

  /// Advances time state for the current frame.
  ///
  /// Pulls the raw frame delta, accumulates it into [time] and
  /// [frameCount] (unscaled), and updates [dt] with the [timeScale]-adjusted
  /// value for this frame. Intended to be called once per frame by the
  /// app's main loop.
   void _update() {
    final dt = app.backend.getFrameTime();
    _time += dt;
    _frameCount++;
    _dt = dt * timeScale;
    _timeScaled += _dt;
  }

  /// Sets the speed at which [dt] progresses relative to real time.
  ///
  /// Negative values are clamped to `0`. Does not affect [time] or
  /// [frameCount], only future values of [dt].
  void setTimeScale(double timeScale) {
    if (timeScale < 0) timeScale = 0;
    _timeScale = timeScale;
  }

  /// Updates [timeScale] by applying [fn] to its current value.
  ///
  /// A convenience wrapper around [setTimeScale] for relative changes,
  /// so you don't need to read [timeScale] yourself first. Goes through
  /// [setTimeScale], so the usual negative-value clamping still applies.
  ///
  /// Example:
  /// ```dart
  /// app.time.updateTimeScale((ts) => ts - 0.1); // slow down by 0.1
  /// ```
  void updateTimeScale(double Function(double timeScale) fn)
    => setTimeScale(fn(_timeScale));

  /// Changes the target FPS backend renders at.
  ///
  /// No-op if [newFPS] equals the current [fps]. Otherwise updates backend's
  /// target FPS, then notifies the app about the FPS change and emits
  /// [EventFPSChanged] with the old and new values.
  void setFPS(int newFPS) {
    if (newFPS == _fps) return;
    app.backend.setTargetFPS(newFPS);
    int oldFPS = _fps;
    _fps = newFPS;
    app._doFPSChange(oldFPS, newFPS);
    app.emit(EventFPSChanged(app, oldFPS, newFPS));
  }
}

class App<T extends App<T>> extends ECSBase<T> with

  // identity
  Self<T>,

  // has
  HasVars<T, T>,

  // is
  IsEventSubscriber<T>,
  IsEventEmittable<T, T>, // needs to be before `IsAppSystemManagable`
  IsEventQueueHolder<T, T>,
  IsEventBucketHolder<T, T>,
  IsEventHistoryHolder<T, T>,

  IsAppSystemManagable<T, T>,
  IsBeginEndFrameable<T, T>,
  IsCloneable<T, T>,
  IsDebuggable<T, T>,
  IsDisposable<T, T>,
  IsInputHandleable<T, T>,
  IsPanicable<T, T>,

  IsSceneTransitionable<T, T>, // needs to be before `IsSceneManagable`
  IsSceneManagable<T, T>,
  IsStateHolder<T, T, AppSnapshot<T>>,
  IsPersistable<T, T, AppSnapshot<T>>
  
{
  @override
  late Renderer<T> renderer = .new(self);
  
  @override
  late InputSystem<T> input = .new(self);

  @override
  late Drawers<T> draw = .new(self);

  @override
  T get app => self;

  @override
  final UnhingedBackend backend;

  @override
  late AppTime<T> time;

  App(this.backend, {
    bool populateDefaults = true,
  }) {
    this.populateDefaults = populateDefaults;
    time = .new(self);
    _assignDummyScene();
    factories._registerBuiltins();
  }

  @override
  Vector2 get screenSize => .vec2(800, 450);

  @override
  bool isSelfOrDescendantOf(Object? target) => target == this;

  bool _initialized = false;
  bool _dependenciesAssigned = false;

  late Font defaultFont = backend.getFontDefault();

  bool exitApp = false; // internal

  @nonVirtual
  bool get shouldAppExit => exitApp || _doShouldExit();

  // ░███     ░███    ░███    ░██████░███    ░██ 
  // ░████   ░████   ░██░██     ░██  ░████   ░██ 
  // ░██░██ ░██░██  ░██  ░██    ░██  ░██░██  ░██ 
  // ░██ ░████ ░██ ░█████████   ░██  ░██ ░██ ░██ 
  // ░██  ░██  ░██ ░██    ░██   ░██  ░██  ░██░██ 
  // ░██       ░██ ░██    ░██   ░██  ░██   ░████ 
  // ░██       ░██ ░██    ░██ ░██████░██    ░███ 

  void init() => _runSafely(() {
    _doInit();
    _enterScene(_scenes.first);
  });

  void frame() => _runSafely(() {
    time._update();
    final dt = time.dt;
    _doBeginFrame(dt);
    // input
    _doOnInput();
    // update
    _doFrame(time);
    currentScene._updateScene(dt);
    // draw
    currentScene._doDraw(dt);
    _doEndFrame(dt);
  });

  void exit() => _runSafely(() {
    _doOnEvent(EventAppExiting(app));
    _doExit();
    _doOnDispose();
    backend.dispose();
    _doOnEvent(EventAppExited(app));
  });

  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██   ░██         
  // ░██████████ ░██     ░██ ░██     ░██ ░███████     ░████████  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██           ░██ 
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   

  /// Hook key for [App]'s [onShouldExit] hooks.
  late final hookKey_onShouldExit = ECSHookKey<bool Function(T self)>(
    '$App', 'onShouldExit'
  );

  /// Hook key for [App]'s [onExit] hooks.
  late final hookKey_onExit = ECSHookKey<void Function(T self)>(
    '$App', 'onExit'
  );

  /// Hook key for [App]'s [onFrame] hooks.
  late final hookKey_onFrame = ECSHookKey<void Function(T self, AppTime time)>(
    '$App', 'onFrame'
  );

  /// Hook key for [App]'s [onFPSChange] hooks.
  late final hookKey_onFPSChange = ECSHookKey<void Function(T self, int oldFps, int newFps)>(
    '$App', 'onFPSChange'
  );

  /// Hook key for [App]'s [onInit] hooks.
  late final hookKey_onInit = ECSHookKey<void Function(T self)>(
    '$App', 'onInit'
  );

  @nonVirtual
  T listenOnShouldExit(bool Function(T self) fn) {
    addHook(hookKey_onShouldExit, fn);
    return self;
  }

  @nonVirtual
  T listenOnExit(void Function(T self) fn) {
    addHook(hookKey_onExit, fn);
    return self;
  }

  @nonVirtual
  T listenOnFrame(void Function(T self, AppTime time) fn) {
    addHook(hookKey_onFrame, fn);
    return self;
  }

  @nonVirtual
  T listenOnFPSChange(void Function(T self, int oldFps, int newFps) fn) {
    addHook(hookKey_onFPSChange, fn);
    return self;
  }  

  @nonVirtual
  T listenOnInit(void Function(T self) fn) {
    addHook(hookKey_onInit, fn);
    return self;
  }

  @nonVirtual
  bool _doShouldExit() {
    if (hooksOf(hookKey_onShouldExit).any((f) => f(self))) return true;
    return onShouldExit();
  }

  @nonVirtual
  void _doExit() {
    hooksOf(hookKey_onExit).forEach((f) => f(self));
    onExit();
  }

  @nonVirtual
  void _doFrame(AppTime time) {
    hooksOf(hookKey_onFrame).forEach((f) => f(self, time));
    onFrame(time);
  }

  @nonVirtual
  void _doFPSChange(int oldFPS, int newFPS) {
    hooksOf(hookKey_onFPSChange).forEach((f) => f(self, oldFPS, newFPS));
    onFPSChange(oldFPS, newFPS);
  }

  @nonVirtual
  void _doInit() {
    if (_initialized) return;
    _doOnEvent(EventAppInitializing(app));
    _initialized = true;
    hooksOf(hookKey_onInit).forEach((f) => f(self));
    onInit();
    _doOnEvent(EventAppInitialized(app));
  }

  bool onShouldExit() => false;

  void onExit() {}

  void onFrame(AppTime time) {}

  void onFPSChange(int oldFPS, int newFPS) {}
  
  void onInit() {}

  // ░██████████ ░██    ░██ ░██████████ ░███    ░██ ░██████████  ░██████   
  // ░██         ░██    ░██ ░██         ░████   ░██     ░██     ░██   ░██  
  // ░██         ░██    ░██ ░██         ░██░██  ░██     ░██    ░██         
  // ░█████████  ░██    ░██ ░█████████  ░██ ░██ ░██     ░██     ░████████  
  // ░██          ░██  ░██  ░██         ░██  ░██░██     ░██            ░██ 
  // ░██           ░██░██   ░██         ░██   ░████     ░██     ░██   ░██  
  // ░██████████    ░███    ░██████████ ░██    ░███     ░██      ░██████   

  /// Overridden to break the forwarding loop inherent in the [IsEventEmittable] mixin.
  @override
  void _dispatchEvent(Event<T> event) {
    // The mixin has no concept of being at the root.
    // App must opt out explicitly.
  }

  @override
  @mustCallSuper
  bool _doEventLocal(Event<T> event) {
    if (_doEventVisitedCheck(event)) return true;
    if (event.isStopped) return true;

    if (_doEventSelfCheck(event)) return true;
    if (event.isStopped) return true;

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

    if (
      event.scope != .scene &&
      event.scope != .sceneOnly
    ) {
      if (event.isStopped) return true;
      _doOnEvent(event);

      for (final s in _systems) {
        if (event.isStopped) return true;
        s._propagate(event);
      }
    }

    if (event.scope != .root && event.scope != .rootAndLocal) {
      scene._propagate(event);
    }

    return true; // do not go back to yourself!
  }

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  @override
  @mustCallSuper
  void _doOnInput() {
    _systems.forEach((s) => s._doOnInput());
    currentScene._doOnInput();
    super._doOnInput();
  }

  @override
  @mustCallSuper
  void _doBeginFrame(double dt) {
    backend.beginFrame();
    input._doBeginFrame(dt);
    _systems.forEach((s) => s._doBeginFrame(dt));
    currentScene._doBeginFrame(dt);
    super._doBeginFrame(dt); // observe fully-prepared frame
  }

  @override
  @mustCallSuper
  void _doEndFrame(double dt) {
    super._doEndFrame(dt); // observe before teardown begins
    currentScene._doEndFrame(dt);
    _systems.forEach((s) => s._doEndFrame(dt));
    input._doEndFrame(dt);
    backend.endFrame();
  }

  @override
  @mustCallSuper
  void _doOnDispose() {
    _scenes.forEach((s) => s._doOnDispose());
    _systems.forEach((s) => s._doOnDispose());
    renderer._doOnDispose();
    input._doOnDispose();
    super._doOnDispose();
  }

  //   ░██████  ░██           ░██████   ░███    ░██ ░██████████ 
  //  ░██   ░██ ░██          ░██   ░██  ░████   ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██░██  ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██ ░██ ░██ ░█████████  
  // ░██        ░██         ░██     ░██ ░██  ░██░██ ░██         
  //  ░██   ░██ ░██          ░██   ░██  ░██   ░████ ░██         
  //   ░██████  ░██████████   ░██████   ░██    ░███ ░██████████ 

  @mustCallSuper
  void _doCloneDependencies(T target) {
    if (target._dependenciesAssigned) return;
    _clones.add(target);
    target._dependenciesAssigned = true;
    target.renderer = renderer;
    target.input = input.clone();
  }

  @override
  void _assignClone(T clone) {
    super._assignClone(clone);
    _doCloneDependencies(clone);
  }

  @override
  @nonVirtual
  void _doOnClone(T copy, [ClonePolicy<T>? policy]) {
    // NOTE: we can call cloneInto without createInstance()
    _doCloneDependencies(copy);

    copy.init();

    _doOnEvent(EventAppCloning(self, self, copy));

    _scenes.forEach((s) {
      if (!(policy?.allowScene(copy, s) ?? true)) return;
      copy.replaceScene(s.clone(policy));
    });

    _systems.forEach((s) {
      if (!(policy?.allowAppSystem(copy, s) ?? true)) return;
      copy.replaceSystem(s.clone(policy));
    });

    super._doOnClone(copy, policy);
  }

  @override
  @nonVirtual
  void _doCloneAfter(T target, [ClonePolicy<T>? policy]) {
    super._doCloneAfter(target, policy);
    app._doOnEvent(EventAppCloned(app, self, target));
  }

  // clone

  @override
  T createInstance() => throw StateError(
    'To enable cloning for whole `App` you need to override `createInstance` method.'
  );

  // state

  @override
  AppSnapshot<T> createSnapshot() => .new(namedId);

  @override
  @nonVirtual
  AppSnapshot<T> captureSnapshot() {
    final snapshot = createSnapshot();
    snapshot.systemSnapshots = _systems
      .map((c) => c.captureSnapshot())
      .toList();
    snapshot.sceneSnapshots = _scenes
      .map((c) => c.captureSnapshot())
      .toList();
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant AppSnapshot<T> snapshot) {
    _restoreSnapshotList(
      originSnapshot: snapshot,
      sourceList: _systems.toList(),
      sourceSnapshots: snapshot.systemSnapshots,
      onRecreate: (x) => addSystem(x),
      onRestore: (x, s) => x.restoreSnapshot(s),
      onRemove: _removeAppSystemInstance,
    );

    _restoreSnapshotList(
      originSnapshot: snapshot,
      sourceList: _scenes.toList(),
      sourceSnapshots: snapshot.sceneSnapshots,
      onRecreate: (x) => addScene(x),
      onRestore: (x, s) => x.restoreSnapshot(s),
      onRemove: removeScene,
    );
  }

  // persistence

  late final ECSFactoryRegistry<T> factories = .new();

  static const typeId = '__app__';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),

    ECSPersistentKeys.appSystems: _storePersistableJsonObjectMap(_systems, force: force),
    ECSPersistentKeys.scenes: _storePersistableJsonObjectMap(_scenes, force: force),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    _restorePersistableJsonObjectMap(
      data: data,
      key: ECSPersistentKeys.appSystems,
      factory: app.factories.appSystem,
      onRestored: addSystem,
    );

    _restorePersistableJsonObjectMap(
      data: data,
      key: ECSPersistentKeys.scenes,
      factory: app.factories.scene,
      onRestored: addScene,
    );
  }
}

class AppSnapshot<T extends App<T>> extends StateSnapshot<T, T> {
  late List<AnyAppSystemSnapshot<T>> systemSnapshots;
  late List<AnySceneSnapshot<T>> sceneSnapshots;

  AppSnapshot(super.id);

  @override
  T createInstance(T app) => App<T>(app.backend) as T;
}