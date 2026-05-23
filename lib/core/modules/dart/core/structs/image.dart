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
    o.structOnOriginalPointer((p) => data = p.ref.data);
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
  late Uint8List _data;
  @override get data {
    structOnOriginalPointer((p) {
      if (p.ref.data.address != 0) {
        _data = p.ref.data.cast<Uint8>().asTypedList(dataLength);
      }
    });
    return _data;
  }
  @override set data(Uint8List value) {
    _data = value;
    structOnOriginalPointer((p) {
      if (p.ref.data.address != 0) {
        p.ref.data.cast<Uint8>().asTypedList(dataLength).setAll(0, value);
      }
    });
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

  @override
  int frameCount = 1; // normal image has only 1 frame

  ImageD({
    super.originalPointer,
    Uint8List? data,
    int width = 0,
    int height = 0,
    int mipmaps = 0,
    PixelFormat format = .PIXELFORMAT_NONE,
  }) :
    _width = width,
    _height = height,
    _mipmaps = mipmaps,
    _format = format 
  {
    _data = data ?? Uint8List(dataLength);
  }

  factory ImageD.zero() => .new();

  // NOTE: for GIFs
  @override
  void structUpdateFrameCount(int frameCount) => structOnOriginalPointer((p) {
    if (this.frameCount != frameCount) {
      this.frameCount = frameCount;
      structSyncFromMemory();
    }
  });

  @override
  ImageD setD(ImageD o) {
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format;
    data.setAll(0, o.data);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<ImageC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<ImageC> p, int index) => p[index];

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
    if (p.data.address != 0) {
      assert(p.dataLength <= data.length);
      p.data.cast<Uint8>().asTypedList(dataLength).setAll(0, data);
    }
  }

  @override
  void nativeReadFrom(ImageC p) {
    structOnOriginalPointer((o) => o.ref.data = p.data);
    width = p.width;
    height = p.height;
    mipmaps = p.mipmaps;
    format = .fromValue(p.format);

    if (p.data.address != 0) data = p.data.cast<Uint8>().asTypedList(dataLength);
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