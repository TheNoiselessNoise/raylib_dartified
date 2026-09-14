import 'dart:ffi';
import 'package:raylib_dartified/raylib_dartified.dart';

RaylibQuaternionExt get _module => Raylib.instance.module();

/// See [RaylibQuaternionExt.QuaternionAdd].
QuaternionC QuaternionAdd(QuaternionC q1, QuaternionC q2)
  => _module.QuaternionAdd(q1, q2);

/// See [RaylibQuaternionExt.QuaternionAddValue].
QuaternionC QuaternionAddValue(QuaternionC q, double add)
  => _module.QuaternionAddValue(q, add);

/// See [RaylibQuaternionExt.QuaternionCubicHermiteSpline].
QuaternionC QuaternionCubicHermiteSpline(QuaternionC q1, QuaternionC outTangent1, QuaternionC q2, QuaternionC inTangent2, double t)
  => _module.QuaternionCubicHermiteSpline(q1, outTangent1, q2, inTangent2, t);

/// See [RaylibQuaternionExt.QuaternionDivide].
QuaternionC QuaternionDivide(QuaternionC q1, QuaternionC q2)
  => _module.QuaternionDivide(q1, q2);

/// See [RaylibQuaternionExt.QuaternionEquals].
bool QuaternionEquals(QuaternionC p, QuaternionC q)
  => _module.QuaternionEquals(p, q);

/// See [RaylibQuaternionExt.QuaternionFromAxisAngle].
QuaternionC QuaternionFromAxisAngle(Vector3C axis, double angle)
  => _module.QuaternionFromAxisAngle(axis, angle);

/// See [RaylibQuaternionExt.QuaternionFromEuler].
QuaternionC QuaternionFromEuler(double pitch, double yaw, double roll)
  => _module.QuaternionFromEuler(pitch, yaw, roll);

/// See [RaylibQuaternionExt.QuaternionFromMatrix].
QuaternionC QuaternionFromMatrix(MatrixC mat)
  => _module.QuaternionFromMatrix(mat);

/// See [RaylibQuaternionExt.QuaternionFromVector3ToVector3].
QuaternionC QuaternionFromVector3ToVector3(Vector3C from, Vector3C to)
  => _module.QuaternionFromVector3ToVector3(from, to);

/// See [RaylibQuaternionExt.QuaternionIdentity].
QuaternionC QuaternionIdentity()
  => _module.QuaternionIdentity();

/// See [RaylibQuaternionExt.QuaternionInvert].
QuaternionC QuaternionInvert(QuaternionC q)
  => _module.QuaternionInvert(q);

/// See [RaylibQuaternionExt.QuaternionLength].
double QuaternionLength(QuaternionC q)
  => _module.QuaternionLength(q);

/// See [RaylibQuaternionExt.QuaternionLerp].
QuaternionC QuaternionLerp(QuaternionC q1, QuaternionC q2, double amount)
  => _module.QuaternionLerp(q1, q2, amount);

/// See [RaylibQuaternionExt.QuaternionMultiply].
QuaternionC QuaternionMultiply(QuaternionC q1, QuaternionC q2)
  => _module.QuaternionMultiply(q1, q2);

/// See [RaylibQuaternionExt.QuaternionNlerp].
QuaternionC QuaternionNlerp(QuaternionC q1, QuaternionC q2, double amount)
  => _module.QuaternionNlerp(q1, q2, amount);

/// See [RaylibQuaternionExt.QuaternionNormalize].
QuaternionC QuaternionNormalize(QuaternionC q)
  => _module.QuaternionNormalize(q);

/// See [RaylibQuaternionExt.QuaternionScale].
QuaternionC QuaternionScale(QuaternionC q, double mul)
  => _module.QuaternionScale(q, mul);

/// See [RaylibQuaternionExt.QuaternionSlerp].
QuaternionC QuaternionSlerp(QuaternionC q1, QuaternionC q2, double amount)
  => _module.QuaternionSlerp(q1, q2, amount);

/// See [RaylibQuaternionExt.QuaternionSubtract].
QuaternionC QuaternionSubtract(QuaternionC q1, QuaternionC q2)
  => _module.QuaternionSubtract(q1, q2);

/// See [RaylibQuaternionExt.QuaternionSubtractValue].
QuaternionC QuaternionSubtractValue(QuaternionC q, double sub)
  => _module.QuaternionSubtractValue(q, sub);

/// See [RaylibQuaternionExt.QuaternionToAxisAngle].
void QuaternionToAxisAngle(QuaternionC q, Pointer<Vector3C> outAxis, Pointer<Float> outAngle)
  => _module.QuaternionToAxisAngle(q, outAxis, outAngle);

/// See [RaylibQuaternionExt.QuaternionToEuler].
Vector3C QuaternionToEuler(QuaternionC q)
  => _module.QuaternionToEuler(q);

/// See [RaylibQuaternionExt.QuaternionToMatrix].
MatrixC QuaternionToMatrix(QuaternionC q)
  => _module.QuaternionToMatrix(q);

/// See [RaylibQuaternionExt.QuaternionTransform].
QuaternionC QuaternionTransform(QuaternionC q, MatrixC mat)
  => _module.QuaternionTransform(q, mat);
