part of '../../../raylib_dartified.dart';

enum ImageField with XFields {
  data,
  width,
  height,
  mipmaps,
  format,
}

/// Image, pixel data stored in CPU memory (RAM)
final class Image extends XStruct<Image> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Image> struct = .create(
    factory: Image.new,
    layout: .aligned<ImageField>({
      .data:    XPtrType(XVoid()), // Image raw data
      .width:   XInt(), // Image base width
      .height:  XInt(), // Image base height
      .mipmaps: XInt(), // Mipmap levels, 1 by default
      .format:  XInt(), // Data format (PixelFormat type)
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<ImageField> _l = struct.layoutOf();

  /// Field descriptor for [data].
  static final field_data = _l.ptrUnknown<XVoid>(.data);
  /// Field descriptor for [width].
  static final field_width = _l.integer<XInt>(.width);
  /// Field descriptor for [height].
  static final field_height = _l.integer<XInt>(.height);
  /// Field descriptor for [mipmaps].
  static final field_mipmaps = _l.integer<XInt>(.mipmaps);
  /// Field descriptor for [format].
  static final field_format = _l.enumValue(.format, PixelFormat.fromValue);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Returns the number of bytes per pixel for the given [format].
  ///
  /// Throws a [StateError] if [format] is [PixelFormat.PIXELFORMAT_NONE],
  /// and an [UnsupportedError] for compressed formats which have no fixed
  /// bytes-per-pixel value.
  static int BASE_bytesPerPixel(PixelFormat format) => switch (format) {
    .PIXELFORMAT_NONE => throw StateError('Cannot compute bytes per pixel for PIXELFORMAT_NONE'),
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

  /// Returns the total byte length of all image data across all frames.
  ///
  /// Returns 0 if [frameSize] is 0 (i.e. width or height is 0).
  static int BASE_dataLength(int frameSize, int frameCount) {
    if (frameSize == 0) return 0;
    return frameSize * frameCount;
  }

  /// Returns the byte size of a single frame.
  ///
  /// Returns 0 if either [width] or [height] is 0.
  ///
  /// Throws a [StateError] if [format] is [PixelFormat.PIXELFORMAT_NONE].
  static int BASE_frameSize(int width, int height, PixelFormat format) {
    if (width == 0 || height == 0) return 0;
    if (format == .PIXELFORMAT_NONE) throw StateError('Image format must be set before accessing data layout');
    return width * height * BASE_bytesPerPixel(format);
  }

  /// Number of bytes per pixel, derived from [format].
  ///
  /// See [BASE_bytesPerPixel] for supported formats and error conditions.
  int get bytesPerPixel => BASE_bytesPerPixel(format);

  /// Total byte length of [data], equal to [frameSize] * [frameCount].
  ///
  /// Returns 0 if [width] or [height] is 0.
  int get dataLength => BASE_dataLength(frameSize, frameCount);

  /// Byte size of a single frame, equal to [width] * [height] * [bytesPerPixel].
  ///
  /// Returns 0 if [width] or [height] is 0.
  int get frameSize => BASE_frameSize(width, height, format);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Uint8List? _initialData;
  late final XLivePtrSync<XVoid> _data = field_data.live(() => op);
  /// Image raw data
  ///
  /// For single-frame images this is exactly `frameSize` bytes.
  /// 
  /// For multi-frame images (e.g. animated GIFs) this is `frameSize * frameCount` bytes.
  XPtr<XVoid> get data => _data.derefPtr(safe: true);
  Uint8List get dataView => data.asView(dataLength);

  int _width;
  /// Image base width
  int get width => _width = field_width.readOr(op, _width);
  set width(int value) => _width = field_width.writeOr(op, value);

  int _height;
  /// Image base height
  int get height => _height = field_height.readOr(op, _height);
  set height(int value) => _height = field_height.writeOr(op, value);

  int _mipmaps;
  /// Mipmap levels, 1 by default
  /// 
  /// 1 means no mipmaps (base image only).
  int get mipmaps => _mipmaps = field_mipmaps.readOr(op, _mipmaps);
  set mipmaps(int value) => _mipmaps = field_mipmaps.writeOr(op, value);

  PixelFormat _format;
  /// Data format (PixelFormat type)
  ///
  /// Must be set to a value other than [PixelFormat.PIXELFORMAT_NONE] before
  /// accessing [bytesPerPixel], [frameSize], or [dataLength].
  PixelFormat get format => _format = field_format.readOr(op, _format);
  set format(PixelFormat value) => _format = field_format.writeOr(op, value);

  /// Number of frames in the image.
  ///
  /// Always 1 for static images. Greater than 1 for animated formats such as GIF.
  ///
  /// Setting this value also updates the `data` according to [dataLength].
  int frameCount = 1;

  Image({
    super.op,
    Uint8List? data,
    this._width = 0,
    this._height = 0,
    this._mipmaps = 0,
    this._format = .PIXELFORMAT_NONE,
  }) :
    _initialData = data;

  factory Image.zero() => .new();

  /// Builds an R8G8B8A8 image from [pixels] in row-major order.
  ///
  /// [height] is derived from the pixel count if omitted.
  factory Image.fromPixels(
    Iterable<Color> pixels, {
    required int width,
    int? height,
  }) {
    assert(width > 0, 'width must be positive');

    final count = pixels.length;
    final h = height ?? count ~/ width;

    if (count != width * h) {
      throw ArgumentError(
        'Expected ${width * h} pixels for ${width}x$h, got $count',
      );
    }

    final bytes = Uint8List(count * 4);
    var i = 0;
    for (final c in pixels) {
      bytes[i++] = c.r;
      bytes[i++] = c.g;
      bytes[i++] = c.b;
      bytes[i++] = c.a;
    }

    return .new(
      data: bytes,
      width: width,
      height: h,
      format: .PIXELFORMAT_UNCOMPRESSED_R8G8B8A8,
      mipmaps: 1,
    );
  }

  @override
  Image setDart(Image o) {
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format;
    data.copyBytesFrom(o.data, o.dataLength);
    return this;
  }

  @override
  void structAllocateInto(XPtr p, String key) {
    final len = _initialData?.length ?? dataLength;
    field_data.allocate(p, '${key}_data', count: len, raw: true);

    if (_initialData case final init?) {
      // sourced from `p` instead of `op` (`op` is not bound yet)
      field_data.live(() => p).derefPtr<XUint8>().writeArray(init);
      _initialData = null;
    }
  }

  @override
  void structWriteInto(XPtr p) {
    _data.syncInto(p);
    field_width.write(p, width);
    field_height.write(p, height);
    field_mipmaps.write(p, mipmaps);
    field_format.write(p, format);
  }

  @override
  void structReadFrom(XPtr p) {
    _data.syncFrom(p);
    width = field_width.read(p);
    height = field_height.read(p);
    mipmaps = field_mipmaps.read(p);
    format = field_format.read(p);
  }

  @override
  String signature() => '$structName(data: $dataLength, width: $width, height: $height, mipmaps: $mipmaps, format: ${format.name})';
}