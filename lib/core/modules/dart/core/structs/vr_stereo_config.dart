part of '../../../../raylib_dartified.dart';

extension VrStereoConfigCPEx on Pointer<VrStereoConfigC> {
  Pointer<VrStereoConfigC> setC(VrStereoConfigC o) { ref.setC(o); return this; }
  Pointer<VrStereoConfigC> setD(VrStereoConfigD o) { ref.setD(o); return this; }
  VrStereoConfigD toD() => ref.toD(this);
}

extension VrStereoConfigCEx on VrStereoConfigC {
  int get paramsCount => VrStereoConfigBase.BASE_paramsCount;

  VrStereoConfigC setC(VrStereoConfigC o) {
    for (int i = 0; i < paramsCount; i++) {
      projection[i].setC(o.projection[i]);
    }
    for (int i = 0; i < paramsCount; i++) {
      viewOffset[i].setC(o.viewOffset[i]);
    }
    for (int i = 0; i < paramsCount; i++) {
      leftLensCenter[i] = o.leftLensCenter[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      rightLensCenter[i] = o.rightLensCenter[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      leftScreenCenter[i] = o.leftScreenCenter[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      rightScreenCenter[i] = o.rightScreenCenter[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      scale[i] = o.scale[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      scaleIn[i] = o.scaleIn[i];
    }

    return this;
  }

  VrStereoConfigC setD(VrStereoConfigD o) {
    for (int i = 0; i < paramsCount; i++) {
      projection[i].setD(o.projection[i]);
    }
    for (int i = 0; i < paramsCount; i++) {
      viewOffset[i].setD(o.viewOffset[i]);
    }
    for (int i = 0; i < paramsCount; i++) {
      leftLensCenter[i] = o.leftLensCenter[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      rightLensCenter[i] = o.rightLensCenter[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      leftScreenCenter[i] = o.leftScreenCenter[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      rightScreenCenter[i] = o.rightScreenCenter[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      scale[i] = o.scale[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      scaleIn[i] = o.scaleIn[i];
    }

    return this;
  }

  VrStereoConfigD toD([Pointer<VrStereoConfigC>? ptr]) => .new(
    originalPointer: ptr,
    projection: .generate(paramsCount, (i) => projection[i].toD()),
    viewOffset: .generate(paramsCount, (i) => viewOffset[i].toD()),
    leftLensCenter: .generate(paramsCount, (i) => leftLensCenter[i]),
    rightLensCenter: .generate(paramsCount, (i) => rightLensCenter[i]),
    leftScreenCenter: .generate(paramsCount, (i) => leftScreenCenter[i]),
    rightScreenCenter: .generate(paramsCount, (i) => rightScreenCenter[i]),
    scale: .generate(paramsCount, (i) => scale[i]),
    scaleIn: .generate(paramsCount, (i) => scaleIn[i]),
  );
}

class VrStereoConfigD extends StructD<VrStereoConfigC, VrStereoConfigD> with VrStereoConfigBase<
  VrStereoConfigD,
  MatrixD,
  Vector3D,
  QuaternionD,
  Vector4D
> {
  late NativeLiveListArrayStruct<MatrixC, MatrixD> _projection;
  @override get projection {
    structOnOp((p) => _projection.ptr = p.ref.projection);
    return _projection;
  }
  @override set projection(List<MatrixD> value) {
    assert(value.length <= paramsCount);
    structOnOp((p) => _projection.ptr = p.ref.projection);
    _projection.inner = value;
  }
  
  late NativeLiveListArrayStruct<MatrixC, MatrixD> _viewOffset;
  @override get viewOffset {
    structOnOp((p) => _viewOffset.ptr = p.ref.viewOffset);
    return _viewOffset;
  }
  @override set viewOffset(List<MatrixD> value) {
    assert(value.length <= paramsCount);
    structOnOp((p) => _viewOffset.ptr = p.ref.viewOffset);
    _viewOffset.inner = value;
  }
  
  late NativeLiveListArrayFloat _leftLensCenter;
  @override get leftLensCenter {
    structOnOp((p) => _leftLensCenter.ptr = p.ref.leftLensCenter);
    return _leftLensCenter;
  }
  @override set leftLensCenter(List<double> value) {
    assert(value.length <= paramsCount);
    structOnOp((p) => _leftLensCenter.ptr = p.ref.leftLensCenter);
    _leftLensCenter.inner = value;
  }
  
  late NativeLiveListArrayFloat _rightLensCenter;
  @override get rightLensCenter {
    structOnOp((p) => _rightLensCenter.ptr = p.ref.rightLensCenter);
    return _rightLensCenter;
  }
  @override set rightLensCenter(List<double> value) {
    assert(value.length <= paramsCount);
    structOnOp((p) => _rightLensCenter.ptr = p.ref.rightLensCenter);
    _rightLensCenter.inner = value;
  }
  
  late NativeLiveListArrayFloat _leftScreenCenter;
  @override get leftScreenCenter {
    structOnOp((p) => _leftScreenCenter.ptr = p.ref.leftScreenCenter);
    return _leftScreenCenter;
  }
  @override set leftScreenCenter(List<double> value) {
    assert(value.length <= paramsCount);
    structOnOp((p) => _leftScreenCenter.ptr = p.ref.leftScreenCenter);
    _leftScreenCenter.inner = value;
  }
  
  late NativeLiveListArrayFloat _rightScreenCenter;
  @override get rightScreenCenter {
    structOnOp((p) => _rightScreenCenter.ptr = p.ref.rightScreenCenter);
    return _rightScreenCenter;
  }
  @override set rightScreenCenter(List<double> value) {
    assert(value.length <= paramsCount);
    structOnOp((p) => _rightScreenCenter.ptr = p.ref.rightScreenCenter);
    _rightScreenCenter.inner = value;
  }
  
  late NativeLiveListArrayFloat _scale;
  @override get scale {
    structOnOp((p) => _scale.ptr = p.ref.scale);
    return _scale;
  }
  @override set scale(List<double> value) {
    assert(value.length <= paramsCount);
    structOnOp((p) => _scale.ptr = p.ref.scale);
    _scale.inner = value;
  }
  
  late NativeLiveListArrayFloat _scaleIn;
  @override get scaleIn {
    structOnOp((p) => _scaleIn.ptr = p.ref.scaleIn);
    return _scaleIn;
  }
  @override set scaleIn(List<double> value) {
    assert(value.length <= paramsCount);
    structOnOp((p) => _scaleIn.ptr = p.ref.scaleIn);
    _scaleIn.inner = value;
  }

  VrStereoConfigD({
    super.originalPointer,
    List<MatrixD>? projection,
    List<MatrixD>? viewOffset,
    List<double>? leftLensCenter,
    List<double>? rightLensCenter,
    List<double>? leftScreenCenter,
    List<double>? rightScreenCenter,
    List<double>? scale,
    List<double>? scaleIn,
  }) {
    _projection = .new(projection ?? .generate(paramsCount, (_) => .zero()), originalPointer?.ref.projection);
    _viewOffset = .new(viewOffset ?? .generate(paramsCount, (_) => .zero()), originalPointer?.ref.viewOffset);
    _leftLensCenter = .new(leftLensCenter ?? .filled(paramsCount, 0), originalPointer?.ref.leftLensCenter);
    _rightLensCenter = .new(rightLensCenter ?? .filled(paramsCount, 0), originalPointer?.ref.rightLensCenter);
    _leftScreenCenter = .new(leftScreenCenter ?? .filled(paramsCount, 0), originalPointer?.ref.leftScreenCenter);
    _rightScreenCenter = .new(rightScreenCenter ?? .filled(paramsCount, 0), originalPointer?.ref.rightScreenCenter);
    _scale = .new(scale ?? .filled(paramsCount, 0), originalPointer?.ref.scale);
    _scaleIn = .new(scaleIn ?? .filled(paramsCount, 0), originalPointer?.ref.scaleIn);
  }

  factory VrStereoConfigD.zero() => .new();

  @override
  VrStereoConfigD setD(VrStereoConfigD o) {
    projection = .from(o.projection);
    viewOffset = .from(o.viewOffset);
    leftLensCenter = .from(o.leftLensCenter);
    rightLensCenter = .from(o.rightLensCenter);
    leftScreenCenter = .from(o.leftScreenCenter);
    rightScreenCenter = .from(o.rightScreenCenter);
    scale = .from(o.scale);
    scaleIn = .from(o.scaleIn);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<VrStereoConfigC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<VrStereoConfigC> p, int index) => p[index];

  @override
  void nativeWriteInto(VrStereoConfigC p) {
    for (int i = 0; i < paramsCount; i++) {
      projection[i].nativeWriteInto(p.projection[i]);
    }
    for (int i = 0; i < paramsCount; i++) {
      viewOffset[i].nativeWriteInto(p.viewOffset[i]);
    }
    for (int i = 0; i < paramsCount; i++) {
      p.leftLensCenter[i] = _leftLensCenter.inner[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      p.rightLensCenter[i] = _rightLensCenter.inner[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      p.leftScreenCenter[i] = _leftScreenCenter.inner[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      p.rightScreenCenter[i] = _rightScreenCenter.inner[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      p.scale[i] = _scale.inner[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      p.scaleIn[i] = _scaleIn.inner[i];
    }
  }

  @override
  void nativeReadFrom(VrStereoConfigC p) {
    structOnOp((o) {
      o.ref.projection = p.projection;
      o.ref.viewOffset = p.viewOffset;
      o.ref.leftLensCenter = p.leftLensCenter;
      o.ref.rightLensCenter = p.rightLensCenter;
      o.ref.leftScreenCenter = p.leftScreenCenter;
      o.ref.rightScreenCenter = p.rightScreenCenter;
      o.ref.scale = p.scale;
      o.ref.scaleIn = p.scaleIn;
    });
    projection = .generate(paramsCount, (i) => p.projection[i].toD());
    viewOffset = .generate(paramsCount, (i) => p.viewOffset[i].toD());
    leftLensCenter = .generate(paramsCount, (i) => p.leftLensCenter[i]);
    rightLensCenter = .generate(paramsCount, (i) => p.rightLensCenter[i]);
    leftScreenCenter = .generate(paramsCount, (i) => p.leftScreenCenter[i]);
    rightScreenCenter = .generate(paramsCount, (i) => p.rightScreenCenter[i]);
    scale = .generate(paramsCount, (i) => p.scale[i]);
    scaleIn = .generate(paramsCount, (i) => p.scaleIn[i]);
  }

  @override
  VrStereoConfigD clone() => .new(
    originalPointer: originalPointer,
    projection: .from(projection),
    viewOffset: .from(viewOffset),
    leftLensCenter: .from(leftLensCenter),
    rightLensCenter: .from(rightLensCenter),
    leftScreenCenter: .from(leftScreenCenter),
    rightScreenCenter: .from(rightScreenCenter),
    scale: .from(scale),
    scaleIn: .from(scaleIn),
  );
}