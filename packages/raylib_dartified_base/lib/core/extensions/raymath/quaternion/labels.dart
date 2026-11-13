part of '../../../raylib_dartified_base.dart';

class _RaylibQuaternionExtDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibQuaternionExtDart.QuaternionAdd].
  String QuaternionAdd(
    Quaternion q1,
    Quaternion q2,
  ) => 'QuaternionAdd($q1, $q2)';

  /// Label for [RaylibQuaternionExtDart.QuaternionAddValue].
  String QuaternionAddValue(
    Quaternion q,
    double add,
  ) => 'QuaternionAddValue($q, $add)';

  /// Label for [RaylibQuaternionExtDart.QuaternionSubtract].
  String QuaternionSubtract(
    Quaternion q1,
    Quaternion q2,
  ) => 'QuaternionSubtract($q1, $q2)';

  /// Label for [RaylibQuaternionExtDart.QuaternionSubtractValue].
  String QuaternionSubtractValue(
    Quaternion q,
    double sub,
  ) => 'QuaternionSubtractValue($q, $sub)';

  /// Label for [RaylibQuaternionExtDart.QuaternionIdentity].
  String QuaternionIdentity()
    => 'QuaternionIdentity()';

  /// Label for [RaylibQuaternionExtDart.QuaternionLength].
  String QuaternionLength(
    Quaternion q,
  ) => 'QuaternionLength($q)';

  /// Label for [RaylibQuaternionExtDart.QuaternionNormalize].
  String QuaternionNormalize(
    Quaternion q,
  ) => 'QuaternionNormalize($q)';

  /// Label for [RaylibQuaternionExtDart.QuaternionInvert].
  String QuaternionInvert(
    Quaternion q,
  ) => 'QuaternionInvert($q)';

  /// Label for [RaylibQuaternionExtDart.QuaternionMultiply].
  String QuaternionMultiply(
    Quaternion q1,
    Quaternion q2,
  ) => 'QuaternionMultiply($q1, $q2)';

  /// Label for [RaylibQuaternionExtDart.QuaternionScale].
  String QuaternionScale(
    Quaternion q,
    double mul,
  ) => 'QuaternionScale($q, $mul)';

  /// Label for [RaylibQuaternionExtDart.QuaternionDivide].
  String QuaternionDivide(
    Quaternion q1,
    Quaternion q2,
  ) => 'QuaternionDivide($q1, $q2)';

  /// Label for [RaylibQuaternionExtDart.QuaternionLerp].
  String QuaternionLerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => 'QuaternionLerp($q1, $q2, $amount)';

  /// Label for [RaylibQuaternionExtDart.QuaternionNlerp].
  String QuaternionNlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => 'QuaternionNlerp($q1, $q2, $amount)';

  /// Label for [RaylibQuaternionExtDart.QuaternionSlerp].
  String QuaternionSlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => 'QuaternionSlerp($q1, $q2, $amount)';

  /// Label for [RaylibQuaternionExtDart.QuaternionCubicHermiteSpline].
  String QuaternionCubicHermiteSpline(
    Quaternion q1,
    Quaternion outTangent1,
    Quaternion q2,
    Quaternion inTangent2,
    double t,
  ) => 'QuaternionCubicHermiteSpline($q1, $outTangent1, $q2, $inTangent2, $t)';

  /// Label for [RaylibQuaternionExtDart.QuaternionFromVector3ToVector3].
  String QuaternionFromVector3ToVector3(
    Vector3 from,
    Vector3 to,
  ) => 'QuaternionFromVector3ToVector3($from, $to)';

  /// Label for [RaylibQuaternionExtDart.QuaternionFromMatrix].
  String QuaternionFromMatrix(
    Matrix mat,
  ) => 'QuaternionFromMatrix($mat)';

  /// Label for [RaylibQuaternionExtDart.QuaternionToMatrix].
  String QuaternionToMatrix(
    Quaternion q,
  ) => 'QuaternionToMatrix($q)';

  /// Label for [RaylibQuaternionExtDart.QuaternionFromAxisAngle].
  String QuaternionFromAxisAngle(
    Vector3 axis,
    double angle,
  ) => 'QuaternionFromAxisAngle($axis, $angle)';

  /// Label for [RaylibQuaternionExtDart.QuaternionToAxisAngle].
  String QuaternionToAxisAngle(
    Quaternion q,
  ) => 'QuaternionToAxisAngle($q)';

  /// Label for [RaylibQuaternionExtDart.QuaternionFromEuler].
  String QuaternionFromEuler(
    double pitch,
    double yaw,
    double roll,
  ) => 'QuaternionFromEuler($pitch, $yaw, $roll)';

  /// Label for [RaylibQuaternionExtDart.QuaternionToEuler].
  String QuaternionToEuler(
    Quaternion q,
  ) => 'QuaternionToEuler($q)';

  /// Label for [RaylibQuaternionExtDart.QuaternionTransform].
  String QuaternionTransform(
    Quaternion q,
    Matrix mat,
  ) => 'QuaternionTransform($q, $mat)';

  /// Label for [RaylibQuaternionExtDart.QuaternionEquals].
  String QuaternionEquals(
    Quaternion p,
    Quaternion q,
  ) => 'QuaternionEquals($p, $q)';
  
}
