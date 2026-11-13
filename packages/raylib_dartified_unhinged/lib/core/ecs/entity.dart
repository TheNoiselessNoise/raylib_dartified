part of '../raylib_dartified_unhinged.dart';

/// A single actor in the ECS, the fundamental building block of a [Scene].
///
/// An [Entity] owns a set of [Comp] components and participates in the full
/// ECS lifecycle: input handling, update, draw, and event propagation. All
/// three passes (input → update → draw) are forwarded to every attached
/// component before the entity's own override hooks are called.
///
/// ## Position
///
/// [worldPosition] and [localPosition] are derived from whichever transform
/// component is present ([CTransform] for world-space, [CLocalTransform] for
/// parent-relative). [bounds] is derived from the first collider or visual
/// component found.
class Entity<T extends App<T>> extends ECSBase<T> with

  // identity
  Self<Entity<T>>,

  // has
  HasEntityAccess<T>,
  HasOwnParent<T, Entity<T>>,
  HasVars<T, Entity<T>>,

  // is
  IsAddable<T, Entity<T>>,
  IsCloneable<T, Entity<T>>,
  IsDisposable<T, Entity<T>>,
  IsDrawable<T, Entity<T>>,
  IsEnableable<T, Entity<T>>,
  IsEventSubscriber<T>,
  IsEventEmittable<T, Entity<T>>,
  IsEventHistoryHolder<T, Entity<T>>,
  IsMorphable<T, Entity<T>>,
  IsPanicable<T, Entity<T>>,
  IsRemovable<T, Entity<T>>,
  IsPrePostUpdatable<T, Entity<T>>, // pre components and post components
  
  // special
  IsComponentManagable<T, Entity<T>>,
  IsStateHolder<T, Entity<T>, AnyEntitySnapshot<T>>,
  IsPersistable<T, Entity<T>, AnyEntitySnapshot<T>>,
  IsDebuggable<T, Entity<T>>

{
  @override
  final T app;

  Entity(this.app, {
    bool populateDefaults = true,
  }) {
    this.populateDefaults = populateDefaults;

    if (populateDefaults) {
      addIfNotExists(CRenderLayer<T>(app, layer: RenderLayers.world.name));
    }

    emit(EventEntityInitialized(app, this));
  }

  @override
  Entity<T> get entity => self;

  /// When `false`, the scene's draw loop skips this entity entirely.
  bool _sceneLevelDrawEnabled = true;

  /// When `false`, the any draw loop (SHOULD) skip this entity entirely.
  bool _drawEnabled = true;

  /// Prevents the scene's render loop from drawing this entity.
  void disableSceneLevelDraw() => _sceneLevelDrawEnabled = false;
  
  /// Prevents any render loop from drawing this entity.
  void disableDraw() => _drawEnabled = false;

  //   ░██████  ░██████████   ░██████   
  //  ░██   ░██ ░██          ░██   ░██  
  // ░██        ░██         ░██     ░██ 
  // ░██  █████ ░█████████  ░██     ░██ 
  // ░██     ██ ░██         ░██     ░██ 
  //  ░██  ░███ ░██          ░██   ░██  
  //   ░█████░█ ░██████████   ░██████   

  /// The entity's position in scene space.
  ///
  /// Resolution order:
  /// 1. [CTransform] returns its position directly.
  /// 2. [CLocalTransform] with an [Entity] parent, adds the offset to the
  ///    parent's [worldPosition] recursively.
  /// 3. Falls back to [Scene.sceneBounds]'s position if neither is present.
  Vector2 get worldPosition {
    final sceneOffset = sceneBounds.position;

    final transform = this.transform;
    if (transform != null) return sceneOffset.add(transform.position);

    final local = localTransform;
    if (local != null) {
      if (parent case Entity<T> parentEntity) {
        return parentEntity.worldPosition.add(local.offset);
      }
    }

    return sceneOffset;
  }

  /// The entity's position relative to its parent.
  ///
  /// Returns [CLocalTransform.offset] if present, otherwise [Vector2.zero].
  Vector2 get localPosition {
    final local = localTransform;
    if (local != null) return local.offset;
    return .zero();
  }

  /// An axis-aligned bounding box derived from the entity's collider or visual
  /// component, or `null` if neither is present.
  ///
  /// Resolution order:
  /// 1. [CCircleCollider] bounding box of the circle.
  /// 2. [CRectCollider] bounding box of the rect.
  /// 3. [CImage] centered on [worldPosition], sized from [CImage.size] or
  ///    the texture dimensions.
  /// 4. [CSprite] centered on [worldPosition], sized from the sprite.
  Bounds? get bounds {
    final circle = get<CCircleCollider<T>>();
    if (circle != null) return .new(
      circle.center.y - circle.radius,
      circle.center.x - circle.radius,
      circle.center.y + circle.radius,
      circle.center.x + circle.radius,
    );

    final rect = get<CRectCollider<T>>();
    if (rect != null) return .fromRectangle(rect.rect);

    final pos = worldPosition;

    final image = get<CImage<T>>();
    if (image != null) {
      final size = image.size ?? .vec2(
        image.texture?.width ?? 0,
        image.texture?.height ?? 0
      );
      final half = size.divideBy(2);
      return .new(
        pos.y - half.y,
        pos.x - half.x,
        pos.y + half.y,
        pos.x + half.x
      );
    }

    final sprite = get<CSprite<T>>();
    if (sprite != null) {
      final half = sprite.size.divideBy(2);
      return .new(
        pos.y - half.y,
        pos.x - half.x,
        pos.y + half.y,
        pos.x + half.x
      );
    }

    return null;
  }

  Entity<T> onBounds(void Function(Bounds bounds) fn) {
    final bounds = this.bounds;
    if (bounds != null) fn(bounds);
    return self;
  }

  // NOTE: renderLayer is expected to exist
  CRenderLayer<T> get renderLayer => get<CRenderLayer<T>>()!;

  CTransform<T>? get transform => get<CTransform<T>>();
  Entity<T> onTransform(void Function(CTransform<T> t) fn) => on<CTransform<T>>(fn);

  CLocalTransform<T>? get localTransform => get<CLocalTransform<T>>();
  Entity<T> onLocalTransform(void Function(CLocalTransform<T> v) fn) => on<CLocalTransform<T>>(fn);

  CCollider<T>? get collider => get<CCollider<T>>();
  Entity<T> onCollider(void Function(CCollider<T> v) fn) => on<CCollider<T>>(fn);

  CVelocity<T>? get velocity => get<CVelocity<T>>();
  Entity<T> onVelocity(void Function(CVelocity<T> v) fn) => on<CVelocity<T>>(fn);

  CPhysicsBody<T>? get physicsBody => get<CPhysicsBody<T>>();
  Entity<T> onPhysicsBody(void Function(CPhysicsBody<T> v) fn) => on<CPhysicsBody<T>>(fn);

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  /// Schedules removal of this entity from its scene via the callback queue.
  ///
  /// Prefer this over calling `scene.removeEntity` directly during an update
  /// or draw pass, where mutating the entity set mid-iteration is unsafe.
  /// Returns `this` for chaining.
  Entity<T> removeThis() {
    callback(() => scene.removeEntity(self));
    return self;
  }

  @override
  @mustCallSuper
  void _doOnCompAdd(Comp<T> component) {
    // Before we add CRenderLayer, let's get rid of all of existing
    if (component is CRenderLayer<T>) removeAll<CRenderLayer<T>>();
    super._doOnCompAdd(component);
  }

  @override
  void _doOnAfterCompAdd(Comp<T> component) {
    if (component is CRenderLayer<T>) {
      if (parent case Scene<T> scene) {
        scene._indexEntity(self);
      }
    }
    
    super._doOnAfterCompAdd(component);
  }

  @override
  void _doOnCompRemove(Comp<T> component) {
    if (component is CRenderLayer<T>) {
      if (parent case Scene<T> scene) {
        scene._unindexEntity(self);
      }
    }

    super._doOnCompRemove(component);
  }

  @override
  bool get _isInstanceDisabled => isDisabled;

  /// Fires pre update listeners, advances all components by [dt], fires post update listeners.
  /// Skipped entirely when the entity is disabled.
  void _doEntityUpdate(double dt) => _runSafely(() {
    if (_isInstanceDisabled) return;
    final result = _doOnPreUpdate(dt);
    if (result == .cancel) return;
    if (_isInstanceDisabled) return;
    if (result == .proceed) _updateChildComponents(dt);
    if (_isInstanceDisabled) return;
    _doOnPostUpdate(dt);
  });

  /// Draws all components for [dt], fires draw listeners, then calls
  /// [onDraw]. Skipped entirely when the entity is disabled.
  @override
  @mustCallSuper
  void _doDraw(double dt) => _runSafely(() {
    if (_isInstanceDisabled) return;
    _drawChildComponents(dt);
    if (_isInstanceDisabled) return;
    super._doDraw(dt);
  });

  @override
  @mustCallSuper
  void _doOnRemove() {
    super._doOnRemove();
    // NOTE: toList() is important
    _components.toList().forEach(_removeComponentInstance);
  }

  //   ░██████   ░██     ░██ ░██████████ ░█████████  ░██     ░██ 
  //  ░██   ░██  ░██     ░██ ░██         ░██     ░██  ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██         ░██     ░██   ░██ ░██   
  // ░██     ░██ ░██     ░██ ░█████████  ░█████████     ░████    
  // ░██     ░██ ░██     ░██ ░██         ░██   ░██       ░██     
  //  ░██   ░██   ░██   ░██  ░██         ░██    ░██      ░██     
  //   ░██████     ░██████   ░██████████ ░██     ░██     ░██     
  //        ░██                                                  

  /// Returns a fresh [QueryEntityComponent] scoped to this entity's direct components.
  ///
  /// Entry point for the **Query-like DSL** over components.
  QueryEntityComponent<T> get QueryComp => .new(app, this);

  /// Returns a fresh [QueryEntityComponentDeep] that searches all components
  /// recursively, including those on child components.
  QueryEntityComponentDeep<T> get QueryCompDeep => .new(app, this);

  //   ░██████  ░██           ░██████   ░███    ░██ ░██████████ 
  //  ░██   ░██ ░██          ░██   ░██  ░████   ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██░██  ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██ ░██ ░██ ░█████████  
  // ░██        ░██         ░██     ░██ ░██  ░██░██ ░██         
  //  ░██   ░██ ░██          ░██   ░██  ░██   ░████ ░██         
  //   ░██████  ░██████████   ░██████   ░██    ░███ ░██████████ 

  @mustCallSuper
  void _doOnCloneEntityStart(Entity<T> copy, [ClonePolicy<T>? policy]) {
    emit(EventEntityCloning(app, self, copy));

    _components.forEach((comp) {
      if (!(policy?.allowComp(copy, comp) ?? true)) return;

      _doCloneComp(
        to: copy,
        what: comp,
        policy: policy,
        replaceComponent: true,
      );
    });
  }

  @override
  @mustCallSuper
  void _doOnClone(Entity<T> copy, [ClonePolicy<T>? policy]) {
    _doOnCloneEntityStart(copy, policy);
    super._doOnClone(copy, policy);
  }

  @override
  @nonVirtual
  void _doCloneAfter(Entity<T> target, [ClonePolicy<T>? policy]) {
    super._doCloneAfter(target, policy);
    emit(EventEntityCloned(app, self, target));
  }

  // clone

  @override
  Entity<T> createInstance() => .new(app);

  // state

  @override
  AnyEntitySnapshot<T> createSnapshot() => .new(namedId);  

  @override
  @mustCallSuper
  AnyEntitySnapshot<T> captureSnapshot() {
    final snapshot = createSnapshot();
    snapshot.componentSnapshots = _components
      .map((c) => c.captureSnapshot())
      .toList();
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant AnyEntitySnapshot<T> snapshot) {
    _restoreSnapshotList(
      originSnapshot: snapshot,
      sourceList: _components.toList(),
      sourceSnapshots: snapshot.componentSnapshots,
      onRecreate: (x) => add(x),
      onRestore: (x, s) => x.restoreSnapshot(s),
      onRemove: _removeComponentInstance,
    );
  }

  // persistence

  static const typeId = '__entity__';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    
    ECSPersistentKeys.components: _storePersistableJsonObjectMap(_components, force: force),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    _restorePersistableJsonObjectMap(
      data: data,
      key: ECSPersistentKeys.components,
      factory: app.factories.comp,
      onRestored: add,
    );
  }
}

typedef AnyEntitySnapshot<T extends App<T>> = EntitySnapshot<T, Entity<T>>;

class EntitySnapshot<T extends App<T>, E extends Entity<T>> extends StateSnapshot<T, E> {
  late List<AnyCompSnapshot<T>> componentSnapshots;

  EntitySnapshot(super.sourceId);

  @override
  E createInstance(T app) => Entity<T>(app) as E;
}

typedef AnyEntityGroup<T extends App<T>> = EntityGroup<T, Entity<T>>;

/// A logical group of related [Entity] objects managed as a single unit.
///
/// An [EntityGroup] is itself an [Entity], so it participates in the scene
/// lifecycle normally. It additionally maintains an ordered [entities] list
/// whose members receive update, draw, and event calls immediately after the
/// group itself.
///
/// ## Transform management
///
/// When an entity is added via [addEntity], [_ensureLocalPosition] reconciles
/// whichever transform style the entity was given:
///
/// - **World transform only** ([CTransform]) => converted to a [CLocalTransform]
///   offset relative to the group's world position.
/// - **Local transform only** ([CLocalTransform]) => a matching [CTransform] is
///   created at the correct world position.
/// - **Both** => left untouched; the caller is assumed to know what they're
///   doing.
/// - **Neither** => left as-is; the propagation system will skip it.
class EntityGroup<T extends App<T>, E extends Entity<T>> extends Entity<T> with
  IsEntityManagable<T, EntityGroup<T, E>, E>
{
  EntityGroup(super.app);

  @override
  Map<String, Set<Entity<T>>> getEntitiesByLayer()
    => throw StateError('Entities by layer are only available in a Scene, not in EntityGroup.');

  @override
  Bounds? get bounds {
    Bounds? result;

    for (final entity in _entities) {
      final b = entity.bounds;
      if (b == null) continue;

      result = result == null ? b : .new(
        math.min(result.top, b.top),
        math.min(result.left, b.left),
        math.max(result.bottom, b.bottom),
        math.max(result.right, b.right),
      );
    }

    return result;
  }

  @override
  @mustCallSuper
  void _doOnRemove() {
    super._doOnRemove();
    // NOTE: toList() is important
    _entities.toList().forEach(removeEntity);
  }

  //   ░██████  ░██           ░██████   ░███    ░██ ░██████████ 
  //  ░██   ░██ ░██          ░██   ░██  ░████   ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██░██  ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██ ░██ ░██ ░█████████  
  // ░██        ░██         ░██     ░██ ░██  ░██░██ ░██         
  //  ░██   ░██ ░██          ░██   ░██  ░██   ░████ ░██         
  //   ░██████  ░██████████   ░██████   ░██    ░███ ░██████████ 

  @mustCallSuper
  void _doOnCloneEntityGroupStart(Entity<T> copy, [ClonePolicy<T>? policy]) {
    if (copy is! EntityGroup<T, E>) throw StateError('unreachable');

    _doOnCloneEntityStart(copy, policy);

    _entities.forEach((e) {
      if (!(policy?.allowEntity(copy, e) ?? true)) return;
      copy.addEntity(e.clone(policy));
    });
  }

  @override
  @mustCallSuper
  void _doOnClone(Entity<T> copy, [ClonePolicy<T>? policy]) {
    _doOnCloneEntityGroupStart(copy, policy);
    super._doOnClone(copy, policy);
  }

  //   ░██████   ░██     ░██ ░██████████ ░█████████  ░██     ░██ 
  //  ░██   ░██  ░██     ░██ ░██         ░██     ░██  ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██         ░██     ░██   ░██ ░██   
  // ░██     ░██ ░██     ░██ ░█████████  ░█████████     ░████    
  // ░██     ░██ ░██     ░██ ░██         ░██   ░██       ░██     
  //  ░██   ░██   ░██   ░██  ░██         ░██    ░██      ░██     
  //   ░██████     ░██████   ░██████████ ░██     ░██     ░██     
  //        ░██                                                   

  /// Returns a fresh [QueryEntities] scoped to this entity group.
  ///
  /// Entry point for the **Query-like DSL**.
  QueryEntities<T, EntityGroup<T, E>> get QueryEntity => .new(app, self);
  
  /// Advances the group itself, then advances each member entity.
  /// Member updates are skipped when the group is disabled.
  @override
  void _doEntityUpdate(double dt) => _runSafely(() {
    if (_isInstanceDisabled) return;
    final result = _doOnPreUpdate(dt);
    if (result == .cancel) return;
    if (_isInstanceDisabled) return;
    if (result == .proceed) _updateChildComponents(dt);
    if (_isInstanceDisabled) return;
    _updateEntities(dt);
    if (_isInstanceDisabled) return;
    _doOnPostUpdate(dt);
  });

  /// Draws the group itself, then draws each member entity.
  /// Member draws are skipped when the group is disabled.
  @override
  @mustCallSuper
  void _doDraw(double dt) => _runSafely(() {
    if (_isInstanceDisabled) return;
    super._doDraw(dt);
    if (_isInstanceDisabled) return;
    _drawAllEntities(dt);
  });

  /// Dispatches [event] to the group itself, then to each member entity.
  /// Propagation stops if [Event.isStopped] becomes `true` after the group.
  @override
  @nonVirtual
  void _doOnEvent(Event<T> event) {
    super._doOnEvent(event);
    if (event.isStopped) return;
    _entities.forEach((e) => e._doOnEvent(event));
  }

  @override
  bool addEntity(E entity) {
    if (!super.addEntity(entity)) return false;
    _ensureLocalPosition(entity);
    return true;
  }

  /// Reconciles the transform components of [entity] so that both a world
  /// [CTransform] and a [CLocalTransform] offset are always present.
  void _ensureLocalPosition(Entity<T> entity) {
    final worldPos = entity.get<CTransform<T>>();
    final localPos = entity.get<CLocalTransform<T>>();

    if (worldPos != null && localPos == null) {
      // user placed entity using world-style, convert to local
      final entityPosition = worldPos.position;
      final groupPosition = transform!.position;
      final offset = entityPosition.sub(groupPosition);
      entity.add(CLocalTransform<T>(app, offset: offset));
      return;
    }

    if (localPos != null && worldPos == null) {
      // user placed entity using local-style, create world transform
      final entityLocalPosition = localPos.offset;
      final groupPosition = transform!.position;
      final offset = groupPosition.add(entityLocalPosition);
      entity.add(CTransform<T>(app, position: offset));
      return;
    }

    // if has both: user knows what they're doing, leave it
    // if has neither: propagation system will just skip it
  }

  // clone

  @override
  EntityGroup<T, E> createInstance() => .new(app);

  // state

  @override
  AnyEntityGroupSnapshot<T> createSnapshot() => .new(namedId);  

  @override
  @nonVirtual
  AnyEntityGroupSnapshot<T> captureSnapshot() {
    final entitySnapshot = super.captureSnapshot();

    final snapshot = createSnapshot();
    snapshot.componentSnapshots = entitySnapshot.componentSnapshots;
    snapshot.entitySnapshots = _entities
      .map((c) => c.captureSnapshot())
      .toList();

    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant AnyEntityGroupSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);

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

  static const typeId = '__entityGroup__';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),

    ECSPersistentKeys.entities: _storePersistableJsonObjectMap(_entities, force: force),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    _restorePersistableJsonObjectMap(
      data: data,
      key: ECSPersistentKeys.entities,
      factory: app.factories.entity,
      onRestored: (entity) {
        if (entity is! E) {
          throw StateError('EntityGroup expected entity of type $E, but got ${entity.runtimeType}');
        }

        addEntity(entity);
      },
    );
  }
}

typedef AnyEntityGroupSnapshot<T extends App<T>> = EntityGroupSnapshot<T, AnyEntityGroup<T>>;

class EntityGroupSnapshot<T extends App<T>, E extends AnyEntityGroup<T>> extends EntitySnapshot<T, E> {
  List<AnyEntitySnapshot<T>> entitySnapshots = [];

  EntityGroupSnapshot(super.id);

  @override
  E createInstance(T app) => AnyEntityGroup<T>(app) as E;
}