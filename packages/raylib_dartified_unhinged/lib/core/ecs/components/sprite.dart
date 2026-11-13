part of '../../raylib_dartified_unhinged.dart';

// simple colored rect
class CSprite<T extends App<T>> extends Comp<T> {
  static const List<double> _defaultSize = [50, 50];

  Vector2 size; // unscaled local size
  Color? color;

  // cached for drawing
  Rectangle rect = .zero(); // dest rect (centered)
  Vector2 origin = .zero(); // origin relative to rec (usually center)

  CSprite(super.app, {
    super.populateDefaults,
    Vector2? size,
    this.color,
  }) : size = size ?? .vec2(_defaultSize[0], _defaultSize[1]);

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('size', ObjectFieldDescriptor.value(
      () => size,
      (v) => size = v.copy(),
    ));

    descriptor.addField('color', ObjectFieldDescriptor.nullable(
      () => color,
      (v) => color = v?.copy(),
    ));

    descriptor.addField('rect', ObjectFieldDescriptor.value(
      () => rect,
      (v) => rect = v.copy(),
    ));

    descriptor.addField('origin', ObjectFieldDescriptor.value(
      () => origin,
      (v) => origin = v.copy(),
    ));
  }

  @override
  void onPostUpdate(double dt) => entity.onTransform((t) {
    final w = size.x * t.scale.x;
    final h = size.y * t.scale.y;

    rect.set(t.position.x - w / 2, t.position.y - h / 2, w, h);
    origin.set(w / 2, h / 2);
  });

  @override
  void onDraw(double dt) => entity.onTransform((t) {
    backend.render.drawRectanglePro(
      rect,
      origin,
      t.rotation * 180.0 / math.pi,
      color ?? .WHITE,
    );
  });

  // clone

  @override
  CSprite<T> createInstance() {
    final c = CSprite<T>(app,
      size: size.copy(),
      color: color,
    );
    c.rect = rect.copy();
    c.origin = origin.copy();
    return c;
  }
  
  // state

  @override
  CSpriteSnapshot<T> createSnapshot() {
    final snapshot = CSpriteSnapshot<T>(namedId);
    snapshot.size = size.copy();
    snapshot.color = color?.copy();
    snapshot.rect = rect.copy();
    snapshot.origin = origin.copy();
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CSpriteSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    size = snapshot.size.copy();
    color = snapshot.color?.copy();
    rect = snapshot.rect.copy();
    origin = snapshot.origin.copy();
  }

  // persistence

  static const typeId = '__comp__CSprite';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'size': size,
    'color': color?.getPersistableData(),
    'rect': rect.getPersistableData(),
    'origin': origin.getPersistableData(),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    final sizeData = data.getList<double>('size', _defaultSize);
    size.setPersistableData(sizeData);

    final colorData = data.getListOrNull<int>('color');
    if (colorData != null) color?.setPersistableData(colorData);

    final rectData = data.getList<double>('rect');
    rect.setPersistableData(rectData);

    final originData = data.getList<double>('origin');
    origin.setPersistableData(originData);
  }
}

class CSpriteSnapshot<T extends App<T>> extends CompSnapshot<T, CSprite<T>> {
  late Vector2 size;
  late Color? color;
  late Rectangle rect;
  late Vector2 origin;
  
  CSpriteSnapshot(super.id);

  @override
  CSprite<T> createInstance(T app) => .new(app);
}