part of '../../../raylib_dartified_base.dart';

enum MaterialMapField with XFields {
  texture,
  color,
  value,
}

/// Material map
class MaterialMap extends XStruct<MaterialMap> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<MaterialMap> struct = .create(
    factory: MaterialMap.new,
    layout: .aligned<MaterialMapField>({
      .texture: XRawStruct(Texture.struct), // Material map texture
      .color:   XRawStruct(Color.struct), // Material map color
      .value:   XFloat(), // Material map value
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<MaterialMapField> _l = struct.layoutOf();

  /// Field descriptor for [texture].
  static final field_texture = _l.struct<Texture>(.texture);
  /// Field descriptor for [color].
  static final field_color = _l.struct<Color>(.color);
  /// Field descriptor for [value].
  static final field_value = _l.float<XFloat>(.value);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Texture _texture;
  /// Material map texture
  Texture get texture => _texture = field_texture.readOr(op, _texture);
  set texture(Texture value) => _texture = field_texture.writeOr(op, value);

  Color _color;
  /// Material map color
  Color get color => _color = field_color.readOr(op, _color);
  set color(Color value) => _color = field_color.writeOr(op, value);

  double _value;
  /// Material map value
  double get value => _value = field_value.readOr(op, _value);
  set value(double value) => _value = field_value.writeOr(op, value);
  
  MaterialMap({
    super.op,
    Texture? texture,
    Color? color,
    double value = 0,
  }) :
    _texture = texture ?? .zero(),
    _color = color ?? .zero(),
    _value = value;

  factory MaterialMap.zero() => .new();

  @override
  MaterialMap setDart(MaterialMap o) {
    texture.setDart(o.texture); 
    color.setDart(o.color); 
    value = o.value;
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_texture.write(p, texture);
    field_color.write(p, color);
    field_value.write(p, value);
  }

  @override
  void structReadFrom(XPtr p) {
    texture = field_texture.read(p);
    color = field_color.read(p);
    value = field_value.read(p);
  }

  @override
  String signature() => '$structName(texture: $texture, color: $color, value: $value)';
}