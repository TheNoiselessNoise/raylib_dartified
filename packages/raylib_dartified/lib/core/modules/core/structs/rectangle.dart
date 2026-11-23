part of '../../../raylib_dartified.dart';

enum RectangleField with XFields {
  x,
  y,
  width,
  height,
}

/// Rectangle, 4 components
final class Rectangle extends XStruct<Rectangle> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Rectangle> struct = .createValue(
    factory: Rectangle.new,
    layout: .aligned<RectangleField>({
      .x:      XFloat(), // Rectangle top-left corner position x
      .y:      XFloat(), // Rectangle top-left corner position y
      .width:  XFloat(), // Rectangle width
      .height: XFloat(), // Rectangle height
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<RectangleField> _l = struct.layoutOf();

  /// Field descriptor for [x].
  static final field_x = _l.float<XFloat>(.x);
  /// Field descriptor for [y].
  static final field_y = _l.float<XFloat>(.y);
  /// Field descriptor for [width].
  static final field_width = _l.float<XFloat>(.width);
  /// Field descriptor for [height].
  static final field_height = _l.float<XFloat>(.height);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  double _x;
  /// Rectangle top-left corner position x
  double get x => _x = field_x.readOr(op, _x);
  set x(double value) => _x = field_x.writeOr(op, value);
  
  double _y;
  /// Rectangle top-left corner position y
  double get y => _y = field_y.readOr(op, _y);
  set y(double value) => _y = field_y.writeOr(op, value);

  double _width;
  /// Rectangle width
  double get width => _width = field_width.readOr(op, _width);
  set width(double value) => _width = field_width.writeOr(op, value);

  double _height;
  /// Rectangle height
  double get height => _height = field_height.readOr(op, _height);
  set height(double value) => _height = field_height.writeOr(op, value);
  
  Rectangle({
    super.op,
    this._x = 0,
    this._y = 0,
    this._width = 0,
    this._height = 0,
  });

  factory Rectangle.zero() => .new();

  factory Rectangle.rect(
    num x,
    num y,
    num width,
    num height
  ) => .new(
    x: x.toDouble(),
    y: y.toDouble(),
    width: width.toDouble(),
    height: height.toDouble(),
  );

  @override
  Rectangle setDart(Rectangle o) {
    return set(o.x, o.y, o.width, o.height);
  }

  @override
  void structWriteInto(XPtr p) {
    field_x.write(p, x);
    field_y.write(p, y);
    field_width.write(p, width);
    field_height.write(p, height);
  }

  @override
  void structReadFrom(XPtr p) {
    x = field_x.read(p);
    y = field_y.read(p);
    width = field_width.read(p);
    height = field_height.read(p);
  }

  /// Sets all components at once.
  ///
  /// Values are converted using [num.toDouble].
  Rectangle set(num x, num y, num width, num height) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.width = width.toDouble();
    this.height = height.toDouble();
    return this;
  }

  /// Returns the Rectangle components as a new double list.
  ///
  /// Order: `[x, y, width, height]`
  List<double> toArray() => [x, y, width, height];

  /// Returns a formatted string representation of this rectangle.
  ///
  /// Each component is formatted to a fixed number of decimal places.
  /// [x0] sets the default precision for all components; individual overrides
  /// can be provided via [y0], [w0], and [h0].
  ///
  /// Example: `[ X:<x>, Y:<y>, W:<width>, H:<height> ]`
  String format([int x0 = 0, int? y0, int? w0, int? h0]) =>
    '[ '
      'X:${x.toStringAsFixed(x0)}, '
      'Y:${y.toStringAsFixed(y0 ?? x0)}, '
      'W:${width.toStringAsFixed(w0 ?? x0)}, '
      'H:${height.toStringAsFixed(h0 ?? x0)} '
    ']';

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, w: ${width.f1}, h: ${height.f1})';
}