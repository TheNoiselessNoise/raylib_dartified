part of '../../raylib_dartified_unhinged.dart';

enum FSelectVariant {
  primary,
  danger,
  success,
}

final class FSelectTheme {
  final Color background;
  final Color backgroundHovered;
  final Color border;
  final Color borderHovered;
  final Color borderOpen;
  final Color text;
  final Color arrow;

  // dropdown
  final Color dropdownBackground;
  final Color dropdownBorder;
  final Color itemHovered;
  final Color itemSelected;
  final Color itemSelectedText;
  final Color itemText;

  const FSelectTheme({
    required this.background,
    required this.backgroundHovered,
    required this.border,
    required this.borderHovered,
    required this.borderOpen,
    required this.text,
    required this.arrow,
    required this.dropdownBackground,
    required this.dropdownBorder,
    required this.itemHovered,
    required this.itemSelected,
    required this.itemSelectedText,
    required this.itemText,
  });

  static FSelectTheme resolveVariant(FSelectVariant variant) {
    final colors = _fSelectVariantColors[variant]!;
    return .new(
      background:        .color(0xFF, 0xFF, 0xFF, 0xFF),
      backgroundHovered: .color(0xF7, 0xF7, 0xFF, 0xFF),
      border:            .color(0xAA, 0xAA, 0xAA, 0xFF),
      borderHovered:     colors.solid,
      borderOpen:        colors.solid,
      text:              .color(0x22, 0x22, 0x22, 0xFF),
      arrow:             .color(0x88, 0x88, 0x88, 0xFF),
      dropdownBackground: .color(0xFF, 0xFF, 0xFF, 0xFF),
      dropdownBorder:    colors.solid,
      itemHovered:       .color(0xEE, 0xEC, 0xFF, 0xFF),
      itemSelected:      colors.solid,
      itemSelectedText:  .color(0xFF, 0xFF, 0xFF, 0xFF),
      itemText:          .color(0x22, 0x22, 0x22, 0xFF),
    );
  }
}

final class _FSelectVariantPalette {
  final Color solid;
  final Color solidHover;

  const _FSelectVariantPalette({
    required this.solid,
    required this.solidHover,
  });
}

Map<FSelectVariant, _FSelectVariantPalette> get _fSelectVariantColors => {
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

final class FSelect<T extends App<T>> extends FWidgetLeaf<T> with IsWidgetClickable<T, FSelect<T>> {
  List<String> options;
  int selectedIndex;
  double controlWidth;
  double controlHeight;
  double itemHeight;
  double fontSize;
  double borderWidth;
  double cornerRadius;
  FSelectVariant selectVariant;

  void Function(FSelect<T> self, int index, String value)? onChangeFn;

  bool _isOpen = false;
  int  _hoveredItemIndex = -1;

  // padding inside the trigger box
  static const double _paddingH = 10.0;
  static const double _arrowAreaWidth = 24.0;

  @override
  bool get _ownsChildrenDrawOrder => true;

  FSelect(super.app, {
    super.key,
    required this.options,
    this.selectedIndex = 0,
    this.controlWidth  = 180.0,
    this.controlHeight = 32.0,
    this.itemHeight    = 28.0,
    this.fontSize      = 14.0,
    this.borderWidth   = 2,
    this.cornerRadius  = 0.25,
    this.selectVariant = .primary,
    this.onChangeFn,
  }) : assert(options.isNotEmpty, 'FSelect requires at least one option');

  String get selectedLabel => options[selectedIndex.clamp(0, options.length - 1)];

  Vector2 get _interactiveSize => .vec2(controlWidth, controlHeight);

  double get _dropdownHeight => itemHeight * options.length;

  // full bounding box including open dropdown, for hit-testing "outside click"
  Rectangle _fullRect(Vector2 origin) => _isOpen
    ? .rect(origin.x, origin.y, controlWidth, controlHeight + _dropdownHeight)
    : .rect(origin.x, origin.y, controlWidth, controlHeight);

  @override
  void layout(FConstraints constraints) {
    size = _interactiveSize.copy();
  }

  @override
  @mustCallSuper
  void onPostUpdate(double dt) {
    final rect = widgetCollider.rect;

    final mouse = backend.mouse;
    final Vector2 origin = .vec2(rect.x, rect.y);

    final Rectangle triggerRect = .rect(origin.x, origin.y, controlWidth, controlHeight);

    final hoveredTrigger = backend.collision.pointRectangle(
      mouse.position, triggerRect,
    );

    _IsWidgetClickable_updateState(
      hovered: hoveredTrigger,
      usePendingSingleClickMethod: false,
      dt: dt,
    );

    // toggle open on trigger click
    if (hoveredTrigger && mouse.btnLeft.pressed) {
      _isOpen = !_isOpen;
      _hoveredItemIndex = -1;
    }

    if (_isOpen) {
      final Rectangle dropdownRect = .rect(
        origin.x, origin.y + controlHeight,
        controlWidth, _dropdownHeight,
      );

      final hoveredDropdown = backend.collision.pointRectangle(
        mouse.position, dropdownRect,
      );

      // track which item the mouse is over
      if (hoveredDropdown) {
        final relY = mouse.position.y - (origin.y + controlHeight);
        _hoveredItemIndex = (relY / itemHeight).floor().clamp(0, options.length - 1);
      } else {
        _hoveredItemIndex = -1;
      }

      // click an item
      if (hoveredDropdown && mouse.btnLeft.pressed) {
        selectedIndex = _hoveredItemIndex;
        onChangeFn?.call(this, selectedIndex, selectedLabel);
        _isOpen = false;
        _hoveredItemIndex = -1;
      }

      // click outside the entire widget → close
      final hoveredFull = backend.collision.pointRectangle(
        mouse.position, _fullRect(origin),
      );
      if (!hoveredFull && mouse.btnLeft.pressed) {
        _isOpen = false;
        _hoveredItemIndex = -1;
      }

      // keyboard navigation
      if (backend.input.isKeyPressed(.KEY_ESCAPE)) {
        _isOpen = false;
        _hoveredItemIndex = -1;
      }
      if (backend.input.isKeyPressed(.KEY_DOWN)) {
        _hoveredItemIndex = (_hoveredItemIndex + 1).clamp(0, options.length - 1);
      }
      if (backend.input.isKeyPressed(.KEY_UP)) {
        _hoveredItemIndex = (_hoveredItemIndex - 1).clamp(0, options.length - 1);
      }
      if (backend.input.isKeyPressed(.KEY_ENTER) || backend.input.isKeyPressed(.KEY_KP_ENTER)) {
        if (_hoveredItemIndex >= 0) {
          selectedIndex = _hoveredItemIndex;
          onChangeFn?.call(this, selectedIndex, selectedLabel);
        }
        _isOpen = false;
        _hoveredItemIndex = -1;
      }
    }
  }

  @override
  void onDraw(double dt) {
    final rect = widgetCollider.rect;

    final theme = FSelectTheme.resolveVariant(selectVariant);
    final isHovered = clickState.hovered;
    final Vector2 origin = .vec2(rect.x, rect.y);

    _drawTrigger(theme, isHovered, origin);

    // NOTE: `callback` is a hack to defer the draw at the end of frame
    if (_isOpen) callback(() => _drawDropdown(theme, origin));
  }

  void _drawTrigger(FSelectTheme theme, bool isHovered, Vector2 origin) {
    final Rectangle rect = .rect(origin.x, origin.y, controlWidth, controlHeight);

    // background
    backend.render.drawRectangleRounded(
      rect, cornerRadius, 4,
      isHovered ? theme.backgroundHovered : theme.background,
    );

    // border
    backend.render.drawRectangleRoundedLinesEx(
      rect, cornerRadius, 4, borderWidth,
      _isOpen ? theme.borderOpen : isHovered ? theme.borderHovered : theme.border,
    );

    // selected label (clipped manually by keeping it short, no Raylib clip rects here)
    backend.render.drawText(
      selectedLabel,
      origin.x + _paddingH,
      origin.y + (controlHeight - fontSize) / 2,
      fontSize,
      theme.text,
    );

    // arrow chevron (simple triangle)
    final ax = origin.x + controlWidth - _arrowAreaWidth / 2;
    final ay = origin.y + controlHeight / 2;
    final hs = 4.0; // half-size
    if (_isOpen) {
      // pointing up
      backend.render.drawTriangle(
        .vec2(ax,      ay - hs),
        .vec2(ax + hs, ay + hs),
        .vec2(ax - hs, ay + hs),
        theme.arrow,
      );
    } else {
      // pointing down
      backend.render.drawTriangle(
        .vec2(ax - hs, ay - hs),
        .vec2(ax + hs, ay - hs),
        .vec2(ax,      ay + hs),
        theme.arrow,
      );
    }
  }

  void _drawDropdown(FSelectTheme theme, Vector2 origin) {
    final dropY = origin.y + controlHeight;

    // dropdown background + border
    final Rectangle dropRect = .rect(origin.x, dropY, controlWidth, _dropdownHeight);
    backend.render.drawRectangleRounded(dropRect, cornerRadius, 4, theme.dropdownBackground);
    backend.render.drawRectangleRoundedLinesEx(
      dropRect, cornerRadius, 4, borderWidth, theme.dropdownBorder,
    );

    // items
    for (var i = 0; i < options.length; i++) {
      final itemY = dropY + i * itemHeight;
      final Rectangle itemRect = .rect(origin.x, itemY, controlWidth, itemHeight);

      final isSelected = i == selectedIndex;
      final isItemHovered = i == _hoveredItemIndex;

      Color? color;

      if (isSelected) {
        color = theme.itemSelected;
      } else if (isItemHovered) {
        color = theme.itemHovered;
      }
        
      if (color != null) {
        backend.render.drawRectangleRounded(itemRect, cornerRadius, 4, color);
        backend.render.drawRectangleRoundedLinesEx(itemRect, cornerRadius, 4, borderWidth, color);
      }

      backend.render.drawText(
        options[i],
        origin.x + _paddingH,
        itemY + (itemHeight - fontSize) / 2,
        fontSize,
        isSelected ? theme.itemSelectedText : theme.itemText,
      );
    }
  }

  @override
  FSelect<T> createInstance() => .new(app, options: options);
  
  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FSelect<T>) return;
    copy.options = .from(options);
    copy.selectedIndex = selectedIndex;
    copy.controlWidth = controlWidth;
    copy.controlHeight = controlHeight;
    copy.itemHeight = itemHeight;
    copy.fontSize = fontSize;
    copy.borderWidth = borderWidth;
    copy.cornerRadius = cornerRadius;
    copy.selectVariant = selectVariant;
    copy._onWidgetClickFns = .from(_onWidgetClickFns);
    copy._onWidgetDoubleClickFns = .from(_onWidgetDoubleClickFns);
    copy._onWidgetClickHoldFns = .from(_onWidgetClickHoldFns);
  }
}