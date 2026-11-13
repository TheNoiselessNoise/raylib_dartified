part of '../../../raylib_dartified_base.dart';

enum FontField with XFields {
  baseSize,
  glyphCount,
  glyphPadding,
  texture,
  recs,
  glyphs,
}

/// Font, font texture and GlyphInfo array data
class Font extends XStruct<Font> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<Font> struct = .create(
    factory: Font.new,
    layout: .aligned<FontField>({
      .baseSize:     XInt(), // Base size (default chars height)
      .glyphCount:   XInt(), // Number of glyph characters
      .glyphPadding: XInt(), // Padding around the glyph characters
      .texture:      XRawStruct(Texture.struct), // Texture atlas containing the glyphs
      .recs:         XRawPtr(XRawStruct(Rectangle.struct)), // Rectangles in texture for the glyphs
      .glyphs:       XRawPtr(XRawStruct(GlyphInfo.struct)), // Glyphs info data
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<FontField> _l = struct.layoutOf();

  /// Field descriptor for [baseSize].
  static final field_baseSize = _l.integer<XInt>(.baseSize);
  /// Field descriptor for [glyphCount].
  static final field_glyphCount = _l.integer<XInt>(.glyphCount);
  /// Field descriptor for [glyphPadding].
  static final field_glyphPadding = _l.integer<XInt>(.glyphPadding);
  /// Field descriptor for [texture].
  static final field_texture = _l.struct<Texture>(.texture);
  /// Field descriptor for [recs].
  static final field_recs = _l.ptrStructArray<Rectangle>(.recs);
  /// Field descriptor for [glyphs].
  static final field_glyphs = _l.ptrStructArray<GlyphInfo>(.glyphs);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _baseSize;
  /// Base size (default chars height)
  int get baseSize => _baseSize = field_baseSize.readOr(op, _baseSize);
  set baseSize(int value) => _baseSize = field_baseSize.writeOr(op, value);

  int _glyphCount;
  /// Number of glyph characters
  int get glyphCount => _glyphCount = field_glyphCount.readOr(op, _glyphCount);
  set glyphCount(int value) => _glyphCount = field_glyphCount.writeOr(op, value);

  int _glyphPadding;
  /// Padding around the glyph characters
  int get glyphPadding => _glyphPadding = field_glyphPadding.readOr(op, _glyphPadding);
  set glyphPadding(int value) => _glyphPadding = field_glyphPadding.writeOr(op, value);

  Texture _texture;
  /// Texture atlas containing the glyphs
  Texture get texture => _texture = field_texture.readOr(op, _texture);
  set texture(Texture value) => _texture = field_texture.writeOr(op, value);

  late final StructLiveListStruct<Rectangle> _recs;
  /// Rectangles in texture for the glyphs
  StructLiveListStruct<Rectangle> get recs => _recs;
  set recs(List<Rectangle> value) => _recs.inner = value;

  late final StructLiveListStruct<GlyphInfo> _glyphs;
  /// Glyphs info data
  StructLiveListStruct<GlyphInfo> get glyphs => _glyphs;
  set glyphs(List<GlyphInfo> value) => _glyphs.inner = value;

  Font({
    super.op,
    int baseSize = 0,
    int glyphCount = 0,
    int glyphPadding = 0,
    Texture? texture,
    List<Rectangle>? recs,
    List<GlyphInfo>? glyphs,
  }) :
    _baseSize = baseSize,
    _glyphCount = glyphCount,
    _glyphPadding = glyphPadding,
    _texture = texture ?? .new()
  {
    _recs = field_recs.live(() => op, recs ?? []);
    _glyphs = field_glyphs.live(() => op, glyphs ?? []);
  }

  factory Font.zero() => .new();

  @override
  Font setDart(Font o) {
    baseSize = o.baseSize;
    glyphCount = o.glyphCount;
    glyphPadding = o.glyphPadding;
    texture.setDart(o.texture);
    recs = o.recs;
    glyphs = o.glyphs;
    return this;
  }

  @override
  void structAllocateInto(XPtr p, String key) {
    if (recs.inner.isNotEmpty) {
      field_recs.allocate(p, '${key}_recs', count: recs.inner.length, raw: true);
    }
    if (glyphs.inner.isNotEmpty) {
      field_glyphs.allocate(p, '${key}_glyphs', count: glyphs.inner.length, raw: true);
    }
  }

  @override
  void structWriteInto(XPtr p) {
    field_baseSize.write(p, baseSize);
    field_glyphCount.write(p, glyphCount);
    field_glyphPadding.write(p, glyphPadding);
    field_texture.write(p, texture);
    recs.writeInto(p);
    glyphs.writeInto(p);
  }

  @override
  void structReadFrom(XPtr p) {
    baseSize = field_baseSize.read(p);
    glyphCount = field_glyphCount.read(p);
    glyphPadding = field_glyphPadding.read(p);
    texture = field_texture.read(p);
    recs.readFrom(p, count: glyphCount);
    glyphs.readFrom(p, count: glyphCount);
  }

  @override
  String signature() => '$structName(baseSize: $baseSize, glyphCount: $glyphCount, glyphPadding: $glyphPadding, texture: $texture, recs: ${recs.length}, glyphs: ${glyphs.length})';
}