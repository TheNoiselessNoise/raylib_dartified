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
    keyframeCount = o.keyframeCount;
    keyframePoses = o.keyframePoses;
    name = o.name;
    return this;
  }

  ModelAnimationC setD(ModelAnimationD o) {
    o.structOnOp((p) {
      boneCount = p.ref.boneCount;
      keyframeCount = p.ref.keyframeCount;
      keyframePoses = p.ref.keyframePoses;
      name = p.ref.name;
    });
    return this;
  }

  ModelAnimationD toD([Pointer<ModelAnimationC>? ptr]) => .new(
    originalPointer: ptr,
    keyframePoses: .generate(keyframeCount, (i) =>
      .generate(boneCount, (j) => (keyframePoses[i] + j).toD())
    ),
    name: name.toDartString(nameLength),
  );
}

class ModelAnimationD extends StructD<ModelAnimationC, ModelAnimationD> with ModelAnimationBase<
  ModelAnimationD,
  TransformD,
  Vector3D,
  MatrixD,
  QuaternionD,
  Vector4D
> {

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

  int _boneCount;
  @override get boneCount {
    structOnOp((p) => _boneCount = p.ref.boneCount);
    return _boneCount;
  }
  @override set boneCount(int value) {
    _boneCount = value;
    structOnOp((p) => p.ref.boneCount = value);
  }
  
  late NativeLiveListPointerPointerStruct<TransformC, TransformD> _keyframePoses;
  @override get keyframePoses {
    structOnOp((p) => _keyframePoses.ptr = p.ref.keyframePoses);
    return _keyframePoses;
  }
  @override set keyframePoses(List<List<TransformD>> value) {
    structOnOp((p) {
      _keyframePoses.ptr = p.ref.keyframePoses;
      p.ref.keyframeCount = value.length;
    });

    _keyframePoses.inner = .generate(value.length, (i) {
      return .new(value[i], _keyframePoses.innerPointer(i));
    });
  }

  ModelAnimationD({
    super.originalPointer,
    String name = '',
    List<List<TransformD>>? keyframePoses,
  }) :
    _name = name,
    _boneCount = keyframePoses?.firstOrNull?.length ?? 0
  {
    _keyframePoses = NativeLiveListPointerPointerStruct.fromList(keyframePoses, originalPointer?.ref.keyframePoses);
  }

  factory ModelAnimationD.zero() => .new();

  @override
  ModelAnimationD setD(ModelAnimationD o) {
    keyframePoses = .from(o.keyframePoses); 
    name = o.name;
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<ModelAnimationC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<ModelAnimationC> p, int index) => p[index];

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<ModelAnimationC> p, String key) {
    p.ref.keyframePoses = temp.allocPtrStruct<TransformC, TransformD>()
      .Fill(key: '${key}_keyframePoses', keyframePoses);

    p.ref.name.setDartString(name, nameLength);
  }

  @override
  void nativeWriteInto(ModelAnimationC p) {
    p.keyframeCount = keyframePoses.length;

    if (p.keyframePoses.address != 0) {
      for (int i = 0; i < keyframePoses.length; i++) {
        final innerPtr = (p.keyframePoses + i).value;

        for (int j = 0; j < keyframePoses[i].length; j++) {
          _keyframePoses.inner[i].inner[j].nativeWriteInto((innerPtr + j).ref);
        }
      }
    }

    p.name.setDartString(name, nameLength);
  }

  @override
  void nativeReadFrom(ModelAnimationC p) {
    structOnOp((o) {
      o.ref.keyframePoses = p.keyframePoses;
      o.ref.name = p.name;
    });
    if (p.keyframePoses.address != 0) keyframePoses = .generate(p.keyframeCount, (i) =>
      .generate(p.boneCount, (j) => (p.keyframePoses[i] + j).toD())
    );
    name = p.name.toDartString(nameLength);
  }

  @override
  ModelAnimationD clone() => .new(
    originalPointer: originalPointer,
    keyframePoses: keyframePoses.map((frame) => 
      frame.map((transform) => transform.clone()).toList()
    ).toList(),
    name: name,
  );
}