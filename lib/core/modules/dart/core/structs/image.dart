part of '../../../../raylib.dart';

extension ImageCLike on ImageC {
  int get bytesPerPixel => switch (PixelFormat.fromValue(format)) {
    .PIXELFORMAT_NONE => 0,
    .PIXELFORMAT_UNCOMPRESSED_GRAYSCALE => 1,
    .PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA => 2,
    .PIXELFORMAT_UNCOMPRESSED_R5G6B5 => 2,
    .PIXELFORMAT_UNCOMPRESSED_R8G8B8 => 3,
    .PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 => 4,
    .PIXELFORMAT_UNCOMPRESSED_R32 => 4,
    .PIXELFORMAT_UNCOMPRESSED_R32G32B32 => 12,
    .PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 => 16,
    .PIXELFORMAT_UNCOMPRESSED_R16 => 2,
    .PIXELFORMAT_UNCOMPRESSED_R16G16B16 => 6,
    .PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 => 8,
    _ => throw UnsupportedError('Compressed formats have no simple bpp: $format'),
  };

  // NOTE: assuming normal image (not a GIF)
  int get frameCount => 1;

  int get dataLength {
    final frameSize = this.frameSize;
    if (frameSize == 0) return 0;
    return frameSize * frameCount;
  }

  int get frameSize {
    if (width == 0 || height == 0) return 0;
    return width * height * bytesPerPixel;
  }
}

extension ImageCPEx on Pointer<ImageC> {
  Pointer<ImageC> setC(ImageC o) {
    ref.setC(o);
    return this;
  }
  
  Pointer<ImageC> setD(ImageD o) {
    ref.setD(o);
    return this;
  }

  ImageD toD() => ref.toD(this);
}

extension ImageCEx on ImageC {
  ImageC setC(ImageC o) {
    data = o.data;
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format;
    return this;
  }

  ImageC setD(ImageD o) {
    o.structOnOriginalPointer((p) {
      data = p.ref.data;
    });
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format.value;
    return this;
  }

  ImageD toD([Pointer<ImageC>? ptr]) => .new(
    originalPointer: ptr,
    data: data.cast<Uint8>().asTypedList(ptr?.ref.dataLength ?? dataLength).toList(),
    width: width,
    height: height,
    mipmaps: mipmaps,
    format: .fromValue(ptr?.ref.format ?? format),
  );
}

class ImageD extends StructD<ImageC, ImageD> with ImageBase {
  @override
  int width;

  @override
  int height;

  @override
  int mipmaps;

  @override
  PixelFormat format;

  @override
  List<int> data;

  @override
  int frameCount = 1; // normal image has only 1 frame

  ImageD({
    super.originalPointer,
    this.width = 0,
    this.height = 0,
    this.mipmaps = 0,
    this.format = .PIXELFORMAT_NONE,
    List<int>? data,
  }) :
    data = data ?? [];

  factory ImageD.zero() => .new();

  // NOTE: for GIFs
  void nativeUpdateFrameCount(int frameCount) => structOnOriginalPointer((p) {
    if (this.frameCount != frameCount) {
      this.frameCount = frameCount;
      data = p.ref.data.address != 0 ?
        p.ref.data.cast<Uint8>().asTypedList(frameSize * frameCount).toList() :
        [];
    }
  });

  @override
  ImageD setC(ImageC o) {
    structOnOriginalPointer((p) {
      p.ref.data = o.data;
      p.ref.format = o.format;
    });
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = .fromValue(o.format);
    data = o.data.address != 0 ? o.data.cast<Uint8>().asTypedList(frameSize * frameCount).toList() : [];
    return this;
  }

  @override
  ImageD setD(ImageD o) {
    originalPointer ??= o.originalPointer;
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format;
    data = .from(o.data);
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.Image$;

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<ImageC> p, String key) {
    p.ref.data = temp.Uint8$.RawArray(data).cast();
  }

  @override
  void nativeWriteInto(ImageC p) {
    p.width = width;
    p.height = height;
    p.mipmaps = mipmaps;
    p.format = format.value;
    if (p.data.address != 0 && data.isNotEmpty) {
      assert(p.dataLength <= data.length);
      for (int i = 0; i < p.dataLength; i++) {
        p.data.cast<Uint8>()[i] = data[i];
      }
    }
  }

  @override
  String signature() => '$structName(data: ${data.length}, width: $width, height: $height, mipmaps: $mipmaps, format: ${format.name})';

  @override
  ImageD clone() => .new(
    originalPointer: originalPointer,
    width: width,
    height: height,
    mipmaps: mipmaps,
    format: format,
    data: .from(data),
  );
}