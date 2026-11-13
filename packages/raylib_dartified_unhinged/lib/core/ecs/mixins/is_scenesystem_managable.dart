part of '../../raylib_dartified_unhinged.dart';

/// Adds scene system add/remove lifecycle hooks to an ECS object.
///
/// Covers two events: system add and system remove, each with a full
/// three-phase contract:
/// - **before** => cancelable; any listener or override returning `false` aborts the operation
/// - **on** => the operation is about to complete; called by the host after all before-checks pass
/// - **after** => the operation has completed; side-effects and cleanup go here
mixin IsSceneSystemManagable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>,
  IsEventEmittable<T, E>
{
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██   ░██         
  // ░██████████ ░██     ░██ ░██     ░██ ░███████     ░████████  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██           ░██ 
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   

  /// Hook key for [IsSceneSystemManagable]'s [onBeforeSceneSystemAdd] hooks.
  late final hookKey_onBeforeSceneSystemAdd = ECSHookKey<HookResult Function(E self, SceneSystem<T> system)>(
    '$IsSceneSystemManagable', 'onBeforeSceneSystemAdd'
  );

  /// Hook key for [IsSceneSystemManagable]'s [onSceneSystemAdd] hooks.
  late final hookKey_onSceneSystemAdd = ECSHookKey<void Function(E self, SceneSystem<T> system)>(
    '$IsSceneSystemManagable', 'onSceneSystemAdd'
  );

  /// Hook key for [IsSceneSystemManagable]'s [onAfterSceneSystemAdd] hooks.
  late final hookKey_onAfterSceneSystemAdd = ECSHookKey<void Function(E self, SceneSystem<T> system)>(
    '$IsSceneSystemManagable', 'onAfterSceneSystemAdd'
  );

  /// Hook key for [IsSceneSystemManagable]'s [onBeforeSceneSystemRemove] hooks.
  late final hookKey_onBeforeSceneSystemRemove = ECSHookKey<HookResult Function(E self, SceneSystem<T> system)>(
    '$IsSceneSystemManagable', 'onBeforeSceneSystemRemove'
  );

  /// Hook key for [IsSceneSystemManagable]'s [onSceneSystemRemove] hooks.
  late final hookKey_onSceneSystemRemove = ECSHookKey<void Function(E self, SceneSystem<T> system)>(
    '$IsSceneSystemManagable', 'onSceneSystemRemove'
  );

  /// Hook key for [IsSceneSystemManagable]'s [onAfterSceneSystemRemove] hooks.
  late final hookKey_onAfterSceneSystemRemove = ECSHookKey<void Function(E self, SceneSystem<T> system)>(
    '$IsSceneSystemManagable', 'onAfterSceneSystemRemove'
  );

  /// Registers [fn] as a before-scenesystem-add listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeSceneSystemAdd(HookResult Function(E self, SceneSystem<T> system) fn) {
    addHook(hookKey_onBeforeSceneSystemAdd, fn);
    return self;
  }

  /// Registers [fn] as an add listener.
  ///
  /// Called when the add operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnSceneSystemAdd(void Function(E self, SceneSystem<T> system) fn) {
    addHook(hookKey_onSceneSystemAdd, fn);
    return self;
  }

  /// Registers [fn] as an after-add listener.
  ///
  /// Called only if the system add was not canceled.
  @nonVirtual
  E listenOnAfterSceneSystemAdd(void Function(E self, SceneSystem<T> system) fn) {
    addHook(hookKey_onAfterSceneSystemAdd, fn);
    return self;
  }

  /// Registers [fn] as a before-scenesystem-remove listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeSceneSystemRemove(HookResult Function(E self, SceneSystem<T> system) fn) {
    addHook(hookKey_onBeforeSceneSystemRemove, fn);
    return self;
  }

  /// Registers [fn] as a remove listener.
  ///
  /// Called when the remove operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnSceneSystemRemove(void Function(E self, SceneSystem<T> system) fn) {
    addHook(hookKey_onSceneSystemRemove, fn);
    return self;
  }

  /// Registers [fn] as an after-remove listener.
  ///
  /// Called only if the system remove was not canceled.
  @nonVirtual
  E listenOnAfterSceneSystemRemove(void Function(E self, SceneSystem<T> system) fn) {
    addHook(hookKey_onAfterSceneSystemRemove, fn);
    return self;
  }

  /// Runs all before-scenesystem-add listeners and [onBeforeSceneSystemAdd], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeSceneSystemAdd(SceneSystem<T> system) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeSceneSystemAdd)) {
      result = _mergeHookResult(result, f(self, system));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeSceneSystemAdd(system));
  }

  /// Runs all add listeners and [onSceneSystemAdd].
  @mustCallSuper
  void _doOnSceneSystemAdd(SceneSystem<T> system) {
    hooksOf(hookKey_onSceneSystemAdd).forEach((f) => f(self, system));
    onSceneSystemAdd(system);
  }

  /// Runs all after-add listeners and [onAfterSceneSystemAdd].
  @mustCallSuper
  void _doOnAfterSceneSystemAdd(SceneSystem<T> system) {
    hooksOf(hookKey_onAfterSceneSystemAdd).forEach((f) => f(self, system));
    onAfterSceneSystemAdd(system);
  }

  /// Runs all before-scenesystem-remove listeners and [onBeforeSceneSystemRemove], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeSceneSystemRemove(SceneSystem<T> system) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeSceneSystemRemove)) {
      result = _mergeHookResult(result, f(self, system));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeSceneSystemRemove(system));
  }

  /// Runs all remove listeners and [onSceneSystemRemove].
  @mustCallSuper
  void _doOnSceneSystemRemove(SceneSystem<T> system) {
    hooksOf(hookKey_onSceneSystemRemove).forEach((f) => f(self, system));
    onSceneSystemRemove(system);
  }

  /// Runs all after-remove listeners and [onAfterSceneSystemRemove].
  @mustCallSuper
  void _doOnAfterSceneSystemRemove(SceneSystem<T> system) {
    hooksOf(hookKey_onAfterSceneSystemRemove).forEach((f) => f(self, system));
    onAfterSceneSystemRemove(system);
  }

  /// Override to intercept the before-scenesystem-add phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeSceneSystemAdd] listeners.
  HookResult onBeforeSceneSystemAdd(SceneSystem<T> system) => .proceed;

  /// Override to react when a system add is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  /// 
  /// Called after all registered [listenOnSceneSystemAdd] listeners.
  void onSceneSystemAdd(SceneSystem<T> system) {}

  /// Override to react after a system add has completed.
  ///
  /// Called after all registered [listenOnAfterSceneSystemAdd] listeners.
  void onAfterSceneSystemAdd(SceneSystem<T> system) {}

  /// Override to intercept the before-scenesystem-remove phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeSceneSystemRemove] listeners.
  HookResult onBeforeSceneSystemRemove(SceneSystem<T> system) => .proceed;

  /// Override to react when a system remove is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  /// 
  /// Called after all registered [listenOnSceneSystemRemove] listeners.
  void onSceneSystemRemove(SceneSystem<T> system) {}

  /// Override to react after a system remove has completed.
  ///
  /// Called after all registered [listenOnAfterSceneSystemRemove] listeners.
  void onAfterSceneSystemRemove(SceneSystem<T> system) {}

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  final List<SceneSystem<T>> _systems = [];

  /// Returns all systems currently registered in this scene.
  Iterable<SceneSystem<T>> getSystems() => _systems;

  /// Replaces the first scene system whose `runtimeType == system.runtimeType` with [system].
  E replaceSystem(SceneSystem<T> system) {
    final old = _systems.where((s) => s.runtimeType == system.runtimeType).firstOrNull;
    if (old != null) _removeSceneSystemInstance(old);
    addSystem(system);
    return self;
  }

  /// Moves the first found system of type [S] to the specified [index].
  /// No-op if no system of type [S] is found.
  /// Clamps [index] to the valid range of the list.
  void relocateSystem<S extends SceneSystem<T>>(int index) {
    final currentIndex = _systems.indexWhere((s) => s is S);
    if (currentIndex == -1) return;

    final system = _systems.removeAt(currentIndex);
    final clampedIndex = index.clamp(0, _systems.length);
    _systems.insert(clampedIndex, system);
  }

  /// Exchanges the positions of the first found system of type [A]
  /// with the first found system of type [B].
  /// No-op if either type is not found.
  void exchangeSystems<A extends SceneSystem<T>, B extends SceneSystem<T>>() {
    final indexA = _systems.indexWhere((s) => s is A);
    if (indexA == -1) return;

    final indexB = _systems.indexWhere((s) => s is B);
    if (indexB == -1) return;

    if (indexA == indexB) return;

    final temp = _systems[indexA];
    _systems[indexA] = _systems[indexB];
    _systems[indexB] = temp;
  }

  /// Gets the index of registered [A] system, or -1 if not found.
  int indexOfSystem<A extends SceneSystem<T>>()
    => _systems.indexWhere((s) => s is A);

  /// Gets the index of registered system under type [type], or -1 if not found.
  int indexOfSystemByType(Type type)
    => _systems.indexWhere((s) => s.runtimeType == type);

  /// Replaces the registered [A] system with [newSystem] in one step.
  void swapSystem<A extends SceneSystem<T>>(SceneSystem<T> newSystem) {
    if (hasSystem<A>()) removeSystem<A>();
    addSystem(newSystem);
  }

  /// Replaces the system registered under [type] with [newSystem] in one step.
  void swapSystemByType<B extends SceneSystem<T>>(Type type, B newSystem) {
    if (hasSystemByType(type)) removeSystemByType(type);
    addSystem<B>(newSystem);
  }

  /// Registers [system] in this [Scene] and runs the full add lifecycle.
  @mustCallSuper
  void addSystem<S extends SceneSystem<T>>(S system, {int? index}) {
    emit(EventSceneSystemAdding(app, scene, system));

    HookResult result = _doOnBeforeSceneSystemAdd(system);

    if (result == .cancel) {
      emit(EventSceneSystemAddCancelled(app, scene, system));
      return;
    }

    result = _mergeHookResult(result, system._doOnBeforeAdd(self));

    if (result == .cancel) {
      emit(EventSceneSystemAddCancelled(app, scene, system));
      return;
    }

    system.setParent(self, force: true);

    if (result == .proceed) {
      _doOnSceneSystemAdd(system);
      if (!system.isClone) system._doAdd(self);
    }
    
    if (index != null) {
      _systems.insert(index, system);
    } else {
      _systems.add(system);
    }

    system._doOnAfterAdd(self);
    _doOnAfterSceneSystemAdd(system);
    emit(EventSceneSystemAdded(app, scene, system));
  }

  /// Returns the registered system of type [S], or `null` if absent.
  S? getSystem<S extends SceneSystem<T>>() => _systems.whereType<S>().firstOrNull;

  /// Returns `true` if a system of type [S] is currently registered.
  bool hasSystem<S extends SceneSystem<T>>() => _systems.any((s) => s is S);

  /// Returns `true` if a system registered under [type] is currently present.
  bool hasSystemByType(Type type) => _systems.any((s) => s.runtimeType == type);

  /// Removes the system of type [S]. No-op if absent.
  E removeSystem<S extends SceneSystem<T>>() {
    final s = getSystem<S>();
    if (s != null) _removeSceneSystemInstance(s);
    return self;
  }

  /// Removes the system registered under [type] and runs the full remove lifecycle.
  E removeSystemByType(Type type) {
    final system = _systems.where((s) => s.runtimeType == type).firstOrNull;
    if (system != null) _removeSceneSystemInstance(system);
    return self;
  }

  void _removeSceneSystemInstance(SceneSystem<T> system) {
    if (!_systems.contains(system)) return;

    emit(EventSceneSystemRemoving(app, scene, system));

    HookResult result = _doOnBeforeSceneSystemRemove(system);

    if (result == .cancel) {
      emit(EventSceneSystemRemoveCancelled(app, scene, system));
      return;
    }

    result = _mergeHookResult(result, system._doOnBeforeRemove());

    if (result == .cancel) {
      emit(EventSceneSystemRemoveCancelled(app, scene, system));
      return;
    }

    if (result == .proceed) {
      _doOnSceneSystemRemove(system);
      system._doRemove();
    }
    
    _systems.remove(system);

    system._doOnAfterRemove();
    _doOnAfterSceneSystemRemove(system);
    emit(EventSceneSystemRemoved(app, scene, system));
  }
}