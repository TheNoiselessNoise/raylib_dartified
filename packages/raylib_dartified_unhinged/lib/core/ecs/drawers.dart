part of '../raylib_dartified_unhinged.dart';

abstract class BaseDrawer<T extends App<T>> with HasAppAccess<T> {
  @override
  final T app;

  BaseDrawer(this.app);
}

enum TextDrawerHAlign { left, center, right }
enum TextDrawerVAlign { top, middle, bottom }

/// Immediate-mode text builder with one layout path.
///
/// Runs added via [text]/[gap] are buffered into the current line. The line
/// is laid out and drawn when it is flushed: by [nl], [end], [at], [align],
/// or [print].
///
/// State rules:
///  - [fontSize] and [color] apply to runs added after the call (per-run).
///  - [align], [lineHeight] and position apply to lines flushed after the
///    call; changing them flushes the pending line first.
///  - State persists between frames. Call [reset] at frame start.
///
/// Rich runs on one line:
///   draw.text.at(20, 20).text('HP: ', .WHITE).text('$hp', .RED).end();
/// Single string:
///   draw.text.print(20, 20, 'Hello', .RED);
final class TextDrawer<T extends App<T>> extends BaseDrawer<T> {
  TextDrawer(super.app);

  static const int _defaultSize = 20;
  static const double _lineHeightFactor = 1.2;
  static const int _cacheLimit = 512;

  // Layout state.
  double _startX = 0;
  double _y = 0;
  TextDrawerHAlign _halign = .left;
  TextDrawerVAlign _valign = .top;
  int _fontSize = _defaultSize;
  Color _color = .WHITE;
  double? _lineHeight; // null = auto (tallest run on the line * 1.2)

  // Current line, parallel buffers reused across frames (no per-run allocs).
  final List<String?> _texts = []; // null = gap
  final List<Color> _colors = [];
  final List<double> _widths = [];
  final List<int> _sizes = [];
  int _n = 0;
  double _total = 0;
  int _maxSize = 0;

  // size -> (string -> width). Bounded; dynamic strings will churn it.
  final Map<int, Map<String, double>> _widthCache = {};

  /// Restores defaults and discards any pending line. Call once per frame.
  TextDrawer<T> reset() {
    _n = 0;
    _total = 0;
    _maxSize = 0;
    _halign = .left;
    _valign = .top;
    _fontSize = _defaultSize;
    _color = .WHITE;
    _lineHeight = null;
    return this;
  }

  /// Sets the line origin. [nl] returns to this x.
  TextDrawer<T> at(num x, num y) {
    _flushLine();
    _startX = x.toDouble();
    _y = y.toDouble();
    return this;
  }

  TextDrawer<T> atV(Vector2 v) => at(v.x, v.y);

  TextDrawer<T> align(TextDrawerHAlign h, TextDrawerVAlign v) {
    _flushLine();
    _halign = h;
    _valign = v;
    return this;
  }

  TextDrawer<T> halign(TextDrawerHAlign h) => align(h, _valign);
  TextDrawer<T> valign(TextDrawerVAlign v) => align(_halign, v);

  /// Applies to runs added after this call.
  TextDrawer<T> size(num size) {
    _fontSize = size.toInt();
    return this;
  }

  /// Default color for runs that don't pass one.
  TextDrawer<T> color(Color c) {
    _color = c;
    return this;
  }

  /// Fixed line step in pixels. Pass null for auto.
  TextDrawer<T> lineHeight(num? h) {
    _flushLine();
    _lineHeight = h?.toDouble();
    return this;
  }

  /// Adds a run to the current line. Nothing is advanced implicitly;
  /// use [gap] for spacing.
  TextDrawer<T> text(String content, [Color? color]) {
    _push(content, color ?? _color, _measure(content, _fontSize), _fontSize);
    return this;
  }

  TextDrawer<T> lines(List<String> lines, [Color? color]) {
    lines.forEach((l) => nl().text(l, color));
    return this;
  }

  /// Horizontal space. Defaults to the width of one space at the current size.
  TextDrawer<T> gap([num? amount]) {
    _push(null, _color, amount?.toDouble() ?? _measure(' ', _fontSize), 0);
    return this;
  }

  /// Flushes the current line and moves down to the next one.
  TextDrawer<T> nl() {
    final step = _lineHeight ?? (_n > 0 ? _maxSize : _fontSize) * _lineHeightFactor;
    _flushLine();
    _y += step;
    return this;
  }

  /// Flushes the current line without moving down.
  TextDrawer<T> end() {
    _flushLine();
    return this;
  }

  /// One-shot: draw a single string at (x, y).
  TextDrawer<T> print(String content, num x, num y, num size, [Color? color])
    => at(x, y).size(size).text(content, color).end();
  
  /// One-shot: draw a single string at (x, y), but centered horizontally and vertically.
  TextDrawer<T> centered(String content, num cx, num y, int size, Color color)
    => at(cx, y).align(.center, .middle).size(size).text(content, color).end();

  /// Debug aid: call at frame end to catch a forgotten [end].
  void debugCheckFlushed() {
    assert(_n == 0, 'TextDrawer: pending line was never flushed (missing end()?)');
  }

  double _measure(String s, int size) {
    final cache = _widthCache[size] ??= {};
    final hit = cache[s];
    if (hit != null) return hit;
    if (cache.length >= _cacheLimit) cache.clear();
    return cache[s] = backend.render.measureText(s, size).toDouble();
  }

  void _push(String? text, Color color, double width, int size) {
    if (_n < _texts.length) {
      _texts[_n] = text;
      _colors[_n] = color;
      _widths[_n] = width;
      _sizes[_n] = size;
    } else {
      _texts.add(text);
      _colors.add(color);
      _widths.add(width);
      _sizes.add(size);
    }
    _n++;
    _total += width;
    if (size > _maxSize) _maxSize = size;
  }

  void _flushLine() {
    if (_n == 0) return;

    var x = switch (_halign) {
      .left => _startX,
      .center => _startX - _total / 2,
      .right => _startX - _total,
    };

    // Line box top; runs are bottom-aligned inside it so mixed sizes share
    // a baseline-ish edge.
    final top = switch (_valign) {
      .top => _y,
      .middle => _y - _maxSize / 2,
      .bottom => _y - _maxSize,
    };

    for (var i = 0; i < _n; i++) {
      final s = _texts[i];
      if (s != null) {
        backend.render.drawText(s, x, top + (_maxSize - _sizes[i]), _sizes[i], _colors[i]);
      }
      x += _widths[i];
    }

    _n = 0;
    _total = 0;
    _maxSize = 0;
  }
}

final class ComponentDrawer<T extends App<T>> extends BaseDrawer<T> {
  ComponentDrawer(super.app);

  void _drawComponentTree(
    Comp<T> node,
    num x,
    num y,
    num fontSize,
    String prefix,
    Color color,
    bool isLast,
    List<int> yRef,
  ) {
    final connector = isLast ? '\\ ' : '|- ';
    String label = '$prefix$connector${node.name}';
    if (true) {
      label += ' (entity: ${node.entity})';
    }
    backend.render.drawText(label, x, yRef[0], fontSize, color);
    yRef[0] += (fontSize + 2).toInt();

    final children = node.getComponents().toList();
    for (int i = 0; i < children.length; i++) {
      final childIsLast = i == children.length - 1;
      final childPrefix = prefix + (isLast ? '    ' : '|   ');
      _drawComponentTree(children[i], x, y, fontSize, childPrefix, color, childIsLast, yRef);
    }
  }

  void tree(
    Comp<T> node,
    num x,
    num y,
    num fontSize,
    String prefix,
    Color color,
    [List<int>? yRef]
  ) {
    yRef ??= [y.toInt()];

    bool isLast = false;
    final parent = node.parentAs<IsAnyComponentManagable<T>>();
    final comps = parent!.getComponents().toList();

    if (comps.indexOf(node) == comps.length - 1) {
      isLast = node.getComponents().isEmpty;
    }

    _drawComponentTree(node, x, y, fontSize, prefix, color, isLast, yRef);
  }

  void entityTree(
    Entity<T> entity,
    num x,
    num y,
    num fontSize, {
      Color? color,
      String? prefix,
    }
  ) {
    final yRef = [y.toInt()];
    backend.render.drawText('$entity', x, y, fontSize, color ?? .WHITE);
    yRef[0] += fontSize.toInt();
    for (final comp in entity.getComponents()) {
      tree(comp, x, yRef[0], fontSize, prefix ?? '', color ?? .WHITE, yRef);
    }
  }
}

final class DigitalStyle {
  /// Segment thickness as a fraction of the digit width.
  final double segmentThickness;

  /// Fraction of thickness; controls tip gaps.
  final double segmentSpacing;

  /// If true, segments are drawn with rounded ends (DrawRectangleRounded).
  /// If false, plain rectangles are used.
  final bool roundedEnds;

  /// Roundness factor used when [roundedEnds] is true. Range 0.0–1.0.
  final double roundness;

  const DigitalStyle({
    this.segmentThickness = 0.13,
    this.segmentSpacing = 0,
    this.roundedEnds = false,
    this.roundness = 0.4,
  });

  static const DEFAULT = DigitalStyle();
  static const ROUNDED = DigitalStyle(roundedEnds: true, roundness: 0.5);
  static const THICK = DigitalStyle(segmentThickness: 0.18, roundedEnds: true, roundness: 0.4);
  static const THIN = DigitalStyle(segmentThickness: 0.08, roundedEnds: true, roundness: 0.6);
}

final class DigitalDrawer<T extends App<T>> extends BaseDrawer<T> {
  DigitalDrawer(super.app);

  // Segment bitmask indices: a=0, b=1, c=2, d=3, e=4, f=5, g=6
  //
  //  aaa
  // f   b
  // f   b
  //  ggg
  // e   c
  // e   c
  //  ddd
  //
  final Map<String, int> _segmentMap = {
    '0': 0x3F, // 0b0111111
    '1': 0x06, // 0b0000110
    '2': 0x5B, // 0b1011011
    '3': 0x4F, // 0b1001111
    '4': 0x66, // 0b1100110
    '5': 0x6D, // 0b1101101
    '6': 0x7D, // 0b1111101
    '7': 0x07, // 0b0000111
    '8': 0x7F, // 0b1111111
    '9': 0x6F, // 0b1101111
    'A': 0x77, // 0b1110111
    'b': 0x7C, // 0b1111100
    'B': 0x7C, // 0b1111100
    'C': 0x39, // 0b0111001
    'd': 0x5E, // 0b1011110
    'D': 0x5E, // 0b1011110
    'E': 0x79, // 0b1111001
    'F': 0x71, // 0b1110001
  };

  // Segment bit positions
  final int _segA = 1 << 0;
  final int _segB = 1 << 1;
  final int _segC = 1 << 2;
  final int _segD = 1 << 3;
  final int _segE = 1 << 4;
  final int _segF = 1 << 5;
  final int _segG = 1 << 6;

  void text(
    num x,
    num y,
    num digitWidth,
    num digitHeight,
    String text,
    Color? digitBackgroundColor,
    Color digitUnlitSegmentsColor,
    Color digitLitSegmentsColor, {
    DigitalStyle style = .DEFAULT,
    num digitPadding = 1,
    Color? textBackgroundColor,
  }) {
    assert(text.isNotEmpty, 'DrawDigitalText expects text to be non-empty.');

    if (textBackgroundColor != null) {
      final totalWidth = (text.length * digitWidth) + ((text.length - 1) * digitPadding);
      backend.render.drawRectangleRec(
        .rect(x, y, totalWidth, digitHeight),
        textBackgroundColor,
      );
    }

    for (int i = 0; i < text.length; i++) {
      final pad = i > 0 ? digitPadding : 0;
      number(
        .rect(x+(i*digitWidth)+(i*pad), y, digitWidth, digitHeight),
        text[i],
        digitBackgroundColor,
        digitUnlitSegmentsColor,
        digitLitSegmentsColor,
        style: style,
      );
    }
  }

  /// Draws a single hex digit (0–9, A–F) as a 7-segment display inside [dst].
  ///
  /// [dst] => bounding rect for this single digit.
  /// 
  /// [n] => a single character string: '0'–'9', 'A'–'F' (case-insensitive for A–F).
  ///          Unknown characters are rendered as blank (all segments unlit).
  /// 
  /// [backgroundColor] => fill color drawn behind the digit.
  /// 
  /// [dimColor] => color for inactive (dim) segments.
  /// 
  /// [litColor] => color for active (lit) segments.
  /// 
  /// [style] => controls thickness, rounding. Defaults to [DigitalStyle.DEFAULT].
  void number(
    Rectangle dst,
    String n,
    Color? backgroundColor,
    Color dimColor,
    Color litColor, {
    DigitalStyle style = .DEFAULT,
  }) {
    assert(n.length == 1, 'DrawDigitalNumber expects a single character; got "$n".');

    if (backgroundColor != null) {
      backend.render.drawRectangleRec(dst, backgroundColor);
    }

    final String key = n == 'b' ? 'b' : n == 'd' ? 'd' : n.toUpperCase();
    final int mask = _segmentMap[key] ?? 0;

    final double x = dst.x;
    final double y = dst.y;
    final double w = dst.width;
    final double h = dst.height;
    final double t = w * style.segmentThickness;
    final double s = t * style.segmentSpacing; // gap between segment ends

    final double row0 = y;
    final double row1 = y + h / 2.0;
    final double row2 = y + h;

    final double colL = x;
    final double colR = x + w;

    // Horizontal segments

    final segA = Rectangle( // top
      x:      colL + t + s,
      y:      row0,
      width:  w - 2 * t - 2 * s,
      height: t,
    );
    final segG = Rectangle( // middle
      x:      colL + t + s,
      y:      row1 - t / 2.0,
      width:  w - 2 * t - 2 * s,
      height: t,
    );
    final segD = Rectangle( // bottom
      x:      colL + t + s,
      y:      row2 - t,
      width:  w - 2 * t - 2 * s,
      height: t,
    );

    // Vertical segments

    final double topSegY = row0 + t + s;            // below segA bottom
    final double topSegBottom = row1 - t / 2.0 - s; // above segG top
    final double topSegH = topSegBottom - topSegY;

    final double botSegY = row1 + t / 2.0 + s; // below segG bottom
    final double botSegBottom = row2 - t - s;  // above segD top
    final double botSegH = botSegBottom - botSegY;

    final segF = Rectangle(x: colL,     y: topSegY, width: t, height: topSegH);
    final segB = Rectangle(x: colR - t, y: topSegY, width: t, height: topSegH);
    final segE = Rectangle(x: colL,     y: botSegY, width: t, height: botSegH);
    final segC = Rectangle(x: colR - t, y: botSegY, width: t, height: botSegH);

    void drawSeg(Rectangle rect, bool lit) {
      final Color color = lit ? litColor : dimColor;
      if (style.roundedEnds) {
        backend.render.drawRectangleRounded(rect, style.roundness, 4, color);
      } else {
        backend.render.drawRectangleRec(rect, color);
      }
    }

    drawSeg(segA, mask & _segA != 0);
    drawSeg(segB, mask & _segB != 0);
    drawSeg(segC, mask & _segC != 0);
    drawSeg(segD, mask & _segD != 0);
    drawSeg(segE, mask & _segE != 0);
    drawSeg(segF, mask & _segF != 0);
    drawSeg(segG, mask & _segG != 0);
  }
}

final class Drawers<T extends App<T>> with HasAppAccess<T> {
  @override
  final T app;

  late ComponentDrawer<T> component;
  late DigitalDrawer<T> digital;
  
  late final TextDrawer<T> _text = .new(app);
  TextDrawer<T> get text => _text.reset();

  Drawers(this.app) {
    component = .new(app);
    digital = .new(app);
  }
}