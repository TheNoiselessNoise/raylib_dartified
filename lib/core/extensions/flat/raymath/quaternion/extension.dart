part of '../../../../raylib_dartified.dart';

class RaylibQuaternionExtFlatNative extends RaylibQuaternionFlatExt<Raylib> {
  RaylibQuaternionExtFlatNative(super.rl);

  RaylibQuaternionExt get _ffi => rl.module();

  @override
  Quaternion QuaternionAdd(
    Quaternion q1,
    Quaternion q2,
  ) => Quaternion$.Extract3(
    (p) => _ffi.QuaternionAdd(
      Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionAddValue(
    Quaternion q,
    double add,
  ) => Quaternion$.Extract2(
    (p) => _ffi.QuaternionAddValue(
      Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
      add,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionSubtract(
    Quaternion q1,
    Quaternion q2,
  ) => Quaternion$.Extract3(
    (p) => _ffi.QuaternionSubtract(
      Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionSubtractValue(
    Quaternion q,
    double sub,
  ) => Quaternion$.Extract2(
    (p) => _ffi.QuaternionSubtractValue(
      Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
      sub,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionIdentity() => Quaternion$.Extract1(
    (p) => _ffi.QuaternionIdentity().toDart(p.asNativePointer()),
  );

  @override
  double QuaternionLength(
    Quaternion q,
  ) => _ffi.QuaternionLength(
    Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
  );

  @override
  Quaternion QuaternionNormalize(
    Quaternion q,
  ) => Quaternion$.Extract2(
    (p) => _ffi.QuaternionNormalize(
      Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionInvert(
    Quaternion q,
  ) => Quaternion$.Extract2(
    (p) => _ffi.QuaternionInvert(
      Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionMultiply(
    Quaternion q1,
    Quaternion q2,
  ) => Quaternion$.Extract3(
    (p) => _ffi.QuaternionMultiply(
      Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionScale(
    Quaternion q,
    double mul,
  ) => Quaternion$.Extract2(
    (p) => _ffi.QuaternionScale(
      Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
      mul,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionDivide(
    Quaternion q1,
    Quaternion q2,
  ) => Quaternion$.Extract3(
    (p) => _ffi.QuaternionDivide(
      Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionLerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => Quaternion$.Extract3(
    (p) => _ffi.QuaternionLerp(
      Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
      amount,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionNlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => Quaternion$.Extract3(
    (p) => _ffi.QuaternionNlerp(
      Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
      amount,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionSlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => Quaternion$.Extract3(
    (p) => _ffi.QuaternionSlerp(
      Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
      amount,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionCubicHermiteSpline(
    Quaternion q1,
    Quaternion outTangent1,
    Quaternion q2,
    Quaternion inTangent2,
    double t,
  ) => Quaternion$.Extract5(
    (p) => _ffi.QuaternionCubicHermiteSpline(
      Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      Quaternion$.Ref2(outTangent1).asNativePointer<QuaternionC>().ref,
      Quaternion$.Ref3(q2).asNativePointer<QuaternionC>().ref,
      Quaternion$.Ref4(inTangent2).asNativePointer<QuaternionC>().ref,
      t,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionFromVector3ToVector3(
    Vector3 from,
    Vector3 to,
  ) => Quaternion$.Extract1(
    (p) => _ffi.QuaternionFromVector3ToVector3(
      Vector3$.Ref1(from).asNativePointer<Vector3C>().ref,
      Vector3$.Ref2(to).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionFromMatrix(
    Matrix mat,
  ) => Quaternion$.Extract1(
    (p) => _ffi.QuaternionFromMatrix(
      Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix QuaternionToMatrix(
    Quaternion q,
  ) => Matrix$.Extract1(
    (p) => _ffi.QuaternionToMatrix(
      Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionFromAxisAngle(
    Vector3 axis,
    double angle,
  ) => Quaternion$.Extract1(
    (p) => _ffi.QuaternionFromAxisAngle(
      Vector3$.Ref1(axis).asNativePointer<Vector3C>().ref,
      angle,
    ).toDart(p.asNativePointer()),
  );

  @override
  void QuaternionToAxisAngle(
    Quaternion q,
    StructPointer<Vector3> outAxis,
    MemoryPointer<RFloat> outAngle,
  ) => _ffi.QuaternionToAxisAngle(
    Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    outAxis.asNativePointer(),
    outAngle.asNativePointer(),
  );

  @override
  Quaternion QuaternionFromEuler(
    double pitch,
    double yaw,
    double roll,
  ) => Quaternion$.Extract1(
    (p) => _ffi.QuaternionFromEuler(
      pitch,
      yaw,
      roll,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3 QuaternionToEuler(
    Quaternion q,
  ) => Vector3$.Extract1(
    (p) => _ffi.QuaternionToEuler(
      Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Quaternion QuaternionTransform(
    Quaternion q,
    Matrix mat,
  ) => Quaternion$.Extract2(
    (p) => _ffi.QuaternionTransform(
      Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
      Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool QuaternionEquals(
    Quaternion p,
    Quaternion q,
  ) => _ffi.QuaternionEquals(
    Quaternion$.Ref1(p).asNativePointer<QuaternionC>().ref,
    Quaternion$.Ref2(q).asNativePointer<QuaternionC>().ref,
  );
}
