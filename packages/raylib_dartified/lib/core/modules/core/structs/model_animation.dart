part of '../../../raylib_dartified.dart';

enum ModelAnimationField with XFields {
  name,
  boneCount,
  keyframeCount,
  keyframePoses,
}

/// ModelAnimation, contains a full animation sequence
final class ModelAnimation extends XStruct<ModelAnimation> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<ModelAnimation> struct = .create(
    factory: ModelAnimation.new,
    layout: .aligned<ModelAnimationField>({
      .name:          XArray(XChar(), BASE_nameLength), // Animation name
      .boneCount:     XInt(), // Number of bones (per pose)
      .keyframeCount: XInt(), // Number of animation key frames
      .keyframePoses: XPtrType(XPtrType(XStructType(Transform.struct))), // Animation sequence keyframe poses [keyframe][pose]
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<ModelAnimationField> _l = struct.layoutOf();

  /// Field descriptor for [name].
  static final field_name = _l.stringAsCharArray(.name);
  /// Field descriptor for [boneCount].
  static final field_boneCount = _l.integer<XInt>(.boneCount);
  /// Field descriptor for [keyframeCount].
  static final field_keyframeCount = _l.integer<XInt>(.keyframeCount);
  /// Field descriptor for [keyframePoses].
  static final field_keyframePoses = _l.ptrPtrStructArray<Transform>(.keyframePoses);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Size of the native [name] buffer.
  static int get BASE_nameLength => 32;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Animation name
  String get name => field_name.readOr(op, '');

  /// Number of bones (per pose)
  int get boneCount => field_boneCount.readOr(op, 0);

  /// Number of animation key frames
  int get keyframeCount => field_keyframeCount.readOr(op, 0);

  StructLiveListStructNested<Transform> get keyframePoses => field_keyframePoses.liveNested(() => op, []);

  ModelAnimation({ super.op });

  factory ModelAnimation.zero() => .new();

  @override
  String signature() => '$structName(name: $name, boneCount: $boneCount, keyframeCount: $keyframeCount)';
}