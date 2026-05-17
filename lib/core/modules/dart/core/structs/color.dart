part of '../../../../raylib.dart';

extension ColorCLike on ColorC {
  String format() => '{ R:$r G:$g B:$b A:$a }';
}

extension ColorDLike on ColorD {
  String format() => '{ R:$r G:$g B:$b A:$a }';
}

extension ColorCPEx on Pointer<ColorC> {
  Pointer<ColorC> setC(ColorC o) {
    ref.setC(o);
    return this;
  }

  Pointer<ColorC> setD(ColorD o) {
    ref.setD(o);
    return this;
  }
  
  Pointer<ColorC> set(num r, num g, num b, num a) {
    ref.set(r, g, b, a);
    return this;
  }

  ColorD toD() => ref.toD(this);

  String format() => ref.format();
}

extension ColorCEx on ColorC {
  ColorC setC(ColorC o) => set(o.r, o.g, o.b, o.a);
  
  ColorC setD(ColorD o) => set(o.r, o.g, o.b, o.a);
  
  ColorC set(num r, num g, num b, num a) {
    this.r = r.toInt();
    this.g = g.toInt();
    this.b = b.toInt();
    this.a = a.toInt();
    return this;
  }

  ColorD toD([Pointer<ColorC>? ptr]) => .new(
    originalPointer: ptr,
    r: r,
    g: g,
    b: b,
    a: a,
  );
}

class ColorD extends StructDLiteral<ColorC, ColorD> with ColorBase {
  @override
  int r, g, b, a;

  ColorD({
    super.originalPointer,
    this.r = 0,
    this.g = 0,
    this.b = 0,
    this.a = 0,
  });

  factory ColorD.zero() => .new();

  factory ColorD.color(
    num r,
    num g,
    num b,
    num a
  ) => ColorD(
    r: r.toInt(),
    g: g.toInt(),
    b: b.toInt(),
    a: a.toInt(),
  );

  // Base Raylib Colors
  static ColorD LIGHTGRAY = .color(200, 200, 200, 255);
  static ColorD GRAY = .color(130, 130, 130, 255);
  static ColorD DARKGRAY = .color(80, 80, 80, 255);
  static ColorD YELLOW = .color(253, 249, 0, 255);
  static ColorD GOLD = .color(255, 203, 0, 255);
  static ColorD ORANGE = .color(255, 161, 0, 255);
  static ColorD PINK = .color(255, 109, 194, 255);
  static ColorD RED = .color(230, 41, 55, 255);
  static ColorD MAROON = .color(190, 33, 55, 255);
  static ColorD GREEN = .color(0, 228, 48, 255);
  static ColorD LIME = .color(0, 158, 47, 255);
  static ColorD DARKGREEN = .color(0, 117, 44, 255);
  static ColorD SKYBLUE = .color(102, 191, 255, 255);
  static ColorD BLUE = .color(0, 121, 241, 255);
  static ColorD DARKBLUE = .color(0, 82, 172, 255);
  static ColorD PURPLE = .color(200, 122, 255, 255);
  static ColorD VIOLET = .color(135, 60, 190, 255);
  static ColorD DARKPURPLE = .color(112, 31, 126, 255);
  static ColorD BEIGE = .color(211, 176, 131, 255);
  static ColorD BROWN = .color(127, 106, 79, 255);
  static ColorD DARKBROWN = .color(76, 63, 47, 255);
  static ColorD WHITE = .color(255, 255, 255, 255);
  static ColorD BLACK = .color(0, 0, 0, 255);
  static ColorD BLANK = .color(0, 0, 0, 0);
  static ColorD MAGENTA = .color(255, 0, 255, 255);
  static ColorD RAYWHITE = .color(245, 245, 245, 255);
  static ColorD TRANSPARENT = .color(255, 255, 255, 0);

  // Extra

  // Cyans & Teals
  static ColorD CYAN = .color(0, 255, 255, 255);
  static ColorD DARKCYAN = .color(0, 139, 139, 255);
  static ColorD TEAL = .color(0, 128, 128, 255);
  static ColorD DARKTEAL = .color(0, 80, 80, 255);
  static ColorD AQUA = .color(0, 210, 210, 255);
  static ColorD TURQUOISE = .color(64, 224, 208, 255);
  static ColorD DARKTURQUOISE = .color(0, 148, 133, 255);
  static ColorD MINTGREEN = .color(60, 255, 180, 255);
  static ColorD SEAFOAM = .color(46, 194, 160, 255);

  // Reds & Pinks
  static ColorD DARKRED = .color(139, 0, 0, 255);
  static ColorD CRIMSON = .color(220, 20, 60, 255);
  static ColorD SCARLET = .color(255, 36, 0, 255);
  static ColorD ROSE = .color(255, 0, 127, 255);
  static ColorD HOTPINK = .color(255, 20, 147, 255);
  static ColorD SALMON = .color(250, 128, 114, 255);
  static ColorD CORAL = .color(255, 127, 80, 255);
  static ColorD TOMATO = .color(255, 99, 71, 255);

  // Oranges & Yellows
  static ColorD DARKORANGE = .color(255, 100, 0, 255);
  static ColorD AMBER = .color(255, 191, 0, 255);
  static ColorD KHAKI = .color(195, 176, 93, 255);
  static ColorD OLIVE = .color(107, 142, 35, 255);
  static ColorD DARKOLIVE = .color(64, 90, 20, 255);
  static ColorD PEACH = .color(255, 218, 185, 255);
  static ColorD LEMON = .color(255, 247, 0, 255);

  // Greens
  static ColorD CHARTREUSE = .color(127, 255, 0, 255);
  static ColorD SPRINGGREEN = .color(0, 255, 127, 255);
  static ColorD EMERALD = .color(0, 201, 87, 255);
  static ColorD FOREST = .color(34, 139, 34, 255);
  static ColorD DARKFOREST = .color(20, 80, 20, 255);
  static ColorD SAGE = .color(100, 148, 100, 255);
  static ColorD MINT = .color(189, 252, 201, 255);
  static ColorD JADE = .color(0, 168, 107, 255);
  static ColorD MOSS = .color(82, 118, 72, 255);

  // Blues
  static ColorD NAVY = .color(0, 0, 128, 255);
  static ColorD DARKNAVY = .color(0, 0, 80, 255);
  static ColorD ROYALBLUE = .color(65, 105, 225, 255);
  static ColorD CORNFLOWER = .color(100, 149, 237, 255);
  static ColorD STEELBLUE = .color(70, 130, 180, 255);
  static ColorD DODGERBLUE = .color(30, 144, 255, 255);
  static ColorD MIDNIGHTBLUE = .color(25, 25, 112, 255);
  static ColorD CADET = .color(95, 158, 160, 255);
  static ColorD PERIWINKLE = .color(153, 153, 255, 255);
  static ColorD AZURE = .color(0, 127, 255, 255);
  static ColorD ICE = .color(180, 220, 255, 255);

  // Purples & Violets
  static ColorD LAVENDER = .color(181, 126, 220, 255);
  static ColorD DARKVIOLET = .color(90, 0, 200, 255);
  static ColorD INDIGO = .color(75, 0, 130, 255);
  static ColorD PLUM = .color(142, 69, 133, 255);
  static ColorD ORCHID = .color(218, 112, 214, 255);
  static ColorD FUCHSIA = .color(255, 0, 200, 255);
  static ColorD LILAC = .color(200, 162, 200, 255);
  static ColorD MAUVE = .color(153, 102, 153, 255);
  static ColorD GRAPE = .color(111, 45, 168, 255);
  static ColorD AMETHYST = .color(153, 102, 204, 255);

  // Neutrals & Browns
  static ColorD TAN = .color(210, 180, 140, 255);
  static ColorD SAND = .color(194, 178, 128, 255);
  static ColorD SIENNA = .color(160, 82, 45, 255);
  static ColorD CHOCOLATE = .color(210, 105, 30, 255);
  static ColorD COPPER = .color(184, 115, 51, 255);
  static ColorD BRONZE = .color(140, 90, 50, 255);
  static ColorD GOLDENROD = .color(218, 165, 32, 255);
  static ColorD IVORY = .color(255, 255, 240, 255);
  static ColorD CREAM = .color(255, 253, 208, 255);
  static ColorD LINEN = .color(250, 240, 230, 255);
  static ColorD SNOW = .color(255, 250, 250, 255);
  static ColorD OFFWHITE = .color(230, 230, 220, 255);

  // Grays
  static ColorD SILVER = .color(192, 192, 192, 255);
  static ColorD DIMGRAY = .color(105, 105, 105, 255);
  static ColorD CHARCOAL = .color(54, 69, 79, 255);
  static ColorD JET = .color(52, 52, 52, 255);
  static ColorD SLATE = .color(112, 128, 144, 255);
  static ColorD DARKSLATE = .color(47, 79, 79, 255);
  static ColorD ASH = .color(178, 190, 181, 255);

  // Neons / UI accents
  static ColorD NEONGREEN = .color(57, 255, 20, 255);
  static ColorD NEONBLUE = .color(31, 81, 255, 255);
  static ColorD NEONPINK = .color(255, 16, 240, 255);
  static ColorD NEONYELLOW = .color(255, 255, 0, 255);
  static ColorD NEONORANGE = .color(255, 103, 0, 255);
  static ColorD NEONPURPLE = .color(188, 19, 254, 255);
  static ColorD NEONRED = .color(255, 7, 58, 255);
  static ColorD NEONCYAN = .color(0, 255, 230, 255);

  @override
  ColorD setC(ColorC o) => set(o.r, o.g, o.b, o.a);
  
  @override
  ColorD setD(ColorD o) {
    originalPointer ??= o.originalPointer;
    return set(o.r, o.g, o.b, o.a);
  }
  
  ColorD set(num r, num g, num b, num a) {
    this.r = r.toInt();
    this.g = g.toInt();
    this.b = b.toInt();
    this.a = a.toInt();
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.Color$;

  @override
  void nativeWriteInto(ColorC p) {
    p.r = r;
    p.g = g;
    p.b = b;
    p.a = a;
  }

  List<int> toArray() => [r, g, b, a];

  @override
  String signature() => '$structName(r: $r, g: $g, b: $b, a: $a)';

  @override
  ColorD clone() => .new(
    originalPointer: originalPointer,
    r: r,
    g: g,
    b: b,
    a: a,
  );
}