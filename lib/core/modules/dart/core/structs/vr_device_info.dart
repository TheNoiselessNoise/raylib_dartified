part of '../../../../raylib_dartified.dart';

extension VrDeviceInfoCPEx on Pointer<VrDeviceInfoC> {
  Pointer<VrDeviceInfoC> setC(VrDeviceInfoC o) { ref.setC(o); return this; }
  Pointer<VrDeviceInfoC> setD(VrDeviceInfoD o) { ref.setD(o); return this; }
  VrDeviceInfoD toD() => ref.toD(this);
}

extension VrDeviceInfoCEx on VrDeviceInfoC {
  int get paramCount => VrDeviceInfoBase.BASE_paramCount;

  VrDeviceInfoC setC(VrDeviceInfoC o) {
    hResolution = o.hResolution;
    vResolution = o.vResolution;
    hScreenSize = o.hScreenSize;
    vScreenSize = o.vScreenSize;
    eyeToScreenDistance = o.eyeToScreenDistance;
    lensSeparationDistance = o.lensSeparationDistance;
    interpupillaryDistance = o.interpupillaryDistance;

    for (int i = 0; i < paramCount; i++) {
      lensDistortionValues[i] = o.lensDistortionValues[i];
    }
    for (int i = 0; i < paramCount; i++) {
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

    for (int i = 0; i < paramCount; i++) {
      lensDistortionValues[i] = o.lensDistortionValues[i];
    }
    for (int i = 0; i < paramCount; i++) {
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
    lensDistortionValues: .generate(paramCount, (i) => lensDistortionValues[i]),
    chromaAbCorrection: .generate(paramCount, (i) => chromaAbCorrection[i]),
  );
}

class VrDeviceInfoD extends StructD<VrDeviceInfoC, VrDeviceInfoD> with VrDeviceInfoBase<VrDeviceInfoD> {
  @override
  int hResolution;
  
  @override
  int vResolution;
  
  @override
  double hScreenSize;
  
  @override
  double vScreenSize;
  
  @override
  double eyeToScreenDistance;
  
  @override
  double lensSeparationDistance;
  
  @override
  double interpupillaryDistance;
  
  @override
  late List<double> lensDistortionValues;
  
  @override
  late List<double> chromaAbCorrection;

  VrDeviceInfoD({
    super.originalPointer,
    this.hResolution = 0,
    this.vResolution = 0,
    this.hScreenSize = 0,
    this.vScreenSize = 0,
    this.eyeToScreenDistance = 0,
    this.lensSeparationDistance = 0,
    this.interpupillaryDistance = 0,
    List<double>? lensDistortionValues,
    List<double>? chromaAbCorrection,
  }) {
    this.lensDistortionValues = lensDistortionValues ?? .filled(paramCount, 0);
    this.chromaAbCorrection = chromaAbCorrection ?? .filled(paramCount, 0);
  }

  factory VrDeviceInfoD.zero() => .new();

  @override
  VrDeviceInfoD setC(VrDeviceInfoC o) {
    structOnOriginalPointer((p) {
      p.ref.lensDistortionValues = o.lensDistortionValues;
      p.ref.chromaAbCorrection = o.chromaAbCorrection;
    });
    hResolution = o.hResolution;
    vResolution = o.vResolution;
    hScreenSize = o.hScreenSize;
    vScreenSize = o.vScreenSize;
    eyeToScreenDistance = o.eyeToScreenDistance;
    lensSeparationDistance = o.lensSeparationDistance;
    interpupillaryDistance = o.interpupillaryDistance;
    lensDistortionValues = .generate(paramCount, (i) => o.lensDistortionValues[i]);
    chromaAbCorrection = .generate(paramCount, (i) => o.chromaAbCorrection[i]);
    return this;
  }

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
  getReference(Pointer<VrDeviceInfoC> p) => p.ref;

  @override
  void nativeWriteInto(VrDeviceInfoC p) {
    p.hResolution = hResolution;
    p.vResolution = vResolution;
    p.hScreenSize = hScreenSize;
    p.vScreenSize = vScreenSize;
    p.eyeToScreenDistance = eyeToScreenDistance;
    p.lensSeparationDistance = lensSeparationDistance;
    p.interpupillaryDistance = interpupillaryDistance;

    for (int i = 0; i < paramCount; i++) {
      p.lensDistortionValues[i] = lensDistortionValues[i];
    }

    for (int i = 0; i < paramCount; i++) {
      p.chromaAbCorrection[i] = chromaAbCorrection[i];
    }
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