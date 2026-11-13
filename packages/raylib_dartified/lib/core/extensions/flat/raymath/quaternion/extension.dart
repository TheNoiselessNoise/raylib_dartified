part of '../../../../raylib_dartified.dart';

class RaylibQuaternionExtFlatNative extends RaylibQuaternionFlatExt<Raylib> {
  RaylibQuaternionExtFlatNative(super.rl);

  RaylibQuaternionExt get _ffi => rl.module();

  @override
  Quaternion QuaternionAdd(
    Quaternion q1,
    Quaternion q2,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionAdd(
      Quaternion$.Ref1(q1).asNative<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNative<QuaternionC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionAddValue(
    Quaternion q,
    double add,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionAddValue(
      Quaternion$.Ref1(q).asNative<QuaternionC>().ref,
      add,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionSubtract(
    Quaternion q1,
    Quaternion q2,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionSubtract(
      Quaternion$.Ref1(q1).asNative<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNative<QuaternionC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionSubtractValue(
    Quaternion q,
    double sub,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionSubtractValue(
      Quaternion$.Ref1(q).asNative<QuaternionC>().ref,
      sub,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionIdentity() => Quaternion$.Extract(
    (p) => _ffi.QuaternionIdentity().toDart(p.asNative()),
  );

  @override
  double QuaternionLength(
    Quaternion q,
  ) => _ffi.QuaternionLength(
    Quaternion$.Ref1(q).asNative<QuaternionC>().ref,
  );

  @override
  Quaternion QuaternionNormalize(
    Quaternion q,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionNormalize(
      Quaternion$.Ref1(q).asNative<QuaternionC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionInvert(
    Quaternion q,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionInvert(
      Quaternion$.Ref1(q).asNative<QuaternionC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionMultiply(
    Quaternion q1,
    Quaternion q2,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionMultiply(
      Quaternion$.Ref1(q1).asNative<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNative<QuaternionC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionScale(
    Quaternion q,
    double mul,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionScale(
      Quaternion$.Ref1(q).asNative<QuaternionC>().ref,
      mul,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionDivide(
    Quaternion q1,
    Quaternion q2,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionDivide(
      Quaternion$.Ref1(q1).asNative<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNative<QuaternionC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionLerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionLerp(
      Quaternion$.Ref1(q1).asNative<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNative<QuaternionC>().ref,
      amount,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionNlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionNlerp(
      Quaternion$.Ref1(q1).asNative<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNative<QuaternionC>().ref,
      amount,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionSlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionSlerp(
      Quaternion$.Ref1(q1).asNative<QuaternionC>().ref,
      Quaternion$.Ref2(q2).asNative<QuaternionC>().ref,
      amount,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionCubicHermiteSpline(
    Quaternion q1,
    Quaternion outTangent1,
    Quaternion q2,
    Quaternion inTangent2,
    double t,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionCubicHermiteSpline(
      Quaternion$.Ref1(q1).asNative<QuaternionC>().ref,
      Quaternion$.Ref2(outTangent1).asNative<QuaternionC>().ref,
      Quaternion$.Ref3(q2).asNative<QuaternionC>().ref,
      Quaternion$.Ref4(inTangent2).asNative<QuaternionC>().ref,
      t,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionFromVector3ToVector3(
    Vector3 from,
    Vector3 to,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionFromVector3ToVector3(
      Vector3$.Ref1(from).asNative<Vector3C>().ref,
      Vector3$.Ref2(to).asNative<Vector3C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionFromMatrix(
    Matrix mat,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionFromMatrix(
      Matrix$.Ref1(mat).asNative<MatrixC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Matrix QuaternionToMatrix(
    Quaternion q,
  ) => Matrix$.Extract(
    (p) => _ffi.QuaternionToMatrix(
      Quaternion$.Ref1(q).asNative<QuaternionC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionFromAxisAngle(
    Vector3 axis,
    double angle,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionFromAxisAngle(
      Vector3$.Ref1(axis).asNative<Vector3C>().ref,
      angle,
    ).toDart(p.asNative()),
  );

  @override
  void QuaternionToAxisAngle(
    Quaternion q,
    XStructPtr<Vector3> outAxis,
    XPtr<XFloat> outAngle,
  ) => _ffi.QuaternionToAxisAngle(
    Quaternion$.Ref1(q).asNative<QuaternionC>().ref,
    outAxis.asNative(),
    outAngle.asNative(),
  );

  @override
  Quaternion QuaternionFromEuler(
    double pitch,
    double yaw,
    double roll,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionFromEuler(
      pitch,
      yaw,
      roll,
    ).toDart(p.asNative()),
  );

  @override
  Vector3 QuaternionToEuler(
    Quaternion q,
  ) => Vector3$.Extract(
    (p) => _ffi.QuaternionToEuler(
      Quaternion$.Ref1(q).asNative<QuaternionC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Quaternion QuaternionTransform(
    Quaternion q,
    Matrix mat,
  ) => Quaternion$.Extract(
    (p) => _ffi.QuaternionTransform(
      Quaternion$.Ref1(q).asNative<QuaternionC>().ref,
      Matrix$.Ref1(mat).asNative<MatrixC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  bool QuaternionEquals(
    Quaternion p,
    Quaternion q,
  ) => _ffi.QuaternionEquals(
    Quaternion$.Ref1(p).asNative<QuaternionC>().ref,
    Quaternion$.Ref2(q).asNative<QuaternionC>().ref,
  );
}
