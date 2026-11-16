part of '../../raylib_dartified_unhinged.dart';

enum FColorPickerVariant {
  primary,
  danger,
  success,
}

enum _ColorDrag { none, sv, hue, alpha }

final class FColorPickerTheme {
  final Color background;
  final Color backgroundHovered;
  final Color border;
  final Color borderHovered;
  final Color borderOpen;
  final Color text;
  final Color arrow;

  // popup
  final Color popupBackground;
  final Color popupBorder;
  final Color checkerA;
  final Color checkerB;

  const FColorPickerTheme({
    required this.background,
    required this.backgroundHovered,
    required this.border,
    required this.borderHovered,
    required this.borderOpen,
    required this.text,
    required this.arrow,
    required this.popupBackground,
    required this.popupBorder,
    required this.checkerA,
    required this.checkerB,
  });

  static FColorPickerTheme resolveVariant(FColorPickerVariant variant) {
    final solid = _fColorPickerVariantColors[variant]!;
    return .new(
      background:        .color(0xFF, 0xFF, 0xFF, 0xFF),
      backgroundHovered: .color(0xF7, 0xF7, 0xFF, 0xFF),
      border:            .color(0xAA, 0xAA, 0xAA, 0xFF),
      borderHovered:     solid,
      borderOpen:        solid,
      text:              .color(0x22, 0x22, 0x22, 0xFF),
      arrow:             .color(0x88, 0x88, 0x88, 0xFF),
      popupBackground:   .color(0xFF, 0xFF, 0xFF, 0xFF),
      popupBorder:       solid,
      checkerA:          .color(0xFF, 0xFF, 0xFF, 0xFF),
      checkerB:          .color(0xCC, 0xCC, 0xCC, 0xFF),
    );
  }
}

Map<FColorPickerVariant, Color> get _fColorPickerVariantColors => {
  .primary: .color(0x5B, 0x4F, 0xCF, 0xFF),
  .danger:  .color(0xD8, 0x5A, 0x30, 0xFF),
  .success: .color(0x1D, 0x9E, 0x75, 0xFF),
};

final class FColorPicker<T extends App<T>> extends FWidgetLeaf<T> with IsWidgetClickable<T, FColorPicker<T>> {
  bool allowAlpha;
  bool allowClear; // shows an "x" in the trigger, emits null on click
  double controlWidth;
  double controlHeight;
  double fontSize;
  double borderWidth;
  double cornerRadius;
  double popupPadding;
  double svHeight;
  double stripHeight;
  double stripGap;
  FColorPickerVariant pickerVariant;

  void Function(FColorPicker<T> self, Color? color)? onChangeFn;
  void Function(FColorPicker<T> self, Color? color)? onChangeEndFn;

  // HSV is the source of truth, so hue/saturation survive when s or v hits 0
  double _h = 0;   // 0..360
  double _s = 1;   // 0..1
  double _v = 1;   // 0..1
  double _a = 1;   // 0..1
  bool _hasValue;

  bool _isOpen = false;
  _ColorDrag _drag = .none;

  static const double _paddingH = 10.0;
  static const double _arrowAreaWidth = 24.0;
  static const double _clearSize = 16.0;
  static const double _checkerCell = 5.0;

  @override
  bool get _ownsChildrenDrawOrder => true;

  FColorPicker(super.app, {
    super.key,
    Color? initial,
    this.allowAlpha    = true,
    this.allowClear    = false,
    this.controlWidth  = 180.0,
    this.controlHeight = 32.0,
    this.fontSize      = 14.0,
    this.borderWidth   = 2,
    this.cornerRadius  = 0.25,
    this.popupPadding  = 8.0,
    this.svHeight      = 120.0,
    this.stripHeight   = 14.0,
    this.stripGap      = 8.0,
    this.pickerVariant = .primary,
    this.onChangeFn,
    this.onChangeEndFn,
  }) : _hasValue = initial != null {
    if (initial != null) _setFromColor(initial);
  }

  // ---------------------------------------------------------------- value

  Color? get color => _hasValue
    ? _hsvToColor(_h, _s, _v, allowAlpha ? _a : 1.0)
    : null;

  set color(Color? c) {
    if (c == null) {
      _hasValue = false;
    } else {
      _setFromColor(c);
    }
  }

  void _setFromColor(Color c) {
    final r = c.r / 255.0;
    final g = c.g / 255.0;
    final b = c.b / 255.0;
    final mx = r > g ? (r > b ? r : b) : (g > b ? g : b);
    final mn = r < g ? (r < b ? r : b) : (g < b ? g : b);
    final d = mx - mn;

    // keep the previous hue for greys (d == 0), it's undefined there
    if (d != 0) {
      if (mx == r) {
        _h = 60 * (((g - b) / d) % 6); // Dart's % is never negative
      } else if (mx == g) {
        _h = 60 * ((b - r) / d + 2);
      } else {
        _h = 60 * ((r - g) / d + 4);
      }
    }
    _s = mx == 0 ? 0 : d / mx;
    _v = mx;
    _a = c.a / 255.0;
    _hasValue = true;
  }

  static Color _hsvToColor(double h, double s, double v, double a) {
    final c = v * s;
    final hp = (h % 360) / 60;
    final x = c * (1 - (hp % 2 - 1).abs());
    final m = v - c;

    final (r, g, b) = switch (hp.floor()) {
      0 => (c, x, 0.0),
      1 => (x, c, 0.0),
      2 => (0.0, c, x),
      3 => (0.0, x, c),
      4 => (x, 0.0, c),
      _ => (c, 0.0, x),
    };

    int ch(double f) => ((f + m) * 255).round().clamp(0, 255);
    return .color(ch(r), ch(g), ch(b), (a * 255).round().clamp(0, 255));
  }

  String get _label {
    final c = color;
    if (c == null) return 'none';
    String hex(int v) => v.toRadixString(16).padLeft(2, '0').toUpperCase();
    final alpha = allowAlpha && c.a != 255 ? hex(c.a) : '';
    return '#${hex(c.r)}${hex(c.g)}${hex(c.b)}$alpha';
  }

  // ------------------------------------------------------------- geometry

  Vector2 get _interactiveSize => .vec2(controlWidth, controlHeight);

  double get _popupWidth => controlWidth;
  double get _innerWidth => _popupWidth - popupPadding * 2;

  double get _popupHeight =>
    popupPadding * 2 +
    svHeight +
    stripGap + stripHeight +
    (allowAlpha ? stripGap + stripHeight : 0);

  Rectangle _triggerRect(Vector2 o) =>
    .rect(o.x, o.y, controlWidth, controlHeight);

  Rectangle _clearRect(Vector2 o) =>
    .rect(o.x + controlWidth - _arrowAreaWidth - _clearSize, o.y, _clearSize, controlHeight);

  Rectangle _popupRect(Vector2 o) =>
    .rect(o.x, o.y + controlHeight, _popupWidth, _popupHeight);

  Rectangle _svRect(Vector2 o) => .rect(
    o.x + popupPadding,
    o.y + controlHeight + popupPadding,
    _innerWidth, svHeight,
  );

  Rectangle _hueRect(Vector2 o) => .rect(
    o.x + popupPadding,
    o.y + controlHeight + popupPadding + svHeight + stripGap,
    _innerWidth, stripHeight,
  );

  Rectangle _alphaRect(Vector2 o) => .rect(
    o.x + popupPadding,
    o.y + controlHeight + popupPadding + svHeight + stripGap + stripHeight + stripGap,
    _innerWidth, stripHeight,
  );

  Rectangle _fullRect(Vector2 o) => _isOpen
    ? .rect(o.x, o.y, controlWidth, controlHeight + _popupHeight)
    : _triggerRect(o);

  @override
  void layout(FConstraints constraints) {
    size = _interactiveSize.copy();
  }

  // --------------------------------------------------------------- update

  bool _hit(Vector2 p, Rectangle r) => backend.collision.pointRectangle(p, r);

  void _close() {
    _isOpen = false;
    _drag = .none;
  }

  void _applyDrag(Vector2 m, Vector2 o) {
    final (h0, s0, v0, a0) = (_h, _s, _v, _a);

    switch (_drag) {
      case .sv: {
        final r = _svRect(o);
        _s = ((m.x - r.x) / r.width).clamp(0.0, 1.0);
        _v = 1.0 - ((m.y - r.y) / r.height).clamp(0.0, 1.0);
      }
      case .hue: {
        final r = _hueRect(o);
        _h = ((m.x - r.x) / r.width).clamp(0.0, 1.0) * 360.0;
      }
      case .alpha: {
        final r = _alphaRect(o);
        _a = ((m.x - r.x) / r.width).clamp(0.0, 1.0);
      }
      case .none:
        return;
    }

    final changed = !_hasValue || h0 != _h || s0 != _s || v0 != _v || a0 != _a;
    _hasValue = true;
    if (changed) onChangeFn?.call(this, color);
  }

  @override
  @mustCallSuper
  void onPostUpdate(double dt) {
    final rect = widgetCollider.rect;
    final mouse = backend.mouse;
    final Vector2 origin = .vec2(rect.x, rect.y);

    final hoveredTrigger = _hit(mouse.position, _triggerRect(origin));
    final hoveredClear = allowClear && _hasValue && _hit(mouse.position, _clearRect(origin));

    _IsWidgetClickable_updateState(
      hovered: hoveredTrigger,
      usePendingSingleClickMethod: false,
      dt: dt,
    );

    if (hoveredClear && mouse.btnLeft.pressed) {
      _hasValue = false;
      _close();
      onChangeFn?.call(this, null);
      onChangeEndFn?.call(this, null);
      return;
    }

    if (hoveredTrigger && mouse.btnLeft.pressed) {
      _isOpen = !_isOpen;
      _drag = .none;
    }

    if (!_isOpen) return;

    // drag start
    if (mouse.btnLeft.pressed && _drag == .none) {
      if (_hit(mouse.position, _svRect(origin))) {
        _drag = .sv;
      } else if (_hit(mouse.position, _hueRect(origin))) {
        _drag = .hue;
      } else if (allowAlpha && _hit(mouse.position, _alphaRect(origin))) {
        _drag = .alpha;
      }
    }

    // drag update / end (keeps tracking when the cursor leaves the strip)
    if (_drag != .none) {
      if (mouse.btnLeft.released) {
        _drag = .none;
        onChangeEndFn?.call(this, color);
      } else if (mouse.btnLeft.down) {
        _applyDrag(mouse.position, origin);
      }
    }

    // click outside the entire widget → close
    if (_drag == .none &&
        mouse.btnLeft.pressed &&
        !_hit(mouse.position, _fullRect(origin))) {
      _close();
    }

    if (backend.input.isKeyPressed(.KEY_ESCAPE) ||
        backend.input.isKeyPressed(.KEY_ENTER) ||
        backend.input.isKeyPressed(.KEY_KP_ENTER)) {
      _close();
    }
  }

  // ----------------------------------------------------------------- draw

  @override
  void onDraw(double dt) {
    final rect = widgetCollider.rect;

    final theme = FColorPickerTheme.resolveVariant(pickerVariant);
    final isHovered = clickState.hovered;
    final Vector2 origin = .vec2(rect.x, rect.y);

    _drawTrigger(theme, isHovered, origin);

    // NOTE: deferred to the end of the frame so it draws above siblings
    if (_isOpen) callback(() => _drawPopup(theme, origin));
  }

  // raylib vertex order: topLeft, bottomLeft, topRight, bottomRight
  void _grad(Rectangle r, Color tl, Color bl, Color tr, Color br) {
    backend.render.drawRectangleGradientEx(r, tl, bl, tr, br);
  }

  void _drawChecker(Rectangle r, FColorPickerTheme theme) {
    backend.render.drawRectangleRec(r, theme.checkerA);

    final cols = (r.width / _checkerCell).ceil();
    final rows = (r.height / _checkerCell).ceil();

    for (var cy = 0; cy < rows; cy++) {
      for (var cx = 0; cx < cols; cx++) {
        if ((cx + cy).isOdd) continue;
        final x = r.x + cx * _checkerCell;
        final y = r.y + cy * _checkerCell;
        final w = (r.x + r.width - x).clamp(0.0, _checkerCell);
        final h = (r.y + r.height - y).clamp(0.0, _checkerCell);
        backend.render.drawRectangleRec(.rect(x, y, w, h), theme.checkerB);
      }
    }
  }

  void _drawTrigger(FColorPickerTheme theme, bool isHovered, Vector2 origin) {
    final Rectangle rect = _triggerRect(origin);

    backend.render.drawRectangleRounded(
      rect, cornerRadius, 4,
      isHovered ? theme.backgroundHovered : theme.background,
    );

    backend.render.drawRectangleRoundedLinesEx(
      rect, cornerRadius, 4, borderWidth,
      _isOpen ? theme.borderOpen : isHovered ? theme.borderHovered : theme.border,
    );

    // swatch
    final swatchSize = controlHeight - 12.0;
    final Rectangle swatch = .rect(
      origin.x + _paddingH,
      origin.y + (controlHeight - swatchSize) / 2,
      swatchSize, swatchSize,
    );
    final c = color;
    if (c == null || c.a < 255) _drawChecker(swatch, theme);
    if (c != null) backend.render.drawRectangleRec(swatch, c);
    backend.render.drawRectangleLinesEx(swatch, 1, theme.border);

    // label
    backend.render.drawText(
      _label,
      swatch.x + swatchSize + 6,
      origin.y + (controlHeight - fontSize) / 2,
      fontSize,
      theme.text,
    );

    // clear button
    if (allowClear && _hasValue) {
      final cr = _clearRect(origin);
      backend.render.drawText(
        'x',
        cr.x + 4,
        origin.y + (controlHeight - fontSize) / 2,
        fontSize,
        theme.arrow,
      );
    }

    // arrow chevron
    final ax = origin.x + controlWidth - _arrowAreaWidth / 2;
    final ay = origin.y + controlHeight / 2;
    final hs = 4.0;
    if (_isOpen) {
      backend.render.drawTriangle(
        .vec2(ax,      ay - hs),
        .vec2(ax + hs, ay + hs),
        .vec2(ax - hs, ay + hs),
        theme.arrow,
      );
    } else {
      backend.render.drawTriangle(
        .vec2(ax - hs, ay - hs),
        .vec2(ax + hs, ay - hs),
        .vec2(ax,      ay + hs),
        theme.arrow,
      );
    }
  }

  void _drawStripHandle(double x, Rectangle strip) {
    backend.render.drawRectangleRec(
      .rect(x - 3, strip.y - 2, 6, strip.height + 4),
      .color(0x22, 0x22, 0x22, 0xFF),
    );
    backend.render.drawRectangleRec(
      .rect(x - 2, strip.y - 1, 4, strip.height + 2),
      .color(0xFF, 0xFF, 0xFF, 0xFF),
    );
  }

  void _drawPopup(FColorPickerTheme theme, Vector2 origin) {
    final Rectangle popup = _popupRect(origin);
    backend.render.drawRectangleRounded(popup, cornerRadius, 4, theme.popupBackground);
    backend.render.drawRectangleRoundedLinesEx(
      popup, cornerRadius, 4, borderWidth, theme.popupBorder,
    );

    final Color white = .color(0xFF, 0xFF, 0xFF, 0xFF);
    final Color black = .color(0x00, 0x00, 0x00, 0xFF);
    final Color clear = .color(0x00, 0x00, 0x00, 0x00);

    // --- saturation / value square
    final sv = _svRect(origin);
    final pureHue = _hsvToColor(_h, 1, 1, 1);
    _grad(sv, white, white, pureHue, pureHue);
    _grad(sv, clear, black, black, clear);
    backend.render.drawRectangleLinesEx(sv, 1, theme.border);

    final hx = sv.x + _s * sv.width;
    final hy = sv.y + (1 - _v) * sv.height;
    backend.render.drawCircle(hx, hy, 6, white);
    backend.render.drawCircle(hx, hy, 4.5, _hsvToColor(_h, _s, _v, 1));

    // --- hue strip (6 segments of 60°)
    final hue = _hueRect(origin);
    final segW = hue.width / 6;
    for (var i = 0; i < 6; i++) {
      final l = _hsvToColor(i * 60.0, 1, 1, 1);
      final r = _hsvToColor((i + 1) * 60.0, 1, 1, 1);
      _grad(.rect(hue.x + i * segW, hue.y, segW, hue.height), l, l, r, r);
    }
    backend.render.drawRectangleLinesEx(hue, 1, theme.border);
    _drawStripHandle(hue.x + (_h / 360.0) * hue.width, hue);

    // --- alpha strip
    if (allowAlpha) {
      final alpha = _alphaRect(origin);
      final base = _hsvToColor(_h, _s, _v, 1);
      final Color transparent = .color(base.r, base.g, base.b, 0);
      _drawChecker(alpha, theme);
      _grad(alpha, transparent, transparent, base, base);
      backend.render.drawRectangleLinesEx(alpha, 1, theme.border);
      _drawStripHandle(alpha.x + _a * alpha.width, alpha);
    }
  }

  @override
  FColorPicker<T> createInstance() => .new(app);

  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FColorPicker<T>) return;
    copy.allowAlpha = allowAlpha;
    copy.allowClear = allowClear;
    copy.controlWidth = controlWidth;
    copy.controlHeight = controlHeight;
    copy.fontSize = fontSize;
    copy.borderWidth = borderWidth;
    copy.cornerRadius = cornerRadius;
    copy.popupPadding = popupPadding;
    copy.svHeight = svHeight;
    copy.stripHeight = stripHeight;
    copy.stripGap = stripGap;
    copy.pickerVariant = pickerVariant;
    copy.onChangeFn = onChangeFn;
    copy.onChangeEndFn = onChangeEndFn;
    copy._h = _h;
    copy._s = _s;
    copy._v = _v;
    copy._a = _a;
    copy._hasValue = _hasValue;
    copy._onWidgetClickFns = .from(_onWidgetClickFns);
    copy._onWidgetDoubleClickFns = .from(_onWidgetDoubleClickFns);
    copy._onWidgetClickHoldFns = .from(_onWidgetClickHoldFns);
  }
}