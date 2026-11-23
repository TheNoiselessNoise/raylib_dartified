part of '../../../raylib_dartified.dart';

enum Camera3DField with XFields {
  position,
  target,
  up,
  fovy,
  projection,
}

/// Camera, defines position/orientation in 3d space
final class Camera3D extends XStruct<Camera3D> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Camera3D> struct = .create(
    factory: Camera3D.new,
    layout: .aligned<Camera3DField>({
      .position:   XStructType(Vector3.struct), // Camera position
      .target:     XStructType(Vector3.struct), // Camera target it looks-at
      .up:         XStructType(Vector3.struct), // Camera up vector (rotation over its axis)
      .fovy:       XFloat(), // Camera field-of-view aperture in Y (degrees) in perspective, used as near plane height in world units in orthographic
      .projection: XInt(), // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<Camera3DField> _l = struct.layoutOf();

  /// Field descriptor for [position].
  static final field_position = _l.struct<Vector3>(.position);
  /// Field descriptor for [target].
  static final field_target = _l.struct<Vector3>(.target);
  /// Field descriptor for [up].
  static final field_up = _l.struct<Vector3>(.up);
  /// Field descriptor for [fovy].
  static final field_fovy = _l.float<XFloat>(.fovy);
  /// Field descriptor for [projection].
  static final field_projection = _l.enumValue(.projection, CameraProjection.fromValue);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3 _position;
  /// Camera position
  Vector3 get position => _position = field_position.readOr(op, _position);
  set position(Vector3 value) => _position = field_position.writeOr(op, value);

  Vector3 _target;
  /// Camera target it looks-at
  Vector3 get target => _target = field_target.readOr(op, _target);
  set target(Vector3 value) => _target = field_target.writeOr(op, value);

  Vector3 _up;
  /// Camera up vector (rotation over its axis)
  Vector3 get up => _up = field_up.readOr(op, _up);
  set up(Vector3 value) => _up = field_up.writeOr(op, value);

  double _fovy;
  /// Camera field-of-view aperture in Y (degrees) in perspective, used as near plane height in world units in orthographic
  double get fovy => _fovy = field_fovy.readOr(op, _fovy);
  set fovy(double value) => _fovy = field_fovy.writeOr(op, value);

  CameraProjection _projection;
  /// Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
  CameraProjection get projection => _projection = field_projection.readOr(op, _projection);
  set projection(CameraProjection value) => _projection = field_projection.writeOr(op, value);

  Camera3D({
    super.op,
    Vector3? position,
    Vector3? target,
    Vector3? up,
    this._fovy = 45,
    this._projection = .CAMERA_PERSPECTIVE,
  }) :
    _position = position ?? .zero(),
    _target = target ?? .zero(),
    _up = up ?? .zero();

  factory Camera3D.zero() => .new();

  @override
  Camera3D setDart(Camera3D o) {
    position.setDart(o.position);
    target.setDart(o.target);
    up.setDart(o.up);
    fovy = o.fovy;
    projection = o.projection;
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_position.write(p, position);
    field_target.write(p, target);
    field_up.write(p, up);
    field_fovy.write(p, fovy);
    field_projection.write(p, projection);
  }

  @override
  void structReadFrom(XPtr p) {
    position = field_position.read(p);
    target = field_target.read(p);
    up = field_up.read(p);
    fovy = field_fovy.read(p);
    projection = field_projection.read(p);
  }

  @override
  String signature() => '$structName(position: $position, target: $target, up: $up, fovy: $fovy, projection: ${projection.name})';
}