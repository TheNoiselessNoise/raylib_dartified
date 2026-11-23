part of '../../../raylib_dartified.dart';

enum TextureField with XFields {
  id,
  width,
  height,
  mipmaps,
  format,
}

/// Texture, tex data stored in GPU memory (VRAM)
final class Texture extends XStruct<Texture> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Texture> struct = .create(
    factory: Texture.new,
    layout: .aligned<TextureField>({
      .id:      XUnsignedInt(), // OpenGL texture id
      .width:   XInt(), // Texture base width
      .height:  XInt(), // Texture base height
      .mipmaps: XInt(), // Mipmap levels, 1 by default
      .format:  XInt(), // Data format (PixelFormat type)
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<TextureField> _l = struct.layoutOf();

  /// Field descriptor for [id].
  static final field_id = _l.integer<XUnsignedInt>(.id);
  /// Field descriptor for [width].
  static final field_width = _l.integer<XInt>(.width);
  /// Field descriptor for [height].
  static final field_height = _l.integer<XInt>(.height);
  /// Field descriptor for [mipmaps].
  static final field_mipmaps = _l.integer<XInt>(.mipmaps);
  /// Field descriptor for [format].
  static final field_format = _l.enumValue(.format, PixelFormat.fromValue);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _id;
  /// OpenGL texture id
  int get id => _id = field_id.readOr(op, _id);
  set id(int value) => _id = field_id.writeOr(op, value);

  int _width;
  /// Texture base wwidthth
  int get width => _width = field_width.readOr(op, _width);
  set width(int value) => _width = field_width.writeOr(op, value);

  int _height;
  /// Texture base height
  int get height => _height = field_height.readOr(op, _height);
  set height(int value) => _height = field_height.writeOr(op, value);

  int _mipmaps;
  /// Mipmap levels, 1 by default
  int get mipmaps => _mipmaps = field_mipmaps.readOr(op, _mipmaps);
  set mipmaps(int value) => _mipmaps = field_mipmaps.writeOr(op, value);

  PixelFormat _format;
  /// Data format (PixelFormat type)
  PixelFormat get format => _format = field_format.readOr(op, _format);
  set format(PixelFormat value) => _format = field_format.writeOr(op, value);

  Texture({
    super.op,
    this._id = 0,
    this._width = 0,
    this._height = 0,
    this._mipmaps = 0,
    this._format = .PIXELFORMAT_NONE,
  });

  factory Texture.zero() => .new();

  @override
  Texture setDart(Texture o) {
    id = o.id;
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format;
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_id.write(p, id);
    field_width.write(p, width);
    field_height.write(p, height);
    field_mipmaps.write(p, mipmaps);
    field_format.write(p, format);
  }

  @override
  void structReadFrom(XPtr p) {
    id = field_id.read(p);
    width = field_width.read(p);
    height = field_height.read(p);
    mipmaps = field_mipmaps.read(p);
    format = field_format.read(p);
  }

  @override
  String signature() => '$structName(id: $id, width: $width, height: $height, mipmaps: $mipmaps, format: ${format.name})';
}