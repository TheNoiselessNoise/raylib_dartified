part of '../../raylib_dartified_unhinged.dart';

enum FSliderStyle {
  track,  // track + thumb (classic)
  filled, // filled left side (progress-style)
}

enum FSliderVariant {
  primary,
  danger,
  success,
}

final class FSliderTheme {
  final Color track;
  final Color trackHovered;
  final Color fill;
  final Color fillHovered;
  final Color thumb;
  final Color thumbHovered;
  final Color thumbDragged;

  const FSliderTheme({
    required this.track,
    required this.trackHovered,
    required this.fill,
    required this.fillHovered,
    required this.thumb,
    required this.thumbHovered,
    required this.thumbDragged,
  });

  static FSliderTheme resolveStyle(FSliderStyle style, FSliderVariant variant) {
    final colors = _fSliderVariantColors[variant]!;
    return .new(
      track:        .color(0xDD, 0xDD, 0xDD, 0xFF),
      trackHovered: .color(0xCC, 0xCC, 0xCC, 0xFF),
      fill:         colors.solid,
      fillHovered:  colors.solidHover,
      thumb:        colors.solid,
      thumbHovered: colors.solidHover,
      thumbDragged: colors.solidActive,
    );
  }
}

final class _FSliderVariantPalette {
  final Color solid;
  final Color solidHover;
  final Color solidActive;

  const _FSliderVariantPalette({
    required this.solid,
    required this.solidHover,
    required this.solidActive,
  });
}

Map<FSliderVariant, _FSliderVariantPalette> get _fSliderVariantColors => {
  .primary: .new(
    solid:       .color(0x5B, 0x4F, 0xCF, 0xFF),
    solidHover:  .color(0x71, 0x65, 0xD6, 0xFF),
    solidActive: .color(0x3C, 0x34, 0x89, 0xFF),
  ),
  .danger: .new(
    solid:       .color(0xD8, 0x5A, 0x30, 0xFF),
    solidHover:  .color(0xE0, 0x6E, 0x45, 0xFF),
    solidActive: .color(0x99, 0x3C, 0x1D, 0xFF),
  ),
  .success: .new(
    solid:       .color(0x1D, 0x9E, 0x75, 0xFF),
    solidHover:  .color(0x2B, 0xB5, 0x8A, 0xFF),
    solidActive: .color(0x0F, 0x6E, 0x56, 0xFF),
  ),
};

abstract class FSlider<T extends App<T>, X extends num> extends FWidgetLeaf<T> with IsWidgetClickable<T, FSlider<T, X>> {
  X? min;
  X? max;
  X? step;
  X value;
  double trackWidth;
  double trackHeight;
  double thumbRadius;
  FSliderStyle sliderStyle;
  FSliderVariant sliderVariant;
  bool enableArrowKeys;

  void Function(FSlider<T, X> self, X value)? onChangeFn;
  void Function(FSlider<T, X> self, X value)? onChangeEndFn;

  bool _isDragging = false;
  double _keyHeldTime = 0.0;
  bool _keyFired = false;

  double keyRepeatDelay = 0.4;     // seconds before repeat starts
  double keyRepeatInterval = 0.05; // seconds between repeats (20/s)

  final X Function(num value) convert;

  FSlider(super.app, {
    super.key,
    Vector2? position,
    this.min,
    this.max,
    this.step,
    X? initialValue,
    this.trackWidth = 200.0,
    this.trackHeight = 6.0,
    this.thumbRadius = 10.0,
    this.sliderStyle = .track,
    this.sliderVariant = .primary,
    this.enableArrowKeys = false,
    this.onChangeFn,
    this.onChangeEndFn,
    required this.convert,
  }) : value = convert(min != null && max != null
    ? (initialValue ?? min).clamp(min, max)
    : initialValue ?? min ?? 0);

  // full bounding box: thumb can overhang track vertically
  Vector2 get _interactiveSize => .vec2(
    trackWidth,
    (thumbRadius * 2).clamp(trackHeight, double.infinity),
  );

  double get _normalized {
    final (min, max) = _getLimits();
    return (max > min) ? ((value - min) / (max - min)) : 0.0;
  }

  double _thumbX(double originX) => originX + _normalized * trackWidth;

  double _centerY(double originY) => originY + _interactiveSize.y / 2;

  void _seekToMouseX(double mouseX, double originX) {
    final (min, max) = _getLimits();
    final t = ((mouseX - originX) / trackWidth).clamp(0.0, 1.0);
    final newValue = (min + t * (max - min)).clamp(min, max);
    if (newValue == value) return;
    value = convert(newValue);
    onChangeFn?.call(this, value);
  }

  (X min, X max) _getLimits() {
    if (min != null && max != null) {
      return (min!, max!);
    } else {
      return (convert(0), convert(trackWidth));
    }
  }

  @override
  void layout(FConstraints constraints) {
    size = _interactiveSize.copy();
  }

  @override
  @mustCallSuper
  void onPostUpdate(double dt) {
    final rect = widgetCollider.rect;
    final mouse = backend.mouse;
    final originX = rect.x;

    final hovered = backend.collision.pointRectangle(
      mouse.position,
      .rect(rect.x, rect.y, _interactiveSize.x, _interactiveSize.y),
    );

    _IsWidgetClickable_updateState(
      hovered: hovered,
      usePendingSingleClickMethod: false,
      dt: dt,
    );

    // drag start
    if (hovered && mouse.btnLeft.pressed) {
      _isDragging = true;
    }

    // drag end
    if (_isDragging && mouse.btnLeft.released) {
      _isDragging = false;
      onChangeEndFn?.call(this, value);
    }

    // seek while dragging or click-to-seek
    if (_isDragging || (hovered && mouse.btnLeft.down)) {
      _seekToMouseX(mouse.position.x, originX);
    }

    final rightDown = backend.input.isKeyDown(.KEY_RIGHT);
    final leftDown = backend.input.isKeyDown(.KEY_LEFT);

    if (enableArrowKeys && hovered && (rightDown || leftDown)) {
      _keyHeldTime += dt;

      // Fire immediately on first press
      final isRepeat = _keyHeldTime > keyRepeatDelay && (_keyHeldTime % keyRepeatInterval) < dt;
      
      if (!_keyFired || isRepeat) {
        final (min, max) = _getLimits();
        final step = this.step ?? ((max - min) / 100.0);
        value = convert((value + (rightDown ? step : -step)).clamp(min, max));
        onChangeFn?.call(this, value);
        _keyFired = true;
      }
    } else {
      _keyHeldTime = 0.0;
      _keyFired = false;
    }
  }

  @override
  void onDraw(double dt) {
    final rect = widgetCollider.rect;
    final theme = FSliderTheme.resolveStyle(sliderStyle, sliderVariant);
    final isHovered = clickState.hovered;

    final originX = rect.x;
    final centerY = _centerY(rect.y);
    final thumbX = _thumbX(originX);
    final trackY = centerY - trackHeight / 2;

    switch (sliderStyle) {
      case .track:
        // full track
        backend.render.drawRectangleRounded(
          .rect(originX, trackY, trackWidth, trackHeight),
          1.0, 4,
          isHovered ? theme.trackHovered : theme.track,
        );
        // thumb
        backend.render.drawCircle(
          thumbX, centerY, thumbRadius,
          _isDragging ? theme.thumbDragged : isHovered ? theme.thumbHovered : theme.thumb,
        );

      case .filled:
        final fillWidth = _normalized * trackWidth;
        // unfilled portion
        backend.render.drawRectangleRounded(
          .rect(originX, trackY, trackWidth, trackHeight),
          1.0, 4,
          isHovered ? theme.trackHovered : theme.track,
        );
        // filled portion
        if (fillWidth > 0) {
          backend.render.drawRectangleRounded(
            .rect(originX, trackY, fillWidth, trackHeight),
            1.0, 4,
            isHovered ? theme.fillHovered : theme.fill,
          );
        }
        // thumb
        backend.render.drawCircle(
          thumbX, centerY, thumbRadius,
          _isDragging ? theme.thumbDragged : isHovered ? theme.thumbHovered : theme.thumb,
        );
    }
  }
  
  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FSlider<T, X>) return;
    copy.min = min;
    copy.max = max;
    copy.step = step;
    copy.value = value;
    copy.trackWidth = trackWidth;
    copy.trackHeight = trackHeight;
    copy.thumbRadius = thumbRadius;
    copy.sliderStyle = sliderStyle;
    copy.sliderVariant = sliderVariant;
    copy.enableArrowKeys = enableArrowKeys;
    copy.keyRepeatDelay = keyRepeatDelay;
    copy.keyRepeatInterval = keyRepeatInterval;
    copy.onChangeFn = onChangeFn;
    copy.onChangeEndFn = onChangeEndFn;
    copy._onWidgetClickFns = .from(_onWidgetClickFns);
    copy._onWidgetDoubleClickFns = .from(_onWidgetDoubleClickFns);
    copy._onWidgetClickHoldFns = .from(_onWidgetClickHoldFns);
  }
}

final class FDoubleSlider<T extends App<T>> extends FSlider<T, double> {
  FDoubleSlider(super.app, {
    super.key,
    super.position,
    super.min,
    super.max,
    super.step,
    super.initialValue,
    super.trackWidth,
    super.trackHeight,
    super.thumbRadius,
    super.sliderStyle,
    super.sliderVariant,
    super.enableArrowKeys,
    super.onChangeFn,
    super.onChangeEndFn,
  }) : super(convert: (x) => x.toDouble());

  @override
  FDoubleSlider<T> createInstance() => .new(app);
}

final class FIntSlider<T extends App<T>> extends FSlider<T, int> {
  FIntSlider(super.app, {
    super.key,
    super.position,
    super.min,
    super.max,
    super.step,
    super.initialValue,
    super.trackWidth,
    super.trackHeight,
    super.thumbRadius,
    super.sliderStyle,
    super.sliderVariant,
    super.enableArrowKeys,
    super.onChangeFn,
    super.onChangeEndFn,
  }) : super(convert: (x) => x.toInt());

  @override
  FIntSlider<T> createInstance() => .new(app);
}