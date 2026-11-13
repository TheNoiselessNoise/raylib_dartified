import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibVector3ExtDart get _module => RaylibBase.instance.module();

/// See [RaylibVector3ExtDart.Vector3Zero].
Vector3 Vector3Zero() => _module.Vector3Zero();

/// See [RaylibVector3ExtDart.Vector3One].
Vector3 Vector3One() => _module.Vector3One();

/// See [RaylibVector3ExtDart.Vector3Add].
Vector3 Vector3Add(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3Add(v1, v2);

/// See [RaylibVector3ExtDart.Vector3AddValue].
Vector3 Vector3AddValue(
  Vector3 v,
  double add,
) => _module.Vector3AddValue(v, add);

/// See [RaylibVector3ExtDart.Vector3Subtract].
Vector3 Vector3Subtract(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3Subtract(v1, v2);

/// See [RaylibVector3ExtDart.Vector3SubtractValue].
Vector3 Vector3SubtractValue(
  Vector3 v,
  double sub,
) => _module.Vector3SubtractValue(v, sub);

/// See [RaylibVector3ExtDart.Vector3Scale].
Vector3 Vector3Scale(
  Vector3 v,
  double scalar,
) => _module.Vector3Scale(v, scalar);

/// See [RaylibVector3ExtDart.Vector3Multiply].
Vector3 Vector3Multiply(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3Multiply(v1, v2);

/// See [RaylibVector3ExtDart.Vector3CrossProduct].
Vector3 Vector3CrossProduct(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3CrossProduct(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Perpendicular].
Vector3 Vector3Perpendicular(
  Vector3 v,
) => _module.Vector3Perpendicular(v);

/// See [RaylibVector3ExtDart.Vector3Length].
double Vector3Length(
  Vector3 v,
) => _module.Vector3Length(v);

/// See [RaylibVector3ExtDart.Vector3LengthSqr].
double Vector3LengthSqr(
  Vector3 v,
) => _module.Vector3LengthSqr(v);

/// See [RaylibVector3ExtDart.Vector3DotProduct].
double Vector3DotProduct(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3DotProduct(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Distance].
double Vector3Distance(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3Distance(v1, v2);

/// See [RaylibVector3ExtDart.Vector3DistanceSqr].
double Vector3DistanceSqr(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3DistanceSqr(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Angle].
double Vector3Angle(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3Angle(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Negate].
Vector3 Vector3Negate(
  Vector3 v,
) => _module.Vector3Negate(v);

/// See [RaylibVector3ExtDart.Vector3Divide].
Vector3 Vector3Divide(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3Divide(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Normalize].
Vector3 Vector3Normalize(
  Vector3 v,
) => _module.Vector3Normalize(v);

/// See [RaylibVector3ExtDart.Vector3Project].
Vector3 Vector3Project(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3Project(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Reject].
Vector3 Vector3Reject(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3Reject(v1, v2);

/// See [RaylibVector3ExtDart.Vector3OrthoNormalize].
void Vector3OrthoNormalize(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3OrthoNormalize(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Transform].
Vector3 Vector3Transform(
  Vector3 v,
  Matrix mat,
) => _module.Vector3Transform(v, mat);

/// See [RaylibVector3ExtDart.Vector3RotateByQuaternion].
Vector3 Vector3RotateByQuaternion(
  Vector3 v,
  Quaternion q,
) => _module.Vector3RotateByQuaternion(v, q);

/// See [RaylibVector3ExtDart.Vector3RotateByAxisAngle].
Vector3 Vector3RotateByAxisAngle(
  Vector3 v,
  Vector3 axis,
  double angle,
) => _module.Vector3RotateByAxisAngle(v, axis, angle);

/// See [RaylibVector3ExtDart.Vector3MoveTowards].
Vector3 Vector3MoveTowards(
  Vector3 v,
  Vector3 target,
  double maxDistance,
) => _module.Vector3MoveTowards(v, target, maxDistance);

/// See [RaylibVector3ExtDart.Vector3Lerp].
Vector3 Vector3Lerp(
  Vector3 v1,
  Vector3 v2,
  double amount,
) => _module.Vector3Lerp(v1, v2, amount);

/// See [RaylibVector3ExtDart.Vector3CubicHermite].
Vector3 Vector3CubicHermite(
  Vector3 v1,
  Vector3 tangent1,
  Vector3 v2,
  Vector3 tangent2,
  double amount,
) => _module.Vector3CubicHermite(v1, tangent1, v2, tangent2, amount);

/// See [RaylibVector3ExtDart.Vector3Reflect].
Vector3 Vector3Reflect(
  Vector3 v,
  Vector3 normal,
) => _module.Vector3Reflect(v, normal);

/// See [RaylibVector3ExtDart.Vector3Min].
Vector3 Vector3Min(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3Min(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Max].
Vector3 Vector3Max(
  Vector3 v1,
  Vector3 v2,
) => _module.Vector3Max(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Barycenter].
Vector3 Vector3Barycenter(
  Vector3 p,
  Vector3 a,
  Vector3 b,
  Vector3 c,
) => _module.Vector3Barycenter(p, a, b, c);

/// See [RaylibVector3ExtDart.Vector3Unproject].
Vector3 Vector3Unproject(
  Vector3 source,
  Matrix projection,
  Matrix view,
) => _module.Vector3Unproject(source, projection, view);

/// See [RaylibVector3ExtDart.Vector3ToFloatV].
float3 Vector3ToFloatV(
  Vector3 v,
) => _module.Vector3ToFloatV(v);

/// See [RaylibVector3ExtDart.Vector3Invert].
Vector3 Vector3Invert(
  Vector3 v,
) => _module.Vector3Invert(v);

/// See [RaylibVector3ExtDart.Vector3Clamp].
Vector3 Vector3Clamp(
  Vector3 v,
  Vector3 min,
  Vector3 max,
) => _module.Vector3Clamp(v, min, max);

/// See [RaylibVector3ExtDart.Vector3ClampValue].
Vector3 Vector3ClampValue(
  Vector3 v,
  double min,
  double max,
) => _module.Vector3ClampValue(v, min, max);

/// See [RaylibVector3ExtDart.Vector3Equals].
bool Vector3Equals(
  Vector3 p,
  Vector3 q,
) => _module.Vector3Equals(p, q);

/// See [RaylibVector3ExtDart.Vector3Refract].
Vector3 Vector3Refract(
  Vector3 v,
  Vector3 n,
  double r,
) => _module.Vector3Refract(v, n, r);