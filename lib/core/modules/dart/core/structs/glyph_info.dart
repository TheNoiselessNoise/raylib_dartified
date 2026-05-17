part of '../../../../raylib.dart';

extension GlyphInfoCPEx on Pointer<GlyphInfoC> {
  Pointer<GlyphInfoC> setC(GlyphInfoC o) {
    ref.setC(o);
    return this;
  }
  
  Pointer<GlyphInfoC> setD(GlyphInfoD o) {
    ref.setD(o);
    return this;
  }

  GlyphInfoD toD() => ref.toD(this);
}

extension GlyphInfoCEx on GlyphInfoC {
  GlyphInfoC setC(GlyphInfoC o) {
    value = o.value;
    offsetX = o.offsetX;
    offsetY = o.offsetY;
    advanceX = o.advanceX;
    image.setC(o.image);
    return this;
  }

  GlyphInfoC setD(GlyphInfoD o) {
    value = o.value;
    offsetX = o.offsetX;
    offsetY = o.offsetY;
    advanceX = o.advanceX;
    image.setD(o.image);
    return this;
  }

  GlyphInfoD toD([Pointer<GlyphInfoC>? ptr]) => .new(
    originalPointer: ptr,
    value: value,
    offsetX: offsetX,
    offsetY: offsetY,
    advanceX: advanceX,
    image: image.toD(),
  );
}

class GlyphInfoD extends StructD<GlyphInfoC, GlyphInfoD> with GlyphInfoBase {
  @override
  int value;
  
  @override
  int offsetX;
  
  @override
  int offsetY;
  
  @override
  int advanceX;
  
  @override
  ImageD image;

  GlyphInfoD({
    super.originalPointer,
    this.value = 0,
    this.offsetX = 0,
    this.offsetY = 0,
    this.advanceX = 0,
    ImageD? image,
  }) :
    image = image ?? .zero();

  factory GlyphInfoD.zero() => .new();

  @override
  GlyphInfoD setC(GlyphInfoC o) {
    value = o.value;
    offsetX = o.offsetX;
    offsetY = o.offsetY;
    advanceX = o.advanceX;
    image.setC(o.image);
    return this;
  }

  @override
  GlyphInfoD setD(GlyphInfoD o) {
    originalPointer ??= o.originalPointer;
    value = o.value;
    offsetX = o.offsetX;
    offsetY = o.offsetY;
    advanceX = o.advanceX;
    image.setD(o.image);
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.GlyphInfo$;

  @override
  void nativeWriteInto(GlyphInfoC p) {
    p.value = value;
    p.offsetX = offsetX;
    p.offsetY = offsetY;
    p.advanceX = advanceX;
    image.nativeWriteInto(p.image);
  }

  @override
  String signature() => '$structName(value: $value, offsetX: $offsetX, offsetY: $offsetY, advanceX: $advanceX, image: $image)';

  @override
  GlyphInfoD clone() => .new(
    originalPointer: originalPointer,
    value: value,
    offsetX: offsetX,
    offsetY: offsetY,
    advanceX: advanceX,
    image: image.clone(),
  );
}