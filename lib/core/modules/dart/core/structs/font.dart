part of '../../../../raylib.dart';

extension FontCPEx on Pointer<FontC> {
  Pointer<FontC> setC(FontC o) {
    ref.setC(o);
    return this;
  }
  
  Pointer<FontC> setD(FontD o) {
    ref.setD(o);
    return this;
  }

  FontD toD() => ref.toD(this);
}

extension FontCEx on FontC {
  FontC setC(FontC o) {
    baseSize = o.baseSize;
    glyphCount = o.glyphCount;
    glyphPadding = o.glyphPadding;
    texture.setC(o.texture);
    recs = o.recs;
    glyphs = o.glyphs;
    return this;
  }

  FontC setD(FontD o) {
    baseSize = o.baseSize;
    glyphCount = o.glyphCount;
    glyphPadding = o.glyphPadding;
    o.onOriginalPointer((p) {
      texture = p.ref.texture;
      recs = p.ref.recs;
      glyphs = p.ref.glyphs;
    });
    return this;
  }

  FontD toD([Pointer<FontC>? ptr]) => .new(
    originalPointer: ptr,
    baseSize: baseSize,
    glyphCount: glyphCount,
    glyphPadding: glyphPadding,
    texture: texture.toD(),
    recs: .generate(glyphCount, (i) => recs[i].toD()),
    glyphs: .generate(glyphCount, (i) => glyphs[i].toD()),
  );
}

class FontD extends StructD<FontD, FontC> {
  int baseSize;
  int glyphCount;
  int glyphPadding;
  TextureD texture;
  List<RectangleD> recs;
  List<GlyphInfoD> glyphs;

  FontD({
    super.originalPointer,
    this.baseSize = 0,
    this.glyphCount = 0,
    this.glyphPadding = 0,
    TextureD? texture,
    List<RectangleD>? recs,
    List<GlyphInfoD>? glyphs,
  }) :
    texture = texture ?? .new(),
    recs = recs ?? [],
    glyphs = glyphs ?? [];

  factory FontD.zero() => .new();

  @override
  FontD setC(FontC o) {
    onOriginalPointer((p) {
      p.ref.recs = o.recs;
      p.ref.glyphs = o.glyphs;
    });
    baseSize = o.baseSize;
    glyphCount = o.glyphCount;
    glyphPadding = o.glyphPadding;
    texture.setC(o.texture);
    recs = .generate(o.glyphCount, (i) => o.recs[i].toD());
    glyphs = .generate(o.glyphCount, (i) => o.glyphs[i].toD());
    return this;
  }

  @override
  FontD setD(FontD o) {
    originalPointer ??= o.originalPointer;
    baseSize = o.baseSize;
    glyphCount = o.glyphCount;
    glyphPadding = o.glyphPadding;
    texture.setD(o.texture);
    recs = .generate(o.glyphCount, (i) => o.recs[i]);
    glyphs = .generate(o.glyphCount, (i) => o.glyphs[i]);
    return this;
  }

  @override
  Pointer<FontC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.Font$.At(key, count);

  @override
  void syncInto(RaylibTemp temp, Pointer<FontC> p, String key)
    => writeInto(p.ref);

  @override
  void allocateInto(RaylibTemp temp, Pointer<FontC> p, String key) {
    p.ref.baseSize = baseSize;
    p.ref.glyphCount = glyphCount;
    p.ref.glyphPadding = glyphPadding;
    p.ref.texture.setD(texture);

    p.ref.recs = temp.Rectangle$.RawArray(recs);
    
    p.ref.glyphs = temp.GlyphInfo$.RawFillInto(glyphs.length, (i, g) {
      g.value = glyphs[i].value;
      g.offsetX = glyphs[i].offsetX;
      g.offsetY = glyphs[i].offsetY;
      g.advanceX = glyphs[i].advanceX;
      g.image.setD(glyphs[i].image);
    });
  }

  @override
  void writeInto(FontC p) {
    p.baseSize = baseSize;
    p.glyphCount = glyphCount;
    p.glyphPadding = glyphPadding;
    texture.writeInto(p.texture);

    for (int i = 0; i < recs.length; i++) {
      recs[i].writeInto((p.recs + i).ref);
    }
    
    for (int i = 0; i < glyphs.length; i++) {
      glyphs[i].writeInto((p.glyphs + i).ref);
    }
  }

  @override
  String signature() => '$structName(baseSize: $baseSize, glyphCount: $glyphCount, glyphPadding: $glyphPadding, texture: $texture, recs: ${recs.length}, glyphs: ${glyphs.length})';

  @override
  FontD clone() => .new(
    originalPointer: originalPointer,
    baseSize: baseSize,
    glyphCount: glyphCount,
    glyphPadding: glyphPadding,
    texture: texture.clone(),
    recs: recs.map((x) => x.clone()).toList(),
    glyphs: glyphs.map((x) => x.clone()).toList(),
  );
}