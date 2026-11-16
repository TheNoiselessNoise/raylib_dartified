part of '../../raylib_dartified_unhinged.dart';

final class FPadding<T extends App<T>> extends FWidgetLeaf<T> {
  double left, top, right, bottom;

  FPadding(super.app, {
    super.key,
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required FWidget<T> child,
  }) : super(child: child);

  factory FPadding.all(T app, num all, {
    required FWidget<T> child,
  }) => .new(app,
    left: all.toDouble(),
    top: all.toDouble(),
    right: all.toDouble(),
    bottom: all.toDouble(),
    child: child,
  );

  factory FPadding.LTRB(T app, num l, num t, num r, num b, {
    required FWidget<T> child,
  }) => .new(app,
    left: l.toDouble(),
    top: t.toDouble(),
    right: r.toDouble(),
    bottom: b.toDouble(),
    child: child,
  );

  factory FPadding.symmetric(T app, num v, num h, {
    required FWidget<T> child,
  }) => .new(app,
    left: h.toDouble(),
    top: v.toDouble(),
    right: h.toDouble(),
    bottom: v.toDouble(),
    child: child,
  );

  factory FPadding.fromRectangle(T app, Rectangle rect, {
    required FWidget<T> child,
  }) => .new(app,
    left: rect.x,
    top: rect.y,
    right: rect.x + rect.width,
    bottom: rect.y + rect.height,
    child: child,
  );

  @override
  void layout(FConstraints constraints) {
    final child = this.child!;

    child._doLayout(.new(
      minWidth: (constraints.minWidth - left - right).clamp(0, double.infinity),
      maxWidth: constraints.maxWidth - left - right,
      minHeight: (constraints.minHeight - top - bottom).clamp(0, double.infinity),
      maxHeight: constraints.maxHeight - top - bottom,
    ));

    child.localOffset = .vec2(left, top);

    size = .vec2(
      child.size.x + left + right,
      child.size.y + top + bottom,
    );
  }

  @override
  FPadding<T> createInstance() => .new(app,
    top: top,
    right: right,
    bottom: bottom,
    left: left,
    child: child!,
  );
  
  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FPadding<T>) return;
    copy.top = top;
    copy.right = right;
    copy.bottom = bottom;
    copy.left = left;
  }
}