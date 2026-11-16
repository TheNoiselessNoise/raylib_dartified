part of '../../raylib_dartified_unhinged.dart';

// keep the entity inside the bounds
class CBoundsConstraint<T extends App<T>> extends Comp<T> {
  List<double> get _defaultArea => [0, 0, screenHeight, screenWidth];

  late Bounds area;

  CBoundsConstraint(super.app, {
    super.populateDefaults,
    Bounds? area,
  }) {
    final a = _defaultArea;
    this.area = area ?? .bounds(a[0], a[1], a[2], a[3]);
  }

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('area', ObjectFieldDescriptor.value(
      () => area,
      (v) => area = v.copy(),
    ));
  }

  @override
  void onPostUpdate(double dt) => entity.on2<CTransform<T>, CVelocity<T>>((t, v) {
    final bounds = entity.bounds!;

    var dx = v.velocity.x;
    var dy = v.velocity.y;

    if (bounds.left + dx < area.left) {
      dx = area.left - bounds.left;
    } else if (bounds.right + dx > area.right) {
      dx = area.right - bounds.right;
    }

    if (bounds.top + dy < area.top) {
      dy = area.top - bounds.top;
    } else if (bounds.bottom + dy > area.bottom) {
      dy = area.bottom - bounds.bottom;
    }

    t.position.x += dx;
    t.position.y += dy;
  });

  // clone

  @override
  CBoundsConstraint<T> createInstance() => .new(app);

  // state

  @override
  CBoundsConstraintSnapshot<T> createSnapshot() {
    final snapshot = CBoundsConstraintSnapshot<T>(namedId);
    snapshot.area = area.copy();
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CBoundsConstraintSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    area = snapshot.area.copy();
  }

  // persistence

  static const typeId = '__comp__CBoundsConstraint';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'area': area.getPersistableData(),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    final areaData = data.getList<double>('area', _defaultArea);
    area.setPersistableData(areaData);
  }
}

class CBoundsConstraintSnapshot<T extends App<T>> extends CompSnapshot<T, CBoundsConstraint<T>> {
  late Bounds area;
  
  CBoundsConstraintSnapshot(super.id);

  @override
  CBoundsConstraint<T> createInstance(T app) => .new(app);
}
