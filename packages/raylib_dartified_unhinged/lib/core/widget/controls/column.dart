part of '../../raylib_dartified_unhinged.dart';

final class FColumn<T extends App<T>> extends FWidgetLeaf<T> {
  double gap;
  FColumnAlignment alignment;

  FColumn(super.app, {
    super.key,
    this.gap = 0,
    this.alignment = .start,
    super.children,
  });

  @override
  void layout(FConstraints constraints) {
    final children = getEntities().toList();
    if (children.isEmpty) {
      size = .vec2(0, 0);
      return;
    }

    // pass 1 - lay out non-expanded children, sum flex of expanded ones
    double usedHeight = 0;
    double maxWidth = 0;
    int totalFlex = 0;
    for (final child in children) {
      if (child is FExpanded<T>) {
        totalFlex += child.flex;
        continue;
      }
      child._doLayout(.new(
        maxWidth: constraints.maxWidth,
        maxHeight: double.infinity,
      ));
      usedHeight += child.size.y;
      if (child.size.x > maxWidth) maxWidth = child.size.x;
    }

    final totalGap = gap * (children.length - 1);
    final remaining = constraints.maxHeight.isFinite
      ? (constraints.maxHeight - usedHeight - totalGap).clamp(0.0, double.infinity)
      : 0.0;

    // pass 2 - lay out expanded children with their share of the space
    final crossSize = constraints.maxWidth.isFinite ? constraints.maxWidth : maxWidth;
    for (final child in children) {
      if (child is! FExpanded<T>) continue;
      child._doLayout(.tight(.vec2(crossSize, remaining * child.flex / totalFlex)));
      if (child.size.x > maxWidth) maxWidth = child.size.x;
    }

    // pass 3 - position (sizes are now real)
    double cursor = 0;
    for (final child in children) {
      final x = switch (alignment) {
        .start  => 0.0,
        .center => (maxWidth - child.size.x) / 2,
        .end    => maxWidth - child.size.x,
      };
      child.localOffset = .vec2(x, cursor);
      cursor += child.size.y + gap;
    }
    cursor -= gap;

    size = .vec2(maxWidth, cursor);
  }

  @override
  FColumn<T> createInstance() => .new(app);
  
  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FColumn<T>) return;
    copy.gap = gap;
    copy.alignment = alignment;
  }
}

enum FColumnAlignment { start, center, end }