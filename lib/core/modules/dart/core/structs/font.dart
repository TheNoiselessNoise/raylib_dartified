part of '../../../../raylib_dartified.dart';

extension FontCPEx on Pointer<FontC> {
  Pointer<FontC> setC(FontC o) { ref.setC(o); return this; }
  Pointer<FontC> setD(FontD o) { ref.setD(o); return this; }
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
    o.structOnOriginalPointer((p) {
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

class FontD extends StructD<FontC, FontD> with FontBase<
  FontD,
  TextureD,
  RectangleD,
  GlyphInfoD,
  ImageD
> {
  @override
  int baseSize;
  
  @override
  int glyphCount;
  
  @override
  int glyphPadding;
  
  @override
  TextureD texture;
  
  @override
  List<RectangleD> recs;
  
  @override
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
    structOnOriginalPointer((p) {
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
    baseSize = o.baseSize;
    glyphCount = o.glyphCount;
    glyphPadding = o.glyphPadding;
    texture.setD(o.texture);
    recs = .generate(o.glyphCount, (i) => o.recs[i]);
    glyphs = .generate(o.glyphCount, (i) => o.glyphs[i]);
    return this;
  }

  @override
  getReference(Pointer<FontC> p) => p.ref;

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<FontC> p, String key) {
    p.ref.recs = temp.Rectangle$.RawArray(recs);
    p.ref.glyphs = temp.GlyphInfo$.RawArray(glyphs);
  }

  @override
  void nativeWriteInto(FontC p) {
    p.baseSize = baseSize;
    p.glyphCount = glyphCount;
    p.glyphPadding = glyphPadding;
    texture.nativeWriteInto(p.texture);

    for (int i = 0; i < recs.length; i++) {
      recs[i].nativeWriteInto((p.recs + i).ref);
    }
    
    for (int i = 0; i < glyphs.length; i++) {
      glyphs[i].nativeWriteInto((p.glyphs + i).ref);
    }
  }

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