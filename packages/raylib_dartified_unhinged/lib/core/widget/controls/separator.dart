part of '../../raylib_dartified_unhinged.dart';

final class FSeparator<T extends App<T>> extends FWidgetLeaf<T> {
  double thickness;
  Color color;
  FLabel<T>? label;
  FSeparatorLabelPosition labelPosition;
  double labelGap;

  FSeparator(super.app, {
    super.key,
    this.thickness = 1,
    Color? color,
    this.label,
    this.labelPosition = .center,
    this.labelGap = 8,
  }) : color = color ?? .WHITE, super(child: label);

  @override
  bool get _ownsChildrenDrawOrder => true;

  @override
  void layout(FConstraints constraints) {
    final Vector2 desired = .vec2(constraints.maxWidth, thickness);

    size = constraints.resolve(desired);

    final lbl = label;
    if (lbl != null) {
      lbl.angle = 0;
      // let FLabel measure itself the normal way (populates its _textSize).
      lbl._doLayout(constraints);
    }
  }

  @override
  void onDraw(double dt) {
    final rect = widgetCollider.rect;
    final lbl = label;

    if (lbl == null) {
      _drawLine(rect.x, rect.y, rect.width, rect.height);
      return;
    }

    final labelSize = lbl.size; // set by FLabel.layout

    // horizontal
    final labelX = switch (labelPosition) {
      .left   => rect.x + labelGap,
      .center => rect.x + (rect.width - labelSize.x) / 2,
      .right  => rect.x + rect.width - labelGap - labelSize.x,
    };

    final gapStart = labelX - labelGap;
    final gapEnd = labelX + labelSize.x + labelGap;

    if (gapStart > rect.x) {
      _drawLine(rect.x, rect.y, gapStart - rect.x, rect.height);
    }
    if (gapEnd < rect.x + rect.width) {
      _drawLine(gapEnd, rect.y, rect.x + rect.width - gapEnd, rect.height);
    }

    lbl.widgetCollider.rect = .rect(
      labelX, rect.y + (rect.height - labelSize.y) / 2,
      labelSize.x, labelSize.y,
    );
    lbl._doDraw(dt);
  }

  void _drawLine(double x, double y, double w, double h) {
    backend.render.drawRectangleRec(.rect(x, y, w, h), color);
  }

  @override
  FSeparator<T> createInstance() => .new(app);

  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FSeparator<T>) return;
    copy.thickness = thickness;
    copy.color = color;
    copy.label = label;
    copy.labelPosition = labelPosition;
    copy.labelGap = labelGap;
  }
}

enum FSeparatorLabelPosition { left, center, right }