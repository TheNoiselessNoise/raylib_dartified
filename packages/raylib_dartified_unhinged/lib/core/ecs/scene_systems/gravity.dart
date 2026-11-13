part of '../../raylib_dartified_unhinged.dart';

class GravitySystem<T extends App<T>> extends SceneSystem<T> {
  Vector2 gravity;

  GravitySystem(super.app, {
    super.populateDefaults,
    Vector2? gravity
  }) : gravity = gravity ?? .zero();

  @override
  void onPostUpdate(double dt) => scene.QueryEntity.DoForEachWith2<CTransform<T>, CVelocity<T>>(
    (e, t, v) => v.velocity.y += gravity.y * dt
  );

  // clone

  @override
  GravitySystem<T> createInstance() => .new(app,
    gravity: gravity.copy(),
  );
  
  // state

  @override
  GravitySystemSnapshot<T> createSnapshot() {
    final snapshot = GravitySystemSnapshot<T>(namedId);
    snapshot.gravity = gravity.copy();
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant GravitySystemSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    gravity = snapshot.gravity.copy();
  }

  // persistence
  
  static const typeId = '__sceneSystem__GravitySystem';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'gravity': gravity.getPersistableData(),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    final gravityData = data.getList<double>('gravity');
    gravity.setPersistableData(gravityData);
  }
}

class GravitySystemSnapshot<T extends App<T>> extends SceneSystemSnapshot<T, GravitySystem<T>> {
  late Vector2 gravity;
  
  GravitySystemSnapshot(super.id);

  @override
  GravitySystem<T> createInstance(T app) => .new(app);
}