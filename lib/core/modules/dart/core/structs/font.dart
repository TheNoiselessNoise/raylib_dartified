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
    o.structOnOp((p) {
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
    recs: .generate(glyphCount, (i) => (recs + i).toD()),
    glyphs: .generate(glyphCount, (i) => (glyphs + i).toD()),
  );
}

class FontD extends StructD<FontC, FontD> with FontBase<
  FontD,
  TextureD,
  RectangleD,
  GlyphInfoD,
  ImageD
> {
  int _baseSize;
  @override get baseSize {
    structOnOp((p) => _baseSize = p.ref.baseSize);
    return _baseSize;
  }
  @override set baseSize(int value) {
    _baseSize = value;
    structOnOp((p) => p.ref.baseSize = value);
  }
  
  int _glyphCount;
  @override get glyphCount {
    structOnOp((p) => _glyphCount = p.ref.glyphCount);
    return _glyphCount;
  }
  @override set glyphCount(int value) {
    _glyphCount = value;
    structOnOp((p) => p.ref.glyphCount = value);
  }
  
  int _glyphPadding;
  @override get glyphPadding {
    structOnOp((p) => _glyphPadding = p.ref.glyphPadding);
    return _glyphPadding;
  }
  @override set glyphPadding(int value) {
    _glyphPadding = value;
    structOnOp((p) => p.ref.glyphPadding = value);
  }
  
  TextureD _texture;
  @override get texture {
    structOnOp((p) => _texture.nativeReadFrom(p.ref.texture));
    return _texture;
  }
  @override set texture(TextureD value) {
    _texture = value;
    structOnOp((p) => value.nativeWriteInto(p.ref.texture));
  }
  
  late NativeLiveListPointerStruct<RectangleC, RectangleD> _recs;
  @override get recs {
    structOnOp((p) => _recs.ptr = p.ref.recs);
    return _recs;
  }
  @override set recs(List<RectangleD> value) {
    assert(value.length <= glyphCount);
    structOnOp((p) => _recs.ptr = p.ref.recs);
    _recs.inner = value;
  }
  
  late NativeLiveListPointerStruct<GlyphInfoC, GlyphInfoD> _glyphs;
  @override get glyphs {
    structOnOp((p) => _glyphs.ptr = p.ref.glyphs);
    return _glyphs;
  }
  @override set glyphs(List<GlyphInfoD> value) {
    assert(value.length <= glyphCount);
    structOnOp((p) => _glyphs.ptr = p.ref.glyphs);
    _glyphs.inner = value;
  }

  FontD({
    super.originalPointer,
    int baseSize = 0,
    int glyphCount = 0,
    int glyphPadding = 0,
    TextureD? texture,
    List<RectangleD>? recs,
    List<GlyphInfoD>? glyphs,
  }) :
    _baseSize = baseSize,
    _glyphCount = glyphCount,
    _glyphPadding = glyphPadding,
    _texture = texture ?? .new()
  {
    _recs = .new(recs ?? [], originalPointer?.ref.recs);
    _glyphs = .new(glyphs ?? [], originalPointer?.ref.glyphs);
  }

  factory FontD.zero() => .new();

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
  nativeGetIndexedReference(Pointer<FontC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<FontC> p, int index) => p[index];

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

    if (p.recs.address != 0) {
      for (int i = 0; i < recs.length; i++) {
        _recs.inner[i].nativeWriteInto((p.recs + i).ref);
      }
    }
    
    if (p.glyphs.address != 0) {
      for (int i = 0; i < glyphs.length; i++) {
        _glyphs.inner[i].nativeWriteInto((p.glyphs + i).ref);
      }
    }
  }

  @override
  void nativeReadFrom(FontC p) {
    structOnOp((o) {
      o.ref.recs = p.recs;
      o.ref.glyphs = p.glyphs;
    });
    baseSize = p.baseSize;
    glyphCount = p.glyphCount;
    glyphPadding = p.glyphPadding;
    texture.nativeReadFrom(p.texture);

    if (p.recs.address != 0) recs = .generate(p.glyphCount, (i) => (p.recs + i).toD());
    if (p.glyphs.address != 0) glyphs = .generate(p.glyphCount, (i) => (p.glyphs + i).toD());
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