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
    o.structOnOriginalPointer((p) {
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
    bones: .generate(boneCount, (i) => bones[i].toD()),
    framePoses: .generate(frameCount, (i) =>
      .generate(boneCount, (j) => framePoses[i][j].toD())
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
  @override
  List<BoneInfoD> bones;
  
  @override
  List<List<TransformD>> framePoses;
  
  @override
  String name;

  ModelAnimationD({
    super.originalPointer,
    List<BoneInfoD>? bones,
    List<List<TransformD>>? framePoses,
    this.name = '',
  }) :
    bones = bones ?? [],
    framePoses = framePoses ?? [];

  factory ModelAnimationD.zero() => .new();

  @override
  ModelAnimationD setC(ModelAnimationC o) {
    structOnOriginalPointer((p) {
      p.ref.bones = o.bones;
      p.ref.framePoses = o.framePoses;
      p.ref.name = o.name;
    });
    bones = .generate(o.boneCount, (i) => o.bones[i].toD());
    framePoses = .generate(o.frameCount, (i) =>
      .generate(o.boneCount, (j) => o.framePoses[i][j].toD())
    );
    name = o.name.toDartString(nameLength);
    return this;
  }

  @override
  ModelAnimationD setD(ModelAnimationD o) {
    bones = .from(o.bones); 
    framePoses = .from(o.framePoses); 
    name = o.name;
    return this;
  }

  @override
  getReference(Pointer<ModelAnimationC> p) => p.ref;

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

    for (int i = 0; i < bones.length; i++) {
      bones[i].nativeWriteInto((p.bones + i).ref);
    }

    for (int i = 0; i < framePoses.length; i++) {
      final innerPtr = (p.framePoses + i).value;

      for (int j = 0; j < framePoses[i].length; j++) {
        framePoses[i][j].nativeWriteInto((innerPtr + j).ref);
      }
    }

    p.name.setDartString(name, nameLength);
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