part of '../../raylib_dartified_unhinged.dart';

enum FCheckboxVariant {
  primary,
  danger,
  success,
}

final class FCheckboxTheme {
  final Color border;
  final Color borderHovered;
  final Color fill;
  final Color fillHovered;
  final Color check;
  final Color background;

  const FCheckboxTheme({
    required this.border,
    required this.borderHovered,
    required this.fill,
    required this.fillHovered,
    required this.check,
    required this.background,
  });

  static FCheckboxTheme resolveVariant(FCheckboxVariant variant) {
    final colors = _fCheckboxVariantColors[variant]!;
    return .new(
      border:        .color(0xAA, 0xAA, 0xAA, 0xFF),
      borderHovered: colors.solid,
      fill:          colors.solid,
      fillHovered:   colors.solidHover,
      check:         .color(0xFF, 0xFF, 0xFF, 0xFF),
      background:    .color(0xFF, 0xFF, 0xFF, 0xFF),
    );
  }
}

final class _FCheckboxVariantPalette {
  final Color solid;
  final Color solidHover;

  const _FCheckboxVariantPalette({
    required this.solid,
    required this.solidHover,
  });
}

Map<FCheckboxVariant, _FCheckboxVariantPalette> get _fCheckboxVariantColors => {
  .primary: .new(
    solid:      .color(0x5B, 0x4F, 0xCF, 0xFF),
    solidHover: .color(0x71, 0x65, 0xD6, 0xFF),
  ),
  .danger: .new(
    solid:      .color(0xD8, 0x5A, 0x30, 0xFF),
    solidHover: .color(0xE0, 0x6E, 0x45, 0xFF),
  ),
  .success: .new(
    solid:      .color(0x1D, 0x9E, 0x75, 0xFF),
    solidHover: .color(0x2B, 0xB5, 0x8A, 0xFF),
  ),
};

final class FCheckbox<T extends App<T>> extends FWidgetLeaf<T> with IsWidgetClickable<T, FCheckbox<T>> {
  bool checked;
  double boxSize;
  double borderWidth;
  double cornerRadius;
  FCheckboxVariant checkboxVariant;

  void Function(FCheckbox<T> self, bool checked)? onChangeFn;

  FCheckbox(super.app, {
    super.key,
    this.checked = false,
    this.boxSize = 20.0,
    this.borderWidth = 2.0,
    this.cornerRadius = 0.2,
    this.checkboxVariant = .primary,
    this.onChangeFn,
  });

  Vector2 get _interactiveSize => .vec2(boxSize, boxSize);

  @override
  void layout(FConstraints constraints) {
    size = _interactiveSize.copy();
  }

  @override
  @mustCallSuper
  void onPostUpdate(double dt) {
    final rect = widgetCollider.rect;

    final hovered = backend.collision.pointRectangle(
      backend.mouse.position,
      .rect(rect.x, rect.y, boxSize, boxSize),
    );

    _IsWidgetClickable_updateState(
      hovered: hovered,
      usePendingSingleClickMethod: false,
      dt: dt,
    );

    if (hovered && backend.mouse.btnLeft.pressed) {
      checked = !checked;
      onChangeFn?.call(this, checked);
    }
  }

  @override
  void onDraw(double dt) {
    final rect = widgetCollider.rect;
    final theme = FCheckboxTheme.resolveVariant(checkboxVariant);
    final isHovered = clickState.hovered;

    // background
    backend.render.drawRectangleRounded(rect, cornerRadius, 4, theme.background);

    // border or filled bg when checked
    if (checked) {
      backend.render.drawRectangleRounded(
        rect, cornerRadius, 4,
        isHovered ? theme.fillHovered : theme.fill,
      );
    } else {
      backend.render.drawRectangleRoundedLinesEx(
        rect, cornerRadius, 4, borderWidth,
        isHovered ? theme.borderHovered : theme.border,
      );
    }

    // checkmark (two-segment polyline)
    if (checked) {
      final pad = boxSize * 0.2;
      final x = rect.x;
      final y = rect.y;
      // knee of the tick: ~38% across, ~65% down
      final kx = x + boxSize * 0.38;
      final ky = y + boxSize - pad;
      backend.render.drawLineEx(
        .vec2(x + pad, y + boxSize * 0.52),
        .vec2(kx,      ky),
        boxSize * 0.12,
        theme.check,
      );
      backend.render.drawLineEx(
        .vec2(kx, ky),
        .vec2(x + boxSize - pad, y + pad),
        boxSize * 0.12,
        theme.check,
      );
    }
  }

  @override
  FCheckbox<T> createInstance() => .new(app);
  
  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FCheckbox<T>) return;
    copy.checked = checked;
    copy.boxSize = boxSize;
    copy.borderWidth = borderWidth;
    copy.cornerRadius = cornerRadius;
    copy.checkboxVariant = checkboxVariant;
    copy._onWidgetClickFns = .from(_onWidgetClickFns);
    copy._onWidgetDoubleClickFns = .from(_onWidgetDoubleClickFns);
    copy._onWidgetClickHoldFns = .from(_onWidgetClickHoldFns);
  }
}