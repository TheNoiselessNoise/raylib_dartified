part of '../../../raylib_dartified_base.dart';

enum ColorField with XFields {
  r,
  g,
  b,
  a,
}

/// Color, 4 components, R8G8B8A8 (32bit)
class Color extends XStruct<Color> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<Color> struct = .createValue(
    factory: Color.new,
    layout: .aligned<ColorField>({
      .r: XUnsignedChar(), // Color red value
      .g: XUnsignedChar(), // Color green value
      .b: XUnsignedChar(), // Color blue value
      .a: XUnsignedChar(), // Color alpha value
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<ColorField> _l = struct.layoutOf();

  /// Field descriptor for [r].
  static final field_r = _l.integer<XUnsignedChar>(.r);
  /// Field descriptor for [g].
  static final field_g = _l.integer<XUnsignedChar>(.g);
  /// Field descriptor for [b].
  static final field_b = _l.integer<XUnsignedChar>(.b);
  /// Field descriptor for [a].
  static final field_a = _l.integer<XUnsignedChar>(.a);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _r;
  /// Color red value
  ///
  /// Expected range: 0-255
  int get r => _r = field_r.readOr(op, _r);
  set r(int value) => _r = field_r.writeOr(op, value);
  
  int _g;
  /// Color green value
  ///
  /// Expected range: 0-255
  int get g => _g = field_g.readOr(op, _g);
  set g(int value) => _g = field_g.writeOr(op, value);
  
  int _b;
  /// Color blue value
  ///
  /// Expected range: 0-255
  int get b => _b = field_b.readOr(op, _b);
  set b(int value) => _b = field_b.writeOr(op, value);
  
  int _a;
  /// Color alpha value
  ///
  /// Expected range: 0-255
  int get a => _a = field_a.readOr(op, _a);
  set a(int value) => _a = field_a.writeOr(op, value);

  Color({
    super.op,
    int r = 0,
    int g = 0,
    int b = 0,
    int a = 0,
  }) :
    _r = r,
    _g = g,
    _b = b,
    _a = a;

  factory Color.zero() => .new();

  factory Color.color(
    num r,
    num g,
    num b,
    num a,
  ) => .new(
    r: r.toInt(),
    g: g.toInt(),
    b: b.toInt(),
    a: a.toInt(),
  );

  @override
  Color setDart(Color o) => set(o.r, o.g, o.b, o.a);

  @override
  void structWriteInto(XPtr p) {
    field_r.write(p, r);
    field_g.write(p, g);
    field_b.write(p, b);
    field_a.write(p, a);
  }

  @override
  void structReadFrom(XPtr p) {
    r = field_r.read(p);
    g = field_g.read(p);
    b = field_b.read(p);
    a = field_a.read(p);
  }

  // Base Raylib Colors
  static Color get LIGHTGRAY => .color(200, 200, 200, 255);
  static Color get GRAY => .color(130, 130, 130, 255);
  static Color get DARKGRAY => .color(80, 80, 80, 255);
  static Color get YELLOW => .color(253, 249, 0, 255);
  static Color get GOLD => .color(255, 203, 0, 255);
  static Color get ORANGE => .color(255, 161, 0, 255);
  static Color get PINK => .color(255, 109, 194, 255);
  static Color get RED => .color(230, 41, 55, 255);
  static Color get MAROON => .color(190, 33, 55, 255);
  static Color get GREEN => .color(0, 228, 48, 255);
  static Color get LIME => .color(0, 158, 47, 255);
  static Color get DARKGREEN => .color(0, 117, 44, 255);
  static Color get SKYBLUE => .color(102, 191, 255, 255);
  static Color get BLUE => .color(0, 121, 241, 255);
  static Color get DARKBLUE => .color(0, 82, 172, 255);
  static Color get PURPLE => .color(200, 122, 255, 255);
  static Color get VIOLET => .color(135, 60, 190, 255);
  static Color get DARKPURPLE => .color(112, 31, 126, 255);
  static Color get BEIGE => .color(211, 176, 131, 255);
  static Color get BROWN => .color(127, 106, 79, 255);
  static Color get DARKBROWN => .color(76, 63, 47, 255);
  static Color get WHITE => .color(255, 255, 255, 255);
  static Color get BLACK => .color(0, 0, 0, 255);
  static Color get BLANK => .color(0, 0, 0, 0);
  static Color get MAGENTA => .color(255, 0, 255, 255);
  static Color get RAYWHITE => .color(245, 245, 245, 255);
  static Color get TRANSPARENT => .color(255, 255, 255, 0);

  // Extra

  // Cyans & Teals
  static Color get CYAN => .color(0, 255, 255, 255);
  static Color get DARKCYAN => .color(0, 139, 139, 255);
  static Color get TEAL => .color(0, 128, 128, 255);
  static Color get DARKTEAL => .color(0, 80, 80, 255);
  static Color get AQUA => .color(0, 210, 210, 255);
  static Color get TURQUOISE => .color(64, 224, 208, 255);
  static Color get DARKTURQUOISE => .color(0, 148, 133, 255);
  static Color get MINTGREEN => .color(60, 255, 180, 255);
  static Color get SEAFOAM => .color(46, 194, 160, 255);

  // Reds & Pinks
  static Color get DARKRED => .color(139, 0, 0, 255);
  static Color get CRIMSON => .color(220, 20, 60, 255);
  static Color get SCARLET => .color(255, 36, 0, 255);
  static Color get ROSE => .color(255, 0, 127, 255);
  static Color get HOTPINK => .color(255, 20, 147, 255);
  static Color get SALMON => .color(250, 128, 114, 255);
  static Color get CORAL => .color(255, 127, 80, 255);
  static Color get TOMATO => .color(255, 99, 71, 255);

  // Oranges & Yellows
  static Color get DARKORANGE => .color(255, 100, 0, 255);
  static Color get AMBER => .color(255, 191, 0, 255);
  static Color get KHAKI => .color(195, 176, 93, 255);
  static Color get OLIVE => .color(107, 142, 35, 255);
  static Color get DARKOLIVE => .color(64, 90, 20, 255);
  static Color get PEACH => .color(255, 218, 185, 255);
  static Color get LEMON => .color(255, 247, 0, 255);

  // Greens
  static Color get CHARTREUSE => .color(127, 255, 0, 255);
  static Color get SPRINGGREEN => .color(0, 255, 127, 255);
  static Color get EMERALD => .color(0, 201, 87, 255);
  static Color get FOREST => .color(34, 139, 34, 255);
  static Color get DARKFOREST => .color(20, 80, 20, 255);
  static Color get SAGE => .color(100, 148, 100, 255);
  static Color get MINT => .color(189, 252, 201, 255);
  static Color get JADE => .color(0, 168, 107, 255);
  static Color get MOSS => .color(82, 118, 72, 255);

  // Blues
  static Color get NAVY => .color(0, 0, 128, 255);
  static Color get DARKNAVY => .color(0, 0, 80, 255);
  static Color get ROYALBLUE => .color(65, 105, 225, 255);
  static Color get CORNFLOWER => .color(100, 149, 237, 255);
  static Color get STEELBLUE => .color(70, 130, 180, 255);
  static Color get DODGERBLUE => .color(30, 144, 255, 255);
  static Color get MIDNIGHTBLUE => .color(25, 25, 112, 255);
  static Color get CADET => .color(95, 158, 160, 255);
  static Color get PERIWINKLE => .color(153, 153, 255, 255);
  static Color get AZURE => .color(0, 127, 255, 255);
  static Color get ICE => .color(180, 220, 255, 255);

  // Purples & Violets
  static Color get LAVENDER => .color(181, 126, 220, 255);
  static Color get DARKVIOLET => .color(90, 0, 200, 255);
  static Color get INDIGO => .color(75, 0, 130, 255);
  static Color get PLUM => .color(142, 69, 133, 255);
  static Color get ORCHID => .color(218, 112, 214, 255);
  static Color get FUCHSIA => .color(255, 0, 200, 255);
  static Color get LILAC => .color(200, 162, 200, 255);
  static Color get MAUVE => .color(153, 102, 153, 255);
  static Color get GRAPE => .color(111, 45, 168, 255);
  static Color get AMETHYST => .color(153, 102, 204, 255);

  // Neutrals & Browns
  static Color get TAN => .color(210, 180, 140, 255);
  static Color get SAND => .color(194, 178, 128, 255);
  static Color get SIENNA => .color(160, 82, 45, 255);
  static Color get CHOCOLATE => .color(210, 105, 30, 255);
  static Color get COPPER => .color(184, 115, 51, 255);
  static Color get BRONZE => .color(140, 90, 50, 255);
  static Color get GOLDENROD => .color(218, 165, 32, 255);
  static Color get IVORY => .color(255, 255, 240, 255);
  static Color get CREAM => .color(255, 253, 208, 255);
  static Color get LINEN => .color(250, 240, 230, 255);
  static Color get SNOW => .color(255, 250, 250, 255);
  static Color get OFFWHITE => .color(230, 230, 220, 255);

  // Grays
  static Color get SILVER => .color(192, 192, 192, 255);
  static Color get DIMGRAY => .color(105, 105, 105, 255);
  static Color get CHARCOAL => .color(54, 69, 79, 255);
  static Color get JET => .color(52, 52, 52, 255);
  static Color get SLATE => .color(112, 128, 144, 255);
  static Color get DARKSLATE => .color(47, 79, 79, 255);
  static Color get ASH => .color(178, 190, 181, 255);

  // Neons / UI accents
  static Color get NEONGREEN => .color(57, 255, 20, 255);
  static Color get NEONBLUE => .color(31, 81, 255, 255);
  static Color get NEONPINK => .color(255, 16, 240, 255);
  static Color get NEONYELLOW => .color(255, 255, 0, 255);
  static Color get NEONORANGE => .color(255, 103, 0, 255);
  static Color get NEONPURPLE => .color(188, 19, 254, 255);
  static Color get NEONRED => .color(255, 7, 58, 255);
  static Color get NEONCYAN => .color(0, 255, 230, 255);

  /// Sets all components at once.
  ///
  /// Values are converted using [num.toInt], truncating any fractional part.
  Color set(num r, num g, num b, num a) {
    this.r = r.toInt();
    this.g = g.toInt();
    this.b = b.toInt();
    this.a = a.toInt();
    return this;
  }

  /// Returns this color encoded as an uppercase hexadecimal RGBA string.
  ///
  /// Format: `RRGGBBAA`
  ///
  /// Example:
  /// ```dart
  /// color.toHex(); // "FF0000FF"
  /// ```
  String toHex() =>
    '${r.toRadixString(16).padLeft(2, '0').toUpperCase()}'
    '${g.toRadixString(16).padLeft(2, '0').toUpperCase()}'
    '${b.toRadixString(16).padLeft(2, '0').toUpperCase()}'
    '${a.toRadixString(16).padLeft(2, '0').toUpperCase()}';

  /// Returns the components as a new int list.
  ///
  /// Order: `[r, g, b, a]`
  List<int> toArray() => [r, g, b, a];

  /// Returns [Vector4] with each component normalized.
  Vector4 normalized() => .vec4(
    r / 255,
    g / 255,
    b / 255,
    a / 255,
  );

  @override
  String signature() => '$structName(r: $r, g: $g, b: $b, a: $a)';
}