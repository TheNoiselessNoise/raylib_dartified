part of '../../raylib_dartified_unhinged.dart';

typedef IsAnyEntityManagable<T extends App<T>> = IsEntityManagable<T, ECSBase<T>, Entity<T>>;

/// Adds entity add/remove lifecycle hooks to a [Scene] or [EntityGroup].
///
/// Covers two events: entity add and entity remove, each with a full three-phase contract:
/// - **before** => cancelable; any listener or override returning `false` aborts the operation
/// - **on** => the operation is about to complete; called by the host after all before-checks pass
/// - **after** => the operation has completed; side-effects and cleanup go here
///
/// Note: this mixin bypasses the standard [Self] pattern due to [Entity] baking
/// in `Self<Entity<T>>` unconditionally. See [self] for details.
mixin IsEntityManagable<
  T extends App<T>,
  E extends ECSBase<T>,
  I extends Entity<T>
> on
  ECSBase<T>
{
  // [Entity<T>] bakes in [Self<Entity<T>>] unconditionally, so its `self`
  // getter is always typed as [Entity<T>], not [E]. We can't override it with
  // a more specific type due to contravariance, so we bypass it entirely with
  // a direct cast. Safe as long as any concrete class mixing this in is [E].
  E get self => this as E;

  // [Entity<T>] bakes in [IsEventEmittable<T, Entity<T>>], which means `emit` is
  // already satisfied by the time the mixin linearizer reaches us. Re-declaring
  // it here as abstract forces the compiler to verify the method exists on the
  // concrete class without us having to inherit the specific host type.
  void emit(Event<T> event, {EventScope scope = .local});

  // [Entity<T>] bakes in [IsEventEmittable<T, Entity<T>>], which means `dispatch` is
  // already satisfied by the time the mixin linearizer reaches us. Re-declaring
  // it here as abstract forces the compiler to verify the method exists on the
  // concrete class without us having to inherit the specific host type.
  void dispatch(Event<T> event, {EventScope scope = .local});

  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██   ░██         
  // ░██████████ ░██     ░██ ░██     ░██ ░███████     ░████████  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██           ░██ 
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   

  /// Hook key for [IsEntityManagable]'s [onBeforeEntityAdd] hooks.
  late final hookKey_onBeforeEntityAdd = ECSHookKey<HookResult Function(E self, I entity)>(
    '$IsEntityManagable', 'onBeforeEntityAdd'
  );

  /// Hook key for [IsEntityManagable]'s [onEntityAdd] hooks.
  late final hookKey_onEntityAdd = ECSHookKey<void Function(E self, I entity)>(
    '$IsEntityManagable', 'onEntityAdd'
  );

  /// Hook key for [IsEntityManagable]'s [onAfterEntityAdd] hooks.
  late final hookKey_onAfterEntityAdd = ECSHookKey<void Function(E self, I entity)>(
    '$IsEntityManagable', 'onAfterEntityAdd'
  );

  /// Hook key for [IsEntityManagable]'s [onBeforeEntityRemove] hooks.
  late final hookKey_onBeforeEntityRemove = ECSHookKey<HookResult Function(E self, I entity)>(
    '$IsEntityManagable', 'onBeforeEntityRemove'
  );

  /// Hook key for [IsEntityManagable]'s [onEntityRemove] hooks.
  late final hookKey_onEntityRemove = ECSHookKey<void Function(E self, I entity)>(
    '$IsEntityManagable', 'onEntityRemove'
  );

  /// Hook key for [IsEntityManagable]'s [onAfterEntityRemove] hooks.
  late final hookKey_onAfterEntityRemove = ECSHookKey<void Function(E self, I entity)>(
    '$IsEntityManagable', 'onAfterEntityRemove'
  );

  /// Hook key for [IsEntityManagable]'s [onBeforeEntityAttach] hooks.
  late final hookKey_onBeforeEntityAttach = ECSHookKey<HookResult Function(E self, I entity)>(
    '$IsEntityManagable', 'onBeforeEntityAttach'
  );

  /// Hook key for [IsEntityManagable]'s [onEntityAttach] hooks.
  late final hookKey_onEntityAttach = ECSHookKey<void Function(E self, I entity)>(
    '$IsEntityManagable', 'onEntityAttach'
  );

  /// Hook key for [IsEntityManagable]'s [onAfterEntityAttach] hooks.
  late final hookKey_onAfterEntityAttach = ECSHookKey<void Function(E self, I entity)>(
    '$IsEntityManagable', 'onAfterEntityAttach'
  );

  /// Hook key for [IsEntityManagable]'s [onBeforeEntityDetach] hooks.
  late final hookKey_onBeforeEntityDetach = ECSHookKey<HookResult Function(E self, I entity)>(
    '$IsEntityManagable', 'onBeforeEntityDetach'
  );

  /// Hook key for [IsEntityManagable]'s [onEntityDetach] hooks.
  late final hookKey_onEntityDetach = ECSHookKey<void Function(E self, I entity)>(
    '$IsEntityManagable', 'onEntityDetach'
  );

  /// Hook key for [IsEntityManagable]'s [onAfterEntityDetach] hooks.
  late final hookKey_onAfterEntityDetach = ECSHookKey<void Function(E self, I entity)>(
    '$IsEntityManagable', 'onAfterEntityDetach'
  );

  /// Hook key for [IsEntityManagable]'s [onPreEntityUpdate] hooks.
  late final hookKey_onPreEntityUpdate = ECSHookKey<HookResult Function(E self, Entity<T> entity)>(
    '$IsEntityManagable', 'onPreEntityUpdate'
  );

  /// Hook key for [IsEntityManagable]'s [onPostEntityUpdate] hooks.
  late final hookKey_onPostEntityUpdate = ECSHookKey<void Function(E self, Entity<T> entity)>(
    '$IsEntityManagable', 'onPostEntityUpdate'
  );

  /// Hook key for [IsEntityManagable]'s [onPreEntityDraw] hooks.
  late final hookKey_onPreEntityDraw = ECSHookKey<HookResult Function(E self, Entity<T> entity)>(
    '$IsEntityManagable', 'onPreEntityDraw'
  );

  /// Hook key for [IsEntityManagable]'s [onPostEntityDraw] hooks.
  late final hookKey_onPostEntityDraw = ECSHookKey<void Function(E self, Entity<T> entity)>(
    '$IsEntityManagable', 'onPostEntityDraw'
  );

  /// Registers [fn] as a before-entity-add listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeEntityAdd(HookResult Function(E self, I entity) fn) {
    addHook(hookKey_onBeforeEntityAdd, fn);
    return self;
  }

  /// Registers [fn] as an add listener.
  ///
  /// Called when the add operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnEntityAdd(void Function(E self, I entity) fn) {
    addHook(hookKey_onEntityAdd, fn);
    return self;
  }

  /// Registers [fn] as an after-add listener.
  ///
  /// Called only if the entity add was not canceled.
  @nonVirtual
  E listenOnAfterEntityAdd(void Function(E self, I entity) fn) {
    addHook(hookKey_onAfterEntityAdd, fn);
    return self;
  }

  /// Registers [fn] as a before-entity-remove listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeEntityRemove(HookResult Function(E self, I entity) fn) {
    addHook(hookKey_onBeforeEntityRemove, fn);
    return self;
  }

  /// Registers [fn] as a remove listener.
  ///
  /// Called when the remove operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnEntityRemove(void Function(E self, I entity) fn) {
    addHook(hookKey_onEntityRemove, fn);
    return self;
  }

  /// Registers [fn] as an after-remove listener.
  ///
  /// Called only if the entity remove was not canceled.
  @nonVirtual
  E listenOnAfterEntityRemove(void Function(E self, I entity) fn) {
    addHook(hookKey_onAfterEntityRemove, fn);
    return self;
  }

  /// Registers [fn] as a before-entity-attach listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeEntityAttach(HookResult Function(E self, I entity) fn) {
    addHook(hookKey_onBeforeEntityAttach, fn);
    return self;
  }

  /// Registers [fn] as an attach listener.
  ///
  /// Called when the attach operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnEntityAttach(void Function(E self, I entity) fn) {
    addHook(hookKey_onEntityAttach, fn);
    return self;
  }

  /// Registers [fn] as an after-attach listener.
  ///
  /// Called only if the entity attach was not canceled.
  @nonVirtual
  E listenOnAfterEntityAttach(void Function(E self, I entity) fn) {
    addHook(hookKey_onAfterEntityAttach, fn);
    return self;
  }

  /// Registers [fn] as a before-entity-detach listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnBeforeEntityDetach(HookResult Function(E self, I entity) fn) {
    addHook(hookKey_onBeforeEntityDetach, fn);
    return self;
  }

  /// Registers [fn] as a detach listener.
  ///
  /// Called when the detach operation is about to happen and was not canceled.
  @nonVirtual
  E listenOnEntityDetach(void Function(E self, I entity) fn) {
    addHook(hookKey_onEntityDetach, fn);
    return self;
  }

  /// Registers [fn] as an after-detach listener.
  ///
  /// Called only if the entity detach was not canceled.
  @nonVirtual
  E listenOnAfterEntityDetach(void Function(E self, I entity) fn) {
    addHook(hookKey_onAfterEntityDetach, fn);
    return self;
  }

  /// Registers [fn] as a pre-entity-update listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnPreEntityUpdate(HookResult Function(E self, Entity<T> entity) fn) {
    addHook(hookKey_onPreEntityUpdate, fn);
    return self;
  }

  @nonVirtual
  E listenOnPostEntityUpdate(void Function(E self, Entity<T> entity) fn) {
    addHook(hookKey_onPostEntityUpdate, fn);
    return self;
  }

  /// Registers [fn] as a pre-entity-draw listener.
  ///
  /// [fn] returns a [HookResult] to control execution flow.
  @nonVirtual
  E listenOnPreEntityDraw(HookResult Function(E self, Entity<T> entity) fn) {
    addHook(hookKey_onPreEntityDraw, fn);
    return self;
  }

  E listenOnPostEntityDraw(void Function(E self, Entity<T> entity) fn) {
    addHook(hookKey_onPostEntityDraw, fn);
    return self;
  }

  /// Runs all before-entity-add listeners and [onBeforeEntityAdd], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeEntityAdd(I entity) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeEntityAdd)) {
      result = _mergeHookResult(result, f(self, entity));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeEntityAdd(entity));
  }

  /// Runs all add listeners and [onEntityAdd].
  @mustCallSuper
  void _doOnEntityAdd(I entity) {
    hooksOf(hookKey_onEntityAdd).forEach((f) => f(self, entity));
    onEntityAdd(entity);
  }

  /// Runs all after-add listeners and [onAfterEntityAdd].
  @mustCallSuper
  void _doOnAfterEntityAdd(I entity) {
    hooksOf(hookKey_onAfterEntityAdd).forEach((f) => f(self, entity));
    onAfterEntityAdd(entity);
  }

  /// Runs all before-entity-remove listeners and [onBeforeEntityRemove], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeEntityRemove(I entity) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeEntityRemove)) {
      result = _mergeHookResult(result, f(self, entity));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeEntityRemove(entity));
  }

  /// Runs all remove listeners and [onEntityRemove].
  @mustCallSuper
  void _doOnEntityRemove(I entity) {
    hooksOf(hookKey_onEntityRemove).forEach((f) => f(self, entity));
    onEntityRemove(entity);
  }

  /// Runs all after-remove listeners and [onAfterEntityRemove].
  @mustCallSuper
  void _doOnAfterEntityRemove(I entity) {
    hooksOf(hookKey_onAfterEntityRemove).forEach((f) => f(self, entity));
    onAfterEntityRemove(entity);
  }

  /// Runs all before-entity-attach listeners and [onBeforeEntityAttach], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeEntityAttach(I entity) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeEntityAttach)) {
      result = _mergeHookResult(result, f(self, entity));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeEntityAttach(entity));
  }

  /// Runs all attach listeners and [onEntityAttach].
  @mustCallSuper
  void _doOnEntityAttach(I entity) {
    hooksOf(hookKey_onEntityAttach).forEach((f) => f(self, entity));
    onEntityAttach(entity);
  }

  /// Runs all after-attach listeners and [onAfterEntityAttach].
  @mustCallSuper
  void _doOnAfterEntityAttach(I entity) {
    hooksOf(hookKey_onAfterEntityAttach).forEach((f) => f(self, entity));
    onAfterEntityAttach(entity);
  }

  /// Runs all before-entity-detach listeners and [onBeforeEntityDetach], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnBeforeEntityDetach(I entity) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onBeforeEntityDetach)) {
      result = _mergeHookResult(result, f(self, entity));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onBeforeEntityDetach(entity));
  }

  /// Runs all detach listeners and [onEntityDetach].
  @mustCallSuper
  void _doOnEntityDetach(I entity) {
    hooksOf(hookKey_onEntityDetach).forEach((f) => f(self, entity));
    onEntityDetach(entity);
  }

  /// Runs all after-detach listeners and [onAfterEntityDetach].
  @mustCallSuper
  void _doOnAfterEntityDetach(I entity) {
    hooksOf(hookKey_onAfterEntityDetach).forEach((f) => f(self, entity));
    onAfterEntityDetach(entity);
  }

  /// Runs all pre-entity-update listeners and [onPreEntityUpdate], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnPreEntityUpdate(Entity<T> entity) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onPreEntityUpdate)) {
      result = _mergeHookResult(result, f(self, entity));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onPreEntityUpdate(entity));
  }

  void _doOnPostEntityUpdate(Entity<T> entity) {
    hooksOf(hookKey_onPostEntityUpdate).forEach((f) => f(self, entity));
    return onPostEntityUpdate(entity);
  }

  /// Runs all pre-entity-draw listeners and [onPreEntityDraw], combining their [HookResult] decisions.
  ///
  /// Prioritizes [HookResult.cancel], followed by [HookResult.skip], defaulting to [HookResult.proceed].
  @mustCallSuper
  HookResult _doOnPreEntityDraw(Entity<T> entity) {
    HookResult result = .proceed;
    for (final f in hooksOf(hookKey_onPreEntityDraw)) {
      result = _mergeHookResult(result, f(self, entity));
      if (result == .cancel) return result;
    }
    return _mergeHookResult(result, onPreEntityDraw(entity));
  }

  void _doOnPostEntityDraw(Entity<T> entity) {
    hooksOf(hookKey_onPostEntityDraw).forEach((f) => f(self, entity));
    return onPostEntityDraw(entity);
  }

  /// Override to intercept the before-entity-add phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeEntityAdd] listeners.
  HookResult onBeforeEntityAdd(I entity) => .proceed;

  /// Override to react when an entity add is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  void onEntityAdd(I entity) {}

  /// Override to react after an entity add has completed.
  ///
  /// Called after all registered [listenOnAfterEntityAdd] listeners.
  void onAfterEntityAdd(I entity) {}

  /// Override to intercept the before-entity-remove phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeEntityRemove] listeners.
  HookResult onBeforeEntityRemove(I entity) => .proceed;

  /// Override to react when an entity remove is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  void onEntityRemove(I entity) {}

  /// Override to react after an entity remove has completed.
  ///
  /// Called after all registered [listenOnAfterEntityRemove] listeners.
  void onAfterEntityRemove(I entity) {}

  /// Override to intercept the before-entity-attach phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeEntityAttach] listeners.
  HookResult onBeforeEntityAttach(I entity) => .proceed;

  /// Override to react when an entity attach is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  void onEntityAttach(I entity) {}

  /// Override to react after an entity attach has completed.
  ///
  /// Called after all registered [listenOnAfterEntityAttach] listeners.
  void onAfterEntityAttach(I entity) {}

  /// Override to intercept the before-entity-detach phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnBeforeEntityDetach] listeners.
  HookResult onBeforeEntityDetach(I entity) => .proceed;

  /// Override to react when an entity detach is about to complete.
  ///
  /// Called by the host after all before-checks have passed.
  void onEntityDetach(I entity) {}

  /// Override to react after an entity detach has completed.
  ///
  /// Called after all registered [listenOnAfterEntityDetach] listeners.
  void onAfterEntityDetach(I entity) {}

  /// Override to intercept the pre-entity-update phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnPreEntityUpdate] listeners.
  HookResult onPreEntityUpdate(Entity<T> entity) => .proceed;

  void onPostEntityUpdate(Entity<T> entity) {}

  /// Override to intercept the pre-entity-draw phase from within the class.
  ///
  /// Returns a [HookResult] (defaults to [HookResult.proceed]). 
  /// Called after all registered [listenOnPreEntityDraw] listeners.
  HookResult onPreEntityDraw(Entity<T> entity) => .proceed;

  void onPostEntityDraw(Entity<T> entity) {}

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  final Set<I> _entities = {};

  final Map<String, Set<Entity<T>>> _entitiesByLayer = {};
  final Map<Entity<T>, String> _entityLayers = {};

  String _getEntityLayer(Entity<T> e) {
    final renderLayer = e.get<CRenderLayer<T>>();

    if (renderLayer == null) {
      throw StateError(
        'Entity $e is expected to have CRenderLayer component.',
      );
    }

    return renderLayer.layer;
  }

  void _indexEntity(Entity<T> e, [String? layer]) {
    layer ??= _getEntityLayer(e);

    (_entitiesByLayer[layer] ??= {}).add(e);
    _entityLayers[e] = layer;
  }

  void _unindexEntity(Entity<T> e) {
    final layer = _entityLayers.remove(e);
    if (layer == null) return;

    final entities = _entitiesByLayer[layer];

    entities?.remove(e);
    _entityLayers.remove(e);

    if (entities?.isEmpty ?? false) {
      _entitiesByLayer.remove(layer);
    }
  }

  void _onLayerChanged(
    Entity<T> entity,
    String oldLayer,
    String newLayer,
  ) {
    if (oldLayer == newLayer) return;

    _unindexEntity(entity);
    _indexEntity(entity, newLayer);
  }

  /// Returns all entities currently registered.
  Set<I> getEntities() => _entities;

  /// Returns all entities currently registered mapped to specific layers.
  Map<String, Set<Entity<T>>> getEntitiesByLayer() => _entitiesByLayer;
  
  /// Returns all entities currently registered mapped to specific [layer].
  Set<Entity<T>> getEntitiesInLayer(String layer) => _entitiesByLayer[layer] ?? {};

  /// Returns all entities mapped to their current layer.
  Map<Entity<T>, String> getEntityLayers() => _entityLayers;

  /// Attaches [entity] to this container without running the full add lifecycle.
  ///
  /// Emits [EventEntityAttaching] first. If [onBeforeEntityAttach] cancels the
  /// operation, [EventEntityAttachCancelled] is emitted and no changes are made.
  /// On success, the entity is marked as added, assigned this container as its
  /// parent, and registered. [EventEntityAttached] is emitted last.
  ///
  /// Does not invoke the entity's own add/remove lifecycle or manage its
  /// components. Already-attached entities are silently ignored.
  @mustCallSuper
  bool attachEntity(I entity) {
    if (entity.isAdded) return false;

    emit(EventEntityAttaching(app, this, entity));

    HookResult result = _doOnBeforeEntityAttach(entity);

    if (result == .cancel) {
      emit(EventEntityAttachCancelled(app, this, entity));
      return false;
    }

    if (result == .proceed) _doOnEntityAttach(entity);

    entity._isAdded = true;
    entity.setParent(self, force: true);
    _entities.add(entity);

    _doOnAfterEntityAttach(entity);

    emit(EventEntityAttached(app, this, entity));
    return true;
  }

  /// Detaches [entity] from this container without running the full remove lifecycle.
  ///
  /// Emits [EventEntityDetaching] first. If [onBeforeEntityDetach] cancels the
  /// operation, [EventEntityDetachCancelled] is emitted and no changes are made.
  /// On success, the entity is marked as removed, its parent is cleared, and it
  /// is unregistered. [EventEntityDetached] is emitted last.
  ///
  /// Does not invoke the entity's own add/remove lifecycle or remove its
  /// components. Already-detached entities are silently ignored.
  @mustCallSuper
  bool detachEntity(I entity) {
    if (!entity.isAdded) return false;

    emit(EventEntityDetaching(app, this, entity));

    HookResult result = _doOnBeforeEntityDetach(entity);
    
    if (result == .cancel) {
      emit(EventEntityDetachCancelled(app, this, entity));
      return false;
    }

    if (result == .proceed) _doOnEntityDetach(entity);

    entity._isAdded = false;
    entity.setParent(null, force: true);
    _entities.remove(entity);

    _doOnAfterEntityDetach(entity);
    emit(EventEntityDetached(app, this, entity));
    return true;
  }

  /// Registers [entity] and runs the full add lifecycle.
  ///
  /// Emits [EventEntityAdding] first. If any [onBeforeEntityAdd] hook or the
  /// entity's own [Entity.onBeforeAdd] returns `false`, the add is cancelled and
  /// [EventEntityAddCancelled] is emitted. On success, emits
  /// [EventEntityAdded]. Already-registered entities are silently ignored.
  @mustCallSuper
  bool addEntity(I entity) {
    if (entity.isAdded) return false;

    emit(EventEntityAdding(app, this, entity));

    HookResult result = _doOnBeforeEntityAdd(entity);

    if (result == .cancel) {
      emit(EventEntityAddCancelled(app, this, entity));
      return false;
    }

    result = _mergeHookResult(result, entity._doOnBeforeAdd(self));

    if (result == .cancel) {
      emit(EventEntityAddCancelled(app, this, entity));
      return false;
    }

    entity.setParent(self, force: true);

    if (result == .proceed) {
      _doOnEntityAdd(entity);
      if (!entity.isClone) entity._doAdd(self);
    }

    _entities.add(entity);

    entity._doOnAfterAdd(self);
    _doOnAfterEntityAdd(entity);

    emit(EventEntityAdded(app, this, entity));
    return true;
  }

  /// Unregisters [entity] and runs the full remove lifecycle.
  ///
  /// Emits [EventEntityRemoving] first. Either hook returning `false` cancels
  /// the removal and emits [EventEntityRemoveCancelled]. On success, all
  /// components are removed before the entity is detached, and
  /// [EventEntityRemoved] is emitted. Unregistered entities are ignored.
  @mustCallSuper
  bool removeEntity(I entity) {
    if (!entity.isAdded) return false;

    emit(EventEntityRemoving(app, this, entity));

    HookResult result = _doOnBeforeEntityRemove(entity);
    
    if (result == .cancel) {
      emit(EventEntityRemoveCancelled(app, this, entity));
      return false;
    }

    result = _mergeHookResult(result, entity._doOnBeforeRemove());

    if (result == .cancel) {
      emit(EventEntityRemoveCancelled(app, this, entity));
      return false;
    }

    if (result == .proceed) {
      _doOnEntityRemove(entity);
      entity._doRemove();
    }

    _entities.remove(entity);

    entity._doOnAfterRemove();
    _doOnAfterEntityRemove(entity);
    emit(EventEntityRemoved(app, this, entity));
    return true;
  }

  /// Calls `_doUpdate` on every entity in the scene.
  void _updateEntities(double dt) {
    for (final e in _entities) {
      final result = _doOnPreEntityUpdate(e);
      if (result == .cancel) continue;
      if (result == .proceed) e._doEntityUpdate(dt);
      _doOnPostEntityUpdate(e);
    }
  }

  void _drawEntity(Entity<T> entity, double dt) {
    final result = _doOnPreEntityDraw(entity);
    if (result == .cancel) return;
    if (result == .proceed) entity._doDraw(dt);
    _doOnPostEntityDraw(entity);
  }

  /// Calls [_doDraw] on entities whose scene-level draw is enabled and whose
  /// render layer matches the renderer's currently active layer.
  void _drawLayeredEntities(double dt, [String? layerOverride]) {
    final layer = layerOverride ?? renderer.activeLayer;
    final Set<Entity<T>> entities = _entitiesByLayer[layer] ?? const {};

    for (final e in entities) {
      if (!e._drawEnabled) continue;
      if (!e._sceneLevelDrawEnabled) continue;
      _drawEntity(e, dt);
    }
  }

  /// WARNING: This is for [EntityGroup] which does not care about its
  ///          entities layers. The [EntityGroup] itself is the one
  ///          filtered by [_drawLayeredEntities].
  void _drawAllEntities(double dt) {
    for (final e in _entities) {
      if (!e._drawEnabled) continue;
      if (!e._sceneLevelDrawEnabled) continue;
      _drawEntity(e, dt);
    }
  }
}