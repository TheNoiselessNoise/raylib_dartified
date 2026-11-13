part of '../../raylib_dartified_unhinged.dart';

class FRow<T extends App<T>> extends FWidgetLeaf<T> {
  double gap;
  FRowAlignment alignment;

  FRow(super.app, {
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
    double usedWidth = 0;
    double maxHeight = 0;
    int totalFlex = 0;
    for (final child in children) {
      if (child is FExpanded<T>) {
        totalFlex += child.flex;
        continue;
      }
      child._doLayout(.new(
        maxWidth: double.infinity,
        maxHeight: constraints.maxHeight,
      ));
      usedWidth += child.size.x;
      if (child.size.y > maxHeight) maxHeight = child.size.y;
    }

    final totalGap = gap * (children.length - 1);
    final remaining = constraints.maxWidth.isFinite
      ? (constraints.maxWidth - usedWidth - totalGap).clamp(0.0, double.infinity)
      : 0.0;

    // pass 2 - lay out expanded children with their share of the space
    final crossSize = constraints.maxHeight.isFinite ? constraints.maxHeight : maxHeight;
    if (totalFlex > 0) {
      for (final child in children) {
        if (child is! FExpanded<T>) continue;
        child._doLayout(.tight(.vec2(remaining * child.flex / totalFlex, crossSize)));
        if (child.size.y > maxHeight) maxHeight = child.size.y;
      }
    }

    // pass 3 - position (sizes are now real)
    double cursor = 0;
    for (final child in children) {
      final y = switch (alignment) {
        .start  => 0.0,
        .center => (maxHeight - child.size.y) / 2,
        .end    => maxHeight - child.size.y,
      };
      child.localOffset = .vec2(cursor, y);
      cursor += child.size.x + gap;
    }
    cursor -= gap;

    size = .vec2(cursor, maxHeight);
  }

  @override
  FRow<T> createInstance() => .new(app);

  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FRow<T>) return;
    copy.gap = gap;
    copy.alignment = alignment;
  }
}

enum FRowAlignment { start, center, end }