part of '../../raylib_dartified_unhinged.dart';

/// Adds app system add/remove lifecycle hooks to an [App].
///
/// Covers two events: system add and system remove, each with a full
/// three-phase contract:
/// - **before** => cancelable; any listener or override returning `false` aborts the operation
/// - **on** => the operation is about to complete; called by the host after all before-checks pass
/// - **after** => the operation has completed; side-effects and cleanup go here
mixin IsAppSystemManagable<
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

  /// Hook key for [IsAppSystemManagable]'s [onBeforeAppSystemAdd] hooks.
  late final hookKey_onBeforeAppSystemAdd = ECSHookKey<HookResult Function(E self, AppSystem<T> system)>(
    '$IsAppSystemManagable', 'onBeforeAppSystemAdd'
  );

  /// Hook key for [IsAppSystemManagable]'s [onAppSystemAdd] hooks.
  late final hookKey_onAppSystemAdd = ECSHookKey<void Function(E self, AppSystem<T> system)>(
    '$IsAppSystemManagable', 'onAppSystemAdd'
  );

  /// Hook key for [IsAppSystemManagable]'s [onAfterAppSystemAdd] hooks.
  late final hookKey_onAfterAppSystemAdd = ECSHookKey<void Function(E self, AppSystem<T> system)>(
    '$IsAppSystemManagable', 'onAfterAppSystemAdd'
  );

  /// Hook key for [IsAppSystemManagable]'s [onBeforeAppSystemRemove] hooks.
  late final hookKey_onBeforeAppSystemRemove = ECSHookKey<HookResult Function(E self, AppSystem<T> system)>(
    '$IsAppSystemManagable', 'onBeforeAppSystemRemove'
  );

  /// Hook key for [IsAppSystemManagable]'s [onAppSystemRemove] hooks.
  late final hookKey_onAppSystemRemove = ECSHookKey<void Function(E self, AppSystem<T> system)>(
    '$IsAppSystemManagable', 'onAppSystemRemove'
  );

  /// Hook key for [IsAppSystemManagable]'s [onAfterAppSystemRemove] hooks.
  late final hookKey_onAfterAppSystemRemove = ECSHookKey<void Function(E self, AppSystem<T> system)>(
    '$IsAppSystemManagable', 'onAfterAppSystemRemove'
  );

  /// Registers [fn] as a before-appsystem-add listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeAppSystemAdd(HookResult Function(E self, AppSystem<T> system) fn) {
    addHook(hookKey_onBeforeAppSystemAdd, fn);
    return self;
  }

  /// Registers [fn] as an add listener.
  ///
  /// Called when the add operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnAppSystemAdd(void Function(E self, AppSystem<T> system) fn) {
    addHook(hookKey_onAppSystemAdd, fn);
    return self;
  }

  /// Registers [fn] as an after-add listener.
  ///
  /// Called only if the system add was not canceled.
  @nonVirtual
  E listenOnAfterAppSystemAdd(void Function(E self, AppSystem<T> system) fn) {
    addHook(hookKey_onAfterAppSystemAdd, fn);
    return self;
  }

  /// Registers [fn] as a before-appsystem-remove listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeAppSystemRemove(HookResult Function(E self, AppSystem<T> system) fn) {
    addHook(hookKey_onBeforeAppSystemRemove, fn);
    return self;
  }

  /// Registers [fn] as a remove listener.
  ///
  /// Called when the remove operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnAppSystemRemove(void Function(E self, AppSystem<T> system) fn) {
    addHook(hookKey_onAppSystemRemove, fn);
    return self;
  }

  /// Registers [fn] as an after-remove listener.
  ///
  /// Called only if the system remove was not canceled.
  @nonVirtual
  E listenOnAfterAppSystemRemove(void Function(E self, AppSystem<T> system) fn) {
    addHook(hookKey_onAfterAppSystemRemove, fn);
    return self;
  }

  /// Runs all before-appsystem-add listeners and [onBeforeAppSystemAdd], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeAppSystemAdd(AppSystem<T> system) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeAppSystemAdd)) {
      result = _mergeHookResult(result, f(self, system));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeAppSystemAdd(system));
  }
  
  /// Runs all add listeners and [onAppSystemAdd].
  @mustCallSuper
  void _doOnAppSystemAdd(AppSystem<T> system) {
    hooksOf(hookKey_onAppSystemAdd).forEach((f) => f(self, system));
    onAppSystemAdd(system);
  }

  /// Runs all after-add listeners and [onAfterAppSystemAdd].
  @mustCallSuper
  void _doOnAfterAppSystemAdd(AppSystem<T> system) {
    hooksOf(hookKey_onAfterAppSystemAdd).forEach((f) => f(self, system));
    onAfterAppSystemAdd(system);
  }

  /// Runs all before-appsystem-remove listeners and [onBeforeAppSystemRemove], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeAppSystemRemove(AppSystem<T> system) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeAppSystemRemove)) {
      result = _mergeHookResult(result, f(self, system));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeAppSystemRemove(system));
  }

  /// Runs all remove listeners and [onAppSystemRemove].
  @mustCallSuper
  void _doOnAppSystemRemove(AppSystem<T> system) {
    hooksOf(hookKey_onAppSystemRemove).forEach((f) => f(self, system));
    onAppSystemRemove(system);
  }

  /// Runs all after-remove listeners and [onAfterAppSystemRemove].
  @mustCallSuper
  void _doOnAfterAppSystemRemove(AppSystem<T> system) {
    hooksOf(hookKey_onAfterAppSystemRemove).forEach((f) => f(self, system));
    onAfterAppSystemRemove(system);
  }

  /// Override to intercept the before-appsystem-add phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeAppSystemAdd] listeners.
  HookResult onBeforeAppSystemAdd(AppSystem<T> system) => .proceed;

  /// Override to react when a system add is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  void onAppSystemAdd(AppSystem<T> system) {}

  /// Override to react after a system add has completed.
  ///
  /// Called after all registered [listenOnAfterAppSystemAdd] listeners.
  void onAfterAppSystemAdd(AppSystem<T> system) {}

  /// Override to intercept the before-appsystem-remove phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeAppSystemRemove] listeners.
  HookResult onBeforeAppSystemRemove(AppSystem<T> system) => .proceed;

  /// Override to react when a system remove is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  void onAppSystemRemove(AppSystem<T> system) {}

  /// Override to react after a system remove has completed.
  ///
  /// Called after all registered [listenOnAfterAppSystemRemove] listeners.
  void onAfterAppSystemRemove(AppSystem<T> system) {}

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  final List<AppSystem<T>> _systems = [];

  Iterable<AppSystem<T>> getSystems() => _systems;

  /// Replaces the first app system whose `runtimeType == system.runtimeType` with [system].
  E replaceSystem(AppSystem<T> system) {
    final old = _systems.where((c) => c.runtimeType == system.runtimeType).firstOrNull;
    if (old != null) _removeAppSystemInstance(old);
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
  void swapSystem<A extends AppSystem<T>>(AppSystem<T> newSystem) {
    if (hasSystem<A>()) removeSystem<A>();
    addSystem(newSystem);
  }

  /// Replaces the system registered under [type] with [newSystem] in one step.
  void swapSystemByType<B extends AppSystem<T>>(Type type, B newSystem) {
    if (hasSystemByType(type)) removeSystemByType(type);
    addSystem<B>(newSystem);
  }

  /// Registers [system] in this [App] and runs the full add lifecycle.
  void addSystem<S extends AppSystem<T>>(S system, {int? index}) {
    emit(EventAppSystemAdding(app, system));

    HookResult result = _doOnBeforeAppSystemAdd(system);

    if (result == .cancel) {
      emit(EventAppSystemAddCancelled(app, system));
      return;
    }

    result = _mergeHookResult(result, system._doOnBeforeAdd(self));

    if (result == .cancel) {
      emit(EventAppSystemAddCancelled(app, system));
      return;
    }

    system.setParent(self, force: true);

    if (result == .proceed) {
      _doOnAppSystemAdd(system);
      if (!system.isClone) system._doAdd(self);
    }

    if (index != null) {
      _systems.insert(index, system);
    } else {
      _systems.add(system);
    }

    system._doOnAfterAdd(self);
    _doOnAfterAppSystemAdd(system);
    emit(EventAppSystemAdded(app, system));
  }

  /// Returns the registered system of type [S], or `null` if absent.
  S? getSystem<S extends AppSystem<T>>() => _systems.whereType<S>().firstOrNull;

  /// Returns `true` if a system of type [S] is currently registered.
  bool hasSystem<S extends AppSystem<T>>() => _systems.any((s) => s is S);

  /// Returns `true` if a system registered under [type] is currently present.
  bool hasSystemByType(Type type) => _systems.any((c) => c.runtimeType == type);

  /// Removes the system of type [S]. No-op if absent.
  E removeSystem<S extends AppSystem<T>>() {
    final c = getSystem<S>();
    if (c != null) _removeAppSystemInstance(c);
    return self;
  }

  /// Removes the system registered under [type] and runs the full remove lifecycle.
  E removeSystemByType(Type type) {
    final system = _systems.where((c) => c.runtimeType == type).firstOrNull;
    if (system != null) _removeAppSystemInstance(system);
    return self;
  }

  void _removeAppSystemInstance(AppSystem<T> system) {
    if (!_systems.contains(system)) return;
      
    emit(EventAppSystemRemoving(app, system));

    HookResult result = _doOnBeforeAppSystemRemove(system);

    if (result == .cancel) {
      emit(EventAppSystemRemoveCancelled(app, system));
      return;
    }

    result = _mergeHookResult(result, system._doOnBeforeRemove());

    if (result == .cancel) {
      emit(EventAppSystemRemoveCancelled(app, system));
      return;
    }

    if (result == .proceed) {
      _doOnAppSystemRemove(system);
      system._doRemove();
    }
    
    _systems.remove(system);

    system._doOnAfterRemove();
    _doOnAfterAppSystemRemove(system);
    emit(EventAppSystemRemoved(app, system));
  }
}