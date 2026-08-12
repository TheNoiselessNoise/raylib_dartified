part of '../../../../raylib_dartified.dart';

extension ModelSkeletonCPEx on Pointer<ModelSkeletonC> {
  Pointer<ModelSkeletonC> setC(ModelSkeletonC o) { ref.setC(o); return this; }
  Pointer<ModelSkeletonC> setD(ModelSkeletonD o) { ref.setD(o); return this; }
  ModelSkeletonD toD() => ref.toD(this);
}

extension ModelSkeletonCEx on ModelSkeletonC {
  ModelSkeletonC setC(ModelSkeletonC o) {
    boneCount = o.boneCount;
    bones = o.bones;
    bindPose = o.bindPose;
    return this;
  }

  ModelSkeletonC setD(ModelSkeletonD o) {
    o.structOnOp((p) {
      boneCount = p.ref.boneCount;
      bones = p.ref.bones;
      bindPose = p.ref.bindPose;
    });
    return this;
  }

  ModelSkeletonD toD([Pointer<ModelSkeletonC>? ptr]) => .new(
    originalPointer: ptr,
    bones: .generate(boneCount, (i) => (bones + i).toD()),
    bindPose: .generate(boneCount, (i) =>  (bindPose + i).toD()),
  );
}

class ModelSkeletonD extends StructD<ModelSkeletonC, ModelSkeletonD> with ModelSkeletonBase<
  ModelSkeletonD,
  BoneInfoD,
  TransformD,
  Vector3D,
  MatrixD,
  QuaternionD,
  Vector4D
> {

  int _boneCount;
  @override get boneCount {
    structOnOp((p) => _boneCount = p.ref.boneCount);
    return _boneCount;
  }
  @override set boneCount(int value) {
    _boneCount = value;
    structOnOp((p) => p.ref.boneCount = value);
  }
  
  late NativeLiveListPointerStruct<BoneInfoC, BoneInfoD> _bones;
  @override get bones {
    structOnOp((p) => _bones.ptr = p.ref.bones);
    return _bones;
  }
  @override set bones(List<BoneInfoD> value) {
    structOnOp((p) {
      _bones.ptr = p.ref.bones;
      p.ref.boneCount = value.length;
    });
    _bones.inner = value;
  }

  late NativeLiveListPointerStruct<TransformC, TransformD> _bindPose;
  @override get bindPose {
    structOnOp((p) => _bindPose.ptr = p.ref.bindPose);
    return _bindPose;
  }
  @override set bindPose(List<TransformD> value) {
    structOnOp((p) {
      _bindPose.ptr = p.ref.bindPose;
      p.ref.boneCount = value.length;
    });
    _bindPose.inner = value;
  }
  
  ModelSkeletonD({
    super.originalPointer,
    List<BoneInfoD>? bones,
    List<TransformD>? bindPose,
  }) : _boneCount = bones?.length ?? 0 {
    _bones = .new(bones ?? [], originalPointer?.ref.bones);
    _bindPose = .new(bindPose ?? [], originalPointer?.ref.bindPose);
  }

  factory ModelSkeletonD.zero() => .new();

  @override
  ModelSkeletonD setD(ModelSkeletonD o) {
    boneCount = o.boneCount;
    bones = .from(o.bones);
    bindPose = .from(o.bindPose);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<ModelSkeletonC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<ModelSkeletonC> p, int index) => p[index];

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<ModelSkeletonC> p, String key) {
    p.ref.bones = temp.BoneInfo$.Array(bones, key: '${key}_bones');
    p.ref.bindPose = temp.Transform$.Array(bindPose, key: '${key}_bindPose');
  }

  @override
  void nativeWriteInto(ModelSkeletonC p) {
    p.boneCount = bones.length;
    
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
  void nativeReadFrom(ModelSkeletonC p) {
    structOnOp((o) {
      o.ref.boneCount = p.boneCount;
      o.ref.bones = p.bones;
      o.ref.bindPose = p.bindPose;
    });
    if (p.bones.address != 0) bones = .generate(p.boneCount, (i) => (p.bones + i).toD());
    if (p.bindPose.address != 0) bindPose = .generate(p.boneCount, (i) => (p.bindPose + i).toD());
  }

  @override
  ModelSkeletonD clone() => .new(
    originalPointer: originalPointer,
    bones: bones.map((x) => x.clone()).toList(),
    bindPose: bindPose.map((x) => x.clone()).toList(),
  );
}