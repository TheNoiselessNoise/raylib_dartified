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
  @override
  int id;
  
  @override
  int width;
  
  @override
  int height;
  
  @override
  int mipmaps;
  
  @override
  PixelFormat format;

  TextureD({
    super.originalPointer,
    this.id = 0,
    this.width = 0,
    this.height = 0,
    this.mipmaps = 0,
    this.format = .PIXELFORMAT_NONE,
  });

  factory TextureD.zero() => .new();

  @override
  TextureD setC(TextureC o) {
    id = o.id;
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = .fromValue(o.format);
    return this;
  }

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
  getReference(Pointer<TextureC> p) => p.ref;

  @override
  void nativeWriteInto(TextureC p) {
    p.id = id;
    p.width = width;
    p.height = height;
    p.mipmaps = mipmaps;
    p.format = format.value;
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