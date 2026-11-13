part of '../../raylib_dartified_unhinged.dart';

class FContainer<T extends App<T>> extends FWidgetLeaf<T> {
  Color? backgroundColor;
  double roundness;

  FContainer(super.app, {
    super.key,
    this.backgroundColor,
    this.roundness = 0.25,
    required FWidget<T> child,
  }) : super(child: child);

  @override
  bool get _ownsChildrenDrawOrder => true;

  @override
  void layout(FConstraints constraints) {
    final child = this.child!;
    child._doLayout(.loose(.vec2(constraints.maxWidth, constraints.maxHeight)));
    size = .vec2(
      constraints.minWidth > child.size.x ? constraints.minWidth : child.size.x,
      constraints.minHeight > child.size.y ? constraints.minHeight : child.size.y,
    );
  }

  @override
  void onDraw(double dt) {
    final color = backgroundColor;

    if (color != null) {
      final rect = widgetCollider.rect;
      backend.render.drawRectangleRounded(rect, roundness, 8, color);
    }

    child!._doDraw(dt);
  }

  @override
  FContainer<T> createInstance() => .new(app, child: child!);
  
  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FContainer<T>) return;
    copy.backgroundColor = backgroundColor;
    copy.roundness = roundness;
  }
}