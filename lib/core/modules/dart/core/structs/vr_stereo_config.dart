part of '../../../../raylib.dart';

extension VrStereoConfigCLike on VrStereoConfigC {
  int get paramCount => 2;
}

extension VrStereoConfigDLike on VrStereoConfigD {
  int get paramCount => 2;
}

extension VrStereoConfigCPEx on Pointer<VrStereoConfigC> {
  Pointer<VrStereoConfigC> setC(VrStereoConfigC o) {
    ref.setC(o);
    return this;
  }
  
  Pointer<VrStereoConfigC> setD(VrStereoConfigD o) {
    ref.setD(o);
    return this;
  }

  VrStereoConfigD toD() => ref.toD(this);
}

extension VrStereoConfigCEx on VrStereoConfigC {
  VrStereoConfigC setC(VrStereoConfigC o) {
    for (int i = 0; i < paramCount; i++) {
      projection[i].setC(o.projection[i]);
    }
    for (int i = 0; i < paramCount; i++) {
      viewOffset[i].setC(o.viewOffset[i]);
    }
    for (int i = 0; i < paramCount; i++) {
      leftLensCenter[i] = o.leftLensCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      rightLensCenter[i] = o.rightLensCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      leftScreenCenter[i] = o.leftScreenCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      rightScreenCenter[i] = o.rightScreenCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      scale[i] = o.scale[i];
    }
    for (int i = 0; i < paramCount; i++) {
      scaleIn[i] = o.scaleIn[i];
    }

    return this;
  }

  VrStereoConfigC setD(VrStereoConfigD o) {
    for (int i = 0; i < paramCount; i++) {
      projection[i].setD(o.projection[i]);
    }
    for (int i = 0; i < paramCount; i++) {
      viewOffset[i].setD(o.viewOffset[i]);
    }
    for (int i = 0; i < paramCount; i++) {
      leftLensCenter[i] = o.leftLensCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      rightLensCenter[i] = o.rightLensCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      leftScreenCenter[i] = o.leftScreenCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      rightScreenCenter[i] = o.rightScreenCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      scale[i] = o.scale[i];
    }
    for (int i = 0; i < paramCount; i++) {
      scaleIn[i] = o.scaleIn[i];
    }

    return this;
  }

  VrStereoConfigD toD([Pointer<VrStereoConfigC>? ptr]) => .new(
    originalPointer: ptr,
    projection: .generate(paramCount, (i) => projection[i].toD()),
    viewOffset: .generate(paramCount, (i) => viewOffset[i].toD()),
    leftLensCenter: .generate(paramCount, (i) => leftLensCenter[i]),
    rightLensCenter: .generate(paramCount, (i) => rightLensCenter[i]),
    leftScreenCenter: .generate(paramCount, (i) => leftScreenCenter[i]),
    rightScreenCenter: .generate(paramCount, (i) => rightScreenCenter[i]),
    scale: .generate(paramCount, (i) => scale[i]),
    scaleIn: .generate(paramCount, (i) => scaleIn[i]),
  );
}

class VrStereoConfigD extends StructD<VrStereoConfigD, VrStereoConfigC> {
  late List<MatrixD> projection;
  late List<MatrixD> viewOffset;
  late List<double> leftLensCenter;
  late List<double> rightLensCenter;
  late List<double> leftScreenCenter;
  late List<double> rightScreenCenter;
  late List<double> scale;
  late List<double> scaleIn;

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
    this.projection = projection ?? .generate(paramCount, (_) => .zero());
    this.viewOffset = viewOffset ?? .generate(paramCount, (_) => .zero());
    this.leftLensCenter = leftLensCenter ?? .filled(paramCount, 0);
    this.rightLensCenter = rightLensCenter ?? .filled(paramCount, 0);
    this.leftScreenCenter = leftScreenCenter ?? .filled(paramCount, 0);
    this.rightScreenCenter = rightScreenCenter ?? .filled(paramCount, 0);
    this.scale = scale ?? .filled(paramCount, 0);
    this.scaleIn = scaleIn ?? .filled(paramCount, 0);
  }

  factory VrStereoConfigD.zero() => .new();

  @override
  VrStereoConfigD setC(VrStereoConfigC o) {
    onOriginalPointer((p) {
      p.ref.projection = o.projection;
      p.ref.viewOffset = o.viewOffset;
      p.ref.leftLensCenter = o.leftLensCenter;
      p.ref.rightLensCenter = o.rightLensCenter;
      p.ref.leftScreenCenter = o.leftScreenCenter;
      p.ref.rightScreenCenter = o.rightScreenCenter;
      p.ref.scale = o.scale;
      p.ref.scaleIn = o.scaleIn;
    });
    projection = .generate(paramCount, (i) => o.projection[i].toD());
    viewOffset = .generate(paramCount, (i) => o.viewOffset[i].toD());
    leftLensCenter = .generate(paramCount, (i) => o.leftLensCenter[i]);
    rightLensCenter = .generate(paramCount, (i) => o.rightLensCenter[i]);
    leftScreenCenter = .generate(paramCount, (i) => o.leftScreenCenter[i]);
    rightScreenCenter = .generate(paramCount, (i) => o.rightScreenCenter[i]);
    scale = .generate(paramCount, (i) => o.scale[i]);
    scaleIn = .generate(paramCount, (i) => o.scaleIn[i]);
    return this;
  }

  @override
  VrStereoConfigD setD(VrStereoConfigD o) {
    originalPointer ??= o.originalPointer;
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
  Pointer<VrStereoConfigC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.VrStereoConfig$.At(key, count);

  @override
  void syncInto(RaylibTemp temp, Pointer<VrStereoConfigC> p, String key)
    => writeInto(p.ref);

  @override
  void allocateInto(RaylibTemp temp, Pointer<VrStereoConfigC> p, String key) {
    for (int i = 0; i < paramCount; i++) {
      projection[i].writeInto(p.ref.projection[i]);
    }
    for (int i = 0; i < paramCount; i++) {
      viewOffset[i].writeInto(p.ref.viewOffset[i]);
    }
    for (int i = 0; i < paramCount; i++) {
      p.ref.leftLensCenter[i] = leftLensCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      p.ref.rightLensCenter[i] = rightLensCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      p.ref.leftScreenCenter[i] = leftScreenCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      p.ref.rightScreenCenter[i] = rightScreenCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      p.ref.scale[i] = scale[i];
    }
    for (int i = 0; i < paramCount; i++) {
      p.ref.scaleIn[i] = scaleIn[i];
    }
  }

  @override
  void writeInto(VrStereoConfigC p) {
    for (int i = 0; i < paramCount; i++) {
      projection[i].writeInto(p.projection[i]);
    }
    for (int i = 0; i < paramCount; i++) {
      viewOffset[i].writeInto(p.viewOffset[i]);
    }
    for (int i = 0; i < paramCount; i++) {
      p.leftLensCenter[i] = leftLensCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      p.rightLensCenter[i] = rightLensCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      p.leftScreenCenter[i] = leftScreenCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      p.rightScreenCenter[i] = rightScreenCenter[i];
    }
    for (int i = 0; i < paramCount; i++) {
      p.scale[i] = scale[i];
    }
    for (int i = 0; i < paramCount; i++) {
      p.scaleIn[i] = scaleIn[i];
    }
  }

  @override
  String signature() => '$structName()';

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