part of '../../raylib_dartified_unhinged.dart';

class FSingleChildScrollView<T extends App<T>> extends FWidgetLeaf<T> {
  bool scrollVertical;
  bool scrollHorizontal;

  bool autoScrollX;
  bool autoScrollY;
  bool defaultScrollSupport;
  double defaultScrollSupportSpeed;
  bool scrollOnContentChange;

  double _scrollX = 0;
  double _scrollY = 0;

  double _lastChildWidth = 0;
  double _lastChildHeight = 0;

  // scrollbar
  bool showScrollbar;
  double scrollbarThickness = 8;
  double scrollbarPadding = 4;
  double scrollbarMinThumbSize = 24;

  Color scrollbarColor = .GRAY;
  Color scrollbarHoverColor = .DARKGRAY;
  Color scrollbarDraggingColor = .WHITE;

  bool _draggingScrollbarX = false;
  bool _draggingScrollbarY = false;

  double _dragStartPosition = 0;
  double _dragStartScroll = 0;

  FSingleChildScrollView(super.app, {
    super.key,
    this.scrollVertical = true,
    this.scrollHorizontal = false,
    this.autoScrollX = false,
    this.autoScrollY = false,
    this.defaultScrollSupport = true,
    this.defaultScrollSupportSpeed = 10,
    this.scrollOnContentChange = false,
    this.showScrollbar = true,
    required FWidget<T> child,
  }) : super(child: child);

  @override
  bool get _ownsChildrenDrawOrder => true;

  bool _userScrolled = false;

  @override
  void layout(FConstraints constraints) {
    final child = this.child!;

    // tight on the non-scrolling axis (fill viewport), unbounded on the scrolling axis
    child._doLayout(.new(
      minWidth: scrollHorizontal ? 0 : constraints.maxWidth,
      maxWidth: scrollHorizontal ? double.infinity : constraints.maxWidth,
      minHeight: scrollVertical ? 0 : constraints.maxHeight,
      maxHeight: scrollVertical ? double.infinity : constraints.maxHeight,
    ));

    // the scroll view itself always fills exactly the space it was offered (it's the viewport)
    size = .vec2(constraints.maxWidth, constraints.maxHeight);

    // clamp scroll so you can't scroll past the content
    final maxScrollX = (child.size.x - size.x).clamp(0, double.infinity);
    final maxScrollY = (child.size.y - size.y).clamp(0, double.infinity);
    
    if (autoScrollX && !_userScrolled) _scrollX = maxScrollX.toDouble();
    if (autoScrollY && !_userScrolled) _scrollY = maxScrollY.toDouble();
    _userScrolled = false;
    // track last content height; only auto-scroll if content size changed
    if (scrollOnContentChange) {
      if (autoScrollX && !_userScrolled && child.size.x != _lastChildWidth) {
        _scrollX = maxScrollX.toDouble();
      }
      if (autoScrollY && !_userScrolled && child.size.y != _lastChildHeight) {
        _scrollY = maxScrollY.toDouble();
      }
      _lastChildWidth = child.size.x;
      _lastChildHeight = child.size.y;
      _userScrolled = false;
    }

    _scrollX = _scrollX.clamp(0, maxScrollX).toDouble();
    _scrollY = _scrollY.clamp(0, maxScrollY).toDouble();

    child.localOffset = .vec2(-_scrollX, -_scrollY);
  }

  void scroll(double dx, double dy) {
    if (scrollHorizontal) _scrollX += dx;
    if (scrollVertical)   _scrollY += dy;
  }

  bool _isInsideRect(Vector2 point, Rectangle rect) {
    return point.x >= rect.x &&
      point.x <= rect.x + rect.width &&
      point.y >= rect.y &&
      point.y <= rect.y + rect.height;
  }

  void _updateScrollbarInteraction(Rectangle origin) {
    if (!showScrollbar) return;

    final oldScrollX = _scrollX;
    final oldScrollY = _scrollY;

    final mouse = backend.mouse.position;
    final pressed = backend.mouse.btnLeft.pressed;
    final held = backend.mouse.btnLeft.down;

    final vertical = _getScrollbarRect(
      origin: origin,
      horizontal: false,
    );

    final horizontal = _getScrollbarRect(
      origin: origin,
      horizontal: true,
    );

    // Start dragging.
    if (pressed && vertical != null && _isInsideRect(mouse, vertical)) {
      _draggingScrollbarY = true;
      _dragStartPosition = mouse.y;
      _dragStartScroll = _scrollY;
    } else if (pressed && horizontal != null && _isInsideRect(mouse, horizontal)) {
      _draggingScrollbarX = true;
      _dragStartPosition = mouse.x;
      _dragStartScroll = _scrollX;
    }

    // Stop dragging.
    if (!held) {
      _draggingScrollbarX = false;
      _draggingScrollbarY = false;
      return;
    }

    // Update scroll position.
    if (_draggingScrollbarY && vertical != null) {
      final trackLength = size.y - scrollbarPadding * 2;
      final thumbTravel = trackLength - vertical.height;

      if (thumbTravel > 0) {
        _scrollY = _dragStartScroll + (mouse.y - _dragStartPosition) * (child!.size.y - size.y) / thumbTravel;
      }
    }

    if (_draggingScrollbarX && horizontal != null) {
      final trackLength = size.x - scrollbarPadding * 2;
      final thumbTravel = trackLength - horizontal.width;

      if (thumbTravel > 0) {
        _scrollX = _dragStartScroll + (mouse.x - _dragStartPosition) * (child!.size.x - size.x) / thumbTravel;
      }
    }

    if (oldScrollX != _scrollX || oldScrollY != _scrollY) {
      setState(() {});
    }
  }

  Rectangle? _getScrollbarRect({
    required Rectangle origin,
    required bool horizontal,
  }) {
    final contentSize = horizontal ? child!.size.x : child!.size.y;
    final viewportSize = horizontal ? size.x : size.y;

    if (contentSize <= viewportSize) return null;

    final trackLength = viewportSize - scrollbarPadding * 2;
    final thumbLength = (trackLength * viewportSize / contentSize)
      .clamp(scrollbarMinThumbSize, trackLength)
      .toDouble();

    final maxScroll = contentSize - viewportSize;
    final scroll = horizontal ? _scrollX : _scrollY;

    final thumbOffset = (trackLength - thumbLength) * scroll / maxScroll;

    if (horizontal) {
      return .new(
        x: origin.x + scrollbarPadding + thumbOffset,
        y: origin.y + origin.height - scrollbarThickness - scrollbarPadding,
        width: thumbLength,
        height: scrollbarThickness,
      );
    }

    return .new(
      x: origin.x + origin.width - scrollbarThickness - scrollbarPadding,
      y: origin.y + scrollbarPadding + thumbOffset,
      width: scrollbarThickness,
      height: thumbLength,
    );
  }

  @override
  void onPostUpdate(double dt) {
    final r = widgetCollider.rect;
    _updateScrollbarInteraction(r);

    if (defaultScrollSupport) {
      final y = backend.mouse.wheel.scale(defaultScrollSupportSpeed).y * -1;
      if (y == 0) return;

      _userScrolled = true;
      if (backend.input.isKeyDown(.KEY_LEFT_CONTROL)) {
        setState(() => _scrollX += y);
      } else {
        setState(() => _scrollY += y);
      }
    }
  }

  void _drawScrollbar(Rectangle origin) {
    final vertical = _getScrollbarRect(
      origin: origin,
      horizontal: false,
    );

    final horizontal = _getScrollbarRect(
      origin: origin,
      horizontal: true,
    );

    if (vertical != null) {
      backend.render.drawRectangleRec(
        vertical,
        _draggingScrollbarY
          ? scrollbarDraggingColor
          : scrollbarColor,
      );
    }

    if (horizontal != null) {
      backend.render.drawRectangleRec(
        horizontal,
        _draggingScrollbarX
          ? scrollbarDraggingColor
          : scrollbarColor,
      );
    }
  }

  @override
  void onDraw(double dt) {
    final r = widgetCollider.rect;
    backend.render.beginScissorMode(r.x, r.y, r.width, r.height);
    child!._doDraw(dt);
    backend.render.endScissorMode();
    if (showScrollbar) _drawScrollbar(r);
  }

  @override
  FSingleChildScrollView<T> createInstance() => .new(app, child: child!);
  
  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FSingleChildScrollView<T>) return;
    copy.scrollVertical = scrollVertical;
    copy.scrollHorizontal = scrollHorizontal;
    copy.autoScrollX = autoScrollX;
    copy.autoScrollY = autoScrollY;
    copy.defaultScrollSupport = defaultScrollSupport;
    copy.defaultScrollSupportSpeed = defaultScrollSupportSpeed;
    copy.scrollOnContentChange = scrollOnContentChange;

    // scrollbar
    copy.showScrollbar = showScrollbar;
    copy.scrollbarThickness = scrollbarThickness;
    copy.scrollbarPadding = scrollbarPadding;
    copy.scrollbarMinThumbSize = scrollbarMinThumbSize;
    copy.scrollbarColor = scrollbarColor;
    copy.scrollbarHoverColor = scrollbarHoverColor;
    copy.scrollbarDraggingColor = scrollbarDraggingColor;
  }
}