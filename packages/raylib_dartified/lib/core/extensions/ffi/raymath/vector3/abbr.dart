import 'dart:ffi';
import 'package:raylib_dartified/raylib_dartified.dart';

RaylibVector3Ext get _module => Raylib.instance.module();

/// See [RaylibVector3Ext.Vector3Add].
Vector3C Vector3Add(Vector3C v1, Vector3C v2)
  => _module.Vector3Add(v1, v2);

/// See [RaylibVector3Ext.Vector3AddValue].
Vector3C Vector3AddValue(Vector3C v, double add)
  => _module.Vector3AddValue(v, add);

/// See [RaylibVector3Ext.Vector3Angle].
double Vector3Angle(Vector3C v1, Vector3C v2)
  => _module.Vector3Angle(v1, v2);

/// See [RaylibVector3Ext.Vector3Barycenter].
Vector3C Vector3Barycenter(Vector3C p, Vector3C a, Vector3C b, Vector3C c)
  => _module.Vector3Barycenter(p, a, b, c);

/// See [RaylibVector3Ext.Vector3Clamp].
Vector3C Vector3Clamp(Vector3C v, Vector3C min, Vector3C max)
  => _module.Vector3Clamp(v, min, max);

/// See [RaylibVector3Ext.Vector3ClampValue].
Vector3C Vector3ClampValue(Vector3C v, double min, double max)
  => _module.Vector3ClampValue(v, min, max);

/// See [RaylibVector3Ext.Vector3CrossProduct].
Vector3C Vector3CrossProduct(Vector3C v1, Vector3C v2)
  => _module.Vector3CrossProduct(v1, v2);

/// See [RaylibVector3Ext.Vector3CubicHermite].
Vector3C Vector3CubicHermite(Vector3C v1, Vector3C tangent1, Vector3C v2, Vector3C tangent2, double amount)
  => _module.Vector3CubicHermite(v1, tangent1, v2, tangent2, amount);

/// See [RaylibVector3Ext.Vector3Distance].
double Vector3Distance(Vector3C v1, Vector3C v2)
  => _module.Vector3Distance(v1, v2);

/// See [RaylibVector3Ext.Vector3DistanceSqr].
double Vector3DistanceSqr(Vector3C v1, Vector3C v2)
  => _module.Vector3DistanceSqr(v1, v2);

/// See [RaylibVector3Ext.Vector3Divide].
Vector3C Vector3Divide(Vector3C v1, Vector3C v2)
  => _module.Vector3Divide(v1, v2);

/// See [RaylibVector3Ext.Vector3DotProduct].
double Vector3DotProduct(Vector3C v1, Vector3C v2)
  => _module.Vector3DotProduct(v1, v2);

/// See [RaylibVector3Ext.Vector3Equals].
bool Vector3Equals(Vector3C p, Vector3C q)
  => _module.Vector3Equals(p, q);

/// See [RaylibVector3Ext.Vector3Invert].
Vector3C Vector3Invert(Vector3C v)
  => _module.Vector3Invert(v);

/// See [RaylibVector3Ext.Vector3Length].
double Vector3Length(Vector3C v)
  => _module.Vector3Length(v);

/// See [RaylibVector3Ext.Vector3LengthSqr].
double Vector3LengthSqr(Vector3C v)
  => _module.Vector3LengthSqr(v);

/// See [RaylibVector3Ext.Vector3Lerp].
Vector3C Vector3Lerp(Vector3C v1, Vector3C v2, double amount)
  => _module.Vector3Lerp(v1, v2, amount);

/// See [RaylibVector3Ext.Vector3Max].
Vector3C Vector3Max(Vector3C v1, Vector3C v2)
  => _module.Vector3Max(v1, v2);

/// See [RaylibVector3Ext.Vector3Min].
Vector3C Vector3Min(Vector3C v1, Vector3C v2)
  => _module.Vector3Min(v1, v2);

/// See [RaylibVector3Ext.Vector3MoveTowards].
Vector3C Vector3MoveTowards(Vector3C v, Vector3C target, double maxDistance)
  => _module.Vector3MoveTowards(v, target, maxDistance);

/// See [RaylibVector3Ext.Vector3Multiply].
Vector3C Vector3Multiply(Vector3C v1, Vector3C v2)
  => _module.Vector3Multiply(v1, v2);

/// See [RaylibVector3Ext.Vector3Negate].
Vector3C Vector3Negate(Vector3C v)
  => _module.Vector3Negate(v);

/// See [RaylibVector3Ext.Vector3Normalize].
Vector3C Vector3Normalize(Vector3C v)
  => _module.Vector3Normalize(v);

/// See [RaylibVector3Ext.Vector3One].
Vector3C Vector3One()
  => _module.Vector3One();

/// See [RaylibVector3Ext.Vector3OrthoNormalize].
void Vector3OrthoNormalize(Pointer<Vector3C> v1, Pointer<Vector3C> v2)
  => _module.Vector3OrthoNormalize(v1, v2);

/// See [RaylibVector3Ext.Vector3Perpendicular].
Vector3C Vector3Perpendicular(Vector3C v)
  => _module.Vector3Perpendicular(v);

/// See [RaylibVector3Ext.Vector3Project].
Vector3C Vector3Project(Vector3C v1, Vector3C v2)
  => _module.Vector3Project(v1, v2);

/// See [RaylibVector3Ext.Vector3Reflect].
Vector3C Vector3Reflect(Vector3C v, Vector3C normal)
  => _module.Vector3Reflect(v, normal);

/// See [RaylibVector3Ext.Vector3Refract].
Vector3C Vector3Refract(Vector3C v, Vector3C n, double r)
  => _module.Vector3Refract(v, n, r);

/// See [RaylibVector3Ext.Vector3Reject].
Vector3C Vector3Reject(Vector3C v1, Vector3C v2)
  => _module.Vector3Reject(v1, v2);

/// See [RaylibVector3Ext.Vector3RotateByAxisAngle].
Vector3C Vector3RotateByAxisAngle(Vector3C v, Vector3C axis, double angle)
  => _module.Vector3RotateByAxisAngle(v, axis, angle);

/// See [RaylibVector3Ext.Vector3RotateByQuaternion].
Vector3C Vector3RotateByQuaternion(Vector3C v, QuaternionC q)
  => _module.Vector3RotateByQuaternion(v, q);

/// See [RaylibVector3Ext.Vector3Scale].
Vector3C Vector3Scale(Vector3C v, double scalar)
  => _module.Vector3Scale(v, scalar);

/// See [RaylibVector3Ext.Vector3Subtract].
Vector3C Vector3Subtract(Vector3C v1, Vector3C v2)
  => _module.Vector3Subtract(v1, v2);

/// See [RaylibVector3Ext.Vector3SubtractValue].
Vector3C Vector3SubtractValue(Vector3C v, double sub)
  => _module.Vector3SubtractValue(v, sub);

/// See [RaylibVector3Ext.Vector3ToFloatV].
float3C Vector3ToFloatV(Vector3C v)
  => _module.Vector3ToFloatV(v);

/// See [RaylibVector3Ext.Vector3Transform].
Vector3C Vector3Transform(Vector3C v, MatrixC mat)
  => _module.Vector3Transform(v, mat);

/// See [RaylibVector3Ext.Vector3Unproject].
Vector3C Vector3Unproject(Vector3C source, MatrixC projection, MatrixC view)
  => _module.Vector3Unproject(source, projection, view);

/// See [RaylibVector3Ext.Vector3Zero].
Vector3C Vector3Zero()
  => _module.Vector3Zero();
