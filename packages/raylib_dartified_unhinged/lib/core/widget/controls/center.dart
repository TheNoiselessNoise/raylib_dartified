part of '../../raylib_dartified_unhinged.dart';

final class FCenter<T extends App<T>> extends FWidgetLeaf<T> {
  bool vertical;

  FCenter(super.app, {
    super.key,
    this.vertical = false,
    required FWidget<T> child,
  }) : super(child: child);

  @override
  void layout(FConstraints constraints) {
    final child = this.child!;

    child._doLayout(.loose(.vec2(constraints.maxWidth, constraints.maxHeight)));

    final w = constraints.maxWidth.isFinite ? constraints.maxWidth : child.size.x;
    final h = constraints.maxHeight.isFinite ? constraints.maxHeight : child.size.y;

    child.localOffset = .vec2(
      (w - child.size.x) / 2,
      vertical ? (h - child.size.y) / 2 : 0,
    );

    size = .vec2(w, h);
  }

  @override
  FCenter<T> createInstance() => .new(app, child: child!);

  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FCenter<T>) return;
    copy.vertical = vertical;
  }
}