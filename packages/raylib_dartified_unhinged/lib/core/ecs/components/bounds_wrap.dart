part of '../../raylib_dartified_unhinged.dart';

// wraps the entity around the screen
class CBoundsWrap<T extends App<T>> extends Comp<T> {
  List<double> get _defaultArea => [0, 0, screenHeight, screenWidth];
  
  late Bounds area;

  CBoundsWrap(super.app, {
    super.populateDefaults,
    Bounds? area
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
  void onPostUpdate(double dt) {
    final screen = sceneBounds.size;
    final bounds = entity.bounds;

    entity.onTransform((t) {
      final hw = (bounds?.width ?? 0) / 2;
      final hh = (bounds?.height ?? 0) / 2;

      if (t.position.x + hw < 0) t.position.x = screen.x + hw;
      if (t.position.x - hw > screen.x) t.position.x = -hw;
      if (t.position.y + hh < 0) t.position.y = screen.y + hh;
      if (t.position.y - hh > screen.y) t.position.y = -hh;
    });
  }

  // clone

  @override
  CBoundsWrap<T> createInstance() => .new(app,
    area: area.copy(),
  );

  // state

  @override
  CBoundsWrapSnapshot<T> createSnapshot() {
    final snapshot = CBoundsWrapSnapshot<T>(namedId);
    snapshot.area = area.copy();
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CBoundsWrapSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    area = snapshot.area.copy();
  }

  // persistence

  static const typeId = '__comp__CBoundsWrap';
  
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

class CBoundsWrapSnapshot<T extends App<T>> extends CompSnapshot<T, CBoundsWrap<T>> {
  late Bounds area;
  
  CBoundsWrapSnapshot(super.id);

  @override
  CBoundsWrap<T> createInstance(T app) => .new(app);
}