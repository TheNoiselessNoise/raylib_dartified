part of '../../raylib_dartified_unhinged.dart';

class COutOfBounds<T extends App<T>> extends Comp<T> {
  static const bool _defaultCheckTop = true;
  static const bool _defaultCheckLeft = true;
  static const bool _defaultCheckBottom = true;
  static const bool _defaultCheckRight = true;
  static const bool _defaultTriggerOnce = true;

  bool checkTop;
  bool checkLeft;
  bool checkBottom;
  bool checkRight;

  bool top = false;
  bool left = false;
  bool bottom = false;
  bool right = false;
  void Function(COutOfBounds<T> self)? then;

  bool triggerOnce;

  COutOfBounds(super.app, {
    super.populateDefaults,
    this.checkTop = _defaultCheckTop,
    this.checkLeft = _defaultCheckLeft,
    this.checkBottom = _defaultCheckBottom,
    this.checkRight = _defaultCheckRight,
    this.then,
    this.triggerOnce = _defaultTriggerOnce,
  });

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('checkTop', BoolFieldDescriptor(
      () => checkTop,
      (v) => checkTop = v,
    ));

    descriptor.addField('checkLeft', BoolFieldDescriptor(
      () => checkLeft,
      (v) => checkLeft = v,
    ));

    descriptor.addField('checkBottom', BoolFieldDescriptor(
      () => checkBottom,
      (v) => checkBottom = v,
    ));

    descriptor.addField('checkRight', BoolFieldDescriptor(
      () => checkRight,
      (v) => checkRight = v,
    ));

    descriptor.addField('top', BoolFieldDescriptor(
      () => top,
      (v) => top = v,
    ));

    descriptor.addField('left', BoolFieldDescriptor(
      () => left,
      (v) => left = v,
    ));

    descriptor.addField('bottom', BoolFieldDescriptor(
      () => bottom,
      (v) => bottom = v,
    ));

    descriptor.addField('right', BoolFieldDescriptor(
      () => right,
      (v) => right = v,
    ));

    descriptor.addField('then', ObjectFieldDescriptor.value(
      () => then,
      (v) => then = v,
    ));

    descriptor.addField('triggerOnce', BoolFieldDescriptor(
      () => triggerOnce,
      (v) => triggerOnce = v,
    ));
  }

  bool _thenCalled = false;
  void reset() => _thenCalled = false;

  @override
  void onPostUpdate(double dt) {
    final screen = sceneBounds.size;
    final bounds = entity.bounds;
    if (bounds == null) return;

    top = checkTop && bounds.bottom < 0;
    left = checkLeft && bounds.right < 0;
    bottom = checkBottom && bounds.top > screen.y;
    right = checkRight && bounds.left > screen.x;

    if (!(top || left || bottom || right)) return;
    
    if (then != null && !_thenCalled) {
      if (triggerOnce) _thenCalled = true;
      then!(this);
    } else {
      callback(() => scene.removeEntity(entity));
    }
  }

  @override
  COutOfBounds<T> createInstance() => .new(app);

  // state

  @override
  COutOfBoundsSnapshot<T> createSnapshot() {
    final snapshot = COutOfBoundsSnapshot<T>(namedId);
    snapshot.checkTop = checkTop;
    snapshot.checkLeft = checkLeft;
    snapshot.checkBottom = checkBottom;
    snapshot.checkRight = checkRight;

    snapshot.top = top;
    snapshot.left = left;
    snapshot.bottom = bottom;
    snapshot.right = right;
    snapshot.then = then;

    snapshot.triggerOnce = triggerOnce;
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant COutOfBoundsSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    checkTop = snapshot.checkTop;
    checkLeft = snapshot.checkLeft;
    checkBottom = snapshot.checkBottom;
    checkRight = snapshot.checkRight;

    top = snapshot.top;
    left = snapshot.left;
    bottom = snapshot.bottom;
    right = snapshot.right;
    then = snapshot.then;

    triggerOnce = snapshot.triggerOnce;
  }

  // persistence

  static const typeId = '__comp__COutOfBounds';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'checkTop': checkTop,
    'checkLeft': checkLeft,
    'checkBottom': checkBottom,
    'checkRight': checkRight,
    'top': top,
    'left': left,
    'bottom': bottom,
    'right': right,
    'triggerOnce': triggerOnce,
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    checkTop = data.getBool('checkTop', _defaultCheckTop);
    checkLeft = data.getBool('checkLeft', _defaultCheckLeft);
    checkBottom = data.getBool('checkBottom', _defaultCheckBottom);
    checkRight = data.getBool('checkRight', _defaultCheckRight);
    top = data.getBool('top');
    left = data.getBool('left');
    bottom = data.getBool('bottom');
    right = data.getBool('right');
    triggerOnce = data.getBool('triggerOnce', _defaultTriggerOnce);
  }
}

class COutOfBoundsSnapshot<T extends App<T>> extends CompSnapshot<T, COutOfBounds<T>> {
  late bool checkTop;
  late bool checkLeft;
  late bool checkBottom;
  late bool checkRight;

  late bool top;
  late bool left;
  late bool bottom;
  late bool right;
  late void Function(COutOfBounds<T> self)? then;

  late bool triggerOnce;
  
  COutOfBoundsSnapshot(super.id);

  @override
  COutOfBounds<T> createInstance(T app) => .new(app);
}