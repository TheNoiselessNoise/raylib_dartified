part of '../../raylib_dartified_unhinged.dart';

/// Adds scene add/remove lifecycle hooks to an ECS object.
///
/// Covers two events: scene add and scene remove, each with a full three-phase contract:
/// - **before** => cancelable; any listener or override returning `false` aborts the operation
/// - **on** => the operation is about to complete; called by the host after all before-checks pass
/// - **after** => the operation has completed; side-effects and cleanup go here
mixin IsSceneManagable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>,
  IsEventEmittable<T, E>,
  IsSceneTransitionable<T, E>
{
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██   ░██         
  // ░██████████ ░██     ░██ ░██     ░██ ░███████     ░████████  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██           ░██ 
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   

  /// Hook key for [IsSceneManagable]'s [onBeforeSceneAdd] hooks.
  late final hookKey_onBeforeSceneAdd = ECSHookKey<HookResult Function(E self, Scene<T> scene)>(
    '$IsSceneManagable', 'onBeforeSceneAdd'
  );

  /// Hook key for [IsSceneManagable]'s [onSceneAdd] hooks.
  late final hookKey_onSceneAdd = ECSHookKey<void Function(E self, Scene<T> scene)>(
    '$IsSceneManagable', 'onSceneAdd'
  );

  /// Hook key for [IsSceneManagable]'s [onAfterSceneAdd] hooks.
  late final hookKey_onAfterSceneAdd = ECSHookKey<void Function(E self, Scene<T> scene)>(
    '$IsSceneManagable', 'onAfterSceneAdd'
  );

  /// Hook key for [IsSceneManagable]'s [onBeforeSceneRemove] hooks.
  late final hookKey_onBeforeSceneRemove = ECSHookKey<HookResult Function(E self, Scene<T> scene)>(
    '$IsSceneManagable', 'onBeforeSceneRemove'
  );

  /// Hook key for [IsSceneManagable]'s [onSceneRemove] hooks.
  late final hookKey_onSceneRemove = ECSHookKey<void Function(E self, Scene<T> scene)>(
    '$IsSceneManagable', 'onSceneRemove'
  );

  /// Hook key for [IsSceneManagable]'s [onAfterSceneRemove] hooks.
  late final hookKey_onAfterSceneRemove = ECSHookKey<void Function(E self, Scene<T> scene)>(
    '$IsSceneManagable', 'onAfterSceneRemove'
  );

  /// Registers [fn] as a before-scene-add listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeSceneAdd(HookResult Function(E self, Scene<T> scene) fn) {
    addHook(hookKey_onBeforeSceneAdd, fn);
    return self;
  }

  /// Registers [fn] as an add listener.
  ///
  /// Called when the add operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnSceneAdd(void Function(E self, Scene<T> scene) fn) {
    addHook(hookKey_onSceneAdd, fn);
    return self;
  }

  /// Registers [fn] as an after-add listener.
  ///
  /// Called only if the scene add was not canceled.
  @nonVirtual
  E listenOnAfterSceneAdd(void Function(E self, Scene<T> scene) fn) {
    addHook(hookKey_onAfterSceneAdd, fn);
    return self;
  }

  /// Registers [fn] as a before-scene-remove listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeSceneRemove(HookResult Function(E self, Scene<T> scene) fn) {
    addHook(hookKey_onBeforeSceneRemove, fn);
    return self;
  }

  /// Registers [fn] as a remove listener.
  ///
  /// Called when the remove operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnSceneRemove(void Function(E self, Scene<T> scene) fn) {
    addHook(hookKey_onSceneRemove, fn);
    return self;
  }

  /// Registers [fn] as an after-remove listener.
  ///
  /// Called only if the scene remove was not canceled.
  @nonVirtual
  E listenOnAfterSceneRemove(void Function(E self, Scene<T> scene) fn) {
    addHook(hookKey_onAfterSceneRemove, fn);
    return self;
  }

  /// Runs all before-scene-add listeners and [onBeforeSceneAdd], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeSceneAdd(Scene<T> scene) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeSceneAdd)) {
      result = _mergeHookResult(result, f(self, scene));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeSceneAdd(scene));
  }

  /// Runs all add listeners and [onSceneAdd].
  @mustCallSuper
  void _doOnSceneAdd(Scene<T> scene) {
    hooksOf(hookKey_onSceneAdd).forEach((f) => f(self, scene));
    onSceneAdd(scene);
  }

  /// Runs all after-add listeners and [onAfterSceneAdd].
  @mustCallSuper
  void _doOnAfterSceneAdd(Scene<T> scene) {
    hooksOf(hookKey_onAfterSceneAdd).forEach((f) => f(self, scene));
    onAfterSceneAdd(scene);
  }

  /// Runs all before-scene-remove listeners and [onBeforeSceneRemove], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeSceneRemove(Scene<T> scene) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeSceneRemove)) {
      result = _mergeHookResult(result, f(self, scene));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeSceneRemove(scene));
  }

  /// Runs all remove listeners and [onSceneRemove].
  @mustCallSuper
  void _doOnSceneRemove(Scene<T> scene) {
    hooksOf(hookKey_onSceneRemove).forEach((f) => f(self, scene));
    onSceneRemove(scene);
  }

  /// Runs all after-remove listeners and [onAfterSceneRemove].
  @mustCallSuper
  void _doOnAfterSceneRemove(Scene<T> scene) {
    hooksOf(hookKey_onAfterSceneRemove).forEach((f) => f(self, scene));
    onAfterSceneRemove(scene);
  }

  /// Override to intercept the before-scene-add phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeSceneAdd] listeners.
  HookResult onBeforeSceneAdd(Scene<T> scene) => .proceed;

  /// Override to react when a scene add is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  void onSceneAdd(Scene<T> scene) {}

  /// Override to react after a scene add has completed.
  ///
  /// Called after all registered [listenOnAfterSceneAdd] listeners.
  void onAfterSceneAdd(Scene<T> scene) {}

  /// Override to intercept the before-scene-remove phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeSceneRemove] listeners.
  HookResult onBeforeSceneRemove(Scene<T> scene) => .proceed;

  /// Override to react when a scene remove is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  void onSceneRemove(Scene<T> scene) {}

  /// Override to react after a scene remove has completed.
  ///
  /// Called after all registered [listenOnAfterSceneRemove] listeners.
  void onAfterSceneRemove(Scene<T> scene) {}

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  late final List<Scene<T>> _scenes = [];
  bool _dummyScenePresent = true;
  late Scene<T> _currentScene;

  void _assignDummyScene() {
    final dummyScene = FWidgetScene<T>(app);

    // message
    dummyScene.listenOnStart((_) => dummyScene.addEntity(FCenter(app,
      vertical: true,
      child: FColumn(app,
        alignment: .center,
        gap: 16,
        children: [
          FLabel(app, text: 'No scene is currently active.'),
          FLabel(app, text: 'Add a scene to get started.'),
        ],
      ),
    )));

    // background
    double time = 0.0;
    dummyScene.listenOnDraw((_, dt) {
      time += dt;

      final screen = sceneBounds.size;
      const waveCount = 6;
      
      for (int waveIndex = 0; waveIndex < waveCount; waveIndex++) {
        int x = 0;
        while (x < screen.x) {
          final y = (
            ((screen.y / waveCount) * waveIndex) +
            math.sin((x * 0.012) + (time * (1.2 + waveIndex * 0.3)) + (waveIndex * 0.8)) *
            (18.0 + waveIndex * 4.0)
          );
          
          final alpha = 40 + (waveIndex * 12);
          backend.render.drawPixel(x, y, .color(30, 120, 220, alpha));
          x += 2;
        }
      }
    });

    _dummyScenePresent = true;
    _currentScene = dummyScene;

    _scenes.clear();
    _scenes.add(_currentScene);
  }

  Iterable<Scene<T>> getScenes() => _scenes;

  Scene<T> get currentScene => _currentScene;

  /// Replaces the first scene whose `runtimeType == scene.runtimeType` with [scene].
  E replaceScene(Scene<T> scene) {
    final old = _scenes.where((c) => c.runtimeType == scene.runtimeType).firstOrNull;
    if (old != null) removeScene(old);
    addScene(scene);
    return self;
  }

  S? getSceneByKey<S extends Scene<T>>(String key) => _scenes.where((s) => s.key == key).firstOrNull as S?;

  S? getScene<S extends Scene<T>>() => _scenes.whereType<S>().firstOrNull;

  void swapScene(Scene<T> oldScene, Scene<T> newScene) {
    if (getSceneByKey(oldScene.key) != null) {
      removeScene(oldScene);
    }
    
    addScene(newScene);
    
    if (oldScene.id == _currentScene.id) {
      setScene(newScene);
    }
  }

  E addScene(Scene<T> scene, {int? index}) {
    final existingScene = getSceneByKey(scene.key);
    if (existingScene != null) {
      throw StateError('You are trying to register already registered Scene $scene.');
    }

    emit(EventSceneAdding(app, scene));

    HookResult result = _doOnBeforeSceneAdd(scene);

    if (result == .cancel) {
      emit(EventSceneAddCancelled(app, scene));
      return self;
    }

    result = _mergeHookResult(result, scene._doOnBeforeAdd(self));

    if (result == .cancel) {
      emit(EventSceneAddCancelled(app, scene));
      return self;
    }

    if (_dummyScenePresent) {
      _scenes.clear();
    }
    
    scene.setParent(self, force: true);

    if (result == .proceed) {
      _doOnSceneAdd(scene);
      if (!scene.isClone) scene._doAdd(self);
    }

    if (index != null) {
      _scenes.insert(index, scene);
    } else {
      _scenes.add(scene);
    }

    if (_dummyScenePresent) {
      _dummyScenePresent = false;
      _currentScene = scene;
    }

    scene._doOnAfterAdd(self);
    _doOnAfterSceneAdd(scene);
    emit(EventSceneAdded(app, scene));

    return self;
  }

  E removeScene(Scene<T> scene) {
    emit(EventSceneRemoving(app, scene));
    
    HookResult result = _doOnBeforeSceneRemove(scene);

    if (result == .cancel) {
      emit(EventSceneRemoveCancelled(app, scene));
      return self;
    }

    result = _mergeHookResult(result, scene._doOnBeforeRemove());

    if (result == .cancel) {
      emit(EventSceneRemoveCancelled(app, scene));
      return self;
    }
    
    if (result == .proceed) {
      _doOnSceneRemove(scene);
      scene._doRemove();
    }

    _scenes.remove(scene);

    scene._doOnAfterRemove();
    _doOnAfterSceneRemove(scene);
    emit(EventSceneRemoved(app, scene));
    return self;
  }

  void nextScene() => setSceneByIndex((_scenes.indexOf(_currentScene) + 1) % _scenes.length);

  void previousScene() => setSceneByIndex((_scenes.indexOf(_currentScene) - 1) % _scenes.length);

  bool _leaveCurrentScene() {
    final scene = _currentScene;

    emit(EventSceneLeaving(app, scene));

    HookResult result = _doOnBeforeSceneLeave(scene);

    if (result == .cancel) {
      emit(EventSceneLeaveCancelled(app, scene));
      return false;
    }

    result = _mergeHookResult(result, scene._doOnBeforeLeave());

    if (result == .cancel) {
      emit(EventSceneLeaveCancelled(app, scene));
      return false;
    } 

    if (result == .proceed) {
      _doOnSceneLeave(scene);
      scene._doOnLeave();
    }

    _doOnAfterSceneLeave(scene);
    scene._doOnAfterLeave();
    emit(EventSceneLeft(app, scene));
    return true;
  }

  bool _enterScene(Scene<T> scene) {
    emit(EventSceneEntering(app, scene));

    HookResult result = _doOnBeforeSceneEnter(scene);

    if (result == .cancel) {
      emit(EventSceneEnterCancelled(app, scene));
      return false;
    }

    result = _mergeHookResult(result, scene._doOnBeforeEnter());

    if (result == .cancel) {
      emit(EventSceneEnterCancelled(app, scene));
      return false;
    }

    if (!scene.isClone) scene._doStart();

    if (result == .proceed) {
      _doOnSceneEnter(scene);
      scene._doOnEnter();
    }

    _currentScene = scene;

    _doOnAfterSceneEnter(scene);
    scene._doOnAfterEnter();
    emit(EventSceneEntered(app, scene));
    return true;
  }

  void setScene(Scene<T> scene) {
    final from = _currentScene;
    final to = scene;

    emit(EventSceneTransitioning(app, from, to));

    HookResult result = _doOnBeforeSceneTransition(from, to);

    if (result == .cancel) {
      emit(EventSceneTransitionCancelled(app, from, to));
      return;
    }

    if (result == .proceed) {
      _doOnSceneTransition(from, to);
    }

    if (from != to) {
      if (!_leaveCurrentScene()) {
        emit(EventSceneTransitionCancelled(app, from, to));
        return;
      }
    }

    if (!_enterScene(to)) {
      emit(EventSceneTransitionCancelled(app, from, to));
      return;
    }

    _doOnAfterSceneTransition(from, to);
    emit(EventSceneTransitioned(app, from, to));
  }

  void setSceneByIndex(int index) {
    var scene = _scenes.elementAtOrNull(index);
    if (scene == null) throw Exception('Invalid scene index: $index');
    setScene(scene);
  }

  void setSceneByKey(String key) {
    var scene = _scenes.where((s) => s.key == key).firstOrNull;
    if (scene == null) throw Exception('Invalid scene key: $key');
    setScene(scene);
  }
}