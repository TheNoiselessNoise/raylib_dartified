part of '../../raylib_dartified_unhinged.dart';

class FSized<T extends App<T>> extends FWidgetLeaf<T> {
  late FSizedMode mode;
  FSizedMode? widthMode;
  FSizedMode? heightMode;

  double? width;
  double? height;

  FSized(super.app, {
    super.key,
    FSizedMode? mode,
    this.widthMode,
    this.heightMode,
    num? width,
    num? height,
    super.child,
  }) : width = width?.toDouble(), height = height?.toDouble() {
    this.mode = mode ?? widthMode ?? heightMode ?? .expand;
  }

  factory FSized.flexible(T app, {
    num? width,
    num? height,
    FWidget<T>? child,
  }) => .new(app,
    widthMode: .flexible,
    heightMode: .flexible,
    width: width,
    height: height,
    child: child,
  );

  factory FSized.shrink(T app, {
    num? width,
    num? height,
    FWidget<T>? child,
  }) => .new(app,
    widthMode: .shrink,
    heightMode: .shrink,
    width: width,
    height: height,
    child: child,
  );

  FSizedMode get wMode => widthMode ?? mode;
  FSizedMode get hMode => heightMode ?? mode;

  @override
  void layout(FConstraints constraints) {
    final child = this.child;

    final isFlexible = wMode == .flexible || hMode == .flexible;

    // layout child first if we need flexible dimensions
    if (isFlexible && child != null) {
      child._doLayout(constraints);
    }

    final w = _resolveWidth(constraints, child);
    final h = _resolveHeight(constraints, child);

    size = .vec2(
      w.isFinite ? w : size.x,
      h.isFinite ? h : size.y,
    );

    child?.size = size.copy();

    if (!isFlexible && child != null) {
      child._doLayout(.tight(size));
    }
  }

  double _resolveWidth(FConstraints constraints, FWidget<T>? child) {
    if (width != null) return width!;
    return switch (wMode) {
      .expand => constraints.maxWidth,
      .shrink => 0,
      .flexible => child?.size.x ?? 0,
    };
  }

  double _resolveHeight(FConstraints constraints, FWidget<T>? child) {
    if (height != null) return height!;
    return switch (hMode) {
      .expand => constraints.maxHeight,
      .shrink => 0,
      .flexible => child?.size.y ?? 0,
    };
  }

  @override
  FSized<T> createInstance() => .new(app);

  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FSized<T>) return;  
    copy.width = width;
    copy.height = height;
  }
}

enum FSizedMode { expand, shrink, flexible }