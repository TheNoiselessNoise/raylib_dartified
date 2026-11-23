part of '../../../raylib_dartified.dart';

enum BoundingBoxField with XFields {
  min,
  max,
}

/// BoundingBox
final class BoundingBox extends XStruct<BoundingBox> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<BoundingBox> struct = .createValue(
    factory: BoundingBox.new,
    layout: .aligned<BoundingBoxField>({
      .min: XStructType(Vector3.struct), // Minimum vertex box-corner
      .max: XStructType(Vector3.struct), // Maximum vertex box-corner
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<BoundingBoxField> _l = struct.layoutOf();

  /// Field descriptor for [min].
  static final field_min = _l.struct<Vector3>(.min);
  /// Field descriptor for [max].
  static final field_max = _l.struct<Vector3>(.max);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3 _min;
  /// Minimum vertex box-corner
  Vector3 get min => _min = field_min.readOr(op, _min);
  set min(Vector3 value) => _min = field_min.writeOr(op, value);

  Vector3 _max;
  /// Maximum vertex box-corner
  Vector3 get max => _max = field_max.readOr(op, _max);
  set max(Vector3 value) => _max = field_max.writeOr(op, value);

  BoundingBox({
    super.op,
    Vector3? min,
    Vector3? max,
  }) :
    _min = min ?? .zero(),
    _max = max ?? .zero();

  factory BoundingBox.zero() => .new();

  factory BoundingBox.bbox(
    Vector3 min,
    Vector3 max,
  ) => .new(
    min: min,
    max: max,
  );

  @override
  BoundingBox setDart(BoundingBox o) {
    min.setDart(o.min);
    max.setDart(o.max);
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_min.write(p, min);
    field_max.write(p, max);
  }

  @override
  void structReadFrom(XPtr p) {
    min = field_min.read(p);
    max = field_max.read(p);
  }
  
  @override
  String signature() => '$structName(min: $min, max: $max)';
}