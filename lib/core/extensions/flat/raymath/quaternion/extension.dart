part of '../../../../raylib_dartified.dart';

class RaylibQuaternionExtFlat extends RaylibQuaternionFlatExt<Raylib> {
  RaylibQuaternionExtFlat(super.rl);

  RaylibQuaternionExt get _ffi => rl.module();

  @override
  QuaternionD QuaternionAdd(
    QuaternionD q1,
    QuaternionD q2,
  ) => rl.Temp.Quaternion$.Extract3(
    (p) => _ffi.QuaternionAdd(
      rl.Temp.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      rl.Temp.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionAddValue(
    QuaternionD q,
    double add,
  ) => rl.Temp.Quaternion$.Extract2(
    (p) => _ffi.QuaternionAddValue(
      rl.Temp.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
      add,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionSubtract(
    QuaternionD q1,
    QuaternionD q2,
  ) => rl.Temp.Quaternion$.Extract3(
    (p) => _ffi.QuaternionSubtract(
      rl.Temp.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      rl.Temp.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionSubtractValue(
    QuaternionD q,
    double sub,
  ) => rl.Temp.Quaternion$.Extract2(
    (p) => _ffi.QuaternionSubtractValue(
      rl.Temp.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
      sub,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionIdentity() => rl.Temp.Quaternion$.Extract1(
    (p) => _ffi.QuaternionIdentity().toDart(p.asNativePointer()),
  );

  @override
  double QuaternionLength(
    QuaternionD q,
  ) => _ffi.QuaternionLength(
    rl.Temp.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
  );

  @override
  QuaternionD QuaternionNormalize(
    QuaternionD q,
  ) => rl.Temp.Quaternion$.Extract2(
    (p) => _ffi.QuaternionNormalize(
      rl.Temp.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionInvert(
    QuaternionD q,
  ) => rl.Temp.Quaternion$.Extract2(
    (p) => _ffi.QuaternionInvert(
      rl.Temp.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionMultiply(
    QuaternionD q1,
    QuaternionD q2,
  ) => rl.Temp.Quaternion$.Extract3(
    (p) => _ffi.QuaternionMultiply(
      rl.Temp.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      rl.Temp.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionScale(
    QuaternionD q,
    double mul,
  ) => rl.Temp.Quaternion$.Extract2(
    (p) => _ffi.QuaternionScale(
      rl.Temp.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
      mul,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionDivide(
    QuaternionD q1,
    QuaternionD q2,
  ) => rl.Temp.Quaternion$.Extract3(
    (p) => _ffi.QuaternionDivide(
      rl.Temp.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      rl.Temp.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionLerp(
    QuaternionD q1,
    QuaternionD q2,
    double amount,
  ) => rl.Temp.Quaternion$.Extract3(
    (p) => _ffi.QuaternionLerp(
      rl.Temp.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      rl.Temp.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
      amount,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionNlerp(
    QuaternionD q1,
    QuaternionD q2,
    double amount,
  ) => rl.Temp.Quaternion$.Extract3(
    (p) => _ffi.QuaternionNlerp(
      rl.Temp.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      rl.Temp.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
      amount,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionSlerp(
    QuaternionD q1,
    QuaternionD q2,
    double amount,
  ) => rl.Temp.Quaternion$.Extract3(
    (p) => _ffi.QuaternionSlerp(
      rl.Temp.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      rl.Temp.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
      amount,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionCubicHermiteSpline(
    QuaternionD q1,
    QuaternionD outTangent1,
    QuaternionD q2,
    QuaternionD inTangent2,
    double t,
  ) => rl.Temp.Quaternion$.Extract5(
    (p) => _ffi.QuaternionCubicHermiteSpline(
      rl.Temp.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      rl.Temp.Quaternion$.Ref2(outTangent1).asNativePointer<QuaternionC>().ref,
      rl.Temp.Quaternion$.Ref3(q2).asNativePointer<QuaternionC>().ref,
      rl.Temp.Quaternion$.Ref4(inTangent2).asNativePointer<QuaternionC>().ref,
      t,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionFromVector3ToVector3(
    Vector3D from,
    Vector3D to,
  ) => rl.Temp.Quaternion$.Extract1(
    (p) => _ffi.QuaternionFromVector3ToVector3(
      rl.Temp.Vector3$.Ref1(from).asNativePointer<Vector3C>().ref,
      rl.Temp.Vector3$.Ref2(to).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionFromMatrix(
    MatrixD mat,
  ) => rl.Temp.Quaternion$.Extract1(
    (p) => _ffi.QuaternionFromMatrix(
      rl.Temp.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD QuaternionToMatrix(
    QuaternionD q,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => _ffi.QuaternionToMatrix(
      rl.Temp.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionFromAxisAngle(
    Vector3D axis,
    double angle,
  ) => rl.Temp.Quaternion$.Extract1(
    (p) => _ffi.QuaternionFromAxisAngle(
      rl.Temp.Vector3$.Ref1(axis).asNativePointer<Vector3C>().ref,
      angle,
    ).toDart(p.asNativePointer()),
  );

  @override
  void QuaternionToAxisAngle(
    QuaternionD q,
    StructPointer<Vector3D> outAxis,
    MemoryPointer<RFloat> outAngle,
  ) => _ffi.QuaternionToAxisAngle(
    rl.Temp.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    outAxis.asNativePointer(),
    outAngle.asNativePointer(),
  );

  @override
  QuaternionD QuaternionFromEuler(
    double pitch,
    double yaw,
    double roll,
  ) => rl.Temp.Quaternion$.Extract1(
    (p) => _ffi.QuaternionFromEuler(
      pitch,
      yaw,
      roll,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D QuaternionToEuler(
    QuaternionD q,
  ) => rl.Temp.Vector3$.Extract1(
    (p) => _ffi.QuaternionToEuler(
      rl.Temp.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionTransform(
    QuaternionD q,
    MatrixD mat,
  ) => rl.Temp.Quaternion$.Extract2(
    (p) => _ffi.QuaternionTransform(
      rl.Temp.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
      rl.Temp.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool QuaternionEquals(
    QuaternionD p,
    QuaternionD q,
  ) => _ffi.QuaternionEquals(
    rl.Temp.Quaternion$.Ref1(p).asNativePointer<QuaternionC>().ref,
    rl.Temp.Quaternion$.Ref2(q).asNativePointer<QuaternionC>().ref,
  );
}
