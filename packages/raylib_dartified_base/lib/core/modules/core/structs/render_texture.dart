part of '../../../raylib_dartified_base.dart';

enum RenderTextureField with XFields {
  id,
  texture,
  depth,
}

/// RenderTexture, fbo for texture rendering
class RenderTexture extends XStruct<RenderTexture> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<RenderTexture> struct = .createValue(
    factory: RenderTexture.new,
    layout: .aligned<RenderTextureField>({
      .id:      XUnsignedInt(), // OpenGL framebuffer object id
      .texture: XRawStruct(Texture.struct), // Color buffer attachment texture
      .depth:   XRawStruct(Texture.struct), // Depth buffer attachment texture
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<RenderTextureField> _l = struct.layoutOf();

  /// Field descriptor for [id].
  static final field_id = _l.integer<XUnsignedInt>(.id);
  /// Field descriptor for [texture].
  static final field_texture = _l.struct<Texture>(.texture);
  /// Field descriptor for [depth].
  static final field_depth = _l.struct<Texture>(.depth);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _id;
  /// OpenGL framebuffer object id
  int get id => _id = field_id.readOr(op, _id);
  set id(int value) => _id = field_id.writeOr(op, value);

  Texture _texture;
  /// Color buffer attachment texture
  Texture get texture => _texture = field_texture.readOr(op, _texture);
  set texture(Texture value) => _texture = field_texture.writeOr(op, value);

  Texture _depth;
  /// Depth buffer attachment texture
  Texture get depth => _depth = field_depth.readOr(op, _depth);
  set depth(Texture value) => _depth = field_depth.writeOr(op, value);

  RenderTexture({
    super.op,
    int id = 0,
    Texture? texture,
    Texture? depth,
  }) :
    _id = id,
    _texture = texture ?? .new(),
    _depth = depth ?? .new();

  factory RenderTexture.zero() => .new();

  @override
  RenderTexture setDart(RenderTexture o) {
    id = o.id;
    texture = o.texture;
    depth = o.texture;
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_id.write(p, id);
    field_texture.write(p, texture);
    field_depth.write(p, depth);
  }

  @override
  void structReadFrom(XPtr p) {
    id = field_id.read(p);
    texture = field_texture.read(p);
    depth = field_depth.read(p);
  }

  @override
  String signature() => '$structName(id: $id, texture: $texture, depth: $depth)';
}