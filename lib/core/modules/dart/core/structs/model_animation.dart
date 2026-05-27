part of '../../../../raylib_dartified.dart';

extension ModelAnimationCPEx on Pointer<ModelAnimationC> {
  Pointer<ModelAnimationC> setC(ModelAnimationC o) { ref.setC(o); return this; }
  Pointer<ModelAnimationC> setD(ModelAnimationD o) { ref.setD(o); return this; }
  ModelAnimationD toD() => ref.toD(this);
}

extension ModelAnimationCEx on ModelAnimationC {
  int get nameLength => ModelAnimationBase.BASE_nameLength;
  String get nameString => name.toDartString(nameLength);

  ModelAnimationC setC(ModelAnimationC o) {
    boneCount = o.boneCount;
    frameCount = o.frameCount;
    bones = o.bones;
    framePoses = o.framePoses;
    name = o.name;
    return this;
  }

  ModelAnimationC setD(ModelAnimationD o) {
    o.structOnOp((p) {
      boneCount = p.ref.boneCount;
      frameCount = p.ref.frameCount;
      bones = p.ref.bones;
      framePoses = p.ref.framePoses;
      name = p.ref.name;
    });
    return this;
  }

  ModelAnimationD toD([Pointer<ModelAnimationC>? ptr]) => .new(
    originalPointer: ptr,
    bones: .generate(boneCount, (i) => (bones + i).toD()),
    framePoses: .generate(frameCount, (i) =>
      .generate(boneCount, (j) => (framePoses[i] + j).toD())
    ),
    name: name.toDartString(nameLength),
  );
}

class ModelAnimationD extends StructD<ModelAnimationC, ModelAnimationD> with ModelAnimationBase<
  ModelAnimationD,
  BoneInfoD,
  TransformD,
  Vector3D,
  MatrixD,
  QuaternionD,
  Vector4D
> {
  
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
  
  late NativeLiveListPointerPointerStruct<TransformC, TransformD> _framePoses;
  @override get framePoses {
    structOnOp((p) => _framePoses.ptr = p.ref.framePoses);
    return _framePoses;
  }
  @override set framePoses(List<List<TransformD>> value) {
    structOnOp((p) {
      _framePoses.ptr = p.ref.framePoses;
      p.ref.frameCount = value.length;
    });

    _framePoses.inner = .generate(value.length, (i) {
      return .new(value[i], _framePoses.innerPointer(i));
    });
  }

  String _name;
  @override get name {
    structOnOp((p) => _name = p.ref.name.toDartString(nameLength));
    return _name;
  }
  @override set name(String value) {
    assert(value.length <= nameLength);
    _name = value;
    structOnOp((p) => p.ref.name.setDartString(value, nameLength));
  }

  ModelAnimationD({
    super.originalPointer,
    List<BoneInfoD>? bones,
    List<List<TransformD>>? framePoses,
    String name = '',
  }) :
    _name = name
  {
    _framePoses = NativeLiveListPointerPointerStruct.fromList(framePoses, originalPointer?.ref.framePoses);
    _bones = .new(bones ?? [], originalPointer?.ref.bones);
  }

  factory ModelAnimationD.zero() => .new();

  @override
  ModelAnimationD setD(ModelAnimationD o) {
    bones = .from(o.bones); 
    framePoses = .from(o.framePoses); 
    name = o.name;
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<ModelAnimationC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<ModelAnimationC> p, int index) => p[index];

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<ModelAnimationC> p, String key) {
    p.ref.bones = temp.BoneInfo$.Array(bones, key: '${key}_bones');

    p.ref.framePoses = temp.Ptr$Transform$.FillRaw(
      key: '${key}_framePoses',
      framePoses.length,
      (i) => temp.Transform$.Array(key: '${key}_framePoses_$i', framePoses[i]),
    );

    p.ref.name.setDartString(name, nameLength);
  }

  @override
  void nativeWriteInto(ModelAnimationC p) {
    p.boneCount = bones.length;
    p.frameCount = framePoses.length;

    if (p.bones.address != 0) {
      for (int i = 0; i < bones.length; i++) {
        _bones.inner[i].nativeWriteInto((p.bones + i).ref);
      }
    }

    if (p.framePoses.address != 0) {
      for (int i = 0; i < framePoses.length; i++) {
        final innerPtr = (p.framePoses + i).value;

        for (int j = 0; j < framePoses[i].length; j++) {
          _framePoses.inner[i].inner[j].nativeWriteInto((innerPtr + j).ref);
        }
      }
    }

    p.name.setDartString(name, nameLength);
  }

  @override
  void nativeReadFrom(ModelAnimationC p) {
    structOnOp((o) {
      o.ref.bones = p.bones;
      o.ref.framePoses = p.framePoses;
      o.ref.name = p.name;
    });
    if (p.bones.address != 0) bones = .generate(p.boneCount, (i) => (p.bones + i).toD());
    if (p.framePoses.address != 0) framePoses = .generate(p.frameCount, (i) =>
      .generate(p.boneCount, (j) => (p.framePoses[i] + j).toD())
    );
    name = p.name.toDartString(nameLength);
  }

  @override
  ModelAnimationD clone() => .new(
    originalPointer: originalPointer,
    bones: bones.map((x) => x.clone()).toList(),
    framePoses: framePoses.map((frame) => 
      frame.map((transform) => transform.clone()).toList()
    ).toList(),
    name: name,
  );
}