part of '../../raylib_dartified_unhinged.dart';

abstract class CCollider<T extends App<T>> extends Comp<T> with
  IsCollidable<T, Comp<T>, CCollider<T>>
{
  static const String _defaultTag = 'default';
  static const bool _defaultEnableCollision = true;
  static const bool _defaultDebugDraw = false;
  static const double _defaultLinesThick = 1;

  String tag;
  bool enableCollision;
  bool debugDraw;
  double debugLinesThick;
  Color? debugColor;

  CCollider(super.app, {
    super.populateDefaults,
    this.tag = _defaultTag,
    this.enableCollision = _defaultEnableCollision,
    this.debugDraw = _defaultDebugDraw,
    this.debugLinesThick = _defaultLinesThick,
    this.debugColor,

    HookResult Function(Comp<T> self, CCollider<T> other)? onBeforeCollisionFn,
    void Function(Comp<T> self, CCollider<T> other)? onCollisionFn,
    void Function(Comp<T> self, CCollider<T> other)? onAfterCollisionFn,
  }) {
    if (onBeforeCollisionFn != null) listenOnBeforeCollision(onBeforeCollisionFn);
    if (onCollisionFn != null) listenOnCollision(onCollisionFn);
    if (onAfterCollisionFn != null) listenOnAfterCollision(onAfterCollisionFn);
  }

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('tag', StringFieldDescriptor(
      () => tag,
      (v) => tag = v,
    ));

    descriptor.addField('enableCollision', BoolFieldDescriptor(
      () => enableCollision,
      (v) => enableCollision = v,
    ));

    descriptor.addField('debugDraw', BoolFieldDescriptor(
      () => debugDraw,
      (v) => debugDraw = v,
    ));

    descriptor.addField('debugLinesThick', DoubleFieldDescriptor.value(
      () => debugLinesThick,
      (v) => debugLinesThick = v,
    ));

    descriptor.addField('debugColor', ColorFieldDescriptor.nullable(
      () => debugColor,
      (v) => debugColor = v,
    ));
  }

  // persistence

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'tag': tag,
    'enableCollision': enableCollision,
    'debugDraw': debugDraw,
    'debugLinesThick': debugLinesThick,
    'debugColor': debugColor?.getPersistableData(),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    tag = data.getString('tag', _defaultTag);
    enableCollision = data.getBool('enableCollision', _defaultEnableCollision);
    debugDraw = data.getBool('debugDraw', _defaultDebugDraw);
    debugLinesThick = data.getDouble('debugLinesThick', _defaultLinesThick);

    final debugColorData = data.getListOrNull<int>('debugColor');
    if (debugColorData != null) debugColor?.setPersistableData(debugColorData);
  }
}

abstract class CColliderSnapshot<T extends App<T>, C extends CCollider<T>> extends CompSnapshot<T, C> {
  late String tag;
  late bool enableCollision;
  late bool debugDraw;
  late double debugLinesThick;
  late Color? debugColor;

  CColliderSnapshot(super.id);

  void _setColliderStateFrom(C source) {
    tag = source.tag;
    enableCollision = source.enableCollision;
    debugDraw = source.debugDraw;
    debugLinesThick = source.debugLinesThick;
    debugColor = source.debugColor;
  }

  void _setColliderStateTo(C destination) {
    destination.tag = tag;
    destination.enableCollision = enableCollision;
    destination.debugDraw = debugDraw;
    destination.debugLinesThick = debugLinesThick;
    destination.debugColor = debugColor;
  }
}

class CCircleCollider<T extends App<T>> extends CCollider<T> {
  static const double _defaultRadius = 0;

  double baseRadius;
  double radius;

  Vector2 get center => entity.get<CTransform<T>>()!.position;

  CCircleCollider(super.app, {
    super.populateDefaults,
    this.radius = _defaultRadius,
    super.tag,
    super.enableCollision,
    super.debugDraw,
    super.debugLinesThick,
    super.debugColor,
    super.onBeforeCollisionFn,
    super.onCollisionFn,
    super.onAfterCollisionFn,
  }) : baseRadius = radius;

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('baseRadius', DoubleFieldDescriptor.value(
      () => baseRadius,
      (v) => baseRadius = v,
    ));

    descriptor.addField('radius', DoubleFieldDescriptor.value(
      () => radius,
      (v) => radius = v,
    ));

    descriptor.addField('center', ObjectFieldDescriptor.value(
      () => center,
    ));
  }

  @override
  void onPostUpdate(double dt) => entity.onTransform((t) {
    final sx = t.scale.x;
    final sy = t.scale.y;

    double s;
    if (!sx.isFinite || !sy.isFinite) {
      s = 1.0;
    } else {
      s = (sx + sy) * 0.5;
      if (s <= 0) s = 1.0;
    }

    radius = baseRadius * s;
  });

  @override
  void onDraw(double dt) {
    if (!debugDraw) return;
    if (!radius.isFinite || radius <= 0) return;

    backend.render.drawCircleLinesV(
      center,
      radius,
      debugColor ?? .GREEN,
    );
  }

  // clone

  @override
  CCircleCollider<T> createInstance() {
    final c = CCircleCollider<T>(app,
      radius: baseRadius,
      tag: tag,
      enableCollision: enableCollision,
      debugDraw: debugDraw,
      debugLinesThick: debugLinesThick,
      debugColor: debugColor,
    );
    c.radius = radius;
    return c;
  }

  // state

  @override
  CCircleColliderSnapshot<T> createSnapshot() {
    final snapshot = CCircleColliderSnapshot<T>(namedId);
    snapshot._setColliderStateFrom(this);
    snapshot.radius = radius;
    snapshot.center = center.copy();
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CCircleColliderSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    snapshot._setColliderStateTo(this);
    radius = snapshot.radius;
  }

  // persistence

  static const typeId = '__comp__CCircleCollider';
  
  @override String get persistentTypeId => typeId;
  
  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'baseRadius': baseRadius,
    'radius': radius,
    'center': center.getPersistableData(),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    baseRadius = data.getDouble('baseRadius');
    radius = data.getDouble('radius', _defaultRadius);

    final centerData = data.getList<double>('center');
    center.setPersistableData(centerData);
  }
}

class CCircleColliderSnapshot<T extends App<T>> extends CColliderSnapshot<T, CCircleCollider<T>> {
  late double radius;
  late Vector2 center;

  CCircleColliderSnapshot(super.id);
  
  @override
  CCircleCollider<T> createInstance(T app) => .new(app);
}

class CRectCollider<T extends App<T>> extends CCollider<T> {
  static const bool _defaultAutoSync = true;
  static const bool _defaultEnableRotation = false;

  Vector2? size;

  Rectangle rect = .zero();
  bool autoSync;
  bool enableRotation;

  CRectCollider(super.app, {
    super.populateDefaults,
    this.autoSync = _defaultAutoSync,
    this.size,
    this.enableRotation = _defaultEnableRotation,
    super.tag,
    super.enableCollision,
    super.debugDraw,
    super.debugLinesThick,
    super.debugColor,
    super.onBeforeCollisionFn,
    super.onCollisionFn,
    super.onAfterCollisionFn,
  });

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('size', ObjectFieldDescriptor.nullable(
      () => size,
      (v) => size = v?.copy(),
    ));

    descriptor.addField('rect', ObjectFieldDescriptor.value(
      () => rect,
      (v) => rect = v.copy(),
    ));

    descriptor.addField('autoSync', BoolFieldDescriptor(
      () => autoSync,
      (v) => autoSync = v,
    ));

    descriptor.addField('enableRotation', BoolFieldDescriptor(
      () => enableRotation,
      (v) => enableRotation = v,
    ));
  }

  Vector2 _getLocalSize() {
    if (size != null) return size!;
    final sprite = entity.get<CSprite<T>>();
    if (sprite != null) return sprite.size;
    return .zero();
  }

  @override
  void onPostUpdate(double dt) => entity.onTransform((t) {
    if (!autoSync) return;
    final s = _getLocalSize();
    final w = s.x * t.scale.x;
    final h = s.y * t.scale.y;

    rect.set(
      t.position.x - w / 2,
      t.position.y - h / 2,
      w,
      h,
    );
  });

  @override
  void onDraw(double dt) {
    if (!debugDraw) return;

    if (enableRotation) {
      double rotation = 0;

      entity.onTransform((t) => rotation = t.rotation * 180 / math.pi);

      backend.render.drawRectangleLinesRotated(
        rect,
        rotation,
        debugLinesThick,
        debugColor ?? .GREEN,
      );
      return;
    }

    backend.render.drawRectangleLinesEx(
      rect,
      debugLinesThick,
      debugColor ?? .GREEN,
    );
  }

  // clone

  @override
  CRectCollider<T> createInstance() {
    final c = CRectCollider<T>(app,
      size: size?.copy(),
      tag: tag,
      autoSync: autoSync,
      enableCollision: enableCollision,
      debugDraw: debugDraw,
      debugLinesThick: debugLinesThick,
      debugColor: debugColor,
    );
    c.rect = rect.copy();
    return c;
  }

  // state

  @override
  CRectColliderSnapshot<T> createSnapshot() {
    final snapshot = CRectColliderSnapshot<T>(namedId);
    snapshot._setColliderStateFrom(this);
    snapshot.size = size?.copy();
    snapshot.rect = rect.copy();
    snapshot.autoSync = autoSync;
    snapshot.enableRotation = enableRotation;
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CRectColliderSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    snapshot._setColliderStateTo(this);
    size = snapshot.size?.copy();
    rect = snapshot.rect.copy();
    autoSync = snapshot.autoSync;
    enableRotation = snapshot.enableRotation;
  }

  // persistence

  static const typeId = '__comp__CRectCollider';

  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'size': size?.getPersistableData(),
    'rect': rect.getPersistableData(),
    'autoSync': autoSync,
    'enableRotation': enableRotation,
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    final sizeData = data.getListOrNull<double>('size');
    if (sizeData != null) size?.setPersistableData(sizeData);

    final rectData = data.getList<double>('rect');
    rect.setPersistableData(rectData);

    autoSync = data.getBool('autoSync', _defaultAutoSync);
    enableRotation = data.getBool('enableRotation', _defaultEnableRotation);
  }
}

class CRectColliderSnapshot<T extends App<T>> extends CColliderSnapshot<T, CRectCollider<T>> {
  late Vector2? size;
  late Rectangle rect;
  late bool autoSync;
  late bool enableRotation;
  
  CRectColliderSnapshot(super.id);

  @override
  CRectCollider<T> createInstance(T app) => .new(app);
}
