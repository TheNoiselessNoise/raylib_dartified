part of '../../raylib_dartified_unhinged.dart';

class CImage<T extends App<T>> extends Comp<T> {
  Texture? texture;

  /// If provided, draws a sub-rect from the texture (sprite sheet).
  /// If null, draws the full texture.
  Rectangle? sourceRect;

  Color? tint;

  // cached drawing data
  Rectangle source = .zero();
  Rectangle dest = .zero();
  Vector2 origin = .zero();

  /// Optional: override draw size in world units.
  /// If null, we try CSprite.size; if absent, we fall back to texture size.
  Vector2? size;

  CImage(super.app, {
    super.populateDefaults,
    this.texture,
    this.sourceRect,
    this.tint,
    this.size,
  });

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('texture', ObjectFieldDescriptor.nullable(
      () => texture,
      (v) => texture = v,
    ));

    descriptor.addField('sourceRect', ObjectFieldDescriptor.nullable(
      () => sourceRect,
      (v) => sourceRect = v?.copy(),
    ));

    descriptor.addField('tint', ColorFieldDescriptor.nullable(
      () => tint,
      (v) => tint = v?.copy(),
    ));

    descriptor.addField('source', ObjectFieldDescriptor.value(
      () => source,
      (v) => source = v.copy(),
    ));

    descriptor.addField('dest', ObjectFieldDescriptor.value(
      () => dest,
      (v) => dest = v.copy(),
    ));

    descriptor.addField('origin', ObjectFieldDescriptor.value(
      () => origin,
      (v) => origin = v.copy(),
    ));

    descriptor.addField('size', ObjectFieldDescriptor.nullable(
      () => size,
      (v) => size = v?.copy(),
    ));
  }

  Vector2 _getLocalSize() {
    if (size != null) return size!;
    final sprite = entity.get<CSprite<T>>();
    if (sprite != null) return sprite.size;

    // Fallback to texture dimensions (assuming your Texture2D exposes width/height)
    if (texture == null) return .zero();
    return .vec2(texture!.width, texture!.height);
  }

  @override
  void onPostUpdate(double dt) => entity.onTransform((t) {
    // Source rect
    if (sourceRect != null) {
      source = sourceRect!.copy();
    } else {
      source.set(0, 0, texture?.width ?? 0, texture?.height ?? 0);
    }

    // Dest rect: centered on transform.position, scaled by transform.scale
    final local = _getLocalSize();
    final w = local.x * t.scale.x;
    final h = local.y * t.scale.y;

    dest.set(
      t.position.x - w / 2,
      t.position.y - h / 2,
      w,
      h,
    );

    // Rotate/scale around center
    origin.set(w / 2, h / 2);
  });

  @override
  void onDraw(double dt) => entity.onTransform((t) {
    if (texture == null) return;

    backend.render.drawTexturePro(
      texture!,
      source,
      dest,
      origin,
      t.rotation * 180.0 / math.pi,
      tint ?? .WHITE,
    );
  });

  // clone

  @override
  CImage<T> createInstance() => .new(app);

  // state

  @override
  CImageSnapshot<T> createSnapshot() {
    final snapshot = CImageSnapshot<T>(namedId);
    snapshot.texture = texture?.copy();
    snapshot.sourceRect = sourceRect?.copy();
    snapshot.tint = tint?.copy();
    snapshot.source = source.copy();
    snapshot.dest = dest.copy();
    snapshot.origin = origin.copy();
    snapshot.size = size?.copy();
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CImageSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    texture = snapshot.texture?.copy();
    sourceRect = snapshot.sourceRect?.copy();
    tint = snapshot.tint?.copy();
    source = snapshot.source.copy();
    dest = snapshot.dest.copy();
    origin = snapshot.origin.copy();
    size = snapshot.size?.copy();
  }

  // persistence

  static const typeId = '__comp__CImage';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'sourceRect': sourceRect?.getPersistableData(),
    'tint': tint?.getPersistableData(),
    'source': source.getPersistableData(),
    'dest': dest.getPersistableData(),
    'origin': origin.getPersistableData(),
    'size': size?.getPersistableData(),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    // NOTE: `texture` needs to be reassigned elsewhere

    final sourceRectData = data.getListOrNull<double>('sourceRect');
    if (sourceRectData != null) sourceRect?.setPersistableData(sourceRectData);

    final tintData = data.getListOrNull<int>('tint');
    if (tintData != null) tint?.setPersistableData(tintData);

    final sourceData = data.getList<double>('source');
    source.setPersistableData(sourceData);

    final destData = data.getList<double>('dest');
    dest.setPersistableData(destData);

    final originData = data.getList<double>('origin');
    origin.setPersistableData(originData);

    final sizeData = data.getListOrNull<double>('size');
    if (sizeData != null) size?.setPersistableData(sizeData);
  }
}

class CImageSnapshot<T extends App<T>> extends CompSnapshot<T, CImage<T>> {
  late Texture? texture;
  late Rectangle? sourceRect;
  late Color? tint;
  late Rectangle source;
  late Rectangle dest;
  late Vector2 origin;
  late Vector2? size;
  
  CImageSnapshot(super.id);

  @override
  CImage<T> createInstance(T app) => .new(app);
}