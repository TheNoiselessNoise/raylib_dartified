part of '../../../../raylib.dart';

extension TextureCPEx on Pointer<TextureC> {
  Pointer<TextureC> setC(TextureC o) {
    ref.setC(o);
    return this;
  }

  Pointer<TextureC> setD(TextureD o) {
    ref.setD(o);
    return this;
  }

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

class TextureD extends StructDLiteral<TextureD, TextureC> {
  int id;
  int width;
  int height;
  int mipmaps;
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
    originalPointer ??= o.originalPointer;
    id = o.id;
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format;
    return this;
  }

  @override
  Pointer<TextureC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.Texture$.At('${key}_$id', count);

  @override
  void allocateInto(RaylibTemp temp, Pointer<TextureC> p, String key)
    => writeInto(p.ref);

  @override
  void writeInto(TextureC p) {
    p.id = id;
    p.width = width;
    p.height = height;
    p.mipmaps = mipmaps;
    p.format = format.value;
  }

  @override
  String signature() => '$structName(id: $id, width: $width, height: $height, mipmaps: $mipmaps, format: ${format.name})';

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