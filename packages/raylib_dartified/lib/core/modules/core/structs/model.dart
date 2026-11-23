part of '../../../raylib_dartified.dart';

enum ModelField with XFields {
  transform,
  meshCount,
  materialCount,
  meshes,
  materials,
  meshMaterial,
  skeleton,
  currentPose,
  boneMatrices,
}

/// Model, meshes, materials and animation data
final class Model extends XStruct<Model> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Model> struct = .create(
    factory: Model.new,
    layout: .aligned<ModelField>({
      .transform:     XStructType(Matrix.struct), // Local transform matrix
      .meshCount:     XInt(), // Number of meshes
      .materialCount: XInt(), // Number of materials
      .meshes:        XPtrType(XStructType(Mesh.struct)), // Meshes array
      .materials:     XPtrType(XStructType(Material.struct)), // Materials array
      .meshMaterial:  XPtrType(XInt()), // Mesh material number

      // Animation data
      .skeleton:      XStructType(ModelSkeleton.struct), // Skeleton for animation

      // Runtime animation data (CPU/GPU skinning)
      .currentPose:   XPtrType(XStructType(Transform.struct)), // Current animation pose (Transform[])
      .boneMatrices:  XPtrType(XStructType(Matrix.struct)), // Bones animated transformation matrices
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<ModelField> _l = struct.layoutOf();

  /// Field descriptor for [transform].
  static final field_transform = _l.struct<Matrix>(.transform);
  /// Field descriptor for [meshCount].
  static final field_meshCount = _l.integer<XInt>(.meshCount);
  /// Field descriptor for [materialCount].
  static final field_materialCount = _l.integer<XInt>(.materialCount);
  /// Field descriptor for [meshes].
  static final field_meshes = _l.ptrStructArray<Mesh>(.meshes);
  /// Field descriptor for [materials].
  static final field_materials = _l.ptrStructArray<Material>(.materials);
  /// Field descriptor for [meshMaterial].
  static final field_meshMaterial = _l.ptrScalarArray<int, XInt>(.meshMaterial);
  /// Field descriptor for [skeleton].
  static final field_skeleton = _l.struct<ModelSkeleton>(.skeleton);
  /// Field descriptor for [currentPose].
  static final field_currentPose = _l.ptrStructArray<Transform>(.currentPose);
  /// Field descriptor for [boneMatrices].
  static final field_boneMatrices = _l.ptrStructArray<Matrix>(.boneMatrices);

  static final _meshesKey = 'meshes';
  static final _materialsKey = 'materials';
  static final _meshMaterialKey = 'meshMaterial';
  static final _currentPoseKey = 'currentPose';
  static final _boneMatricesKey = 'boneMatrices';

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Matrix _transform;
  /// Local transform matrix
  Matrix get transform => _transform = field_transform.readOr(op, _transform);
  set transform(Matrix value) => _transform = field_transform.writeOr(op, value);
  
  int _meshCount;
  /// Number of meshes
  int get meshCount => _meshCount = field_meshCount.readOr(op, _meshCount);
  set meshCount(int value) => _meshCount = field_meshCount.writeOr(op, value);

  int _materialCount;
  /// Number of materials
  int get materialCount => _materialCount = field_materialCount.readOr(op, _materialCount);
  set materialCount(int value) => _materialCount = field_materialCount.writeOr(op, value);

  late final StructLiveListStruct<Mesh> _meshes;
  /// Meshes array
  StructLiveListStruct<Mesh> get meshes => _meshes;
  set meshes(List<Mesh> value) => _meshes.setOrAllocate(value, key: _meshesKey);
  
  late final StructLiveListStruct<Material> _materials;
  /// Materials array
  StructLiveListStruct<Material> get materials => _materials;
  set materials(List<Material> value) => _materials.setOrAllocate(value, key: _materialsKey);

  late final XLiveList<int, XInt> _meshMaterial;
  /// Mesh material number
  XLiveList<int, XInt> get meshMaterial => _meshMaterial;
  set meshMaterial(List<int> value) => _meshMaterial.setOrAllocate(value, key: _meshMaterialKey);

  ModelSkeleton _skeleton;
  /// Skeleton for animation
  ModelSkeleton get skeleton => _skeleton = field_skeleton.readOr(op, _skeleton);
  set skeleton(ModelSkeleton value) => _skeleton = field_skeleton.writeOr(op, value);

  late final StructLiveListStruct<Transform> _currentPose;
  /// Current animation pose (Transform[])
  StructLiveListStruct<Transform> get currentPose => _currentPose;
  set currentPose(List<Transform> value) => _currentPose.setOrAllocate(value, key: _currentPoseKey);
  
  late final StructLiveListStruct<Matrix> _boneMatrices;
  /// Bones animated transformation matrices
  StructLiveListStruct<Matrix> get boneMatrices => _boneMatrices;
  set boneMatrices(List<Matrix> value) => _boneMatrices.setOrAllocate(value, key: _boneMatricesKey);

  Model({
    super.op,
    Matrix? transform,
    List<Mesh>? meshes,
    List<Material>? materials,
    List<int>? meshMaterial,
    ModelSkeleton? skeleton,
    List<Transform>? currentPose,
    List<Matrix>? boneMatrices,
  }) :
    _transform = transform ?? .new(),
    _meshCount = meshes?.length ?? 0,
    _materialCount = materials?.length ?? 0,
    _skeleton = skeleton ?? .new()
  {
    _meshes = field_meshes.live(() => op, meshes ?? []);
    _materials = field_materials.live(() => op, materials ?? []);
    _meshMaterial = field_meshMaterial.live(() => op, meshMaterial ?? []);
    _currentPose = field_currentPose.live(() => op, currentPose ?? []);
    _boneMatrices = field_boneMatrices.live(() => op, boneMatrices ?? []);
  }

  factory Model.zero() => .new();

  @override
  Model setDart(Model o) {
    transform.setDart(o.transform);
    meshCount = o.meshCount;
    materialCount = o.materialCount;
    meshes = .from(o.meshes);
    materials = .from(o.materials);
    meshMaterial = .from(o.meshMaterial);
    skeleton.setDart(o.skeleton);
    currentPose = .from(o.currentPose);
    boneMatrices = .from(o.boneMatrices);
    return this;
  }

  @override
  void structAllocateInto(XPtr p, String key) {
    field_meshes.allocate(p, '$key:$_meshesKey', count: meshCount);
    field_materials.allocate(p, '$key:$_materialsKey', count: materialCount);
    field_meshMaterial.allocate(p, '$key:$_meshMaterialKey', count: materialCount);
    field_currentPose.allocate(p, '$key:$_currentPoseKey', count: skeleton.boneCount);
    field_boneMatrices.allocate(p, '$key:$_boneMatricesKey', count: skeleton.boneCount);
  }

  @override
  void structWriteInto(XPtr p) {
    field_transform.write(p, transform);
    field_meshCount.write(p, meshCount);
    field_materialCount.write(p, materialCount);
    meshes.writeInto(p);
    materials.writeInto(p);
    meshMaterial.writeInto(p);
    field_skeleton.write(p, skeleton);
    currentPose.writeInto(p);
    boneMatrices.writeInto(p);
  }

  @override
  void structReadFrom(XPtr p) {
    transform = field_transform.read(p);
    meshCount = field_meshCount.read(p);
    materialCount = field_materialCount.read(p);
    meshes.readFrom(p, count: meshCount);
    materials.readFrom(p, count: materialCount);
    meshMaterial.readFrom(p, count: materialCount);
    skeleton = field_skeleton.read(p);
    currentPose.readFrom(p, count: skeleton.boneCount);
    boneMatrices.readFrom(p, count: skeleton.boneCount);
  }

  @override
  String signature() => '$structName(transform: $transform, meshes: $meshCount, materials: $materialCount)';
}