part of '../../../raylib_dartified_base.dart';

enum RayField with XFields {
  position,
  direction,
}

/// Ray, ray for raycasting
final class Ray extends XStruct<Ray> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Ray> struct = .createValue(
    factory: Ray.new,
    layout: .aligned<RayField>({
      .position:  XStructType(Vector3.struct), // Ray position (origin)
      .direction: XStructType(Vector3.struct), // Ray direction (normalized)
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<RayField> _l = struct.layoutOf();

  /// Field descriptor for [position].
  static final field_position = _l.struct<Vector3>(.position);
  /// Field descriptor for [direction].
  static final field_direction = _l.struct<Vector3>(.direction);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3 _position;
  /// Ray position (origin)
  Vector3 get position => _position = field_position.readOr(op, _position);
  set position(Vector3 value) => _position = field_position.writeOr(op, value);

  Vector3 _direction;
  /// Ray direction (normalized)
  Vector3 get direction => _direction = field_direction.readOr(op, _direction);
  set direction(Vector3 value) => _direction = field_direction.writeOr(op, value);

  Ray({
    super.op,
    Vector3? position,
    Vector3? direction
  }) :
    _position = position ?? .zero(),
    _direction = direction ?? .zero();

  factory Ray.zero() => .new();

  @override
  Ray setDart(Ray o) {
    position.setDart(o.position);
    direction.setDart(o.direction);
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_position.write(p, position);
    field_direction.write(p, direction);
  }

  @override
  void structReadFrom(XPtr p) {
    position = field_position.read(p);
    direction = field_direction.read(p);
  }

  @override
  String signature() => '$structName(position: $position, direction: $direction)';
}