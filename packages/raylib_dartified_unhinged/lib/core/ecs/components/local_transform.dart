part of '../../raylib_dartified_unhinged.dart';

class CLocalTransform<T extends App<T>> extends Comp<T> {
  static const double _defaultRotation = 0;

  Vector2 offset; // OFFSET from a parent
  double rotation; // radians
  Vector2 scale;  // 1,1 is identity

  CLocalTransform(super.app, {
    super.populateDefaults,
    Vector2? offset,
    this.rotation = _defaultRotation,
    Vector2? scale,
  }) :
    offset = offset ?? .zero(),
    scale = scale ?? .one();

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('offset', ObjectFieldDescriptor.value(
      () => offset,
      (v) => offset = v.copy(),
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

  // clone

  @override
  CLocalTransform<T> createInstance() => .new(app);

  // state

  @override
  CLocalTransformSnapshot<T> createSnapshot() {
    final snapshot = CLocalTransformSnapshot<T>(namedId);
    snapshot.offset = offset.copy();
    snapshot.rotation = rotation;
    snapshot.scale = scale.copy();
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CLocalTransformSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    offset = snapshot.offset.copy();
    rotation = snapshot.rotation;
    scale = snapshot.scale.copy();
  }

  // persistence

  static const typeId = '__comp__CLocalTransform';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'offset': offset.getPersistableData(),
    'rotation': rotation,
    'scale': scale.getPersistableData(),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    final offsetData = data.getList<double>('offset');
    offset.setPersistableData(offsetData);

    rotation = data.getDouble('rotation', _defaultRotation);

    final scaleData = data.getList<double>('scale');
    scale.setPersistableData(scaleData);
  }
}

class CLocalTransformSnapshot<T extends App<T>> extends CompSnapshot<T, CLocalTransform<T>> {
  late Vector2 offset;
  late double rotation;
  late Vector2 scale;
  
  CLocalTransformSnapshot(super.id);

  @override
  CLocalTransform<T> createInstance(T app) => .new(app);
}