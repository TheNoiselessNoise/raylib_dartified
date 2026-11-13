import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibQuaternionExtDart get _module => RaylibBase.instance.module();

/// See [RaylibQuaternionExtDart.QuaternionAdd].
Quaternion QuaternionAdd(
  Quaternion q1,
  Quaternion q2,
) => _module.QuaternionAdd(q1, q2);

/// See [RaylibQuaternionExtDart.QuaternionAddValue].
Quaternion QuaternionAddValue(
  Quaternion q,
  double add,
) => _module.QuaternionAddValue(q, add);

/// See [RaylibQuaternionExtDart.QuaternionSubtract].
Quaternion QuaternionSubtract(
  Quaternion q1,
  Quaternion q2,
) => _module.QuaternionSubtract(q1, q2);

/// See [RaylibQuaternionExtDart.QuaternionSubtractValue].
Quaternion QuaternionSubtractValue(
  Quaternion q,
  double sub,
) => _module.QuaternionSubtractValue(q, sub);

/// See [RaylibQuaternionExtDart.QuaternionIdentity].
Quaternion QuaternionIdentity() => _module.QuaternionIdentity();

/// See [RaylibQuaternionExtDart.QuaternionLength].
double QuaternionLength(
  Quaternion q,
) => _module.QuaternionLength(q);

/// See [RaylibQuaternionExtDart.QuaternionNormalize].
Quaternion QuaternionNormalize(
  Quaternion q,
) => _module.QuaternionNormalize(q);

/// See [RaylibQuaternionExtDart.QuaternionInvert].
Quaternion QuaternionInvert(
  Quaternion q,
) => _module.QuaternionInvert(q);

/// See [RaylibQuaternionExtDart.QuaternionMultiply].
Quaternion QuaternionMultiply(
  Quaternion q1,
  Quaternion q2,
) => _module.QuaternionMultiply(q1, q2);

/// See [RaylibQuaternionExtDart.QuaternionScale].
Quaternion QuaternionScale(
  Quaternion q,
  double mul,
) => _module.QuaternionScale(q, mul);

/// See [RaylibQuaternionExtDart.QuaternionDivide].
Quaternion QuaternionDivide(
  Quaternion q1,
  Quaternion q2,
) => _module.QuaternionDivide(q1, q2);

/// See [RaylibQuaternionExtDart.QuaternionLerp].
Quaternion QuaternionLerp(
  Quaternion q1,
  Quaternion q2,
  double amount,
) => _module.QuaternionLerp(q1, q2, amount);

/// See [RaylibQuaternionExtDart.QuaternionNlerp].
Quaternion QuaternionNlerp(
  Quaternion q1,
  Quaternion q2,
  double amount,
) => _module.QuaternionNlerp(q1, q2, amount);

/// See [RaylibQuaternionExtDart.QuaternionSlerp].
Quaternion QuaternionSlerp(
  Quaternion q1,
  Quaternion q2,
  double amount,
) => _module.QuaternionSlerp(q1, q2, amount);

/// See [RaylibQuaternionExtDart.QuaternionCubicHermiteSpline].
Quaternion QuaternionCubicHermiteSpline(
  Quaternion q1,
  Quaternion outTangent1,
  Quaternion q2,
  Quaternion inTangent2,
  double t,
) => _module.QuaternionCubicHermiteSpline(q1, outTangent1, q2, inTangent2, t);

/// See [RaylibQuaternionExtDart.QuaternionFromVector3ToVector3].
Quaternion QuaternionFromVector3ToVector3(
  Vector3 from,
  Vector3 to,
) => _module.QuaternionFromVector3ToVector3(from, to);

/// See [RaylibQuaternionExtDart.QuaternionFromMatrix].
Quaternion QuaternionFromMatrix(
  Matrix mat,
) => _module.QuaternionFromMatrix(mat);

/// See [RaylibQuaternionExtDart.QuaternionToMatrix].
Matrix QuaternionToMatrix(
  Quaternion q,
) => _module.QuaternionToMatrix(q);

/// See [RaylibQuaternionExtDart.QuaternionFromAxisAngle].
Quaternion QuaternionFromAxisAngle(
  Vector3 axis,
  double angle,
) => _module.QuaternionFromAxisAngle(axis, angle);

/// See [RaylibQuaternionExtDart.QuaternionToAxisAngle].
(Vector3 outAxis, double outAngle) QuaternionToAxisAngle(
  Quaternion q,
) => _module.QuaternionToAxisAngle(q);

/// See [RaylibQuaternionExtDart.QuaternionFromEuler].
Quaternion QuaternionFromEuler(
  double pitch,
  double yaw,
  double roll,
) => _module.QuaternionFromEuler(pitch, yaw, roll);

/// See [RaylibQuaternionExtDart.QuaternionToEuler].
Vector3 QuaternionToEuler(
  Quaternion q,
) => _module.QuaternionToEuler(q);

/// See [RaylibQuaternionExtDart.QuaternionTransform].
Quaternion QuaternionTransform(
  Quaternion q,
  Matrix mat,
) => _module.QuaternionTransform(q, mat);

/// See [RaylibQuaternionExtDart.QuaternionEquals].
bool QuaternionEquals(
  Quaternion p,
  Quaternion q,
) => _module.QuaternionEquals(p, q);