part of '../../../raylib_dartified.dart';

enum TransformField with XFields {
  translation,
  rotation,
  scale,
}

/// Transform, vertex transformation data
final class Transform extends XStruct<Transform> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Transform> struct = .createValue(
    factory: Transform.new,
    layout: .aligned<TransformField>({
      .translation: XStructType(Vector3.struct), // Translation
      .rotation: XStructType(Quaternion.struct), // Rotation
      .scale: XStructType(Vector3.struct), // Scale
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<TransformField> _l = struct.layoutOf();

  /// Field descriptor for [translation].
  static final field_translation = _l.struct<Vector3>(.translation);
  /// Field descriptor for [rotation].
  static final field_rotation = _l.struct<Quaternion>(.rotation);
  /// Field descriptor for [scale].
  static final field_scale = _l.struct<Vector3>(.scale);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3 _translation;
  /// Translation
  Vector3 get translation => _translation = field_translation.readOr(op, _translation);
  set translation(Vector3 value) => _translation = field_translation.writeOr(op, value);

  Quaternion _rotation;
  /// Rotation
  Quaternion get rotation => _rotation = field_rotation.readOr(op, _rotation);
  set rotation(Quaternion value) => _rotation = field_rotation.writeOr(op, value);

  Vector3 _scale;
  /// Scale
  Vector3 get scale => _scale = field_scale.readOr(op, _scale);
  set scale(Vector3 value) => _scale = field_scale.writeOr(op, value);
  
  Transform({
    super.op,
    Vector3? translation,
    Quaternion? rotation,
    Vector3? scale,
  }) :
    _translation = translation ?? .zero(),
    _rotation = rotation ?? .zero(),
    _scale = scale ?? .zero();

  factory Transform.zero() => .new();

  @override
  Transform setDart(Transform o) {
    translation.setDart(o.translation);
    rotation.setDart(o.rotation);
    scale.setDart(o.scale);
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_translation.write(p, translation);
    field_rotation.write(p, rotation);
    field_scale.write(p, scale);
  }

  @override
  void structReadFrom(XPtr p) {
    translation = field_translation.read(p);
    rotation = field_rotation.read(p);
    scale = field_scale.read(p);
  }

  @override
  String signature() => '$structName(translation: $translation, rotation: $rotation, scale: $scale)';
}