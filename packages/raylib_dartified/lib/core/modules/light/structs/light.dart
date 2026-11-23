part of '../../../raylib_dartified.dart';

enum LightField with XFields {
  type,
  enabled,
  position,
  target,
  color,
  attenuation,
  enabledLoc,
  typeLoc,
  positionLoc,
  targetLoc,
  colorLoc,
  attenuationLoc,
}

/// Light
final class Light extends XStruct<Light> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Light> struct = .createValue(
    factory: Light.new,
    layout: .aligned<LightField>({
      .type:           XInt(),
      .enabled:        XBool(),
      .position:       XStructType(Vector3.struct),
      .target:         XStructType(Vector3.struct),
      .color:          XStructType(Color.struct),
      .attenuation:    XFloat(),

      // Shader locations
      .enabledLoc:     XInt(),
      .typeLoc:        XInt(),
      .positionLoc:    XInt(),
      .targetLoc:      XInt(),
      .colorLoc:       XInt(),
      .attenuationLoc: XInt(),
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<LightField> _l = struct.layoutOf();

  /// Field descriptor for [type].
  static final field_type = _l.enumValue(.type, LightType.fromValue);
  /// Field descriptor for [enabled].
  static final field_enabled = _l.boolean(.enabled);
  /// Field descriptor for [position].
  static final field_position = _l.struct<Vector3>(.position);
  /// Field descriptor for [target].
  static final field_target = _l.struct<Vector3>(.target);
  /// Field descriptor for [color].
  static final field_color = _l.struct<Color>(.color);
  /// Field descriptor for [attenuation].
  static final field_attenuation = _l.float<XFloat>(.attenuation);
  /// Field descriptor for [enabledLoc].
  static final field_enabledLoc = _l.integer<XInt>(.enabledLoc);
  /// Field descriptor for [typeLoc].
  static final field_typeLoc = _l.integer<XInt>(.typeLoc);
  /// Field descriptor for [positionLoc].
  static final field_positionLoc = _l.integer<XInt>(.positionLoc);
  /// Field descriptor for [targetLoc].
  static final field_targetLoc = _l.integer<XInt>(.targetLoc);
  /// Field descriptor for [colorLoc].
  static final field_colorLoc = _l.integer<XInt>(.colorLoc);
  /// Field descriptor for [attenuationLoc].
  static final field_attenuationLoc = _l.integer<XInt>(.attenuationLoc);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  LightType _type;
  /// Light type (directional or point)
  LightType get type => _type = field_type.readOr(op, _type);
  set type(LightType value) => _type = field_type.writeOr(op, value);

  bool _enabled;
  /// Whether the light is currently active
  bool get enabled => _enabled = field_enabled.readOr(op, _enabled);
  set enabled(bool value) => _enabled = field_enabled.writeOr(op, value);
  
  Vector3 _position;
  /// Light position in world space
  Vector3 get position => _position = field_position.readOr(op, _position);
  set position(Vector3 value) => _position = field_position.writeOr(op, value);
  
  Vector3 _target;
  /// Light target direction (used for directional lights)
  Vector3 get target => _target = field_target.readOr(op, _target);
  set target(Vector3 value) => _target = field_target.writeOr(op, value);
  
  Color _color;
  /// Light color
  Color get color => _color = field_color.readOr(op, _color);
  set color(Color value) => _color = field_color.writeOr(op, value);
  
  double _attenuation;
  /// Light attenuation factor (falloff over distance)
  double get attenuation => _attenuation = field_attenuation.readOr(op, _attenuation);
  set attenuation(double value) => _attenuation = field_attenuation.writeOr(op, value);

  int _enabledLoc;
  /// Shader location for [enabled]
  int get enabledLoc => _enabledLoc = field_enabledLoc.readOr(op, _enabledLoc);
  set enabledLoc(int value) => _enabledLoc = field_enabledLoc.writeOr(op, value);
  
  int _typeLoc;
  /// Shader location for [type]
  int get typeLoc => _typeLoc = field_typeLoc.readOr(op, _typeLoc);
  set typeLoc(int value) => _typeLoc = field_typeLoc.writeOr(op, value);
  
  int _positionLoc;
  /// Shader location for [position]
  int get positionLoc => _positionLoc = field_positionLoc.readOr(op, _positionLoc);
  set positionLoc(int value) => _positionLoc = field_positionLoc.writeOr(op, value);
  
  int _targetLoc;
  /// Shader location for [target]
  int get targetLoc => _targetLoc = field_targetLoc.readOr(op, _targetLoc);
  set targetLoc(int value) => _targetLoc = field_targetLoc.writeOr(op, value);
  
  int _colorLoc;
  /// Shader location for [color]
  int get colorLoc => _colorLoc = field_colorLoc.readOr(op, _colorLoc);
  set colorLoc(int value) => _colorLoc = field_colorLoc.writeOr(op, value);
  
  int _attenuationLoc;
  /// Shader location for [attenuation]
  int get attenuationLoc => _attenuationLoc = field_attenuationLoc.readOr(op, _attenuationLoc);
  set attenuationLoc(int value) => _attenuationLoc = field_attenuationLoc.writeOr(op, value);

  Light({
    super.op,
    this._type = .LIGHT_POINT,
    this._enabled = false,
    Vector3? position,
    Vector3? target,
    Color? color,
    this._attenuation = 0,
    this._enabledLoc = 0,
    this._typeLoc = 0,
    this._positionLoc = 0,
    this._targetLoc = 0,
    this._colorLoc = 0,
    this._attenuationLoc = 0,
  }) :
    _position = position ?? .zero(),
    _target = target ?? .zero(),
    _color = color ?? .zero();

  factory Light.zero() => .new();

  @override
  Light setDart(Light o) {
    type = o.type;
    enabled = o.enabled;
    position.setDart(o.position);
    target.setDart(o.target);
    color.setDart(o.color);
    attenuation = o.attenuation;
    enabledLoc = o.enabledLoc;
    typeLoc = o.typeLoc;
    positionLoc = o.positionLoc;
    targetLoc = o.targetLoc;
    colorLoc = o.colorLoc;
    attenuationLoc = o.attenuationLoc;
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_type.write(p, type);
    field_enabled.write(p, enabled);
    field_position.write(p, position);
    field_target.write(p, target);
    field_color.write(p, color);
    field_attenuation.write(p, attenuation);
    field_enabledLoc.write(p, enabledLoc);
    field_typeLoc.write(p, typeLoc);
    field_positionLoc.write(p, positionLoc);
    field_targetLoc.write(p, targetLoc);
    field_colorLoc.write(p, colorLoc);
    field_attenuationLoc.write(p, attenuationLoc);
  }

  @override
  void structReadFrom(XPtr p) {
    type = field_type.read(p);
    enabled = field_enabled.read(p);
    position = field_position.read(p);
    target = field_target.read(p);
    color = field_color.read(p);
    attenuation = field_attenuation.read(p);
    enabledLoc = field_enabledLoc.read(p);
    typeLoc = field_typeLoc.read(p);
    positionLoc = field_positionLoc.read(p);
    targetLoc = field_targetLoc.read(p);
    colorLoc = field_colorLoc.read(p);
    attenuationLoc = field_attenuationLoc.read(p);
  }

  @override
  String signature() => '$structName(${type.name}, enabled: $enabled, position: $position, target: $target)';
}