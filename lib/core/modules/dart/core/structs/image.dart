part of '../../../../raylib_dartified.dart';

extension ImageCPEx on Pointer<ImageC> {
  Pointer<ImageC> setC(ImageC o) { ref.setC(o); return this; }
  Pointer<ImageC> setD(ImageD o) { ref.setD(o); return this; }
  ImageD toD() => ref.toD(this);
}

extension ImageCEx on ImageC {
  int get bytesPerPixel => ImageBase.BASE_bytesPerPixel(.fromValue(format));
  // NOTE: 1 frame (which is wrong, but we can't do anything about that)
  int get dataLength => ImageBase.BASE_dataLength(frameSize, 1);
  int get frameSize => ImageBase.BASE_frameSize(width, height, .fromValue(format));

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
    data: .fromList(data.cast<Uint8>().asTypedList(ptr?.ref.dataLength ?? dataLength)),
    width: width,
    height: height,
    mipmaps: mipmaps,
    format: .fromValue(ptr?.ref.format ?? format),
  );
}

class ImageD extends StructD<ImageC, ImageD> with ImageBase<ImageD> {
  @override
  int width;

  @override
  int height;

  @override
  int mipmaps;

  @override
  PixelFormat format;

  @override
  late Uint8List data;

  @override
  int frameCount = 1; // normal image has only 1 frame

  ImageD({
    super.originalPointer,
    this.width = 0,
    this.height = 0,
    this.mipmaps = 0,
    this.format = .PIXELFORMAT_NONE,
    Uint8List? data,
  }) {
    this.data = data ?? Uint8List(dataLength);
  }

  factory ImageD.zero() => .new();

  // NOTE: for GIFs
  @override
  void structUpdateFrameCount(int frameCount) => structOnOriginalPointer((p) {
    if (this.frameCount != frameCount) {
      this.frameCount = frameCount;
      data = p.ref.data.address != 0 ?
        .fromList(p.ref.data.cast<Uint8>().asTypedList(dataLength)) :
        Uint8List(dataLength);
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
    data = o.data.address != 0 ?
      .fromList(o.data.cast<Uint8>().asTypedList(dataLength)) :
      Uint8List(dataLength);
    return this;
  }

  @override
  ImageD setD(ImageD o) {
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format;
    data = .fromList(o.data);
    return this;
  }

  @override
  getReference(Pointer<ImageC> p) => p.ref;

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
  ImageD clone() => .new(
    originalPointer: originalPointer,
    width: width,
    height: height,
    mipmaps: mipmaps,
    format: format,
    data: .fromList(data),
  );
}