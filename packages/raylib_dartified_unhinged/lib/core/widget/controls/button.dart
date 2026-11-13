part of '../../raylib_dartified_unhinged.dart';

enum FButtonStyle {
  flat,
  outlined,
  ghost,
  pill,
}

enum FButtonVariant {
  primary,
  danger,
  success,
}

class FButtonThemeColors {
  final Color bg;
  final Color fg;
  final Color border;

  FButtonThemeColors({
    required this.bg,
    required this.fg,
    required this.border,
  });
}

class FButtonTheme<T extends App<T>> {
  final Color bg;
  final Color bgHovered;
  final Color bgClicked;
  final Color bgDisabled;
  final Color fg;
  final Color fgHovered;
  final Color fgClicked;
  final Color fgDisabled;
  final Color border;
  final Color borderHovered;
  final Color borderClicked;
  final Color borderDisabled;

  const FButtonTheme({
    required this.bg,
    required this.bgHovered,
    required this.bgClicked,
    required this.bgDisabled,
    required this.fg,
    required this.fgHovered,
    required this.fgClicked,
    required this.fgDisabled,
    required this.border,
    required this.borderHovered,
    required this.borderClicked,
    required this.borderDisabled,
  });

  FButtonThemeColors resolveState(FButton<T> btn) {
    Color bgColor = bg;
    if (btn.isWidgetDisabled) bgColor = bgDisabled;
    else if (btn.clickState.framesHeld > 0) bgColor = bgClicked;
    else if (btn.clickState.hovered) bgColor = bgHovered;

    Color fgColor = fg;
    if (btn.isWidgetDisabled) fgColor = fgDisabled;
    else if (btn.clickState.framesHeld > 0) fgColor = fgClicked;
    else if (btn.clickState.hovered) fgColor = fgHovered;

    Color borderColor = border;
    if (btn.isWidgetDisabled) borderColor = borderDisabled;
    else if (btn.clickState.framesHeld > 0) borderColor = borderClicked;
    else if (btn.clickState.hovered) borderColor = borderHovered;

    return .new(
      bg: bgColor,
      fg: fgColor,
      border: borderColor,
    );
  }

  static FButtonTheme<T> resolveStyle<T extends App<T>>(FButtonStyle style, FButtonVariant variant) {
    final colors = _fButtonVariantColors[variant]!;
    return switch (style) {
      .flat || .pill => .new(
        bg:             colors.solid,
        bgHovered:      colors.solidHover,
        bgClicked:      colors.solidActive,
        bgDisabled:     .color(0xF0, 0xF0, 0xF0, 0xFF),
        fg:             .WHITE,
        fgHovered:      .WHITE,
        fgClicked:      .WHITE,
        fgDisabled:     .color(0xA0, 0xA0, 0xA0, 0xFF),
        border:         .BLANK,
        borderHovered:  .BLANK,
        borderClicked:  .BLANK,
        borderDisabled: .BLANK,
      ),
      .outlined => .new(
        bg:             .BLANK,
        bgHovered:      colors.tintLight,
        bgClicked:      colors.tintMid,
        bgDisabled:     .BLANK,
        fg:             colors.solid,
        fgHovered:      colors.solid,
        fgClicked:      colors.solidActive,
        fgDisabled:     .color(0xB0, 0xB0, 0xB0, 0xFF),
        border:         colors.solid,
        borderHovered:  colors.solid,
        borderClicked:  colors.solidActive,
        borderDisabled: .color(0xD0, 0xD0, 0xD0, 0xFF),
      ),
      .ghost => .new(
        bg:             .BLANK,
        bgHovered:      colors.tintLight,
        bgClicked:      colors.tintMid,
        bgDisabled:     .BLANK,
        fg:             colors.solid,
        fgHovered:      colors.solid,
        fgClicked:      colors.solidActive,
        fgDisabled:     .color(0xB0, 0xB0, 0xB0, 0xFF),
        border:         .BLANK,
        borderHovered:  .BLANK,
        borderClicked:  .BLANK,
        borderDisabled: .BLANK,
      ),
    };
  }
}

class _FButtonVariantPalette {
  final Color solid;
  final Color solidHover;
  final Color solidActive;
  final Color tintLight;
  final Color tintMid;

  const _FButtonVariantPalette({
    required this.solid,
    required this.solidHover,
    required this.solidActive,
    required this.tintLight,
    required this.tintMid,
  });
}

Map<FButtonVariant, _FButtonVariantPalette> get _fButtonVariantColors => {
  .primary: .new(
    solid:       .color(0x5B, 0x4F, 0xCF, 0xFF), // purple mid
    solidHover:  .color(0x71, 0x65, 0xD6, 0xFF), // lighter
    solidActive: .color(0x3C, 0x34, 0x89, 0xFF), // darker
    tintLight:   .color(0xEE, 0xED, 0xFE, 0xFF), // purple 50
    tintMid:     .color(0xCE, 0xCB, 0xF6, 0xFF), // purple 100
  ),
  .danger: .new(
    solid:       .color(0xD8, 0x5A, 0x30, 0xFF), // coral mid
    solidHover:  .color(0xE0, 0x6E, 0x45, 0xFF),
    solidActive: .color(0x99, 0x3C, 0x1D, 0xFF), // coral dark
    tintLight:   .color(0xFA, 0xEC, 0xE7, 0xFF), // coral 50
    tintMid:     .color(0xF5, 0xC4, 0xB3, 0xFF), // coral 100
  ),
  .success: .new(
    solid:       .color(0x1D, 0x9E, 0x75, 0xFF), // teal mid
    solidHover:  .color(0x2B, 0xB5, 0x8A, 0xFF),
    solidActive: .color(0x0F, 0x6E, 0x56, 0xFF), // teal dark
    tintLight:   .color(0xE1, 0xF5, 0xEE, 0xFF), // teal 50
    tintMid:     .color(0x9F, 0xE1, 0xCB, 0xFF), // teal 100
  ),
};

class FButton<T extends App<T>> extends FWidgetLeaf<T> with
  
  IsWidgetClickable<T, FButton<T>>,
  IsWidgetDisableable<T, FButton<T>>
  
{

  void Function(FButton<T> self)? onClickFn;
  void Function(FButton<T> self)? onDoubleClickFn;
  void Function(FButton<T> self, int framesHeld, double secondsHeld)? onClickHoldFn;
  FButtonStyle buttonStyle;
  FButtonVariant buttonVariant;
  bool usePendingSingleClickMethod;

  FButton(super.app, {
    super.key,
    Vector2? position,
    this.buttonStyle = .flat,
    this.buttonVariant = .primary,
    this.onClickFn,
    this.onDoubleClickFn,
    this.onClickHoldFn,
    this.usePendingSingleClickMethod = false,
    bool isDisabled = false,
    required FWidget<T> child,
  }) : super(child: child) {
    _isWidgetDisabled = isDisabled;
  }

  @override
  bool get _ownsChildrenDrawOrder => true;

  FButtonThemeColors resolveStyle()
    => FButtonTheme
      .resolveStyle<T>(buttonStyle, buttonVariant)
      .resolveState(this);

  @override
  void layout(FConstraints constraints) {
    final child = this.child!;
    child._doLayout(.loose(.vec2(constraints.maxWidth, constraints.maxHeight)));
    size = child.size.copy();
  }

  @override
  @mustCallSuper
  void onWidgetClick() {
    if (isWidgetDisabled) return;
    onClickFn?.call(this);
  }

  @override
  @mustCallSuper
  void onWidgetDoubleClick() {
    if (isWidgetDisabled) return;
    onDoubleClickFn?.call(this);
  }

  @override
  @mustCallSuper
  void onWidgetClickHold(int framesHeld, double secondsHeld) {
    if (isWidgetDisabled) return;
    onClickHoldFn?.call(this, framesHeld, secondsHeld);
  }

  @override
  @mustCallSuper
  void onPostUpdate(double dt) {
    final rect = widgetCollider.rect;
   
    _IsWidgetClickable_updateState(
      hovered: backend.collision.pointRectangle(
        backend.mouse.position,
        .rect(rect.x, rect.y, size.x, size.y),
      ),
      usePendingSingleClickMethod: usePendingSingleClickMethod,
      dt: dt,
    );

    // update color of children label control
    findChildControl<FLabel<T>>()?.color = resolveStyle().fg;
  }

  @override
  void onDraw(double dt) {
    final rect = widgetCollider.rect;

    final roundness = switch (buttonStyle) {
      .pill => 0.75, 
      _     => 0.25,
    };

    final colors = resolveStyle();

    // fill
    backend.render.drawRectangleRounded(rect, roundness, 8, colors.bg);

    // border
    backend.render.drawRectangleRoundedLinesEx(rect, roundness, 8, 2, colors.border);

    child?._doDraw(dt);
  }

  @override
  FButton<T> createInstance() => .new(app, child: child!);
  
  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FButton<T>) return;
    copy.buttonStyle = buttonStyle;
    copy.buttonVariant = buttonVariant;
    copy.usePendingSingleClickMethod = usePendingSingleClickMethod;
    copy._onWidgetClickFns = .from(_onWidgetClickFns);
    copy._onWidgetDoubleClickFns = .from(_onWidgetDoubleClickFns);
    copy._onWidgetClickHoldFns = .from(_onWidgetClickHoldFns);
  }
}