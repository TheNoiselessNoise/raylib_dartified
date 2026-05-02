part of '../../../../raylib.dart';

extension VrDeviceInfoCLike on VrDeviceInfoC {
  int get paramCount => 4;
}

extension VrDeviceInfoDLike on VrDeviceInfoD {
  int get paramCount => 4;
}

extension VrDeviceInfoCPEx on Pointer<VrDeviceInfoC> {
  Pointer<VrDeviceInfoC> setC(VrDeviceInfoC o) {
    ref.setC(o);
    return this;
  }
  
  Pointer<VrDeviceInfoC> setD(VrDeviceInfoD o) {
    ref.setD(o);
    return this;
  }

  VrDeviceInfoD toD() => ref.toD(this);
}

extension VrDeviceInfoCEx on VrDeviceInfoC {
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

class VrDeviceInfoD extends StructD<VrDeviceInfoD, VrDeviceInfoC> {
  int hResolution;
  int vResolution;
  double hScreenSize;
  double vScreenSize;
  double eyeToScreenDistance;
  double lensSeparationDistance;
  double interpupillaryDistance;
  late List<double> lensDistortionValues;
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
    onOriginalPointer((p) {
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
    originalPointer ??= o.originalPointer;
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
  Pointer<VrDeviceInfoC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.VrDeviceInfo$.At(key, count);

  @override
  void syncInto(RaylibTemp temp, Pointer<VrDeviceInfoC> p, String key)
    => writeInto(p.ref);

  @override
  void allocateInto(RaylibTemp temp, Pointer<VrDeviceInfoC> p, String key) {
    p.ref.hResolution = hResolution;
    p.ref.vResolution = vResolution;
    p.ref.hScreenSize = hScreenSize;
    p.ref.vScreenSize = vScreenSize;
    p.ref.eyeToScreenDistance = eyeToScreenDistance;
    p.ref.lensSeparationDistance = lensSeparationDistance;
    p.ref.interpupillaryDistance = interpupillaryDistance;

    for (int i = 0; i < paramCount; i++) {
      p.ref.lensDistortionValues[i] = lensDistortionValues[i];
    }

    for (int i = 0; i < paramCount; i++) {
      p.ref.chromaAbCorrection[i] = chromaAbCorrection[i];
    }
  }

  @override
  void writeInto(VrDeviceInfoC p) {
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
  String signature() => '$structName()';

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