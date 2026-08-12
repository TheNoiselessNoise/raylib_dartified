part of '../../../../raylib_dartified.dart';

extension ModelCPEx on Pointer<ModelC> {
  Pointer<ModelC> setC(ModelC o) { ref.setC(o); return this; }
  Pointer<ModelC> setD(ModelD o) { ref.setD(o); return this; }
  ModelD toD() => ref.toD(this);
}

extension ModelCEx on ModelC {
  ModelC setC(ModelC o) {
    transform.setC(o.transform);
    meshCount = o.meshCount;
    materialCount = o.materialCount;
    meshes = o.meshes;
    materials = o.materials;
    meshMaterial = o.meshMaterial;
    skeleton.setC(o.skeleton);
    currentPose = o.currentPose;
    boneMatrices = o.boneMatrices;
    return this;
  }

  ModelC setD(ModelD o) {
    o.structOnOp((p) {
      meshCount = p.ref.meshCount;
      materialCount = p.ref.materialCount;
      meshes = p.ref.meshes;
      materials = p.ref.materials;
      meshMaterial = p.ref.meshMaterial;
      currentPose = p.ref.currentPose;
      boneMatrices = p.ref.boneMatrices;
    });
    transform.setD(o.transform);
    skeleton.setD(o.skeleton);
    return this;
  }

  ModelD toD([Pointer<ModelC>? ptr]) => .new(
    originalPointer: ptr,
    transform: transform.toD(),
    meshes: .generate(meshCount, (i) => (meshes + i).toD()),
    materials: .generate(materialCount, (i) => (materials + i).toD()),
    meshMaterial: .generate(meshCount, (i) => meshMaterial[i]),
    skeleton: skeleton.toD(),
    currentPose: .generate(skeleton.boneCount, (i) => (currentPose + i).toD()),
    boneMatrices: .generate(skeleton.boneCount, (i) => (boneMatrices + i).toD()),
  );
}

class ModelD extends StructD<ModelC, ModelD> with ModelBase<
  ModelD,
  MeshD,
  MatrixD,
  Vector3D,
  QuaternionD,
  Vector4D,
  MaterialD,
  ShaderD,
  MaterialMapD,
  TextureD,
  ColorD,
  TransformD,
  BoneInfoD,
  ModelSkeletonD
> {
  MatrixD _transform;
  @override get transform {
    structOnOp((p) => _transform.nativeReadFrom(p.ref.transform));
    return _transform;
  }
  @override set transform(MatrixD value) {
    _transform = value;
    structOnOp((p) => value.nativeWriteInto(p.ref.transform));
  }
  
  late NativeLiveListPointerStruct<MeshC, MeshD> _meshes;
  @override get meshes {
    structOnOp((p) => _meshes.ptr = p.ref.meshes);
    return _meshes;
  }
  @override set meshes(List<MeshD> value) {
    structOnOp((p) => _meshes.ptr = p.ref.meshes);
    _meshes.inner = value;
  }
  
  late NativeLiveListPointerStruct<MaterialC, MaterialD> _materials;
  @override get materials {
    structOnOp((p) => _materials.ptr = p.ref.materials);
    return _materials;
  }
  @override set materials(List<MaterialD> value) {
    structOnOp((p) => _materials.ptr = p.ref.materials);
    _materials.inner = value;
  }
  
  late NativeLiveListPointerInt _meshMaterial;
  @override get meshMaterial {
    structOnOp((p) => _meshMaterial.ptr = p.ref.meshMaterial);
    return _meshMaterial;
  }
  @override set meshMaterial(List<int> value) {
    structOnOp((p) => _meshMaterial.ptr = p.ref.meshMaterial);
    _meshMaterial.inner = value;
  }

  ModelSkeletonD _skeleton;
  @override get skeleton {
    structOnOp((p) => _skeleton.nativeReadFrom(p.ref.skeleton));
    return _skeleton;
  }
  @override set skeleton(ModelSkeletonD value) {
    _skeleton = value;
    structOnOp((p) => value.nativeWriteInto(p.ref.skeleton));
  }
  
  late NativeLiveListPointerStruct<TransformC, TransformD> _currentPose;
  @override get currentPose {
    structOnOp((p) => _currentPose.ptr = p.ref.currentPose);
    return _currentPose;
  }
  @override set currentPose(List<TransformD> value) {
    structOnOp((p) => _currentPose.ptr = p.ref.currentPose);
    _currentPose.inner = value;
  }
  
  late NativeLiveListPointerStruct<MatrixC, MatrixD> _boneMatrices;
  @override get boneMatrices {
    structOnOp((p) => _boneMatrices.ptr = p.ref.boneMatrices);
    return _boneMatrices;
  }
  @override set boneMatrices(List<MatrixD> value) {
    structOnOp((p) => _boneMatrices.ptr = p.ref.boneMatrices);
    _boneMatrices.inner = value;
  }

  ModelD({
    super.originalPointer,
    MatrixD? transform,
    List<MeshD>? meshes,
    List<MaterialD>? materials,
    List<int>? meshMaterial,
    ModelSkeletonD? skeleton,
    List<TransformD>? currentPose,
    List<MatrixD>? boneMatrices,
  }) :
    _transform = transform ?? .new(),
    _skeleton = skeleton ?? .new()
  {
    _meshes = .new(meshes ?? [], originalPointer?.ref.meshes);
    _materials = .new(materials ?? [], originalPointer?.ref.materials);
    _meshMaterial = .new(meshMaterial ?? [], originalPointer?.ref.meshMaterial);
    _currentPose = .new(currentPose ?? [], originalPointer?.ref.currentPose);
    _boneMatrices = .new(boneMatrices ?? [], originalPointer?.ref.boneMatrices);
  }

  factory ModelD.zero() => .new();

  @override
  ModelD setD(ModelD o) {
    transform.setD(o.transform);
    meshes = .from(o.meshes);
    materials = .from(o.materials);
    meshMaterial = .from(o.meshMaterial);
    skeleton.setD(o.skeleton);
    currentPose = .from(o.currentPose);
    boneMatrices = .from(o.boneMatrices);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<ModelC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<ModelC> p, int index) => p[index];

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<ModelC> p, String key) {
    p.ref.meshes = temp.Mesh$.val.Array(meshes, key: '${key}_meshes');
    p.ref.materials = temp.Material$.val.Array(materials, key: '${key}_materials');
    p.ref.meshMaterial = temp.Int$.val.Array(meshMaterial, key: '${key}_meshMaterial');
    p.ref.currentPose = temp.Transform$.val.Array(currentPose, key: '${key}_currentPose');
    p.ref.boneMatrices = temp.Matrix$.val.Array(boneMatrices, key: '${key}_boneMatrices');
  }

  @override
  void nativeWriteInto(ModelC p) {
    transform.nativeWriteInto(p.transform);
    p.meshCount = meshes.length;
    p.materialCount = materials.length;

    if (p.meshes.address != 0) {
      for (int i = 0; i < meshes.length; i++) {
        _meshes.inner[i].nativeWriteInto((p.meshes + i).ref);
      }
    }

    if (p.materials.address != 0) {
      for (int i = 0; i < materials.length; i++) {
        _materials.inner[i].nativeWriteInto((p.materials + i).ref);
      }
    }

    if (p.meshMaterial.address != 0) {
      for (int i = 0; i < meshMaterial.length; i++) {
        p.meshMaterial[i] = _meshMaterial.inner[i];
      }
    }

    skeleton.nativeWriteInto(p.skeleton);

    if (p.currentPose.address != 0) {
      for (int i = 0; i < currentPose.length; i++) {
        _currentPose.inner[i].nativeWriteInto((p.currentPose + i).ref);
      }
    }

    if (p.boneMatrices.address != 0) {
      for (int i = 0; i < boneMatrices.length; i++) {
        _boneMatrices.inner[i].nativeWriteInto((p.boneMatrices + i).ref);
      }
    }
  }

  @override
  void nativeReadFrom(ModelC p) {
    structOnOp((o) {
      o.ref.meshes = p.meshes;
      o.ref.materials = p.materials;
      o.ref.meshMaterial = p.meshMaterial;
      o.ref.currentPose = p.currentPose;
      o.ref.boneMatrices = p.boneMatrices;
    });
    transform.nativeReadFrom(p.transform);
    if (p.meshes.address != 0) meshes = .generate(p.meshCount, (i) => (p.meshes + i).toD());
    if (p.materials.address != 0) materials = .generate(p.materialCount, (i) => (p.materials + i).toD());
    if (p.meshMaterial.address != 0) meshMaterial = .generate(p.meshCount, (i) => p.meshMaterial[i]);
    skeleton.nativeReadFrom(p.skeleton);
    if (p.currentPose.address != 0) currentPose = .generate(p.skeleton.boneCount, (i) => (p.currentPose + i).toD());
    if (p.boneMatrices.address != 0) boneMatrices = .generate(p.skeleton.boneCount, (i) => (p.boneMatrices + i).toD());
  }

  @override
  ModelD clone() => .new(
    originalPointer: originalPointer,
    transform: transform.clone(),
    meshes: meshes.map((x) => x.clone()).toList(),
    materials: materials.map((x) => x.clone()).toList(),
    meshMaterial: .from(meshMaterial),
    skeleton: skeleton.clone(),
    currentPose: currentPose.map((x) => x.clone()).toList(),
    boneMatrices: boneMatrices.map((x) => x.clone()).toList(),
  );
}