part of '../../../../raylib_dartified.dart';

class RaylibQuaternionExtFlatNative extends RaylibQuaternionFlatExt<Raylib> {
  RaylibQuaternionExtFlatNative(super.rl);

  RaylibQuaternionExt get _ffi => rl.module();

  @override
  QuaternionD QuaternionAdd(
    QuaternionD q1,
    QuaternionD q2,
  ) => $.Quaternion$.Extract3(
    (p) => _ffi.QuaternionAdd(
      $.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      $.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionAddValue(
    QuaternionD q,
    double add,
  ) => $.Quaternion$.Extract2(
    (p) => _ffi.QuaternionAddValue(
      $.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
      add,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionSubtract(
    QuaternionD q1,
    QuaternionD q2,
  ) => $.Quaternion$.Extract3(
    (p) => _ffi.QuaternionSubtract(
      $.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      $.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionSubtractValue(
    QuaternionD q,
    double sub,
  ) => $.Quaternion$.Extract2(
    (p) => _ffi.QuaternionSubtractValue(
      $.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
      sub,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionIdentity() => $.Quaternion$.Extract1(
    (p) => _ffi.QuaternionIdentity().toDart(p.asNativePointer()),
  );

  @override
  double QuaternionLength(
    QuaternionD q,
  ) => _ffi.QuaternionLength(
    $.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
  );

  @override
  QuaternionD QuaternionNormalize(
    QuaternionD q,
  ) => $.Quaternion$.Extract2(
    (p) => _ffi.QuaternionNormalize(
      $.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionInvert(
    QuaternionD q,
  ) => $.Quaternion$.Extract2(
    (p) => _ffi.QuaternionInvert(
      $.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionMultiply(
    QuaternionD q1,
    QuaternionD q2,
  ) => $.Quaternion$.Extract3(
    (p) => _ffi.QuaternionMultiply(
      $.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      $.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionScale(
    QuaternionD q,
    double mul,
  ) => $.Quaternion$.Extract2(
    (p) => _ffi.QuaternionScale(
      $.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
      mul,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionDivide(
    QuaternionD q1,
    QuaternionD q2,
  ) => $.Quaternion$.Extract3(
    (p) => _ffi.QuaternionDivide(
      $.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      $.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionLerp(
    QuaternionD q1,
    QuaternionD q2,
    double amount,
  ) => $.Quaternion$.Extract3(
    (p) => _ffi.QuaternionLerp(
      $.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      $.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
      amount,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionNlerp(
    QuaternionD q1,
    QuaternionD q2,
    double amount,
  ) => $.Quaternion$.Extract3(
    (p) => _ffi.QuaternionNlerp(
      $.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      $.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
      amount,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionSlerp(
    QuaternionD q1,
    QuaternionD q2,
    double amount,
  ) => $.Quaternion$.Extract3(
    (p) => _ffi.QuaternionSlerp(
      $.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      $.Quaternion$.Ref2(q2).asNativePointer<QuaternionC>().ref,
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
  ) => $.Quaternion$.Extract5(
    (p) => _ffi.QuaternionCubicHermiteSpline(
      $.Quaternion$.Ref1(q1).asNativePointer<QuaternionC>().ref,
      $.Quaternion$.Ref2(outTangent1).asNativePointer<QuaternionC>().ref,
      $.Quaternion$.Ref3(q2).asNativePointer<QuaternionC>().ref,
      $.Quaternion$.Ref4(inTangent2).asNativePointer<QuaternionC>().ref,
      t,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionFromVector3ToVector3(
    Vector3D from,
    Vector3D to,
  ) => $.Quaternion$.Extract1(
    (p) => _ffi.QuaternionFromVector3ToVector3(
      $.Vector3$.Ref1(from).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(to).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionFromMatrix(
    MatrixD mat,
  ) => $.Quaternion$.Extract1(
    (p) => _ffi.QuaternionFromMatrix(
      $.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD QuaternionToMatrix(
    QuaternionD q,
  ) => $.Matrix$.Extract1(
    (p) => _ffi.QuaternionToMatrix(
      $.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionFromAxisAngle(
    Vector3D axis,
    double angle,
  ) => $.Quaternion$.Extract1(
    (p) => _ffi.QuaternionFromAxisAngle(
      $.Vector3$.Ref1(axis).asNativePointer<Vector3C>().ref,
      angle,
    ).toDart(p.asNativePointer()),
  );

  @override
  void QuaternionToAxisAngle(
    QuaternionD q,
    StructPointer<Vector3D> outAxis,
    MemoryPointer<RFloat> outAngle,
  ) => _ffi.QuaternionToAxisAngle(
    $.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    outAxis.asNativePointer(),
    outAngle.asNativePointer(),
  );

  @override
  QuaternionD QuaternionFromEuler(
    double pitch,
    double yaw,
    double roll,
  ) => $.Quaternion$.Extract1(
    (p) => _ffi.QuaternionFromEuler(
      pitch,
      yaw,
      roll,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D QuaternionToEuler(
    QuaternionD q,
  ) => $.Vector3$.Extract1(
    (p) => _ffi.QuaternionToEuler(
      $.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  QuaternionD QuaternionTransform(
    QuaternionD q,
    MatrixD mat,
  ) => $.Quaternion$.Extract2(
    (p) => _ffi.QuaternionTransform(
      $.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
      $.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool QuaternionEquals(
    QuaternionD p,
    QuaternionD q,
  ) => _ffi.QuaternionEquals(
    $.Quaternion$.Ref1(p).asNativePointer<QuaternionC>().ref,
    $.Quaternion$.Ref2(q).asNativePointer<QuaternionC>().ref,
  );
}
