part of '../../raylib_dartified_unhinged.dart';

class ScreenBounceSystem<T extends App<T>> extends SceneSystem<T> {
  static const double _defaultRestitution = 1;

  double restitution; // 1.0 = perfect bounce, <1 = energy loss
  bool top;
  bool left;
  bool bottom;
  bool right;

  ScreenBounceSystem(super.app, {
    super.populateDefaults,
    this.restitution = _defaultRestitution,
    this.top = true,
    this.left = true,
    this.bottom = true,
    this.right = true,
  });

  @override
  void onPostUpdate(double dt) {
    final screen = sceneBounds.size;

    scene.QueryEntity.DoForEachWith2<CTransform<T>, CVelocity<T>>((e, t, v) {
      final bounds = e.bounds;
      if (bounds == null) return;

      final pos = t.position;
      final vel = v.velocity;

      final body = e.get<CPhysicsBody<T>>();
      final isKinematic = body != null && body.mass == 0;

      double rx = bounds.width / 2;
      double ry = bounds.height / 2;

      // TOP
      final minY = ry;
      if (top && pos.y < minY) {
        pos.y = minY;
        if (vel.y < 0) vel.y = isKinematic ? 0 : -vel.y * restitution;
      }

      // LEFT
      final minX = rx;
      if (left && pos.x < minX) {
        pos.x = minX;
        if (vel.x < 0) vel.x = isKinematic ? 0 : -vel.x * restitution;
      }

      // BOTTOM
      final maxY = screen.y - ry;
      if (bottom && pos.y > maxY) {
        pos.y = maxY;
        if (vel.y > 0) vel.y = isKinematic ? 0 : -vel.y * restitution;
      }

      // RIGHT
      final maxX = screen.x - rx;
      if (right && pos.x > maxX) {
        pos.x = maxX;
        if (vel.x > 0) vel.x = isKinematic ? 0 : -vel.x * restitution;
      }
    });
  }

  // clone

  @override
  ScreenBounceSystem<T> createInstance() => .new(app,
    restitution: restitution,
    top: top,
    left: left,
    bottom: bottom,
    right: right,
  );
  
  // state

  @override
  ScreenBounceSystemSnapshot<T> createSnapshot() {
    final snapshot = ScreenBounceSystemSnapshot<T>(namedId);
    snapshot.restitution = restitution;
    snapshot.top = top;
    snapshot.left = left;
    snapshot.bottom = bottom;
    snapshot.right = right;
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant ScreenBounceSystemSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    restitution = snapshot.restitution;
    top = snapshot.top;
    left = snapshot.left;
    bottom = snapshot.bottom;
    right = snapshot.right;
  }

  // persistence
  
  static const typeId = '__sceneSystem__ScreenBounceSystem';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'restitution': restitution,
    'top': top,
    'left': left,
    'bottom': bottom,
    'right': right,
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    restitution = data.getDouble('restitution', _defaultRestitution);
    top = data.getBool('top');
    left = data.getBool('left');
    bottom = data.getBool('bottom');
    right = data.getBool('right');
  }
}

class ScreenBounceSystemSnapshot<T extends App<T>> extends SceneSystemSnapshot<T, ScreenBounceSystem<T>> {
  late double restitution;
  late bool top;
  late bool left;
  late bool bottom;
  late bool right;
  
  ScreenBounceSystemSnapshot(super.id);

  @override
  ScreenBounceSystem<T> createInstance(T app) => .new(app);
}