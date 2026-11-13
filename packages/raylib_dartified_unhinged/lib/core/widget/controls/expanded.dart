part of '../../raylib_dartified_unhinged.dart';

class FExpanded<T extends App<T>> extends FWidgetLeaf<T> {
  int flex;

  FExpanded(super.app, {
    super.key,
    this.flex = 1,
    required FWidget<T> child,
  }) : super(child: child);

  @override
  void layout(FConstraints constraints) {
    final child = this.child!;

    child._doLayout(.tight(.vec2(constraints.maxWidth, constraints.maxHeight)));

    size = .vec2(constraints.maxWidth, constraints.maxHeight);
  }

  @override
  FExpanded<T> createInstance() => .new(app, child: child!);
  
  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FExpanded<T>) return;
    copy.flex = flex;
  }
}