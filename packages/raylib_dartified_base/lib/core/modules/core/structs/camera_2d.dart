part of '../../../raylib_dartified_base.dart';

enum Camera2DField with XFields {
  offset,
  target,
  rotation,
  zoom,
}

/// Camera2D, defines position/orientation in 2d space
final class Camera2D extends XStruct<Camera2D> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Camera2D> struct = .createValue(
    factory: Camera2D.new,
    layout: .aligned<Camera2DField>({
      .offset:   XStructType(Vector2.struct), // Camera offset (screen space offset from window origin)
      .target:   XStructType(Vector2.struct), // Camera target (world space target point that is mapped to screen space offset)
      .rotation: XFloat(), // Camera rotation in degrees (pivots around target)
      .zoom:     XFloat(), // Camera zoom (scaling around target), must not be set to 0, set to 1.0f for no scale
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<Camera2DField> _l = struct.layoutOf();

  /// Field descriptor for [offset].
  static final field_offset = _l.struct<Vector2>(.offset);
  /// Field descriptor for [target].
  static final field_target = _l.struct<Vector2>(.target);
  /// Field descriptor for [rotation].
  static final field_rotation = _l.float<XFloat>(.rotation);
  /// Field descriptor for [zoom].
  static final field_zoom = _l.float<XFloat>(.zoom);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  Vector2 _offset;
  /// Camera offset (screen space offset from window origin)
  Vector2 get offset => _offset = field_offset.readOr(op, _offset);
  set offset(Vector2 value) => _offset = field_offset.writeOr(op, value);
  
  Vector2 _target;
  /// Camera target (world space target point that is mapped to screen space offset)
  Vector2 get target => _target = field_target.readOr(op, _target);
  set target(Vector2 value) => _target = field_target.writeOr(op, value);

  double _rotation;
  /// Camera rotation in degrees (pivots around target)
  double get rotation => _rotation = field_rotation.readOr(op, _rotation);
  set rotation(double value) => _rotation = field_rotation.writeOr(op, value);

  double _zoom;
  /// Camera zoom (scaling around target), must not be set to 0, set to 1.0f for no scale
  double get zoom => _zoom = field_zoom.readOr(op, _zoom);
  set zoom(double value) => _zoom = field_zoom.writeOr(op, value);

  Camera2D({
    super.op,
    Vector2? offset,
    Vector2? target,
    this._rotation = 0,
    this._zoom = 1,
  }) :
    _offset = offset ?? .zero(),
    _target = target ?? .zero();

  factory Camera2D.zero() => .new();

  @override
  Camera2D setDart(Camera2D o) {
    offset.setDart(o.offset);
    target.setDart(o.target);
    rotation = o.rotation;
    zoom = o.zoom;
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_offset.write(p, offset);
    field_target.write(p, target);
    field_rotation.write(p, rotation);
    field_zoom.write(p, zoom);
  }

  @override
  void structReadFrom(XPtr p) {
    offset = field_offset.read(p);
    target = field_target.read(p);
    rotation = field_rotation.read(p);
    zoom = field_zoom.read(p);
  }

  @override
  String signature() => '$structName(offset: $offset, target: $target, rotation: $rotation, zoom: $zoom)';
}