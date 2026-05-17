part of '../../../../raylib.dart';

extension ModelCPEx on Pointer<ModelC> {
  Pointer<ModelC> setC(ModelC o) {
    ref.setC(o);
    return this;
  }
  
  Pointer<ModelC> setD(ModelD o) {
    ref.setD(o);
    return this;
  }

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
    o.structOnOriginalPointer((p) {
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

class ModelD extends StructD<ModelC, ModelD> with ModelBase {
  @override
  MatrixD transform;
  
  @override
  List<MeshD> meshes;
  
  @override
  List<MaterialD> materials;
  
  @override
  List<int> meshMaterial;
  
  @override
  List<BoneInfoD> bones;
  
  @override
  List<TransformD> bindPose;

  ModelD({
    super.originalPointer,
    MatrixD? transform,
    List<MeshD>? meshes,
    List<MaterialD>? materials,
    List<int>? meshMaterial,
    List<BoneInfoD>? bones,
    List<TransformD>? bindPose,
  }) :
    transform = transform ?? .new(),
    meshes = meshes ?? [],
    materials = materials ?? [],
    meshMaterial = meshMaterial ?? [],
    bones = bones ?? [],
    bindPose = bindPose ?? [];

  factory ModelD.zero() => .new();

  @override
  ModelD setC(ModelC o) {
    structOnOriginalPointer((p) {
      p.ref.meshes = o.meshes;
      p.ref.materials = o.materials;
      p.ref.meshMaterial = o.meshMaterial;
      p.ref.bones = o.bones;
      p.ref.bindPose = o.bindPose;
    });
    transform.setC(o.transform);
    meshes = o.meshes.address != 0 ? .generate(o.meshCount, (i) => (o.meshes + i).toD()) : [];
    materials = o.materials.address != 0 ? .generate(o.materialCount, (i) => (o.materials + i).toD()) : [];
    meshMaterial = o.meshMaterial.address != 0 ? .generate(o.meshCount, (i) => o.meshMaterial[i]) : [];
    bones = o.bones.address != 0 ? .generate(o.boneCount, (i) => (o.bones + i).toD()) : [];
    bindPose = o.bindPose.address != 0 ? .generate(o.boneCount, (i) => (o.bindPose + i).toD()) : [];
    return this;
  }

  @override
  ModelD setD(ModelD o) {
    originalPointer ??= o.originalPointer;
    transform.setD(o.transform);
    meshes = .from(o.meshes);
    materials = .from(o.materials);
    meshMaterial = .from(o.meshMaterial);
    bones = .from(o.bones);
    bindPose = .from(o.bindPose);
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.Model$;

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
        meshes[i].nativeWriteInto((p.meshes + i).ref);
      }
    }

    if (p.materials.address != 0) {
      for (int i = 0; i < materials.length; i++) {
        materials[i].nativeWriteInto((p.materials + i).ref);
      }
    }

    if (p.meshMaterial.address != 0) {
      for (int i = 0; i < meshMaterial.length; i++) {
        p.meshMaterial[i] = meshMaterial[i];
      }
    }

    if (p.bones.address != 0) {
      for (int i = 0; i < bones.length; i++) {
        bones[i].nativeWriteInto((p.bones + i).ref);
      }
    }

    if (p.bindPose.address != 0) {
      for (int i = 0; i < bindPose.length; i++) {
        bindPose[i].nativeWriteInto((p.bindPose + i).ref);
      }
    }
  }

  @override
  String signature() => '$structName(transform: $transform, meshes: ${meshes.length}, materials: ${materials.length}, bones: ${bones.length}, ...)';

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