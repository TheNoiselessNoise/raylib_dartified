part of '../../../../raylib_dartified_web.dart';

final class RaylibQuaternionExtFlatWeb extends RaylibQuaternionFlatExt<Raylib> {
  RaylibQuaternionExtFlatWeb(super.rl);

  RaylibQuaternionExt get _wasm => rl.module();

  @override
  Quaternion QuaternionAdd(
    Quaternion q1,
    Quaternion q2,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionAdd(
      p.toJS,
      Quaternion$.Ref1(q1).toJS,
      Quaternion$.Ref2(q2).toJS,
    ),
  );

  @override
  Quaternion QuaternionAddValue(
    Quaternion q,
    double add,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionAddValue(
      p.toJS,
      Quaternion$.Ref1(q).toJS,
      add.toJS,
    ),
  );

  @override
  Quaternion QuaternionSubtract(
    Quaternion q1,
    Quaternion q2,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionSubtract(
      p.toJS,
      Quaternion$.Ref1(q1).toJS,
      Quaternion$.Ref2(q2).toJS,
    ),
  );

  @override
  Quaternion QuaternionSubtractValue(
    Quaternion q,
    double sub,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionSubtractValue(
      p.toJS,
      Quaternion$.Ref1(q).toJS,
      sub.toJS,
    ),
  );

  @override
  Quaternion QuaternionIdentity() => Quaternion$.Extract(
    (p) => _wasm.QuaternionIdentity(
      p.toJS,
    ),
  );

  @override
  double QuaternionLength(
    Quaternion q,
  ) => _wasm.QuaternionLength(
    Quaternion$.Ref1(q).toJS,
  );

  @override
  Quaternion QuaternionNormalize(
    Quaternion q,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionNormalize(
      p.toJS,
      Quaternion$.Ref1(q).toJS,
    ),
  );

  @override
  Quaternion QuaternionInvert(
    Quaternion q,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionInvert(
      p.toJS,
      Quaternion$.Ref1(q).toJS,
    ),
  );

  @override
  Quaternion QuaternionMultiply(
    Quaternion q1,
    Quaternion q2,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionMultiply(
      p.toJS,
      Quaternion$.Ref1(q1).toJS,
      Quaternion$.Ref2(q2).toJS,
    ),
  );

  @override
  Quaternion QuaternionScale(
    Quaternion q,
    double mul,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionScale(
      p.toJS,
      Quaternion$.Ref1(q).toJS,
      mul.toJS,
    ),
  );

  @override
  Quaternion QuaternionDivide(
    Quaternion q1,
    Quaternion q2,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionDivide(
      p.toJS,
      Quaternion$.Ref1(q1).toJS,
      Quaternion$.Ref2(q2).toJS,
    ),
  );

  @override
  Quaternion QuaternionLerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionLerp(
      p.toJS,
      Quaternion$.Ref1(q1).toJS,
      Quaternion$.Ref2(q2).toJS,
      amount.toJS,
    ),
  );

  @override
  Quaternion QuaternionNlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionNlerp(
      p.toJS,
      Quaternion$.Ref1(q1).toJS,
      Quaternion$.Ref2(q2).toJS,
      amount.toJS,
    ),
  );

  @override
  Quaternion QuaternionSlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionSlerp(
      p.toJS,
      Quaternion$.Ref1(q1).toJS,
      Quaternion$.Ref2(q2).toJS,
      amount.toJS,
    ),
  );

  @override
  Quaternion QuaternionCubicHermiteSpline(
    Quaternion q1,
    Quaternion outTangent1,
    Quaternion q2,
    Quaternion inTangent2,
    double t,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionCubicHermiteSpline(
      p.toJS,
      Quaternion$.Ref1(q1).toJS,
      Quaternion$.Ref2(outTangent1).toJS,
      Quaternion$.Ref3(q2).toJS,
      Quaternion$.Ref4(inTangent2).toJS,
      t.toJS,
    ),
  );

  @override
  Quaternion QuaternionFromVector3ToVector3(
    Vector3 from,
    Vector3 to,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionFromVector3ToVector3(
      p.toJS,
      Vector3$.Ref1(from).toJS,
      Vector3$.Ref2(to).toJS,
    ),
  );

  @override
  Quaternion QuaternionFromMatrix(
    Matrix mat,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionFromMatrix(
      p.toJS,
      Matrix$.Ref1(mat).toJS,
    ),
  );

  @override
  Matrix QuaternionToMatrix(
    Quaternion q,
  ) => Matrix$.Extract(
    (p) => _wasm.QuaternionToMatrix(
      p.toJS,
      Quaternion$.Ref1(q).toJS,
    ),
  );

  @override
  Quaternion QuaternionFromAxisAngle(
    Vector3 axis,
    double angle,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionFromAxisAngle(
      p.toJS,
      Vector3$.Ref1(axis).toJS,
      angle.toJS,
    ),
  );

  @override
  void QuaternionToAxisAngle(
    Quaternion q,
    XStructPtr<Vector3> outAxis,
    XPtr<XFloat> outAngle,
  ) => _wasm.QuaternionToAxisAngle(
    Quaternion$.Ref1(q).toJS,
    outAxis.toJS,
    outAngle.toJS,
  );

  @override
  Quaternion QuaternionFromEuler(
    double pitch,
    double yaw,
    double roll,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionFromEuler(
      p.toJS,
      pitch.toJS,
      yaw.toJS,
      roll.toJS,
    ),
  );

  @override
  Vector3 QuaternionToEuler(
    Quaternion q,
  ) => Vector3$.Extract(
    (p) => _wasm.QuaternionToEuler(
      p.toJS,
      Quaternion$.Ref1(q).toJS,
    ),
  );

  @override
  Quaternion QuaternionTransform(
    Quaternion q,
    Matrix mat,
  ) => Quaternion$.Extract(
    (p) => _wasm.QuaternionTransform(
      p.toJS,
      Quaternion$.Ref1(q).toJS,
      Matrix$.Ref1(mat).toJS,
    ),
  );

  @override
  bool QuaternionEquals(
    Quaternion p,
    Quaternion q,
  ) => _wasm.QuaternionEquals(
    Quaternion$.Ref1(p).toJS,
    Quaternion$.Ref2(q).toJS,
  );
}
