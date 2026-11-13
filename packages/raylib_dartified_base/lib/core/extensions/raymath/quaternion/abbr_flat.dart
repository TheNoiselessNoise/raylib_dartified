import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibQuaternionFlatExt get _module => RaylibBase.instance.module();

/// See [RaylibQuaternionFlatExt.QuaternionAdd].
Quaternion QuaternionAdd(
  Quaternion q1,
  Quaternion q2,
) => _module.QuaternionAdd(q1, q2);

/// See [RaylibQuaternionFlatExt.QuaternionAddValue].
Quaternion QuaternionAddValue(
  Quaternion q,
  double add,
) => _module.QuaternionAddValue(q, add);

/// See [RaylibQuaternionFlatExt.QuaternionSubtract].
Quaternion QuaternionSubtract(
  Quaternion q1,
  Quaternion q2,
) => _module.QuaternionSubtract(q1, q2);

/// See [RaylibQuaternionFlatExt.QuaternionSubtractValue].
Quaternion QuaternionSubtractValue(
  Quaternion q,
  double sub,
) => _module.QuaternionSubtractValue(q, sub);

/// See [RaylibQuaternionFlatExt.QuaternionIdentity].
Quaternion QuaternionIdentity() => _module.QuaternionIdentity();

/// See [RaylibQuaternionFlatExt.QuaternionLength].
double QuaternionLength(
  Quaternion q,
) => _module.QuaternionLength(q);

/// See [RaylibQuaternionFlatExt.QuaternionNormalize].
Quaternion QuaternionNormalize(
  Quaternion q,
) => _module.QuaternionNormalize(q);

/// See [RaylibQuaternionFlatExt.QuaternionInvert].
Quaternion QuaternionInvert(
  Quaternion q,
) => _module.QuaternionInvert(q);

/// See [RaylibQuaternionFlatExt.QuaternionMultiply].
Quaternion QuaternionMultiply(
  Quaternion q1,
  Quaternion q2,
) => _module.QuaternionMultiply(q1, q2);

/// See [RaylibQuaternionFlatExt.QuaternionScale].
Quaternion QuaternionScale(
  Quaternion q,
  double mul,
) => _module.QuaternionScale(q, mul);

/// See [RaylibQuaternionFlatExt.QuaternionDivide].
Quaternion QuaternionDivide(
  Quaternion q1,
  Quaternion q2,
) => _module.QuaternionDivide(q1, q2);

/// See [RaylibQuaternionFlatExt.QuaternionLerp].
Quaternion QuaternionLerp(
  Quaternion q1,
  Quaternion q2,
  double amount,
) => _module.QuaternionLerp(q1, q2, amount);

/// See [RaylibQuaternionFlatExt.QuaternionNlerp].
Quaternion QuaternionNlerp(
  Quaternion q1,
  Quaternion q2,
  double amount,
) => _module.QuaternionNlerp(q1, q2, amount);

/// See [RaylibQuaternionFlatExt.QuaternionSlerp].
Quaternion QuaternionSlerp(
  Quaternion q1,
  Quaternion q2,
  double amount,
) => _module.QuaternionSlerp(q1, q2, amount);

/// See [RaylibQuaternionFlatExt.QuaternionCubicHermiteSpline].
Quaternion QuaternionCubicHermiteSpline(
  Quaternion q1,
  Quaternion outTangent1,
  Quaternion q2,
  Quaternion inTangent2,
  double t,
) => _module.QuaternionCubicHermiteSpline(q1, outTangent1, q2, inTangent2, t);

/// See [RaylibQuaternionFlatExt.QuaternionFromVector3ToVector3].
Quaternion QuaternionFromVector3ToVector3(
  Vector3 from,
  Vector3 to,
) => _module.QuaternionFromVector3ToVector3(from, to);

/// See [RaylibQuaternionFlatExt.QuaternionFromMatrix].
Quaternion QuaternionFromMatrix(
  Matrix mat,
) => _module.QuaternionFromMatrix(mat);

/// See [RaylibQuaternionFlatExt.QuaternionToMatrix].
Matrix QuaternionToMatrix(
  Quaternion q,
) => _module.QuaternionToMatrix(q);

/// See [RaylibQuaternionFlatExt.QuaternionFromAxisAngle].
Quaternion QuaternionFromAxisAngle(
  Vector3 axis,
  double angle,
) => _module.QuaternionFromAxisAngle(axis, angle);

/// See [RaylibQuaternionFlatExt.QuaternionToAxisAngle].
void QuaternionToAxisAngle(
  Quaternion q,
  XStructPtr<Vector3> outAxis,
  XPtr<XFloat> outAngle,
) => _module.QuaternionToAxisAngle(q, outAxis, outAngle);

/// See [RaylibQuaternionFlatExt.QuaternionFromEuler].
Quaternion QuaternionFromEuler(
  double pitch,
  double yaw,
  double roll,
) => _module.QuaternionFromEuler(pitch, yaw, roll);

/// See [RaylibQuaternionFlatExt.QuaternionToEuler].
Vector3 QuaternionToEuler(
  Quaternion q,
) => _module.QuaternionToEuler(q);

/// See [RaylibQuaternionFlatExt.QuaternionTransform].
Quaternion QuaternionTransform(
  Quaternion q,
  Matrix mat,
) => _module.QuaternionTransform(q, mat);

/// See [RaylibQuaternionFlatExt.QuaternionEquals].
bool QuaternionEquals(
  Quaternion p,
  Quaternion q,
) => _module.QuaternionEquals(p, q);