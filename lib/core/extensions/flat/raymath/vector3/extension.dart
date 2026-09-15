part of '../../../../raylib_dartified.dart';

class RaylibVector3ExtFlat extends RaylibVector3FlatExt<Raylib> {
  RaylibVector3ExtFlat(super.rl);

  RaylibVector3Ext get _ffi => rl.module();

  @override
  Vector3D Vector3Zero() => $.Vector3$.Extract1(
    (p) => _ffi.Vector3Zero().toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3One() => $.Vector3$.Extract3(
    (p) => _ffi.Vector3One().toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Add(
    Vector3D v1,
    Vector3D v2,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3Add(
      $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3AddValue(
    Vector3D v,
    double add,
  ) => $.Vector3$.Extract2(
    (p) => _ffi.Vector3AddValue(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
      add,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Subtract(
    Vector3D v1,
    Vector3D v2,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3Subtract(
      $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3SubtractValue(
    Vector3D v,
    double sub,
  ) => $.Vector3$.Extract2(
    (p) => _ffi.Vector3SubtractValue(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
      sub,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Scale(
    Vector3D v,
    double scalar,
  ) => $.Vector3$.Extract2(
    (p) => _ffi.Vector3Scale(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
      scalar,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Multiply(
    Vector3D v1,
    Vector3D v2,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3Multiply(
      $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3CrossProduct(
    Vector3D v1,
    Vector3D v2,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3CrossProduct(
      $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Perpendicular(
    Vector3D v,
  ) => $.Vector3$.Extract2(
    (p) => _ffi.Vector3Perpendicular(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  double Vector3Length(
    Vector3D v,
  ) => _ffi.Vector3Length(
    $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
  );

  @override
  double Vector3LengthSqr(
    Vector3D v,
  ) => _ffi.Vector3LengthSqr(
    $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
  );

  @override
  double Vector3DotProduct(
    Vector3D v1,
    Vector3D v2,
  ) => _ffi.Vector3DotProduct(
    $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
  );

  @override
  double Vector3Distance(
    Vector3D v1,
    Vector3D v2,
  ) => _ffi.Vector3Distance(
    $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
  );

  @override
  double Vector3DistanceSqr(
    Vector3D v1,
    Vector3D v2,
  ) => _ffi.Vector3DistanceSqr(
    $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
  );

  @override
  double Vector3Angle(
    Vector3D v1,
    Vector3D v2,
  ) => _ffi.Vector3Angle(
    $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
  );

  @override
  Vector3D Vector3Negate(
    Vector3D v,
  ) => $.Vector3$.Extract2(
    (p) => _ffi.Vector3Negate(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Divide(
    Vector3D v1,
    Vector3D v2,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3Divide(
      $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Normalize(
    Vector3D v,
  ) => $.Vector3$.Extract2(
    (p) => _ffi.Vector3Normalize(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Project(
    Vector3D v1,
    Vector3D v2,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3Project(
      $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Reject(
    Vector3D v1,
    Vector3D v2,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3Reject(
      $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void Vector3OrthoNormalize(
    StructPointer<Vector3D> v1,
    StructPointer<Vector3D> v2,
  ) => _ffi.Vector3OrthoNormalize(
    v1.asNativePointer(),
    v2.asNativePointer(),
  );

  @override
  Vector3D Vector3Transform(
    Vector3D v,
    MatrixD mat,
  ) => $.Vector3$.Extract2(
    (p) => _ffi.Vector3Transform(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
      $.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3RotateByQuaternion(
    Vector3D v,
    QuaternionD q,
  ) => $.Vector3$.Extract2(
    (p) => _ffi.Vector3RotateByQuaternion(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
      $.Quaternion$.Ref1(q).asNativePointer<QuaternionC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3RotateByAxisAngle(
    Vector3D v,
    Vector3D axis,
    double angle,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3RotateByAxisAngle(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(axis).asNativePointer<Vector3C>().ref,
      angle,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3MoveTowards(
    Vector3D v,
    Vector3D target,
    double maxDistance,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3MoveTowards(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(target).asNativePointer<Vector3C>().ref,
      maxDistance,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Lerp(
    Vector3D v1,
    Vector3D v2,
    double amount,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3Lerp(
      $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
      amount,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3CubicHermite(
    Vector3D v1,
    Vector3D tangent1,
    Vector3D v2,
    Vector3D tangent2,
    double amount,
  ) => $.Vector3$.Extract5(
    (p) => _ffi.Vector3CubicHermite(
      $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(tangent1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref3(v2).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref4(tangent2).asNativePointer<Vector3C>().ref,
      amount,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Reflect(
    Vector3D v,
    Vector3D normal,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3Reflect(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(normal).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Min(
    Vector3D v1,
    Vector3D v2,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3Min(
      $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Max(
    Vector3D v1,
    Vector3D v2,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3Max(
      $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Barycenter(
    Vector3D p,
    Vector3D a,
    Vector3D b,
    Vector3D c,
  ) => $.Vector3$.Extract5(
    (ptr) => _ffi.Vector3Barycenter(
      $.Vector3$.Ref1(p).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(a).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref3(b).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref4(c).asNativePointer<Vector3C>().ref,
    ).toDart(ptr.asNativePointer()),
  );

  @override
  Vector3D Vector3Unproject(
    Vector3D source,
    MatrixD projection,
    MatrixD view,
  ) => $.Vector3$.Extract2(
    (p) => _ffi.Vector3Unproject(
      $.Vector3$.Ref1(source).asNativePointer<Vector3C>().ref,
      $.Matrix$.Ref1(projection).asNativePointer<MatrixC>().ref,
      $.Matrix$.Ref2(view).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  float3D Vector3ToFloatV(
    Vector3D v,
  ) => $.float3$.Extract1(
    (p) => _ffi.Vector3ToFloatV(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Invert(
    Vector3D v,
  ) => $.Vector3$.Extract2(
    (p) => _ffi.Vector3Invert(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3Clamp(
    Vector3D v,
    Vector3D min,
    Vector3D max,
  ) => $.Vector3$.Extract4(
    (p) => _ffi.Vector3Clamp(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(min).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref3(max).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D Vector3ClampValue(
    Vector3D v,
    double min,
    double max,
  ) => $.Vector3$.Extract2(
    (p) => _ffi.Vector3ClampValue(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
      min,
      max,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool Vector3Equals(
    Vector3D p,
    Vector3D q,
  ) => _ffi.Vector3Equals(
    $.Vector3$.Ref1(p).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(q).asNativePointer<Vector3C>().ref,
  );

  @override
  Vector3D Vector3Refract(
    Vector3D v,
    Vector3D n,
    double r,
  ) => $.Vector3$.Extract3(
    (p) => _ffi.Vector3Refract(
      $.Vector3$.Ref1(v).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(n).asNativePointer<Vector3C>().ref,
      r,
    ).toDart(p.asNativePointer()),
  );
}
