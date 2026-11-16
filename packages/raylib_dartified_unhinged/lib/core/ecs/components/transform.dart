part of '../../raylib_dartified_unhinged.dart';

// world position, scale and rotation
class CTransform<T extends App<T>> extends Comp<T> {
  static const double _defaultRotation = 0;

  late Vector2 prevPosition;

  Vector2 position; // CENTER position in world space
  double rotation;  // radians
  Vector2 scale;    // 1,1 is identity

  CTransform(super.app, {
    super.populateDefaults,
    Vector2? position,
    this.rotation = _defaultRotation,
    Vector2? scale,
  }) :
    position = position ?? .zero(),
    scale = scale ?? .one()
  {
    prevPosition = this.position.copy();
  }

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('prevPosition', ObjectFieldDescriptor.value(
      () => prevPosition,
      (v) => prevPosition = v.copy(),
    ));

    descriptor.addField('position', ObjectFieldDescriptor.value(
      () => position,
      (v) => position = v.copy(),
    ));

    descriptor.addField('rotation', DoubleFieldDescriptor.value(
      () => rotation,
      (v) => rotation = v,
    ));

    descriptor.addField('scale', ObjectFieldDescriptor.value(
      () => scale,
      (v) => scale = v.copy(),
    ));
  }

  @override
  @mustCallSuper
  void onPostUpdate(double dt) {
    if (isDisabled) return;
    prevPosition = position.copy();
  }

  // clone

  @override
  CTransform<T> createInstance() => .new(app);

  // state

  @override
  CTransformSnapshot<T> createSnapshot() {
    final snapshot = CTransformSnapshot<T>(namedId);
    snapshot.position = position.copy();
    snapshot.rotation = rotation;
    snapshot.scale = scale.copy();
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CTransformSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    position = snapshot.position.copy();
    rotation = snapshot.rotation;
    scale = snapshot.scale.copy();
  }

  // persistence

  static const typeId = '__comp__CTransform';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'position': position.getPersistableData(),
    'rotation': rotation,
    'scale': scale.getPersistableData(),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    final positionData = data.getList<double>('position');
    position.setPersistableData(positionData);

    rotation = data.getDouble('rotation', _defaultRotation);

    final scaleData = data.getList<double>('scale');
    scale.setPersistableData(scaleData);
  }
}

class CTransformSnapshot<T extends App<T>> extends CompSnapshot<T, CTransform<T>> {
  late Vector2 position;
  late double rotation;
  late Vector2 scale;
  
  CTransformSnapshot(super.id);

  @override
  CTransform<T> createInstance(T app) => .new(app);
}