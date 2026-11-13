part of '../../raylib_dartified_unhinged.dart';

typedef IsAnyComponentManagable<T extends App<T>> = IsComponentManagable<T, ECSBase<T>>;

mixin IsComponentManagable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  HasEntityAccess<T>,
  IsEventEmittable<T, E>,
  IsDisposable<T, E>
{
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██   ░██         
  // ░██████████ ░██     ░██ ░██     ░██ ░███████     ░████████  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██           ░██ 
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   

  /// Hook key for [IsComponentManagable]'s [onBeforeCompAdd] hooks.
  late final hookKey_onBeforeCompAdd = ECSHookKey<HookResult Function(E self, Comp<T> component)>(
    '$IsComponentManagable', 'onBeforeCompAdd'
  );

  /// Hook key for [IsComponentManagable]'s [onCompAdd] hooks.
  late final hookKey_onCompAdd = ECSHookKey<void Function(E self, Comp<T> component)>(
    '$IsComponentManagable', 'onCompAdd'
  );

  /// Hook key for [IsComponentManagable]'s [onAfterCompAdd] hooks.
  late final hookKey_onAfterCompAdd = ECSHookKey<void Function(E self, Comp<T> component)>(
    '$IsComponentManagable', 'onAfterCompAdd'
  );

  /// Hook key for [IsComponentManagable]'s [onBeforeCompRemove] hooks.
  late final hookKey_onBeforeCompRemove = ECSHookKey<HookResult Function(E self, Comp<T> component)>(
    '$IsComponentManagable', 'onBeforeCompRemove'
  );

  /// Hook key for [IsComponentManagable]'s [onCompRemove] hooks.
  late final hookKey_onCompRemove = ECSHookKey<void Function(E self, Comp<T> component)>(
    '$IsComponentManagable', 'onCompRemove'
  );

  /// Hook key for [IsComponentManagable]'s [onAfterCompRemove] hooks.
  late final hookKey_onAfterCompRemove = ECSHookKey<void Function(E self, Comp<T> component)>(
    '$IsComponentManagable', 'onAfterCompRemove'
  );

  /// Hook key for [IsComponentManagable]'s [onBeforeCompClone] hooks.
  late final hookKey_onBeforeCompClone = ECSHookKey<HookResult Function(E self, Comp<T> component)>(
    '$IsComponentManagable', 'onBeforeCompClone'
  );

  /// Hook key for [IsComponentManagable]'s [onCompClone] hooks.
  late final hookKey_onCompClone = ECSHookKey<void Function(E self, Comp<T> component)>(
    '$IsComponentManagable', 'onCompClone'
  );

  /// Hook key for [IsComponentManagable]'s [onAfterCompClone] hooks.
  late final hookKey_onAfterCompClone = ECSHookKey<void Function(E self, Comp<T> component)>(
    '$IsComponentManagable', 'onAfterCompClone'
  );

  /// Hook key for [IsComponentManagable]'s [onPreCompUpdate] hooks.
  late final hookKey_onPreCompUpdate = ECSHookKey<HookResult Function(E self, Comp<T> component)>(
    '$IsComponentManagable', 'onPreCompUpdate'
  );

  /// Hook key for [IsComponentManagable]'s [onPostCompUpdate] hooks.
  late final hookKey_onPostCompUpdate = ECSHookKey<void Function(E self, Comp<T> component)>(
    '$IsComponentManagable', 'onPostCompUpdate'
  );

  /// Hook key for [IsComponentManagable]'s [onPreCompDraw] hooks.
  late final hookKey_onPreCompDraw = ECSHookKey<HookResult Function(E self, Comp<T> component)>(
    '$IsComponentManagable', 'onPreCompDraw'
  );

  /// Hook key for [IsComponentManagable]'s [onPostCompDraw] hooks.
  late final hookKey_onPostCompDraw = ECSHookKey<void Function(E self, Comp<T> component)>(
    '$IsComponentManagable', 'onPostCompDraw'
  );

  /// Registers [fn] as a before-comp-add listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeCompAdd(HookResult Function(E self, Comp<T> component) fn) {
    addHook(hookKey_onBeforeCompAdd, fn);
    return self;
  }

  @nonVirtual
  E listenOnCompAdd(void Function(E self, Comp<T> component) fn) {
    addHook(hookKey_onCompAdd, fn);
    return self;
  }

  @nonVirtual
  E listenOnAfterCompAdd(void Function(E self, Comp<T> component) fn) {
    addHook(hookKey_onAfterCompAdd, fn);
    return self;
  }

  /// Registers [fn] as a before-comp-remove listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeCompRemove(HookResult Function(E self, Comp<T> component) fn) {
    addHook(hookKey_onBeforeCompRemove, fn);
    return self;
  }

  @nonVirtual
  E listenOnCompRemove(void Function(E self, Comp<T> component) fn) {
    addHook(hookKey_onCompRemove, fn);
    return self;
  }

  @nonVirtual
  E listenOnAfterCompRemove(void Function(E self, Comp<T> component) fn) {
    addHook(hookKey_onAfterCompRemove, fn);
    return self;
  }

  /// Registers [fn] as a before-comp-clone listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeCompClone(HookResult Function(E self, Comp<T> component) fn) {
    addHook(hookKey_onBeforeCompClone, fn);
    return self;
  }

  @nonVirtual
  E listenOnCompClone(void Function(E self, Comp<T> component) fn) {
    addHook(hookKey_onCompClone, fn);
    return self;
  }

  @nonVirtual
  E listenOnAfterCompClone(void Function(E self, Comp<T> component) fn) {
    addHook(hookKey_onAfterCompClone, fn);
    return self;
  }

  /// Registers [fn] as a pre-comp-update listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnPreCompUpdate(HookResult Function(E self, Comp<T> component) fn) {
    addHook(hookKey_onPreCompUpdate, fn);
    return self;
  }

  @nonVirtual
  E listenOnPostCompUpdate(void Function(E self, Comp<T> component) fn) {
    addHook(hookKey_onPostCompUpdate, fn);
    return self;
  }

  /// Registers [fn] as a pre-comp-draw listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnPreCompDraw(HookResult Function(E self, Comp<T> component) fn) {
    addHook(hookKey_onPreCompDraw, fn);
    return self;
  }

  E listenOnPostCompDraw(void Function(E self, Comp<T> component) fn) {
    addHook(hookKey_onPostCompDraw, fn);
    return self;
  }

  /// Runs all before-comp-add listeners and [onBeforeCompAdd], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeCompAdd(Comp<T> component) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeCompAdd)) {
      result = _mergeHookResult(result, f(self, component));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeCompAdd(component));
  }
  
  @mustCallSuper
  void _doOnCompAdd(Comp<T> component) {
    hooksOf(hookKey_onCompAdd).forEach((f) => f(self, component));
    onCompAdd(component);
  }

  @mustCallSuper
  void _doOnAfterCompAdd(Comp<T> component) {
    hooksOf(hookKey_onAfterCompAdd).forEach((f) => f(self, component));
    onAfterCompAdd(component);
  }

  /// Runs all before-comp-remove listeners and [onBeforeCompRemove], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeCompRemove(Comp<T> component) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeCompRemove)) {
      result = _mergeHookResult(result, f(self, component));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeCompRemove(component));
  }

  @mustCallSuper
  void _doOnCompRemove(Comp<T> component) {
    hooksOf(hookKey_onCompRemove).forEach((f) => f(self, component));
    onCompRemove(component);
  }

  @mustCallSuper
  void _doOnAfterCompRemove(Comp<T> component) {
    hooksOf(hookKey_onAfterCompRemove).forEach((f) => f(self, component));
    onAfterCompRemove(component);
  }

  /// Runs all before-comp-clone listeners and [onBeforeCompClone], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeCompClone(Comp<T> component) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeCompClone)) {
      result = _mergeHookResult(result, f(self, component));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeCompClone(component));
  }

  @mustCallSuper
  void _doOnCompClone(Comp<T> component) {
    hooksOf(hookKey_onCompClone).forEach((f) => f(self, component));
    onCompClone(component);
  }

  @mustCallSuper
  void _doOnAfterCompClone(Comp<T> component) {
    hooksOf(hookKey_onAfterCompClone).forEach((f) => f(self, component));
    onAfterCompClone(component);
  }

  /// Runs all pre-comp-update listeners and [onPreCompUpdate], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnPreCompUpdate(Comp<T> component) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onPreCompUpdate)) {
      result = _mergeHookResult(result, f(self, component));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onPreCompUpdate(component));
  }

  void _doOnPostCompUpdate(Comp<T> component) {
    hooksOf(hookKey_onPostCompUpdate).forEach((f) => f(self, component));
    return onPostCompUpdate(component);
  }

  /// Runs all pre-comp-draw listeners and [onPreCompDraw], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnPreCompDraw(Comp<T> component) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onPreCompDraw)) {
      result = _mergeHookResult(result, f(self, component));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onPreCompDraw(component));
  }

  void _doOnPostCompDraw(Comp<T> component) {
    hooksOf(hookKey_onPostCompDraw).forEach((f) => f(self, component));
    return onPostCompDraw(component);
  }

  /// Override to intercept the before-comp-add phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeCompAdd] listeners.
  HookResult onBeforeCompAdd(Comp<T> component) => .proceed;

  void onCompAdd(Comp<T> component) {}

  void onAfterCompAdd(Comp<T> component) {}

  /// Override to intercept the before-comp-remove phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeCompRemove] listeners.
  HookResult onBeforeCompRemove(Comp<T> component) => .proceed;

  void onCompRemove(Comp<T> component) {}

  void onAfterCompRemove(Comp<T> component) {}

  /// Override to intercept the before-comp-clone phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeCompClone] listeners.
  HookResult onBeforeCompClone(Comp<T> copy) => .proceed;

  void onCompClone(Comp<T> copy) {}

  void onAfterCompClone(Comp<T> copy) {}

  /// Override to intercept the pre-comp-update phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnPreCompUpdate] listeners.
  HookResult onPreCompUpdate(Comp<T> component) => .proceed;

  void onPostCompUpdate(Comp<T> component) {}

  /// Override to intercept the pre-comp-draw phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnPreCompDraw] listeners.
  HookResult onPreCompDraw(Comp<T> component) => .proceed;

  void onPostCompDraw(Comp<T> component) {}

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
    if (event.scope == .sceneOnly) return false;

    if (_doEventVisitedCheck(event)) return true;
    if (event.isStopped) return true;

    if (_doEventSelfCheck(event)) return true;
    if (event.isStopped) return true;

    if (event.scope == .local || event.scope == .rootAndLocal) {
      _doOnEvent(event);

      for (final c in _components) {
        if (event.isStopped) return true;
        c._propagate(event);
      }

      if (event.isStopped) return true;

      // `.local` must never leave this subtree, always stop.
      // `.rootAndLocal` is done, but if this IS the origin, it still owes a trip to App
      if (event.scope == .rootAndLocal) {
        return event.origin != self;
      }

      return true;
    } else if (event.scope != .globalNoEntities) {
      _doOnEvent(event);
    }

    for (final c in _components) {
      if (event.isStopped) return true;
      c._propagate(event);
    }

    if (event.isStopped) return true;

    return event.origin != self;
  }

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  final List<Comp<T>> _components = [];

  /// Returns the top-level components attached directly to this entity/component
  /// (does not recurse into nested components).
  Iterable<Comp<T>> getComponents() => _components;

  bool get _isInstanceDisabled;

  void _updateChildComponents(double dt) {
    for (final c in _components) {
      if (_isInstanceDisabled) return;

      final result = _doOnPreCompUpdate(c);
      if (_isInstanceDisabled) return;

      if (result == .cancel) continue;

      if (result == .proceed) {
        c._doComponentUpdate(dt);
      }

      if (_isInstanceDisabled) return;
      _doOnPostCompUpdate(c);
    }
  }

  void _drawChildComponents(double dt) {
    for (final c in _components) {
      if (_isInstanceDisabled) return;

      final result = _doOnPreCompDraw(c);
      if (_isInstanceDisabled) return;

      if (result == .cancel) continue;

      if (result == .proceed) {
        c._doDraw(dt);
      }

      if (_isInstanceDisabled) return;
      _doOnPostCompDraw(c);
    }
  }

  // ──────────
  // ACTIVATION
  // ──────────

  /// Activates every top-level component of type [C].
  E enable<C extends Comp<T>>() {
    getAll<C>().forEach((c) => c.setEnabled(true));
    return self;
  }

  /// Activates all top-level components.
  E enableAll() {
    _components.forEach((c) => c.setEnabled(true));
    return self;
  }

  /// Recursively activates every component, including nested ones.
  E enableEverything() {
    _components.forEach((c) {
      c.setEnabled(true);
      c.enableEverything();
    });
    return self;
  }

  /// Deactivates every top-level component of type [C].
  E disable<C extends Comp<T>>() {
    getAll<C>().forEach((c) => c.setEnabled(false));
    return self;
  }

  /// Deactivates all top-level components (not nested).
  E disableAll() {
    _components.forEach((c) => c.setEnabled(false));
    return self;
  }

  /// Recursively deactivates every component, including nested ones.
  E disableEverything() {
    _components.forEach((c) {
      c.setEnabled(false);
      c.disableEverything();
    });
    return self;
  }

  // ────────
  // MUTATION
  // ────────

  /// Replaces the first top-level component of type [A] with [newC].
  /// No-op if no component of type [A] exists.
  E swap<A extends Comp<T>>(Comp<T> newC) {
    final old = get<A>();
    if (old == null) return self;
    _removeComponentInstance(old);
    add(newC);
    return self;
  }

  /// Removes all the top-level components of type [A] and adds [newC].
  /// No-op if no component of type [A] exists.
  E swapAll<A extends Comp<T>>(Comp<T> newC) {
    final oldComps = getAll<A>();
    if (oldComps.isEmpty) return self;
    oldComps.forEach(_removeComponentInstance);
    add(newC);
    return self;
  }

  /// Replaces the first top-level component whose `runtimeType == component.runtimeType` with [component].
  E replace(Comp<T> component) {
    final old = _components.where((c) => c.runtimeType == component.runtimeType).firstOrNull;
    if (old != null) _removeComponentInstance(old);
    add(component);
    return self;
  }

  /// Adds [component] as a new top-level component.
  E add<C extends Comp<T>>(C component, {int? index}) {
    emit(EventCompAdding(app, entity, component));

    HookResult result = _doOnBeforeCompAdd(component);

    if (result == .cancel) {
      emit(EventCompAddCancelled(app, entity, component));
      return self;
    }

    result = _mergeHookResult(result, component._doOnBeforeAdd(self));

    if (result == .cancel) {
      emit(EventCompAddCancelled(app, entity, component));
      return self;
    }

    component.setParent(self, force: true);
    component.entity = entity;

    if (result == .proceed) {
      _doOnCompAdd(component);
      if (!component.isClone) component._doAdd(self);
    }

    if (index != null) {
      _components.insert(index, component);
    } else {
      _components.add(component);
    }

    component._doOnAfterAdd(self);
    _doOnAfterCompAdd(component);
    emit(EventCompAdded(app, entity, component));
    return self;
  }

  /// Adds [component] only if no top-level component of type [C] already exists.
  E addIfNotExists<C extends Comp<T>>(C component) {
    if (!has<C>()) add(component);
    return self;
  }

  /// Removes the first top-level component matching type [C].
  E remove<C extends Comp<T>>() {
    final c = get<C>();
    if (c != null) _removeComponentInstance(c);
    return self;
  }

  /// Removes the exact component.
  E removeExact(Comp<T> component) {
    if (!_components.any((c) => identical(c, component))) return self;
    _removeComponentInstance(component);
    return self;
  }

  /// Removes the first top-level component whose `runtimeType == type`.
  E removeByType(Type type) {
    final component = _components.where((c) => c.runtimeType == type).firstOrNull;
    if (component != null) _removeComponentInstance(component);
    return self;
  }

  /// Removes all top-level components matching type [C].
  E removeAll<C extends Comp<T>>() {
    getAll<C>().toList().forEach(_removeComponentInstance);
    return self;
  }

  /// Removes every top-level component.
  E removeEverything() {
    _components.toList().forEach(_removeComponentInstance);
    return self;
  }

  // the actual removal logic, now keyed by identity instead of type
  E _removeComponentInstance(Comp<T> component) {
    if (!_components.contains(component)) return self;

    emit(EventCompRemoving(app, entity, component));

    HookResult result = _doOnBeforeCompRemove(component);

    if (result == .cancel) {
      emit(EventCompRemoveCancelled(app, entity, component));
      return self;
    }

    result = _mergeHookResult(result, component._doOnBeforeRemove());

    if (result == .cancel) {
      emit(EventCompRemoveCancelled(app, entity, component));
      return self;
    }

    if (result == .proceed) {
      _doOnCompRemove(component);
      component._doRemove();
    }

    _components.remove(component);

    component._doOnAfterRemove();
    _doOnAfterCompRemove(component);
    emit(EventCompRemoved(app, entity, component));
    return self;
  }

  // ──────
  // LOOKUP
  // ──────

  /// Returns the first top-level component matching type [C], or `null`.
  C? get<C extends Comp<T>>() => _components.whereType<C>().firstOrNull;

  /// Returns all top-level components matching type [C].
  List<C> getAll<C extends Comp<T>>() => _components.whereType<C>().toList();
  
  /// Invokes [callback] with the first top-level component matching type [C],
  /// if one exists.
  E on<
    C extends Comp<T>
  >(void Function(C) callback) {
    final a = get<C>();
    if (a == null) return self;
    callback(a);
    return self;
  }
  
  /// Invokes [callback] with the first top-level components matching types
  /// [A] and [B], if both exist.
  E on2<
    A extends Comp<T>,
    B extends Comp<T>
  >(
    void Function(A, B) callback
  ) {
    final a = get<A>(), b = get<B>();
    if (a == null || b == null) return self;
    callback(a, b);
    return self;
  }
  
  /// Invokes [callback] with the first top-level components matching types
  /// [A], [B], and [C], if all three exist.
  E on3<
    A extends Comp<T>,
    B extends Comp<T>,
    C extends Comp<T>
  >(
    void Function(A, B, C) callback
  ) {
    final a = get<A>(), b = get<B>(), c = get<C>();
    if (a == null || b == null || c == null) return self;
    callback(a, b, c);
    return self;
  }
  
  /// Invokes [callback] with every top-level component matching type [C].
  E onAll<C extends Comp<T>>(void Function(List<C> components) callback) {
    final found = getAll<C>();
    if (found.isNotEmpty) callback(found);
    return self;
  }

  // ────────────────
  // EXISTENCE CHECKS
  // ────────────────

  /// Whether a top-level component of type [C] exists.
  bool has<C extends Comp<T>>() => _components.any((s) => s is C);
  
  /// Whether a top-level component whose `runtimeType == type` exists.
  bool hasByType(Type type) => _components.any((c) => c.runtimeType == type);

  /// Whether a top-level component of type [A] OR type [B] exists.
  bool hasAny<
    A extends Comp<T>,
    B extends Comp<T>
  >() => has<A>() || has<B>();

  /// Whether top-level components of BOTH type [A] and type [B] exist.
  bool has2<
    A extends Comp<T>,
    B extends Comp<T>
  >() => has<A>() && has<B>();

  /// Whether top-level components whose `runtimeType` matches both [a] and [b]
  /// exist.
  bool has2ByType(Type a, Type b) => hasByType(a) && hasByType(b);

  /// Whether top-level components of types [A], [B], and [C] all exist.
  bool has3<
    A extends Comp<T>,
    B extends Comp<T>,
    C extends Comp<T>
  >() => has<A>() && has<B>() && has<C>();

  /// Whether top-level components whose `runtimeType` matches [a], [b], and [c]
  /// all exist.
  bool has3ByType(Type a, Type b, Type c) => hasByType(a) && hasByType(b) && hasByType(c);

  // ───────
  // SPECIAL
  // ───────

  void mergeCompsInto<X extends IsAnyComponentManagable<T>>(X into, {
    ClonePolicy<T>? policy,
    bool replaceComponents = true,
  }) {
    _components.forEach((childComp) {
      if (!(policy?.allowComp(into, childComp) ?? true)) return;

      _doCloneComp(
        to: into,
        what: childComp,
        policy: policy,
        replaceComponent: replaceComponents,
      );
    });
  }

  // ░███    ░██ ░██████████   ░██████   ░██████████░██████████ ░███████   
  // ░████   ░██ ░██          ░██   ░██      ░██    ░██         ░██   ░██  
  // ░██░██  ░██ ░██         ░██             ░██    ░██         ░██    ░██ 
  // ░██ ░██ ░██ ░█████████   ░████████      ░██    ░█████████  ░██    ░██ 
  // ░██  ░██░██ ░██                 ░██     ░██    ░██         ░██    ░██ 
  // ░██   ░████ ░██          ░██   ░██      ░██    ░██         ░██   ░██  
  // ░██    ░███ ░██████████   ░██████       ░██    ░██████████ ░███████   

  /// Recursively collects every component in this subtree, including nested ones.
  List<Comp<T>> getEverything() {
    final result = <Comp<T>>[];
    for (final comp in _components) {
      result.add(comp);
      result.addAll(comp.getEverything());
    }
    return result;
  }

  /// Recursively finds the first component of type [C] in this subtree.
  C? find<C extends Comp<T>>() {
    final topLevel = get<C>();
    if (topLevel != null) return topLevel;

    for (final comp in _components) {
      final subComp = comp.find<C>();
      if (subComp != null) return subComp;
    }

    return null;
  }

  /// Whether a component of type [C] exists anywhere in this subtree.
  bool contains<C extends Comp<T>>() => find<C>() != null;

  /// Recursively finds every component of type [C] in this subtree.
  Iterable<C> findAll<C extends Comp<T>>() {
    List<C> found = [];

    found.addAll(getAll<C>());

    for (final comp in _components) {
      found.addAll(comp.findAll<C>());
    }

    return found;
  }

  /// Recursively finds every component that itself *contains* a nested
  /// component of type [C] (i.e. returns the containing components, not
  /// the matches themselves).
  Iterable<Comp<T>> findAllWith<C extends Comp<T>>() {
    List<Comp<T>> found = [];

    for (final comp in _components) {
      if (comp.contains<C>()) {
        found.add(comp);
      }

      found.addAll(comp.findAllWith<C>());
    }
    
    return found;
  }

  /// Walks up the hierarchy and returns the nearest ancestor component of
  /// type [C], if any.
  C? findInParent<C extends Comp<T>>() {
    var current = parent;
    while (current != null && current is IsAnyComponentManagable<T>) {
      final comp = current.get<C>();
      if (comp != null) return comp;
      current = current.parent;
    }
    return null;
  }

  /// Returns sibling components at the same level as this one.
  Iterable<C> findSiblings<C extends Comp<T>>() {
    if (parent == null) return [];
    if (parent case IsAnyComponentManagable<T> parent) {
      return parent.getAll<C>().where((c) => c != self);
    }
    return [];
  }

  /// Finds the first direct child component of type [C] (non-recursive).
  C? findInChildren<C extends Comp<T>>() {
    for (final comp in _components) {
      final found = comp.get<C>();
      if (found != null) return found;
    }
    return null;
  }

  /// Finds the closest component of type [C] via breadth-first search.
  C? findNearest<C extends Comp<T>>() {
    // check self first
    final self = get<C>();
    if (self != null) return self;

    // check parent chain
    final inParent = findInParent<C>();
    if (inParent != null) return inParent;

    // check children
    return find<C>();
  }

  /// Recursively removes every component of type [C] from this subtree.
  void removeNested<C extends Comp<T>>() {
    remove<C>();
    for (final comp in _components) {
      comp.removeNested<C>();
    }
  }

  /// Recursively counts every component of type [C] in this subtree.
  int countAll<C extends Comp<T>>() {
    int count = getAll<C>().length;
    for (final comp in _components) {
      count += comp.countAll<C>();
    }
    return count;
  }

  /// Recursively invokes [callback] on every component of type [C] in this subtree.
  void forEachRecursive<C extends Comp<T>>(void Function(C) callback) {
    for (final comp in getAll<C>()) {
      callback(comp);
    }
    for (final comp in _components) {
      comp.forEachRecursive<C>(callback);
    }
  }

  /// Recursively finds the first component of type [C] satisfying [predicate].
  C? findWhere<C extends Comp<T>>(bool Function(C) predicate) {
    for (final comp in getAll<C>()) {
      if (predicate(comp)) return comp;
    }
    for (final comp in _components) {
      final found = comp.findWhere<C>(predicate);
      if (found != null) return found;
    }
    return null;
  }

  /// Returns every leaf component in this subtree (components with no children).
  Iterable<Comp<T>> getLeaves() {
    List<Comp<T>> leaves = [];
    for (final comp in _components) {
      if (comp._components.isEmpty) {
        leaves.add(comp);
      } else {
        leaves.addAll(comp.getLeaves());
      }
    }
    return leaves;
  }

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  @nonVirtual
  @pragma('vm:prefer-inline')
  void _doCloneComp({
    required IsAnyComponentManagable<T> to,
    required Comp<T> what,
    ClonePolicy<T>? policy,
    bool replaceComponent = false,
  }) {
    if (!what.isCloneable) return;

    HookResult result = _doOnBeforeCompClone(what);
    if (result == .cancel) return;
    
    if (result == .proceed) _doOnCompClone(what);

    // This clone() call ALREADY does everything.
    // Returns the fully cloned component
    final fullyClonedComp = what.clone(policy);

    if (replaceComponent) {
      to.replace(fullyClonedComp);
    } else {
      to.add(fullyClonedComp);
    }
    
    // Post-clone hook for the parent
    _doOnAfterCompClone(what);
  }

  @override
  @mustCallSuper
  void _doOnDispose() {
    _components.forEach((s) => s._doOnDispose());
    super._doOnDispose();
  }
}