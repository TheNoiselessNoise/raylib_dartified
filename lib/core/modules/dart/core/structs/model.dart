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
    boneCount = o.boneCount;
    bones = o.bones;
    bindPose = o.bindPose;
    return this;
  }

  ModelC setD(ModelD o) {
    o.structOnOp((p) {
      meshCount = p.ref.meshCount;
      materialCount = p.ref.materialCount;
      meshes = p.ref.meshes;
      materials = p.ref.materials;
      meshMaterial = p.ref.meshMaterial;
      boneCount = p.ref.boneCount;
      bones = p.ref.bones;
      bindPose = p.ref.bindPose;
    });
    transform.setD(o.transform);
    return this;
  }

  ModelD toD([Pointer<ModelC>? ptr]) => .new(
    originalPointer: ptr,
    transform: transform.toD(),
    meshes: .generate(meshCount, (i) => (meshes + i).toD()),
    materials: .generate(materialCount, (i) => (materials + i).toD()),
    meshMaterial: .generate(meshCount, (i) => meshMaterial[i]),
    bones: .generate(boneCount, (i) => (bones + i).toD()),
    bindPose: .generate(boneCount, (i) =>  (bindPose + i).toD()),
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
  BoneInfoD
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
  
  late NativeLiveListPointerStruct<BoneInfoC, BoneInfoD> _bones;
  @override get bones {
    structOnOp((p) => _bones.ptr = p.ref.bones);
    return _bones;
  }
  @override set bones(List<BoneInfoD> value) {
    structOnOp((p) => _bones.ptr = p.ref.bones);
    _bones.inner = value;
  }
  
  late NativeLiveListPointerStruct<TransformC, TransformD> _bindPose;
  @override get bindPose {
    structOnOp((p) => _bindPose.ptr = p.ref.bindPose);
    return _bindPose;
  }
  @override set bindPose(List<TransformD> value) {
    structOnOp((p) => _bindPose.ptr = p.ref.bindPose);
    _bindPose.inner = value;
  }

  ModelD({
    super.originalPointer,
    MatrixD? transform,
    List<MeshD>? meshes,
    List<MaterialD>? materials,
    List<int>? meshMaterial,
    List<BoneInfoD>? bones,
    List<TransformD>? bindPose,
  }) :
    _transform = transform ?? .new()
  {
    _meshes = .new(meshes ?? [], originalPointer?.ref.meshes);
    _materials = .new(materials ?? [], originalPointer?.ref.materials);
    _meshMaterial = .new(meshMaterial ?? [], originalPointer?.ref.meshMaterial);
    _bones = .new(bones ?? [], originalPointer?.ref.bones);
    _bindPose = .new(bindPose ?? [], originalPointer?.ref.bindPose);
  }

  factory ModelD.zero() => .new();

  @override
  ModelD setD(ModelD o) {
    transform.setD(o.transform);
    meshes = .from(o.meshes);
    materials = .from(o.materials);
    meshMaterial = .from(o.meshMaterial);
    bones = .from(o.bones);
    bindPose = .from(o.bindPose);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<ModelC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<ModelC> p, int index) => p[index];

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<ModelC> p, String key) {
    p.ref.meshes = temp.Mesh$.Array(meshes, key: '${key}_meshes');
    p.ref.materials = temp.Material$.Array(materials, key: '${key}_materials');
    p.ref.meshMaterial = temp.Int$.Array(meshMaterial, key: '${key}_meshMaterial');
    p.ref.bones = temp.BoneInfo$.Array(bones, key: '${key}_bones');
    p.ref.bindPose = temp.Transform$.Array(bindPose, key: '${key}_bindPose');
  }

  @override
  void nativeWriteInto(ModelC p) {
    transform.nativeWriteInto(p.transform);
    p.meshCount = meshes.length;
    p.materialCount = materials.length;
    p.boneCount = bones.length;

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

    if (p.bones.address != 0) {
      for (int i = 0; i < bones.length; i++) {
        _bones.inner[i].nativeWriteInto((p.bones + i).ref);
      }
    }

    if (p.bindPose.address != 0) {
      for (int i = 0; i < bindPose.length; i++) {
        _bindPose.inner[i].nativeWriteInto((p.bindPose + i).ref);
      }
    }
  }

  @override
  void nativeReadFrom(ModelC p) {
    structOnOp((o) {
      o.ref.meshes = p.meshes;
      o.ref.materials = p.materials;
      o.ref.meshMaterial = p.meshMaterial;
      o.ref.bones = p.bones;
      o.ref.bindPose = p.bindPose;
    });
    transform.nativeReadFrom(p.transform);
    if (p.meshes.address != 0) meshes = .generate(p.meshCount, (i) => (p.meshes + i).toD());
    if (p.materials.address != 0) materials = .generate(p.materialCount, (i) => (p.materials + i).toD());
    if (p.meshMaterial.address != 0) meshMaterial = .generate(p.meshCount, (i) => p.meshMaterial[i]);
    if (p.bones.address != 0) bones = .generate(p.boneCount, (i) => (p.bones + i).toD());
    if (p.bindPose.address != 0) bindPose = .generate(p.boneCount, (i) => (p.bindPose + i).toD());
  }

  @override
  ModelD clone() => .new(
    originalPointer: originalPointer,
    transform: transform.clone(),
    meshes: meshes.map((x) => x.clone()).toList(),
    materials: materials.map((x) => x.clone()).toList(),
    meshMaterial: .from(meshMaterial),
    bones: bones.map((x) => x.clone()).toList(),
    bindPose: bindPose.map((x) => x.clone()).toList(),
  );
}