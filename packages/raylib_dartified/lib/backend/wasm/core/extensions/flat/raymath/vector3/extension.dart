part of '../../../../backend.dart';

final class RaylibVector3FlatExtWeb extends RaylibVector3FlatExt {
  RaylibVector3FlatExtWeb(super.pkg);

  RaylibVector3Ext get _wasm => pkg.module();

  @override
  Vector3 Vector3Zero() => Vector3$.Extract(
    (p) => _wasm.Vector3Zero(
      p.toJS,
    ),
  );

  @override
  Vector3 Vector3One() => Vector3$.Extract(
    (p) => _wasm.Vector3One(
      p.toJS,
    ),
  );

  @override
  Vector3 Vector3Add(
    Vector3 v1,
    Vector3 v2,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Add(
      p.toJS,
      Vector3$.Ref1(v1).toJS,
      Vector3$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector3 Vector3AddValue(
    Vector3 v,
    double add,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3AddValue(
      p.toJS,
      Vector3$.Ref1(v).toJS,
      add.toJS,
    ),
  );

  @override
  Vector3 Vector3Subtract(
    Vector3 v1,
    Vector3 v2,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Subtract(
      p.toJS,
      Vector3$.Ref1(v1).toJS,
      Vector3$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector3 Vector3SubtractValue(
    Vector3 v,
    double sub,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3SubtractValue(
      p.toJS,
      Vector3$.Ref1(v).toJS,
      sub.toJS,
    ),
  );

  @override
  Vector3 Vector3Scale(
    Vector3 v,
    double scalar,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Scale(
      p.toJS,
      Vector3$.Ref1(v).toJS,
      scalar.toJS,
    ),
  );

  @override
  Vector3 Vector3Multiply(
    Vector3 v1,
    Vector3 v2,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Multiply(
      p.toJS,
      Vector3$.Ref1(v1).toJS,
      Vector3$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector3 Vector3CrossProduct(
    Vector3 v1,
    Vector3 v2,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3CrossProduct(
      p.toJS,
      Vector3$.Ref1(v1).toJS,
      Vector3$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector3 Vector3Perpendicular(
    Vector3 v,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Perpendicular(
      p.toJS,
      Vector3$.Ref1(v).toJS,
    ),
  );

  @override
  double Vector3Length(
    Vector3 v,
  ) => _wasm.Vector3Length(
    Vector3$.Ref1(v).toJS,
  );

  @override
  double Vector3LengthSqr(
    Vector3 v,
  ) => _wasm.Vector3LengthSqr(
    Vector3$.Ref1(v).toJS,
  );

  @override
  double Vector3DotProduct(
    Vector3 v1,
    Vector3 v2,
  ) => _wasm.Vector3DotProduct(
    Vector3$.Ref1(v1).toJS,
    Vector3$.Ref2(v2).toJS,
  );

  @override
  double Vector3Distance(
    Vector3 v1,
    Vector3 v2,
  ) => _wasm.Vector3Distance(
    Vector3$.Ref1(v1).toJS,
    Vector3$.Ref2(v2).toJS,
  );

  @override
  double Vector3DistanceSqr(
    Vector3 v1,
    Vector3 v2,
  ) => _wasm.Vector3DistanceSqr(
    Vector3$.Ref1(v1).toJS,
    Vector3$.Ref2(v2).toJS,
  );

  @override
  double Vector3Angle(
    Vector3 v1,
    Vector3 v2,
  ) => _wasm.Vector3Angle(
    Vector3$.Ref1(v1).toJS,
    Vector3$.Ref2(v2).toJS,
  );

  @override
  Vector3 Vector3Negate(
    Vector3 v,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Negate(
      p.toJS,
      Vector3$.Ref1(v).toJS,
    ),
  );

  @override
  Vector3 Vector3Divide(
    Vector3 v1,
    Vector3 v2,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Divide(
      p.toJS,
      Vector3$.Ref1(v1).toJS,
      Vector3$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector3 Vector3Normalize(
    Vector3 v,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Normalize(
      p.toJS,
      Vector3$.Ref1(v).toJS,
    ),
  );

  @override
  Vector3 Vector3Project(
    Vector3 v1,
    Vector3 v2,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Project(
      p.toJS,
      Vector3$.Ref1(v1).toJS,
      Vector3$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector3 Vector3Reject(
    Vector3 v1,
    Vector3 v2,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Reject(
      p.toJS,
      Vector3$.Ref1(v1).toJS,
      Vector3$.Ref2(v2).toJS,
    ),
  );

  @override
  void Vector3OrthoNormalize(
    XStructPtr<Vector3> v1,
    XStructPtr<Vector3> v2,
  ) => _wasm.Vector3OrthoNormalize(
    v1.toJS,
    v2.toJS,
  );

  @override
  Vector3 Vector3Transform(
    Vector3 v,
    Matrix mat,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Transform(
      p.toJS,
      Vector3$.Ref1(v).toJS,
      Matrix$.Ref1(mat).toJS,
    ),
  );

  @override
  Vector3 Vector3RotateByQuaternion(
    Vector3 v,
    Quaternion q,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3RotateByQuaternion(
      p.toJS,
      Vector3$.Ref1(v).toJS,
      Quaternion$.Ref1(q).toJS,
    ),
  );

  @override
  Vector3 Vector3RotateByAxisAngle(
    Vector3 v,
    Vector3 axis,
    double angle,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3RotateByAxisAngle(
      p.toJS,
      Vector3$.Ref1(v).toJS,
      Vector3$.Ref2(axis).toJS,
      angle.toJS,
    ),
  );

  @override
  Vector3 Vector3MoveTowards(
    Vector3 v,
    Vector3 target,
    double maxDistance,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3MoveTowards(
      p.toJS,
      Vector3$.Ref1(v).toJS,
      Vector3$.Ref2(target).toJS,
      maxDistance.toJS,
    ),
  );

  @override
  Vector3 Vector3Lerp(
    Vector3 v1,
    Vector3 v2,
    double amount,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Lerp(
      p.toJS,
      Vector3$.Ref1(v1).toJS,
      Vector3$.Ref2(v2).toJS,
      amount.toJS,
    ),
  );

  @override
  Vector3 Vector3CubicHermite(
    Vector3 v1,
    Vector3 tangent1,
    Vector3 v2,
    Vector3 tangent2,
    double amount,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3CubicHermite(
      p.toJS,
      Vector3$.Ref1(v1).toJS,
      Vector3$.Ref2(tangent1).toJS,
      Vector3$.Ref3(v2).toJS,
      Vector3$.Ref4(tangent2).toJS,
      amount.toJS,
    ),
  );

  @override
  Vector3 Vector3Reflect(
    Vector3 v,
    Vector3 normal,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Reflect(
      p.toJS,
      Vector3$.Ref1(v).toJS,
      Vector3$.Ref2(normal).toJS,
    ),
  );

  @override
  Vector3 Vector3Min(
    Vector3 v1,
    Vector3 v2,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Min(
      p.toJS,
      Vector3$.Ref1(v1).toJS,
      Vector3$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector3 Vector3Max(
    Vector3 v1,
    Vector3 v2,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Max(
      p.toJS,
      Vector3$.Ref1(v1).toJS,
      Vector3$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector3 Vector3Barycenter(
    Vector3 p,
    Vector3 a,
    Vector3 b,
    Vector3 c,
  ) => Vector3$.Extract(
    (ptr) => _wasm.Vector3Barycenter(
      ptr.toJS,
      Vector3$.Ref1(p).toJS,
      Vector3$.Ref2(a).toJS,
      Vector3$.Ref3(b).toJS,
      Vector3$.Ref4(c).toJS,
    ),
  );

  @override
  Vector3 Vector3Unproject(
    Vector3 source,
    Matrix projection,
    Matrix view,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Unproject(
      p.toJS,
      Vector3$.Ref1(source).toJS,
      Matrix$.Ref1(projection).toJS,
      Matrix$.Ref2(view).toJS,
    ),
  );

  @override
  float3 Vector3ToFloatV(
    Vector3 v,
  ) => float3$.Extract(
    (p) => _wasm.Vector3ToFloatV(
      p.toJS,
      Vector3$.Ref1(v).toJS,
    ),
  );

  @override
  Vector3 Vector3Invert(
    Vector3 v,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Invert(
      p.toJS,
      Vector3$.Ref1(v).toJS,
    ),
  );

  @override
  Vector3 Vector3Clamp(
    Vector3 v,
    Vector3 min,
    Vector3 max,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Clamp(
      p.toJS,
      Vector3$.Ref1(v).toJS,
      Vector3$.Ref2(min).toJS,
      Vector3$.Ref3(max).toJS,
    ),
  );

  @override
  Vector3 Vector3ClampValue(
    Vector3 v,
    double min,
    double max,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3ClampValue(
      p.toJS,
      Vector3$.Ref1(v).toJS,
      min.toJS,
      max.toJS,
    ),
  );

  @override
  bool Vector3Equals(
    Vector3 p,
    Vector3 q,
  ) => _wasm.Vector3Equals(
    Vector3$.Ref1(p).toJS,
    Vector3$.Ref2(q).toJS,
  );

  @override
  Vector3 Vector3Refract(
    Vector3 v,
    Vector3 n,
    double r,
  ) => Vector3$.Extract(
    (p) => _wasm.Vector3Refract(
      p.toJS,
      Vector3$.Ref1(v).toJS,
      Vector3$.Ref2(n).toJS,
      r.toJS,
    ),
  );
}
