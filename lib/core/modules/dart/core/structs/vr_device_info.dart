part of '../../../../raylib_dartified.dart';

extension VrDeviceInfoCPEx on Pointer<VrDeviceInfoC> {
  Pointer<VrDeviceInfoC> setC(VrDeviceInfoC o) { ref.setC(o); return this; }
  Pointer<VrDeviceInfoC> setD(VrDeviceInfoD o) { ref.setD(o); return this; }
  VrDeviceInfoD toD() => ref.toD(this);
}

extension VrDeviceInfoCEx on VrDeviceInfoC {
  int get paramsCount => VrDeviceInfoBase.BASE_paramsCount;

  VrDeviceInfoC setC(VrDeviceInfoC o) {
    hResolution = o.hResolution;
    vResolution = o.vResolution;
    hScreenSize = o.hScreenSize;
    vScreenSize = o.vScreenSize;
    eyeToScreenDistance = o.eyeToScreenDistance;
    lensSeparationDistance = o.lensSeparationDistance;
    interpupillaryDistance = o.interpupillaryDistance;

    for (int i = 0; i < paramsCount; i++) {
      lensDistortionValues[i] = o.lensDistortionValues[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      chromaAbCorrection[i] = o.chromaAbCorrection[i];
    }
    return this;
  }

  VrDeviceInfoC setD(VrDeviceInfoD o) {
    hResolution = o.hResolution;
    vResolution = o.vResolution;
    hScreenSize = o.hScreenSize;
    vScreenSize = o.vScreenSize;
    eyeToScreenDistance = o.eyeToScreenDistance;
    lensSeparationDistance = o.lensSeparationDistance;
    interpupillaryDistance = o.interpupillaryDistance;

    for (int i = 0; i < paramsCount; i++) {
      lensDistortionValues[i] = o.lensDistortionValues[i];
    }
    for (int i = 0; i < paramsCount; i++) {
      chromaAbCorrection[i] = o.chromaAbCorrection[i];
    }
    return this;
  }

  VrDeviceInfoD toD([Pointer<VrDeviceInfoC>? ptr]) => .new(
    originalPointer: ptr,
    hResolution: hResolution,
    vResolution: vResolution,
    hScreenSize: hScreenSize,
    vScreenSize: vScreenSize,
    eyeToScreenDistance: eyeToScreenDistance,
    lensSeparationDistance: lensSeparationDistance,
    interpupillaryDistance: interpupillaryDistance,
    lensDistortionValues: .generate(paramsCount, (i) => lensDistortionValues[i]),
    chromaAbCorrection: .generate(paramsCount, (i) => chromaAbCorrection[i]),
  );
}

class VrDeviceInfoD extends StructD<VrDeviceInfoC, VrDeviceInfoD> with VrDeviceInfoBase<VrDeviceInfoD> {
  int _hResolution;
  @override get hResolution {
    structOnOriginalPointer((p) => _hResolution = p.ref.hResolution);
    return _hResolution;
  }
  @override set hResolution(int value) {
    _hResolution = value;
    structOnOriginalPointer((p) => p.ref.hResolution = value);
  }
  
  int _vResolution;
  @override get vResolution {
    structOnOriginalPointer((p) => _vResolution = p.ref.vResolution);
    return _vResolution;
  }
  @override set vResolution(int value) {
    _vResolution = value;
    structOnOriginalPointer((p) => p.ref.vResolution = value);
  }
  
  double _hScreenSize;
  @override get hScreenSize {
    structOnOriginalPointer((p) => _hScreenSize = p.ref.hScreenSize);
    return _hScreenSize;
  }
  @override set hScreenSize(double value) {
    _hScreenSize = value;
    structOnOriginalPointer((p) => p.ref.hScreenSize = value);
  }
  
  double _vScreenSize;
  @override get vScreenSize {
    structOnOriginalPointer((p) => _vScreenSize = p.ref.vScreenSize);
    return _vScreenSize;
  }
  @override set vScreenSize(double value) {
    _vScreenSize = value;
    structOnOriginalPointer((p) => p.ref.vScreenSize = value);
  }
  
  double _eyeToScreenDistance;
  @override get eyeToScreenDistance {
    structOnOriginalPointer((p) => _eyeToScreenDistance = p.ref.eyeToScreenDistance);
    return _eyeToScreenDistance;
  }
  @override set eyeToScreenDistance(double value) {
    _eyeToScreenDistance = value;
    structOnOriginalPointer((p) => p.ref.eyeToScreenDistance = value);
  }
  
  double _lensSeparationDistance;
  @override get lensSeparationDistance {
    structOnOriginalPointer((p) => _lensSeparationDistance = p.ref.lensSeparationDistance);
    return _lensSeparationDistance;
  }
  @override set lensSeparationDistance(double value) {
    _lensSeparationDistance = value;
    structOnOriginalPointer((p) => p.ref.lensSeparationDistance = value);
  }
  
  double _interpupillaryDistance;
  @override get interpupillaryDistance {
    structOnOriginalPointer((p) => _interpupillaryDistance = p.ref.interpupillaryDistance);
    return _interpupillaryDistance;
  }
  @override set interpupillaryDistance(double value) {
    _interpupillaryDistance = value;
    structOnOriginalPointer((p) => p.ref.interpupillaryDistance = value);
  }
  
  late NativeLiveListArrayFloat _lensDistortionValues;
  @override get lensDistortionValues {
    structOnOriginalPointer((p) => _lensDistortionValues.ptr = p.ref.lensDistortionValues);
    return _lensDistortionValues;
  }
  @override set lensDistortionValues(List<double> value) {
    assert(value.length <= paramsCount);
    structOnOriginalPointer((p) => _lensDistortionValues.ptr = p.ref.lensDistortionValues);
    _lensDistortionValues.inner = value;
  }
  
  late NativeLiveListArrayFloat _chromaAbCorrection;
  @override get chromaAbCorrection {
    structOnOriginalPointer((p) => _chromaAbCorrection.ptr = p.ref.chromaAbCorrection);
    return _chromaAbCorrection;
  }
  @override set chromaAbCorrection(List<double> value) {
    assert(value.length <= paramsCount);
    structOnOriginalPointer((p) => _chromaAbCorrection.ptr = p.ref.chromaAbCorrection);
    _chromaAbCorrection.inner = value;
  }

  VrDeviceInfoD({
    super.originalPointer,
    int hResolution = 0,
    int vResolution = 0,
    double hScreenSize = 0,
    double vScreenSize = 0,
    double eyeToScreenDistance = 0,
    double lensSeparationDistance = 0,
    double interpupillaryDistance = 0,
    List<double>? lensDistortionValues,
    List<double>? chromaAbCorrection,
  }) :
    _hResolution = hResolution,
    _vResolution = vResolution,
    _hScreenSize = hScreenSize,
    _vScreenSize = vScreenSize,
    _eyeToScreenDistance = eyeToScreenDistance,
    _lensSeparationDistance = lensSeparationDistance,
    _interpupillaryDistance = interpupillaryDistance
  {
    _lensDistortionValues = .new(lensDistortionValues ?? .filled(paramsCount, 0), originalPointer?.ref.lensDistortionValues);
    _chromaAbCorrection = .new(chromaAbCorrection ?? .filled(paramsCount, 0), originalPointer?.ref.chromaAbCorrection);
  }

  factory VrDeviceInfoD.zero() => .new();

  @override
  VrDeviceInfoD setD(VrDeviceInfoD o) {
    hResolution = o.hResolution;
    vResolution = o.vResolution;
    hScreenSize = o.hScreenSize;
    vScreenSize = o.vScreenSize;
    eyeToScreenDistance = o.eyeToScreenDistance;
    lensSeparationDistance = o.lensSeparationDistance;
    interpupillaryDistance = o.interpupillaryDistance;
    lensDistortionValues = .from(o.lensDistortionValues);
    chromaAbCorrection = .from(o.chromaAbCorrection);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<VrDeviceInfoC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<VrDeviceInfoC> p, int index) => p[index];

  @override
  void nativeWriteInto(VrDeviceInfoC p) {
    p.hResolution = hResolution;
    p.vResolution = vResolution;
    p.hScreenSize = hScreenSize;
    p.vScreenSize = vScreenSize;
    p.eyeToScreenDistance = eyeToScreenDistance;
    p.lensSeparationDistance = lensSeparationDistance;
    p.interpupillaryDistance = interpupillaryDistance;

    for (int i = 0; i < paramsCount; i++) {
      p.lensDistortionValues[i] = _lensDistortionValues.inner[i];
    }

    for (int i = 0; i < paramsCount; i++) {
      p.chromaAbCorrection[i] = _chromaAbCorrection.inner[i];
    }
  }

  @override
  void nativeReadFrom(VrDeviceInfoC p) {
    structOnOriginalPointer((o) {
      o.ref.lensDistortionValues = p.lensDistortionValues;
      o.ref.chromaAbCorrection = p.chromaAbCorrection;
    });
    hResolution = p.hResolution;
    vResolution = p.vResolution;
    hScreenSize = p.hScreenSize;
    vScreenSize = p.vScreenSize;
    eyeToScreenDistance = p.eyeToScreenDistance;
    lensSeparationDistance = p.lensSeparationDistance;
    interpupillaryDistance = p.interpupillaryDistance;
    lensDistortionValues = .generate(paramsCount, (i) => p.lensDistortionValues[i]);
    chromaAbCorrection = .generate(paramsCount, (i) => p.chromaAbCorrection[i]);
  }

  @override
  VrDeviceInfoD clone() => .new(
    originalPointer: originalPointer,
    hResolution: hResolution,
    vResolution: vResolution,
    hScreenSize: hScreenSize,
    vScreenSize: vScreenSize,
    eyeToScreenDistance: eyeToScreenDistance,
    lensSeparationDistance: lensSeparationDistance,
    interpupillaryDistance: interpupillaryDistance,
    lensDistortionValues: .from(lensDistortionValues),
    chromaAbCorrection: .from(chromaAbCorrection),
  );
}