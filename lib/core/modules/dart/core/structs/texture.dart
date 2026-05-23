part of '../../../../raylib_dartified.dart';

extension TextureCPEx on Pointer<TextureC> {
  Pointer<TextureC> setC(TextureC o) { ref.setC(o); return this; }
  Pointer<TextureC> setD(TextureD o) { ref.setD(o); return this; }
  TextureD toD() => ref.toD(this);
}

extension TextureCEx on TextureC {
  TextureC setC(TextureC o) {
    id = o.id;
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format;
    return this;
  }

  TextureC setD(TextureD o) {
    id = o.id;
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format.value;
    return this;
  }

  TextureD toD([Pointer<TextureC>? ptr]) => .new(
    originalPointer: ptr,
    id: id,
    width: width,
    height: height,
    mipmaps: mipmaps,
    format: .fromValue(format),
  );
}

class TextureD extends StructD<TextureC, TextureD> with TextureBase<TextureD> {
  int _id;
  @override get id {
    structOnOriginalPointer((p) => _id = p.ref.id);
    return _id;
  }
  @override set id(int value) {
    _id = value;
    structOnOriginalPointer((p) => p.ref.id = value);
  }
  
  int _width;
  @override get width {
    structOnOriginalPointer((p) => _width = p.ref.width);
    return _width;
  }
  @override set width(int value) {
    _width = value;
    structOnOriginalPointer((p) => p.ref.width = value);
  }
  
  int _height;
  @override get height {
    structOnOriginalPointer((p) => _height = p.ref.height);
    return _height;
  }
  @override set height(int value) {
    _height = value;
    structOnOriginalPointer((p) => p.ref.height = value);
  }
  
  int _mipmaps;
  @override get mipmaps {
    structOnOriginalPointer((p) => _mipmaps = p.ref.mipmaps);
    return _mipmaps;
  }
  @override set mipmaps(int value) {
    _mipmaps = value;
    structOnOriginalPointer((p) => p.ref.mipmaps = value);
  }
  
  PixelFormat _format;
  @override get format {
    structOnOriginalPointer((p) => _format = .fromValue(p.ref.format));
    return _format;
  }
  @override set format(PixelFormat value) {
    _format = value;
    structOnOriginalPointer((p) => p.ref.format = value.value);
  }

  TextureD({
    super.originalPointer,
    int id = 0,
    int width = 0,
    int height = 0,
    int mipmaps = 0,
    PixelFormat format = .PIXELFORMAT_NONE,
  }) :
    _id = id,
    _width = width,
    _height = height,
    _mipmaps = mipmaps,
    _format = format;

  factory TextureD.zero() => .new();

  @override
  TextureD setD(TextureD o) {
    id = o.id;
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format;
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<TextureC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<TextureC> p, int index) => p[index];

  @override
  void nativeWriteInto(TextureC p) {
    p.id = id;
    p.width = width;
    p.height = height;
    p.mipmaps = mipmaps;
    p.format = format.value;
  }

  @override
  void nativeReadFrom(TextureC p) {
    id = p.id;
    width = p.width;
    height = p.height;
    mipmaps = p.mipmaps;
    format = .fromValue(p.format);
  }

  @override
  TextureD clone() => .new(
    originalPointer: originalPointer,
    id: id,
    width: width,
    height: height,
    mipmaps: mipmaps,
    format: format,
  );
}