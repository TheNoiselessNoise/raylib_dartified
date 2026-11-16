part of '../../raylib_dartified_unhinged.dart';

// Reduces O(n^2) to O(n) collision checks
final class SpatialGrid<T extends App<T>> {
  double cellSize;
  Map<int, List<Entity<T>>> grid = {};
  
  SpatialGrid(this.cellSize);

  SpatialGrid<T> clone() {
    final copy = SpatialGrid<T>(cellSize);
    copy.grid = .from(grid);
    return copy;
  }
  
  /// Simple spatial hash function
  int _hash(int x, int y) => (x * 73856093) ^ (y * 19349663);
  
  /// Clear all cells (call once per frame)
  void clear() => grid.clear();
  
  /// Insert an entity into all cells its collider overlaps
  void insert(Entity<T> entity, CCollider<T> collider) {
    if (collider is CCircleCollider<T>) {
      _insertCircle(entity, collider);
    } else if (collider is CRectCollider<T>) {
      _insertRect(entity, collider);
    }
  }
  
  void _insertCircle(Entity<T> entity, CCircleCollider<T> collider) {
    final cx = collider.center.x;
    final cy = collider.center.y;
    final r = collider.radius;
    
    // Calculate which cells this circle overlaps
    final minX = ((cx - r) / cellSize).floor();
    final maxX = ((cx + r) / cellSize).floor();
    final minY = ((cy - r) / cellSize).floor();
    final maxY = ((cy + r) / cellSize).floor();
    
    for (int x = minX; x <= maxX; x++) {
      for (int y = minY; y <= maxY; y++) {
        final hash = _hash(x, y);
        grid.putIfAbsent(hash, () => []).add(entity);
      }
    }
  }
  
  void _insertRect(Entity<T> entity, CRectCollider<T> collider) {
    final rx = collider.rect.x;
    final ry = collider.rect.y;
    final rw = collider.rect.width;
    final rh = collider.rect.height;
    
    final minX = (rx / cellSize).floor();
    final maxX = ((rx + rw) / cellSize).floor();
    final minY = (ry / cellSize).floor();
    final maxY = ((ry + rh) / cellSize).floor();
    
    for (int x = minX; x <= maxX; x++) {
      for (int y = minY; y <= maxY; y++) {
        final hash = _hash(x, y);
        grid.putIfAbsent(hash, () => []).add(entity);
      }
    }
  }
  
  /// Query all entities near a collider (returns candidates for collision check)
  List<Entity<T>> query(CCollider<T> collider) {
    if (collider is CCircleCollider<T>) {
      return _queryCircle(collider);
    } else if (collider is CRectCollider<T>) {
      return _queryRect(collider);
    }
    return [];
  }
  
  List<Entity<T>> _queryCircle(CCircleCollider<T> collider) {
    final cx = collider.center.x;
    final cy = collider.center.y;
    final r = collider.radius;
    
    final minX = ((cx - r) / cellSize).floor();
    final maxX = ((cx + r) / cellSize).floor();
    final minY = ((cy - r) / cellSize).floor();
    final maxY = ((cy + r) / cellSize).floor();
    
    final candidates = <Entity<T>>{};
    
    for (int x = minX; x <= maxX; x++) {
      for (int y = minY; y <= maxY; y++) {
        final hash = _hash(x, y);
        final cell = grid[hash];
        if (cell != null) candidates.addAll(cell);
      }
    }
    
    return candidates.toList();
  }
  
  List<Entity<T>> _queryRect(CRectCollider<T> collider) {
    final rx = collider.rect.x;
    final ry = collider.rect.y;
    final rw = collider.rect.width;
    final rh = collider.rect.height;
    
    final minX = (rx / cellSize).floor();
    final maxX = ((rx + rw) / cellSize).floor();
    final minY = (ry / cellSize).floor();
    final maxY = ((ry + rh) / cellSize).floor();
    
    final candidates = <Entity<T>>{};
    
    for (int x = minX; x <= maxX; x++) {
      for (int y = minY; y <= maxY; y++) {
        final hash = _hash(x, y);
        final cell = grid[hash];
        if (cell != null) candidates.addAll(cell);
      }
    }
    
    return candidates.toList();
  }
}

// MTV (Minimum Translation Vector) - Used for collision response
final class MTV {
  Vector2 normal;
  double depth;

  MTV(this.normal, this.depth);
}

class CollisionResolverSystem<T extends App<T>> extends SceneSystem<T> {
  static const double _defaultRestitution = 1;
  static const double _defaultGridCellSize = 64;

  double restitution;
  late SpatialGrid<T> spatialGrid;
  
  // Reusable data structures to avoid allocations
  final List<_EntityColliderData<T>> _bodies = [];
  final Set<int> _checkedPairs = {};
  
  double gridCellSize;

  bool enableEventEmitting;

  CollisionResolverSystem(super.app, {
    super.populateDefaults,
    this.restitution = _defaultRestitution,
    this.gridCellSize = _defaultGridCellSize,
    this.enableEventEmitting = true,
  }) {
    // Cell size should be roughly 2x your largest collider radius
    // For 8-radius balls, 20-32 is a good default
    spatialGrid = .new(gridCellSize);
  }

  @override
  void onPostUpdate(double dt) {
    // Clear reusable structures
    _bodies.clear();
    _checkedPairs.clear();
    spatialGrid.clear();
    
    // Phase 1: Build spatial grid with movable entities
    _buildSpatialGrid();
    
    // Phase 2: Check collisions only for nearby pairs
    _resolveCollisions();
  }
  
  /// Build the spatial grid with all active colliders
  void _buildSpatialGrid() {
    // Add all movable entities (those with velocity)
    scene.QueryEntity.DoForEachWith3<CTransform<T>, CCollider<T>, CPhysicsBody<T>>((e, t, c, p) {
      if (t.isDisabled) return;
      if (c.isDisabled || !c.enableCollision) return;
      
      spatialGrid.insert(e, c);

      _bodies.add(_EntityColliderData(
        entity: e,
        transform: t,
        velocity: e.velocity,
        collider: c,
        physics: p,
      ));
    });
    
    // Also add static entities (those without velocity but with colliders)
    scene.QueryEntity.DoForEachWith2<CTransform<T>, CCollider<T>>((e, t, c) {
      if (c.isDisabled || !c.enableCollision) return;
      
      // Skip if entity already has velocity (already added above)
      if (e.velocity != null) return;
      
      spatialGrid.insert(e, c);
    });
  }
  
  /// Resolve collisions using spatial grid for broad phase
  void _resolveCollisions() {
    for (final entityData in _bodies) {
      final a = entityData.entity;
      final tA = entityData.transform;
      final vA = entityData.velocity;
      final cA = entityData.collider;
      final pA = entityData.physics;
      
      // Get only nearby candidates from spatial grid (BROAD PHASE)
      final candidates = spatialGrid.query(cA);
      
      for (final b in candidates) {
        // Skip self-collision
        if (identical(a, b)) continue;
        
        // Avoid checking same pair twice using unique pair ID
        final pairHash = _getPairHash(a.id, b.id);
        if (_checkedPairs.contains(pairHash)) continue;
        _checkedPairs.add(pairHash);
        
        // Get components
        final tB = b.transform;
        if (tB == null || tB.isDisabled) continue;

        final cB = b.collider;
        if (cB == null || cB.isDisabled || !cB.enableCollision) continue;

        final vB = b.velocity;
        final pB = b.physicsBody;

        final collision = ColliderCollision<T>(cA, cB);

        HookResult result = cA._doOnBeforeCollision(cB);
        if (result == .cancel) continue;
        
        result = _mergeHookResult(result, cB._doOnBeforeCollision(cA));
        if (result == .cancel) continue;

        result = _mergeHookResult(result, onBeforeCollision(collision));
        if (result == .cancel) continue;

        if (result == .proceed) {        
          cA._doOnCollision(cB);
          cB._doOnCollision(cA);
          onCollision(collision);
        }

        // NARROW PHASE: Precise collision detection & resolution
        final didCollide = _resolvePair(a, tA, vA, cA, pA, b, tB, vB, cB, pB);
        if (!didCollide) continue;

        cA._doOnAfterCollision(cB);
        cB._doOnAfterCollision(cA);
        onAfterCollision(collision);
      }
    }
  }

  int _getPairHash(int a, int b) {
    final lo = math.min(a, b);
    final hi = math.max(a, b);
    return lo + (hi * (hi + 1)) ~/ 2; // Cantor, collision-free for non-negative ints
  }

  /// Resolve collision between two entities
  bool _resolvePair(
    Entity<T> a,
    CTransform<T> tA,
    CVelocity<T>? vA,
    CCollider<T> cA,
    CPhysicsBody<T>? pA,

    Entity<T> b,
    CTransform<T> tB,
    CVelocity<T>? vB,
    CCollider<T> cB,
    CPhysicsBody<T>? pB,
  ) {
    // Quick AABB check before expensive precise collision
    if (!_quickAABBCheck(cA, cB)) return false;
    
    // Compute MTV (Minimum Translation Vector)
    final mtv = _computeMTV(cA, cB);
    if (mtv == null) return false; // No collision

    final n = mtv.normal;
    final p = mtv.depth;

    final invMassA = (pA?.isEnabled ?? false) ? pA!.invMass : 0.0;
    final invMassB = (pB?.isEnabled ?? false) ? pB!.invMass : 0.0;
    final sum = invMassA + invMassB;

    // Both immovable
    if (sum == 0) return true;
    
    // ----------------------------
    // Positional correction
    // ----------------------------
    final moveA = invMassA / sum;
    final moveB = invMassB / sum;

    tA.position.x += n.x * p * moveA;
    tA.position.y += n.y * p * moveA;

    tB.position.x -= n.x * p * moveB;
    tB.position.y -= n.y * p * moveB;
    
    // ----------------------------
    // Velocity resolution
    // ----------------------------
    final avx = (invMassA > 0 || (pA?.transferVelocity ?? false)) ? (vA?.velocity.x ?? 0) : 0.0;
    final avy = (invMassA > 0 || (pA?.transferVelocity ?? false)) ? (vA?.velocity.y ?? 0) : 0.0;
    final bvx = (invMassB > 0 || (pB?.transferVelocity ?? false)) ? (vB?.velocity.x ?? 0) : 0.0;
    final bvy = (invMassB > 0 || (pB?.transferVelocity ?? false)) ? (vB?.velocity.y ?? 0) : 0.0;

    final relVelX = avx - bvx;
    final relVelY = avy - bvy;

    final velAlongNormal = relVelX * n.x + relVelY * n.y;
    // Always resolve if we're overlapping
    if (velAlongNormal > 0) return true;

    final restitution = math.min(
      pA?.restitution ?? 1.0,
      pB?.restitution ?? 1.0,
    );

    final j = -(1 + restitution) * velAlongNormal / sum;

    final impulseX = j * n.x;
    final impulseY = j * n.y;

    if (vA?.isEnabled ?? false) {
      vA?.velocity.x += impulseX * invMassA;
      vA?.velocity.y += impulseY * invMassA;
    }

    if (vB?.isEnabled ?? false) {
      vB?.velocity.x -= impulseX * invMassB;
      vB?.velocity.y -= impulseY * invMassB;
    }

    _fireCollisionEvents(a, b, n, p);

    return true;
  }
  
  /// Quick AABB (Axis-Aligned Bounding Box) check
  bool _quickAABBCheck(CCollider<T> a, CCollider<T> b) {
    if (a is CCircleCollider<T> && b is CCircleCollider<T>) {
      return backend.collision.circles(a.center, a.radius, b.center, b.radius);
    }
    
    if (a is CCircleCollider<T> && b is CRectCollider<T>) {
      return backend.collision.circleRectangle(a.center, a.radius, b.rect);
    }
    
    if (a is CRectCollider<T> && b is CCircleCollider<T>) {
      return backend.collision.circleRectangle(b.center, b.radius, a.rect);
    }
    
    if (a is CRectCollider<T> && b is CRectCollider<T>) {
      return backend.collision.rectangles(a.rect, b.rect);
    }
    
    return true; // Default to true for unknown types
  }
  
  /// Fire collision events for both entities
  void _fireCollisionEvents(
    Entity<T> a,
    Entity<T> b,
    Vector2 normal,
    double depth,
  ) {
    if (!enableEventEmitting) return;

    final eventAB = EventCollision(app, a, b, normal, depth);
    final eventBA = EventCollision(app, b, a, normal.negate(), depth);

    eventAB.setLink(eventBA);
    eventBA.setLink(eventAB);

    eventAB.scope = .local;
    a.emit(eventAB);
    if (eventAB.isStopped) return;

    eventBA.scope = .local;
    b.emit(eventBA);
    if (eventBA.isStopped) return;

    eventAB.scope = .rootAndLocal;
    emit(eventAB);
  }
  
  // Collision Detection (NARROW PHASE)
  
  MTV? _computeMTV(CCollider<T> a, CCollider<T> b) {
    if (a is CCircleCollider<T> && b is CCircleCollider<T>) {
      return _circleCircleMTV(a, b);
    }
    
    if (a is CCircleCollider<T> && b is CRectCollider<T>) {
      return _circleRectMTV(a, b);
    }
    
    if (a is CRectCollider<T> && b is CCircleCollider<T>) {
      final mtv = _circleRectMTV(b, a);
      if (mtv != null) {
        // Flip normal since we swapped arguments
        return MTV(mtv.normal.negate(), mtv.depth);
      }
      return null;
    }
    
    if (a is CRectCollider<T> && b is CRectCollider<T>) {
      return _rectRectMTV(a, b);
    }
    
    return null;
  }
  
  /// Circle-Circle collision (optimized to avoid sqrt when no collision)
  MTV? _circleCircleMTV(
    CCircleCollider<T> a,
    CCircleCollider<T> b,
  ) {
    final dx = a.center.x - b.center.x;
    final dy = a.center.y - b.center.y;
    final dist2 = dx * dx + dy * dy;
    final r = a.radius + b.radius;
    final r2 = r * r;

    // Early exit: no collision (avoids expensive sqrt)
    if (dist2 >= r2) return null;

    // Only compute sqrt when we know there's a collision
    var dist = math.sqrt(dist2);
    
    if (dist < 0.0001) {
      // Circles are exactly on top of each other - use arbitrary normal
      return MTV(.vec2(1, 0), r);
    }

    final Vector2 n = .vec2(dx / dist, dy / dist);
    return MTV(n, r - dist);
  }
  
  /// Circle-Rectangle collision
  MTV? _circleRectMTV(
    CCircleCollider<T> c,
    CRectCollider<T> r,
  ) {
    final cx = c.center.x;
    final cy = c.center.y;

    final rx = r.rect.x;
    final ry = r.rect.y;
    final rw = r.rect.width;
    final rh = r.rect.height;

    // Find closest point on rectangle to circle center
    final closestX = cx.clamp(rx, rx + rw);
    final closestY = cy.clamp(ry, ry + rh);

    final dx = cx - closestX;
    final dy = cy - closestY;

    final dist2 = dx * dx + dy * dy;
    final r2 = c.radius * c.radius;
    
    if (dist2 >= r2) return null; // No collision

    var dist = math.sqrt(dist2);
    double nx, ny;

    if (dist < 0.0001) {
      // Circle center is inside rectangle
      // Choose normal based on smallest penetration axis
      final left = cx - rx;
      final right = (rx + rw) - cx;
      final top = cy - ry;
      final bottom = (ry + rh) - cy;

      final min = math.min(
        math.min(left, right),
        math.min(top, bottom),
      );

      if (min == left) {
        nx = -1; ny = 0;
      } else if (min == right) {
        nx = 1; ny = 0;
      } else if (min == top) {
        nx = 0; ny = -1;
      } else {
        nx = 0; ny = 1;
      }

      return MTV(.vec2(nx, ny), c.radius + min);
    }

    // Normal points from rectangle to circle center
    nx = dx / dist;
    ny = dy / dist;

    return MTV(.vec2(nx, ny), c.radius - dist);
  }
  
  /// Rectangle-Rectangle collision (SAT - Separating Axis Theorem)
  MTV? _rectRectMTV(
    CRectCollider<T> a,
    CRectCollider<T> b,
  ) {
    final aX = a.rect.x;
    final aY = a.rect.y;
    final aW = a.rect.width;
    final aH = a.rect.height;
    
    final bX = b.rect.x;
    final bY = b.rect.y;
    final bW = b.rect.width;
    final bH = b.rect.height;
    
    // Calculate overlap on each axis
    final overlapX = math.min(aX + aW, bX + bW) - math.max(aX, bX);
    final overlapY = math.min(aY + aH, bY + bH) - math.max(aY, bY);
    
    // No collision if no overlap on either axis
    if (overlapX <= 0 || overlapY <= 0) return null;
    
    // Find axis of minimum penetration
    if (overlapX < overlapY) {
      // Resolve on X axis
      final nx = (aX + aW / 2) < (bX + bW / 2) ? 1.0 : -1.0;
      return MTV(.vec2(nx, 0), overlapX);
    } else {
      // Resolve on Y axis
      final ny = (aY + aH / 2) < (bY + bH / 2) ? 1.0 : -1.0;
      return MTV(.vec2(0, ny), overlapY);
    }
  }

  // overridable methods

  /// Called before the narrow-phase collision check is performed.
  ///
  /// Return [HookResult.cancel] to cancel the collision entirely, neither [onCollision] nor
  /// [onAfterCollision] will be invoked, and no physics resolution will occur.
  /// Return [HookResult.proceed] (the default) to allow the pipeline to continue.
  ///
  /// Both colliders and the scene each have a chance to cancel: if any of them
  /// returns [HookResult.cancel], the collision is skipped.
  ///
  /// Useful for filtering collisions by game state, team, cooldown, or any other
  /// condition that doesn't require knowing whether the shapes actually overlap.
  HookResult onBeforeCollision(ColliderCollision<T> collision) => .proceed;

  /// Called after [onBeforeCollision] passes but before the narrow phase
  /// determines whether the shapes actually overlap.
  ///
  /// In most cases you want [onAfterCollision] instead.
  ///
  /// There is no guarantee the shapes are touching when this is called.
  void onCollision(ColliderCollision<T> collision) {}

  /// Called after the narrow-phase check confirms the shapes overlap and physics
  /// resolution has been applied.
  ///
  /// This is the authoritative "collision happened" callback. Use it for dealing
  /// damage, triggering events, spawning effects, or any logic that should only
  /// run when contact is geometrically confirmed.
  void onAfterCollision(ColliderCollision<T> collision) {}

  //   ░██████  ░██           ░██████   ░███    ░██ ░██████████ 
  //  ░██   ░██ ░██          ░██   ░██  ░████   ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██░██  ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██ ░██ ░██ ░█████████  
  // ░██        ░██         ░██     ░██ ░██  ░██░██ ░██         
  //  ░██   ░██ ░██          ░██   ░██  ░██   ░████ ░██         
  //   ░██████  ░██████████   ░██████   ░██    ░███ ░██████████ 

  // clone

  @override
  CollisionResolverSystem<T> createInstance() => .new(app);
  
  // state

  @override
  CollisionResolverSystemSnapshot<T> createSnapshot() {
    final snapshot = CollisionResolverSystemSnapshot<T>(namedId);
    snapshot.restitution = restitution;
    snapshot.enableEventEmitting = enableEventEmitting;
    snapshot.gridCellSize = gridCellSize;
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CollisionResolverSystemSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    restitution = snapshot.restitution;
    enableEventEmitting = snapshot.enableEventEmitting;
    gridCellSize = snapshot.gridCellSize;
    // Rebuild derived state rather than restore it directly
    spatialGrid = .new(gridCellSize);
    // Scratch buffers are transient, clear rather than restore
    _bodies.clear();
    _checkedPairs.clear();
  }

  // persistence
  
  static const typeId = '__sceneSystem__CollisionResolverSystem';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'restitution': restitution,
    'enableEventEmitting': enableEventEmitting,
    'gridCellSize': gridCellSize,
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    restitution = data.getDouble('restitution', 1.0);
    enableEventEmitting = data.getBool('enableEventEmitting', true);

    gridCellSize = data.getDouble('gridCellSize', _defaultGridCellSize);
    spatialGrid = .new(gridCellSize);
  }
}

final class CollisionResolverSystemSnapshot<T extends App<T>> extends SceneSystemSnapshot<T, CollisionResolverSystem<T>> {
  late double restitution;
  late bool enableEventEmitting;
  late double gridCellSize;
  
  CollisionResolverSystemSnapshot(super.id);

  @override
  CollisionResolverSystem<T> createInstance(T app) => .new(app);
}

/// A mixin that provides typed collision resolution utilities for pairs of
/// collidable entities or components.
///
/// Enables type-safe pattern matching on collision pairs, useful when a system
/// needs to handle a collision differently based on what the two participants
/// are or what components they carry.
///
/// [T] is the [App] type, [E] is the base entity/component type that both
/// sides of the collision must satisfy.
mixin WithCollisionResolver<T extends App<T>, E extends IsComponentManagable<T, E>> {
  /// The first participant in the collision.
  E get a;

  /// The second participant in the collision.
  E get b;

  /// Returns the pair typed as `(A, B)` if the collision is between an [A] and
  /// a [B] (in either order), or `null` if neither ordering matches.
  ///
  /// ```dart
  /// final playerEnemy = collision.as<Player, Enemy>();
  /// if (playerEnemy != null) {
  ///   final (player, enemy) = playerEnemy;
  /// }
  /// ```
  (A, B)? as<A extends E, B extends E>() {
    if (a is A && b is B) return (a as A, b as B);
    if (a is B && b is A) return (b as A, a as B);
    return null;
  }

  /// Returns the pair ordered so that the first element carries component [A]
  /// and the second carries component [B], or `null` if the collision doesn't
  /// involve both component types.
  ///
  /// Unlike [as], this matches on *component presence* rather than entity type.
  ///
  /// ```dart
  /// final hasVelocityHealth = collision.has<CVelocity, CHealth>();
  /// if (hasVelocityHealth) {
  ///   final (hasVelocity, hasHealth) = hasVelocityHealth;
  /// }
  /// ```
  (E, E)? has<A extends Comp<T>, B extends Comp<T>>() {
    if (a.has<A>() && b.has<B>()) return (a, b);
    if (a.has<B>() && b.has<A>()) return (b, a);
    return null;
  }

  /// Returns the pair typed as `(A, C)` only if the types match (`A`/`C`) *and*
  /// the corresponding components are present (`B` on the first, `D` on the
  /// second).
  ///
  /// Combines [as] and [has], useful when you need both a specific entity type
  /// *and* a specific component to be present before handling a collision.
  ///
  /// Returns `null` if either the type check or the component check fails.
  (A, C)? asHas<
    A extends E,
    B extends Comp<T>,
    C extends E,
    D extends Comp<T>
  >() {
    final ab = as<A, C>();
    if (ab == null) return null;
    final cd = has<B, D>();
    if (cd == null) return null;
    return ab;
  }
}

/// Represents a collision between two [CCollider] components and exposes
/// helpers for resolving what kind of objects collided.
final class ColliderCollision<T extends App<T>> with WithCollisionResolver<T, Comp<T>> {
  @override
  final CCollider<T> a;

  @override
  final CCollider<T> b;

  ColliderCollision(this.a, this.b);

  /// Returns the pair ordered as `(aTag, bTag)` if the colliders carry those
  /// tags (in either order), or `null` if the tags don't match.
  (CCollider<T>, CCollider<T>)? asColliders(String aTag, String bTag) {
    if (a.tag == aTag && b.tag == bTag) return (a, b);
    if (a.tag == bTag && b.tag == aTag) return (b, a);
    return null;
  }

  /// Returns the owning entities typed as `(A, B)` if their types match (in
  /// either order), or `null` if neither ordering does.
  ///
  /// Useful when the collision handling logic needs the parent entity rather
  /// than the collider component itself.
  (A, B)? asEntities<A extends Entity<T>, B extends Entity<T>>() {
    final ae = a.entity;
    final be = b.entity;
    if (ae is A && be is B) return (ae, be);
    if (ae is B && be is A) return (be, ae);
    return null;
  }

  /// Returns `true` if this collision involves one collider tagged [aTag] and
  /// one tagged [bTag] (in either order).
  bool hasTags(String aTag, String bTag) => asColliders(aTag, bTag) != null;

  /// Returns `true` if this collision involves one collider's entity to be [A] and
  /// one's entity to be [B] (in either order).
  bool hasEntities<A extends Entity<T>, B extends Entity<T>>() => asEntities<A, B>() != null;
}

final class _EntityColliderData<T extends App<T>> {
  final Entity<T> entity;
  final CTransform<T> transform;
  final CVelocity<T>? velocity;
  final CCollider<T> collider;
  final CPhysicsBody<T>? physics;

  _EntityColliderData({
    required this.entity,
    required this.transform,
    required this.velocity,
    required this.collider,
    required this.physics,
  });
}
