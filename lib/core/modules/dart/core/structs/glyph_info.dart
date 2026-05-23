part of '../../../../raylib_dartified.dart';

extension GlyphInfoCPEx on Pointer<GlyphInfoC> {
  Pointer<GlyphInfoC> setC(GlyphInfoC o) { ref.setC(o); return this; }
  Pointer<GlyphInfoC> setD(GlyphInfoD o) { ref.setD(o); return this; }
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

class GlyphInfoD extends StructD<GlyphInfoC, GlyphInfoD> with GlyphInfoBase<
  GlyphInfoD,
  ImageD
> {
  int _value;
  @override get value {
    structOnOriginalPointer((p) => _value = p.ref.value);
    return _value;
  }
  @override set value(int value) {
    _value = value;
    structOnOriginalPointer((p) => p.ref.value = value);
  }
  
  int _offsetX;
  @override get offsetX {
    structOnOriginalPointer((p) => _offsetX = p.ref.offsetX);
    return _offsetX;
  }
  @override set offsetX(int value) {
    _offsetX = value;
    structOnOriginalPointer((p) => p.ref.offsetX = value);
  }
  
  int _offsetY;
  @override get offsetY {
    structOnOriginalPointer((p) => _offsetY = p.ref.offsetY);
    return _offsetY;
  }
  @override set offsetY(int value) {
    _offsetY = value;
    structOnOriginalPointer((p) => p.ref.offsetY = value);
  }
  
  int _advanceX;
  @override get advanceX {
    structOnOriginalPointer((p) => _advanceX = p.ref.advanceX);
    return _advanceX;
  }
  @override set advanceX(int value) {
    _advanceX = value;
    structOnOriginalPointer((p) => p.ref.advanceX = value);
  }
  
  ImageD _image;
  @override get image {
    structOnOriginalPointer((p) => _image.nativeReadFrom(p.ref.image));
    return _image;
  }
  @override set image(ImageD value) {
    _image = value;
    structOnOriginalPointer((p) => value.nativeWriteInto(p.ref.image));
  }

  GlyphInfoD({
    super.originalPointer,
    int value = 0,
    int offsetX = 0,
    int offsetY = 0,
    int advanceX = 0,
    ImageD? image,
  }) :
    _value = value,
    _offsetX = offsetX,
    _offsetY = offsetY,
    _advanceX = advanceX,
    _image = image ?? .zero();

  factory GlyphInfoD.zero() => .new();

  @override
  GlyphInfoD setD(GlyphInfoD o) {
    value = o.value;
    offsetX = o.offsetX;
    offsetY = o.offsetY;
    advanceX = o.advanceX;
    image.setD(o.image);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<GlyphInfoC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<GlyphInfoC> p, int index) => p[index];

  @override
  void nativeWriteInto(GlyphInfoC p) {
    p.value = value;
    p.offsetX = offsetX;
    p.offsetY = offsetY;
    p.advanceX = advanceX;
    image.nativeWriteInto(p.image);
  }

  @override
  void nativeReadFrom(GlyphInfoC p) {
    value = p.value;
    offsetX = p.offsetX;
    offsetY = p.offsetY;
    advanceX = p.advanceX;
    image.nativeReadFrom(p.image);
  }

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