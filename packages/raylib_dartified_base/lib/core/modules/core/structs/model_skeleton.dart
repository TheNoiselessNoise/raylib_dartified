part of '../../../raylib_dartified_base.dart';

enum ModelSkeletonField with XFields {
  boneCount,
  bones,
  bindPose,
}

/// Skeleton, animation bones hierarchy
class ModelSkeleton extends XStruct<ModelSkeleton> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<ModelSkeleton> struct = .create(
    factory: ModelSkeleton.new,
    layout: .aligned<ModelSkeletonField>({
      .boneCount: XInt(), // Number of bones
      .bones:     XRawPtr(XRawStruct(BoneInfo.struct)), // Bones information (skeleton)
      .bindPose:  XRawPtr(XRawStruct(Transform.struct)), // Bones base transformation (Transform[])
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<ModelSkeletonField> _l = struct.layoutOf();

  /// Field descriptor for [boneCount].
  static final field_boneCount = _l.integer<XInt>(.boneCount);
  /// Field descriptor for [bones].
  static final field_bones = _l.ptrStructArray<BoneInfo>(.bones);
  /// Field descriptor for [bindPose].
  static final field_bindPose = _l.ptrStructArray<Transform>(.bindPose);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _boneCount;
  /// Number of bones
  int get boneCount => _boneCount = field_boneCount.readOr(op, _boneCount);
  set boneCount(int value) => _boneCount = field_boneCount.writeOr(op, value);

  late final StructLiveListStruct<BoneInfo> _bones;
  /// Bones information (skeleton)
  StructLiveListStruct<BoneInfo> get bones => _bones;
  set bones(List<BoneInfo> value) => _bones.inner = value;

  late final StructLiveListStruct<Transform> _bindPose;
  /// Bones base transformation (Transform[])
  StructLiveListStruct<Transform> get bindPose => _bindPose;
  set bindPose(List<Transform> value) => _bindPose.inner = value;
  
  ModelSkeleton({
    super.op,
    int? boneCount,
    List<BoneInfo>? bones,
    List<Transform>? bindPose,
  }) : _boneCount = boneCount ?? bones?.length ?? 0 {
    _bones = field_bones.live(() => op, bones ?? []);
    _bindPose = field_bindPose.live(() => op, bindPose ?? []);
  }

  factory ModelSkeleton.zero() => .new();

  @override
  ModelSkeleton setDart(ModelSkeleton o) {
    boneCount = o.boneCount;
    bones = .from(o.bones);
    bindPose = .from(o.bindPose); 
    return this;
  }

  @override
  void structAllocateInto(XPtr p, String key) {
    field_bones.allocate(p, '${key}_bones', count: boneCount);
    field_bindPose.allocate(p, '${key}_bindPose', count: boneCount);
  }

  @override
  void structWriteInto(XPtr p) {
    field_boneCount.write(p, boneCount);
    bones.writeInto(p);
    bindPose.writeInto(p);
  }

  @override
  void structReadFrom(XPtr p) {
    boneCount = field_boneCount.read(p);
    bones.readFrom(p, count: boneCount);
    bindPose.readFrom(p, count: boneCount);
  }

  @override
  String signature() => '$structName(boneCount: $boneCount, bones: ${bones.length}, bindPose: ${bindPose.length})';
}