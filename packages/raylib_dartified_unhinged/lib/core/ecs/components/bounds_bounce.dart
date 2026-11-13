part of '../../raylib_dartified_unhinged.dart';

// bounce the entity from bounds edges
class CBoundsBounce<T extends App<T>> extends Comp<T> {
  static const double _defaultRestitution = 1;

  late Bounds area;
  double restitution; // 1.0 = perfect bounce, <1 = energy loss
  bool left;
  bool top;
  bool right;
  bool bottom;

  CBoundsBounce(super.app, {
    super.populateDefaults,
    Bounds? area,
    this.restitution = _defaultRestitution,
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
  }) {
    this.area = area ?? .bounds(0, 0, screenHeight, screenWidth);
  }

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('area', ObjectFieldDescriptor.value(
      () => area,
      (v) => area = v.copy(),
    ));

    descriptor.addField('restitution', DoubleFieldDescriptor.value(
      () => restitution,
      (v) => restitution = v,
    ));

    descriptor.addField('left', BoolFieldDescriptor(
      () => left,
      (v) => left = v,
    ));

    descriptor.addField('top', BoolFieldDescriptor(
      () => top,
      (v) => top = v,
    ));

    descriptor.addField('right', BoolFieldDescriptor(
      () => right,
      (v) => right = v,
    ));

    descriptor.addField('bottom', BoolFieldDescriptor(
      () => bottom,
      (v) => bottom = v,
    ));
  }

  @override
  void onPostUpdate(double dt) => entity.on2<CTransform<T>, CVelocity<T>>((t, v) {
    final bounds = entity.bounds;
    if (bounds == null) return;

    final pos = t.position;
    final vel = v.velocity;

    final body = entity.get<CPhysicsBody<T>>();
    final isKinematic = body != null && body.mass == 0;

    double rx = bounds.width / 2;
    double ry = bounds.height / 2;

    // LEFT
    final minX = rx;
    if (left && pos.x < minX) {
      pos.x = minX;
      if (vel.x < 0) vel.x = isKinematic ? 0 : -vel.x * restitution;
    }

    // RIGHT
    final maxX = area.right - rx;
    if (right && pos.x > maxX) {
      pos.x = maxX;
      if (vel.x > 0) vel.x = isKinematic ? 0 : -vel.x * restitution;
    }

    // TOP
    final minY = ry;
    if (top && pos.y < minY) {
      pos.y = minY;
      if (vel.y < 0) vel.y = isKinematic ? 0 : -vel.y * restitution;
    }

    // BOTTOM
    final maxY = area.bottom - ry;
    if (bottom && pos.y > maxY) {
      pos.y = maxY;
      if (vel.y > 0) vel.y = isKinematic ? 0 : -vel.y * restitution;
    }
  });

  // clone

  @override
  CBoundsBounce<T> createInstance() => .new(app,
    restitution: restitution,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
  
  // state

  @override
  CBoundsBounceSnapshot<T> createSnapshot() {
    final snapshot = CBoundsBounceSnapshot<T>(namedId);
    snapshot.restitution = restitution;
    snapshot.left = left;
    snapshot.top = top;
    snapshot.right = right;
    snapshot.bottom = bottom;
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CBoundsBounceSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    restitution = snapshot.restitution;
    left = snapshot.left;
    top = snapshot.top;
    right = snapshot.right;
    bottom = snapshot.bottom;
  }

  // persistence

  static const typeId = '__comp__CBoundsBounce';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'area': area.getPersistableData(),
    'restitution': restitution,
    'left': left,
    'top': top,
    'right': right,
    'bottom': bottom,
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    final areaData = data.getList<double>('area');
    area.setPersistableData(areaData);

    restitution = data.getDouble('restitution', _defaultRestitution);
    left = data.getBool('left');
    top = data.getBool('top');
    right = data.getBool('right');
    bottom = data.getBool('bottom');
  }
}

class CBoundsBounceSnapshot<T extends App<T>> extends CompSnapshot<T, CBoundsBounce<T>> {
  late double restitution;
  late bool left;
  late bool top;
  late bool right;
  late bool bottom;
  
  CBoundsBounceSnapshot(super.id);

  @override
  CBoundsBounce<T> createInstance(T app) => .new(app);
}