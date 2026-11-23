part of '../../../raylib_dartified.dart';

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector3] methods/factories.
/// Exists purely for Raylib API symmetry.
final class RaylibVector3ExtDart extends XPackageModule<Raylib> {

  RaylibVector3ExtDart(super.pkg);

  /// See [Vector3.zero].
  Vector3 Vector3Zero() => .zero();

  /// See [Vector3.one].
  Vector3 Vector3One() => .one();

  /// See [Vector3.add].
  Vector3 Vector3Add(
    Vector3 v1,
    Vector3 v2,
  ) => v1.add(v2);

  /// See [Vector3.addValue].
  Vector3 Vector3AddValue(
    Vector3 v,
    double add,
  ) => v.addValue(add);

  /// See [Vector3.sub].
  Vector3 Vector3Subtract(
    Vector3 v1,
    Vector3 v2,
  ) => v1.sub(v2);

  /// See [Vector3.subValue].
  Vector3 Vector3SubtractValue(
    Vector3 v,
    double sub,
  ) => v.subValue(sub);

  /// See [Vector3.scale].
  Vector3 Vector3Scale(
    Vector3 v,
    double scalar,
  ) => v.scale(scalar);

  /// See [Vector3.mul].
  Vector3 Vector3Multiply(
    Vector3 v1,
    Vector3 v2,
  ) => v1.mul(v2);

  /// See [Vector3.crossProduct].
  Vector3 Vector3CrossProduct(
    Vector3 v1,
    Vector3 v2,
  ) => v1.crossProduct(v2);

  /// See [Vector3.perpendicular].
  Vector3 Vector3Perpendicular(
    Vector3 v,
  ) => .perpendicular(v);

  /// See [Vector3.length].
  double Vector3Length(
    Vector3 v,
  ) => v.length;

  /// See [Vector3.lengthSqr].
  double Vector3LengthSqr(
    Vector3 v,
  ) => v.lengthSqr;

  /// See [Vector3.dotProduct].
  double Vector3DotProduct(
    Vector3 v1,
    Vector3 v2,
  ) => v1.dotProduct(v2);

  /// See [Vector3.distance].
  double Vector3Distance(
    Vector3 v1,
    Vector3 v2,
  ) => v1.distance(v2);

  /// See [Vector3.distanceSqr].
  double Vector3DistanceSqr(
    Vector3 v1,
    Vector3 v2,
  ) => v1.distanceSqr(v2);

  /// See [Vector3.angle].
  double Vector3Angle(
    Vector3 v1,
    Vector3 v2,
  ) => v1.angle(v2);

  /// See [Vector3.negate].
  Vector3 Vector3Negate(
    Vector3 v,
  ) => v.negate();

  /// See [Vector3.div].
  Vector3 Vector3Divide(
    Vector3 v1,
    Vector3 v2,
  ) => v1.div(v2);

  /// See [Vector3.normalize].
  Vector3 Vector3Normalize(
    Vector3 v,
  ) => v.normalize();

  /// See [Vector3.project].
  Vector3 Vector3Project(
    Vector3 v1,
    Vector3 v2,
  ) => v1.project(v2);

  /// See [Vector3.reject].
  Vector3 Vector3Reject(
    Vector3 v1,
    Vector3 v2,
  ) => v1.reject(v2);

  /// See [Vector3.orthoNormalize].
  void Vector3OrthoNormalize(
    Vector3 v1,
    Vector3 v2,
  ) => v2.setDart(v1.orthoNormalize(v2));

  /// See [Vector3.transform].
  Vector3 Vector3Transform(
    Vector3 v,
    Matrix mat,
  ) => v.transform(mat);

  /// See [Vector3.rotateByQuaternion].
  Vector3 Vector3RotateByQuaternion(
    Vector3 v,
    Quaternion q,
  ) => v.rotateByQuaternion(q);

  /// See [Vector3.rotateByAxisAngle].
  Vector3 Vector3RotateByAxisAngle(
    Vector3 v,
    Vector3 axis,
    double angle,
  ) => v.rotateByAxisAngle(axis, angle);

  /// See [Vector3.moveTowards].
  Vector3 Vector3MoveTowards(
    Vector3 v,
    Vector3 target,
    double maxDistance,
  ) => v.moveTowards(target, maxDistance);

  /// See [Vector3.lerp].
  Vector3 Vector3Lerp(
    Vector3 v1,
    Vector3 v2,
    double amount,
  ) => v1.lerp(v2, amount);

  /// See [Vector3.cubicHermite].
  Vector3 Vector3CubicHermite(
    Vector3 v1,
    Vector3 tangent1,
    Vector3 v2,
    Vector3 tangent2,
    double amount,
  ) => v1.cubicHermite(tangent1, v2, tangent2, amount);

  /// See [Vector3.reflect].
  Vector3 Vector3Reflect(
    Vector3 v,
    Vector3 normal,
  ) => v.reflect(normal);

  /// See [Vector3.min].
  Vector3 Vector3Min(
    Vector3 v1,
    Vector3 v2,
  ) => v1.min(v2);

  /// See [Vector3.max].
  Vector3 Vector3Max(
    Vector3 v1,
    Vector3 v2,
  ) => v1.max(v2);

  /// See [Vector3.barycenter].
  Vector3 Vector3Barycenter(
    Vector3 p,
    Vector3 a,
    Vector3 b,
    Vector3 c,
  ) => .barycenter(p, a, b, c);

  /// See [Vector3.unproject].
  Vector3 Vector3Unproject(
    Vector3 source,
    Matrix projection,
    Matrix view,
  ) => source.unproject(projection, view);

  /// See [Vector3.toArray].
  float3 Vector3ToFloatV(
    Vector3 v,
  ) => v.toFloatV();

  /// See [Vector3.invert].
  Vector3 Vector3Invert(
    Vector3 v,
  ) => v.invert();

  /// See [Vector3.clamp].
  Vector3 Vector3Clamp(
    Vector3 v,
    Vector3 min,
    Vector3 max,
  ) => v.clamp(min, max);

  /// See [Vector3.clampValue].
  Vector3 Vector3ClampValue(
    Vector3 v,
    double min,
    double max,
  ) => v.clampValue(min, max);

  /// See [Vector3.equals].
  bool Vector3Equals(
    Vector3 p,
    Vector3 q,
  ) => p.equals(q);

  /// See [Vector3.refract].
  Vector3 Vector3Refract(
    Vector3 v,
    Vector3 n,
    double r,
  ) => v.refract(n, r);
}