part of '../../raylib_dartified_unhinged.dart';

class CRenderLayer<T extends App<T>> extends Comp<T> {
  late String _layer;

  String get layer => _layer;

  set layer(String value) {
    final oldLayer = _layer;
    _layer = value;

    // We only care if parent of this component is Entity
    // not another component for example
    if (parent case Entity<T> entity) {
      // We only care if parent of Entity is `Scene`
      // not `EntityGroup` for example
      if (entity.parent case Scene<T> scene) {
        scene._onLayerChanged(entity, oldLayer, value);
      }
    }
  }

  CRenderLayer(super.app, {
    super.populateDefaults,
    String? layer,
  }) : _layer = layer ?? RenderLayers.world.name;

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('layer', StringFieldDescriptor(
      () => layer,
      (v) => layer = v,
    ));
  }

  // clone

  @override
  CRenderLayer<T> createInstance() => .new(app,
    layer: layer,
  );

  // state

  @override
  CRenderLayerSnapshot<T> createSnapshot() {
    final snapshot = CRenderLayerSnapshot<T>(namedId);
    snapshot.layer = layer;
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CRenderLayerSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    _layer = snapshot.layer;
  }

  // persistence

  static const typeId = '__comp__CRenderLayer';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'layer': layer,
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    _layer = data.getString('layer');
  }
}

class CRenderLayerSnapshot<T extends App<T>> extends CompSnapshot<T, CRenderLayer<T>> {
  late String layer;
  
  CRenderLayerSnapshot(super.id);

  @override
  CRenderLayer<T> createInstance(T app) => .new(app);
}