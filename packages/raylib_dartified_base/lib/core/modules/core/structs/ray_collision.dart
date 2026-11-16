part of '../../../raylib_dartified_base.dart';

enum RayCollisionField with XFields {
  hit,
  distance,
  point,
  normal,
}

/// RayCollision, ray hit information
final class RayCollision extends XStruct<RayCollision> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<RayCollision> struct = .createValue(
    factory: RayCollision.new,
    layout: .aligned<RayCollisionField>({
      .hit:      XBool(), // Did the ray hit something?
      .distance: XFloat(), // Distance to the nearest hit
      .point:    XStructType(Vector3.struct), // Point of the nearest hit
      .normal:   XStructType(Vector3.struct), // Surface normal of hit
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<RayCollisionField> _l = struct.layoutOf();

  /// Field descriptor for [hit].
  static final field_hit = _l.boolean(.hit);
  /// Field descriptor for [distance].
  static final field_distance = _l.float<XFloat>(.distance);
  /// Field descriptor for [point].
  static final field_point = _l.struct<Vector3>(.point);
  /// Field descriptor for [normal].
  static final field_normal = _l.struct<Vector3>(.normal);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  bool _hit;
  /// Did the ray hit something?
  bool get hit => _hit = field_hit.readOr(op, _hit);
  set hit(bool value) => _hit = field_hit.writeOr(op, value);

  double _distance;
  /// Distance to the nearest hit
  double get distance => _distance = field_distance.readOr(op, _distance);
  set distance(double value) => _distance = field_distance.writeOr(op, value);

  Vector3 _point;
  /// Point of the nearest hit
  Vector3 get point => _point = field_point.readOr(op, _point);
  set point(Vector3 value) => _point = field_point.writeOr(op, value);

  Vector3 _normal;
  /// Surface normal of hit
  Vector3 get normal => _normal = field_normal.readOr(op, _normal);
  set normal(Vector3 value) => _normal = field_normal.writeOr(op, value);

  RayCollision({
    super.op,
    this._hit = false,
    this._distance = 0,
    Vector3? point,
    Vector3? normal
  }) :
    _point = point ?? .zero(),
    _normal = normal ?? .zero();

  factory RayCollision.zero() => .new();

  @override
  RayCollision setDart(RayCollision o) {
    hit = o.hit;
    distance = o.distance;
    point.setDart(o.point);
    normal.setDart(o.normal);
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_hit.write(p, hit);
    field_distance.write(p, distance);
    field_point.write(p, point);
    field_normal.write(p, normal);
  }

  @override
  void structReadFrom(XPtr p) {
    hit = field_hit.read(p);
    distance = field_distance.read(p);
    point = field_point.read(p);
    normal = field_normal.read(p);
  }

  @override
  String signature() => '$structName(hit: $hit, distance: $distance, point: $point, normal: $normal)';
}