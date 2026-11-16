part of '../raylib_dartified_unhinged.dart';

final class FAnimationController {
  double value = 0;
  double duration;
  bool _running = false;
  double _elapsed = 0;
  
  void Function()? onComplete;
  void Function(double value, double elapsed)? onFrame;

  FAnimationController({
    required this.duration,
    this.onComplete,
    this.onFrame,
  });

  void forward() {
    _elapsed = 0;
    _running = true;
  }

  void stop() => _running = false;

  void update(double dt) {
    if (!_running) return;
    _elapsed = (_elapsed + dt).clamp(0.0, duration);
    value = _elapsed / duration;
    onFrame?.call(value, _elapsed);
    if (value >= 1.0) {
      _running = false;
      onFrame?.call(1.0, _elapsed);
      onComplete?.call();
    }
  }
}

final class FConstraints {
  final double minWidth, maxWidth, minHeight, maxHeight;

  const FConstraints({
    this.minWidth = 0, required this.maxWidth,
    this.minHeight = 0, required this.maxHeight,
  });

  /// "You must be exactly this size"
  FConstraints.tight(Vector2 size)
    : minWidth = size.x, maxWidth = size.x,
      minHeight = size.y, maxHeight = size.y;

  /// "You can be up to this big, but no smaller than 0"
  FConstraints.loose(Vector2 size)
    : minWidth = 0, maxWidth = size.x,
      minHeight = 0, maxHeight = size.y;

  Vector2 constrain(Vector2 size) => .vec2(
    size.x.clamp(minWidth, maxWidth),
    size.y.clamp(minHeight, maxHeight),
  );

  num resolveWidth(num v) => v.clamp(minWidth, maxWidth);

  num resolveHeight(num v) => v.clamp(minHeight, maxHeight);

  Vector2 resolve(Vector2 size) => .vec2(
    resolveWidth(size.x),
    resolveHeight(size.y),
  );

  @override
  String toString() => 'Constraints(minw=$minWidth, maxw=$maxWidth, minh=$minHeight, maxh=$maxHeight)';
}

final class FWidgetComp<T extends App<T>> extends Comp<T> {
  FWidgetComp(super.app);

  FWidget<T> get widget => entity as FWidget<T>;
}

final class CWidgetMouseInteractable<T extends App<T>> extends FWidgetComp<T> {

  bool hovered = false;
  bool clicked = false;
  bool held = false;
  int framesHeld = 0;
  double secondsHeld = 0;
  double secondsUntilHeld = 0.5;

  CWidgetMouseInteractable(super.app);

  void externalUpdate(double dt) => widget.on<CRectCollider<T>>((c) {
    final nowHovered = backend.collision.pointRectangle(
      backend.mouse.position,
      c.rect,
    );
    
    final nowClicked = backend.mouse.btnLeft.pressed;
    
    final nowHeld = backend.mouse.btnLeft.down;

    clicked = nowHovered && nowClicked;
    hovered = nowHovered;
    held = false;

    if (nowHovered && nowHeld) {
      framesHeld++;
      secondsHeld += dt;
    } else {
      framesHeld = 0;
      secondsHeld = 0;
    }

    if (secondsHeld >= secondsUntilHeld) {
      held = true;
    }
  });

  @override
  CWidgetMouseInteractable<T> createInstance() => .new(app);
}

abstract class FWidgetLeaf<T extends App<T>> extends FWidget<T> {
  FWidgetLeaf(super.app, {
    super.key,
    super.children,
    super.child,
  });

  @override
  @nonVirtual
  FWidget<T> build() => this;
}

class FWidget<T extends App<T>> extends EntityGroup<T, FWidget<T>> {
  late String key;

  FWidget(super.app, {
    String? key,
    List<FWidget<T>>? children,
    FWidget<T>? child,
  }) {
    this.key = key ?? '${runtimeType}_$id';

    add(CTransform<T>(app, position: .zero()));
    add(CVelocity<T>(app, velocity: .zero()));
    add(CRectCollider<T>(app, size: size, autoSync: false));
    add(CWidgetMouseInteractable<T>(app));

    children?.forEach(addChild);
    if (child != null) addChild(child);
  }

  final List<FAnimationController> _controllers = [];

  FAnimationController createController({
    required double duration,
    void Function()? onComplete,
    void Function(double value, double elapsed)? onFrame,
  }) {
    final controller = FAnimationController(
      duration: duration,
      onComplete: onComplete,
      onFrame: onFrame,
    );
    _controllers.add(controller);
    return controller;
  }

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  bool _built = false;
  bool _builtSelf = false; // build() => this
  bool _dirty = false;     // this widget wants build() re-run
  bool _needsPass = true;  // only meaningful on the root: rebuild + layout pending

  FWidget<T>? parentWidget;
  Vector2 localOffset = .zero();
  Vector2 _size = .zero(); // OUTPUT of layout(), never an input
  Vector2 get size => _size;
  set size(Vector2 value) {
    _size = value;
    markNeedsLayout();
  }

  Set<FWidget<T>> get children => getEntities();
  FWidget<T>? get child => children.firstOrNull;
  FMouseSystem<T>? get mouseSystem => scene.getSystem();
  CRectCollider<T> get widgetCollider => get<CRectCollider<T>>()!;

  /// Constraints given to a widget with no parent widget.
  /// Loose: roots shrink-wrap. Use `.tight(sceneBounds.size)` for Flutter-style.
  FConstraints get rootConstraints => .loose(sceneBounds.size);

  /// Anything that changes a widget's size must call this
  /// (text, font, children, padding, ...).
  void markNeedsLayout() => getRootWidget()._needsPass = true;

  void markWidgetDirty() {
    _dirty = true;
    markNeedsLayout();
  }

  void setState(void Function() fn) {
    markWidgetDirty();
    fn();
  }

  @override
  Vector2 get worldPosition {
    final p = parentWidget;
    return p == null ? sceneBounds.position.add(localOffset) : p.worldPosition.add(localOffset);
  }

  Bounds get widgetBounds {
    final p = worldPosition;
    return .bounds(p.y, p.x, p.y + size.y, p.x + size.x);
  }

  bool get _ownsChildrenDrawOrder => false;

  void _setDrawManagedByParent() {
    disableSceneLevelDraw();
    for (final child in children) {
      child._setDrawManagedByParent();
    }
  }

  FWidget<T> build() => this;

  @override
  void onAdd(ECSBase<T> parent) { // when added to scene/entity group
    if (_built) return;
    _built = true;
    final built = build();
    _builtSelf = built == this;
    if (!_builtSelf && _ownsChildrenDrawOrder) throw StateError('$runtimeType overrides build() and cannot own child draw order');
    if (!_builtSelf) addChild(built);
    markNeedsLayout(); // no layout here
  }

  void rebuild() {
    if (!_built) return;
    final built = build();
    if (built != this) {
      final old = child;
      if (old != null && old != built) _detachChild(old);
      if (old != built) addChild(built);
    }
    markNeedsLayout();
  }

  void addChild(FWidget<T> child) {
    child._isAdded = false; // NOTE: this enables call to `addEntity` again
    child.parentWidget = this;
    addEntity(child);
    if (_ownsChildrenDrawOrder) child._setDrawManagedByParent();
    markNeedsLayout();
  }

  void _detachChild(FWidget<T> child) {
    markNeedsLayout(); // before parentWidget is cleared, so it reaches the root
    _entities.remove(child);
    child.parentWidget = null;
  }

  void clearChildren() {
    for (final child in _entities.toList()) {
      child.clearChildren();
      removeEntity(child);
    }
    _entities.clear();
    markNeedsLayout();
  }

  // ░█████████    ░██████     ░██████   ░██████████
  // ░██     ░██  ░██   ░██   ░██   ░██      ░██    
  // ░██     ░██ ░██     ░██ ░██     ░██     ░██    
  // ░█████████  ░██     ░██ ░██     ░██     ░██    
  // ░██   ░██   ░██     ░██ ░██     ░██     ░██    
  // ░██    ░██   ░██   ░██   ░██   ░██      ░██    
  // ░██     ░██   ░██████     ░██████       ░██    

  void _flushPass() {
    _rebuildDirty();
    _doLayout(rootConstraints);
    _syncTree();
    _needsPass = false; // after rebuild, which re-marks
  }

  void _rebuildDirty() {
    if (_dirty) {
      _dirty = false;
      rebuild();
    }
    children.forEach((c) => c._rebuildDirty());
  }

  void _sync() {
    final c = widgetCollider;
    transform?.position = worldPosition;
    c.rect = widgetBounds.rectangle;
    c.size = size.copy();
  }

  void _syncTree() {
    _sync();
    children.forEach((c) => c._syncTree());
  }

  // ░██████████░█████████     ░███    ░███     ░███ ░██████████ 
  // ░██        ░██     ░██   ░██░██   ░████   ░████ ░██         
  // ░██        ░██     ░██  ░██  ░██  ░██░██ ░██░██ ░██         
  // ░█████████ ░█████████  ░█████████ ░██ ░████ ░██ ░█████████  
  // ░██        ░██   ░██   ░██    ░██ ░██  ░██  ░██ ░██         
  // ░██        ░██    ░██  ░██    ░██ ░██       ░██ ░██         
  // ░██        ░██     ░██ ░██    ░██ ░██       ░██ ░██████████ 

  @override
  @mustCallSuper
  HookResult _doOnPreUpdate(double dt) {
    if (parentWidget == null && _needsPass) _flushPass();
    _controllers.forEach((c) => c.update(dt));
    return super._doOnPreUpdate(dt);
  }

  @override
  @mustCallSuper
  void _doOnPostUpdate(double dt) {
    if (parentWidget == null) _sync();
    super._doOnPostUpdate(dt);
    get<CWidgetMouseInteractable<T>>()!.externalUpdate(dt);
  }

  @override
  @mustCallSuper
  void _doDraw(double dt) {
    if (_isInstanceDisabled) return;
    if (parentWidget == null && _needsPass) _flushPass(); // draw before first update
    if (_isInstanceDisabled) return;
    super._doDraw(dt);
    if (_ownsChildrenDrawOrder) return; // owner already drew them in onDraw
    for (final child in children) {
      if (_isInstanceDisabled) return;
      if (!child._sceneLevelDrawEnabled && child._drawEnabled) {
        child._doDraw(dt);
      }
    }
  }

  // ░██       ░██ ░██████░███████     ░██████  ░██████████ ░██████████
  // ░██       ░██   ░██  ░██   ░██   ░██   ░██ ░██             ░██    
  // ░██  ░██  ░██   ░██  ░██    ░██ ░██        ░██             ░██    
  // ░██ ░████ ░██   ░██  ░██    ░██ ░██  █████ ░█████████      ░██    
  // ░██░██ ░██░██   ░██  ░██    ░██ ░██     ██ ░██             ░██    
  // ░████   ░████   ░██  ░██   ░██   ░██  ░███ ░██             ░██    
  // ░███     ░███ ░██████░███████     ░█████░█ ░██████████     ░██    

  Iterable<FWidget<T>> getAllControls() {
    final result = <FWidget<T>>[];
    for (final control in children.toList()) {
      result.add(control);
      result.addAll(control.getAllControls());
    }
    return result;
  }

  FWidget<T> getRootWidget() {
    var r = this;
    while (r.parentWidget != null) {
      r = r.parentWidget!;
    }
    return r;
  }

  Iterable<(FWidget<T>, int)> getParentTree() {
    final result = <(FWidget<T>, int)>[];
    FWidget<T>? current = this;
    while (current != null) {
      final parent = current.parentWidget;
      if (parent != null) result.add((parent, parent.getParentIndexOf()));
      current = parent;
    }
    return result;
  }

  int getParentIndexOf() {
    final parent = parentWidget;
    if (parent == null) return -1;
    return parent.children.toList().indexOf(this);
  }

  QueryFWidget<T> get QueryWidget => .new(app, this);
  
  QueryFWidgetParent<T> get QueryWidgetParent => .new(app, this);

  E? findParentControl<E extends FWidget<T>>() {
    var current = parentWidget;
    while (current != null) {
      if (current is E) return current;
      current = current.parentWidget;
    }
    return null;
  }

  FWidget<T>? findParentControlByKey(String key) {
    var current = parentWidget;
    while (current != null) {
      if (current.key == key) return current;
      current = current.parentWidget;
    }
    return null;
  }

  Iterable<E> findParentControls<E extends FWidget<T>>() {
    return getParentTree().map((e) => e.$1).whereType<E>();
  }

  E? findChildControl<E extends FWidget<T>>() {
    for (final child in children.toList()) {
      if (child is E) return child;
      final found = child.findChildControl<E>();
      if (found != null) return found;
    }
    return null;
  }

  FWidget<T>? findChildControlByKey(String key) {
    for (final child in children.toList()) {
      if (child.key == key) return child;
      final found = child.findChildControlByKey(key);
      if (found != null) return found;
    }
    return null;
  }

  Iterable<E> findChildControls<E extends FWidget<T>>() {
    final found = <E>[];
    for (final child in children.toList()) {
      if (child is E) found.add(child);
      found.addAll(child.findChildControls<E>());
    }
    return found;
  }

  bool isControlAncestorOf(FWidget<T> other) {
    var current = other.parentWidget;
    while (current != null) {
      if (identical(current, this)) return true;
      current = current.parentWidget;
    }
    return false;
  }

  bool isControlDescendantOf(FWidget<T> other) {
    return other.isControlAncestorOf(this);
  }

  //   ░██████  ░██           ░██████   ░███    ░██ ░██████████ 
  //  ░██   ░██ ░██          ░██   ░██  ░████   ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██░██  ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██ ░██ ░██ ░█████████  
  // ░██        ░██         ░██     ░██ ░██  ░██░██ ░██         
  //  ░██   ░██ ░██          ░██   ░██  ░██   ░████ ░██         
  //   ░██████  ░██████████   ░██████   ░██    ░███ ░██████████ 

  void cloneWidgetInto(FWidget<T> copy) {}

  @override
  @mustCallSuper
  void _doOnClone(Entity<T> copy, [ClonePolicy<T>? policy]) {
    _doOnCloneEntityGroupStart(copy, policy);
    cloneWidgetInto(copy as FWidget<T>);
    super._doOnClone(copy, policy);
  }

  @override
  FWidget<T> createInstance() => .new(app);

  // ░██            ░███    ░██     ░██   ░██████   ░██     ░██ ░██████████
  // ░██           ░██░██    ░██   ░██   ░██   ░██  ░██     ░██     ░██    
  // ░██          ░██  ░██    ░██ ░██   ░██     ░██ ░██     ░██     ░██    
  // ░██         ░█████████    ░████    ░██     ░██ ░██     ░██     ░██    
  // ░██         ░██    ░██     ░██     ░██     ░██ ░██     ░██     ░██    
  // ░██         ░██    ░██     ░██      ░██   ░██   ░██   ░██      ░██    
  // ░██████████ ░██    ░██     ░██       ░██████     ░██████       ░██    

  @mustCallSuper
  void _doLayout(FConstraints constraints) {
    layout(constraints);
    assert(
      size.x.isFinite && size.y.isFinite,
      '$runtimeType produced a non-finite size: $size',
    );
  }

  /// Default: stack children (same constraints, offsets untouched),
  /// size = largest child. For `build() != this` widgets that is just the child's size.
  void layout(FConstraints constraints) {
    double w = 0, h = 0;
    for (final c in children.toList()) {
      c._doLayout(constraints);
      w = math.max(w, c.size.x);
      h = math.max(h, c.size.y);
    }
    size = constraints.resolve(.vec2(w, h));
  }
}