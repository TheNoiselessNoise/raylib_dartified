part of '../../../raylib_dartified.dart';

/// Exposes Raylib's quaternion math API as module-level functions by delegating
/// to the corresponding [Quaternion] methods/factories.
/// Exists purely for Raylib API symmetry.
final class RaylibQuaternionExtDart extends XPackageModule<Raylib> {

  RaylibQuaternionExtDart(super.pkg);

  /// See [Quaternion.add].
  Quaternion QuaternionAdd(
    Quaternion q1,
    Quaternion q2,
  ) => q1.add(q2);

  /// See [Quaternion.addValue].
  Quaternion QuaternionAddValue(
    Quaternion q,
    double add,
  ) => q.addValue(add);

  /// See [Quaternion.sub].
  Quaternion QuaternionSubtract(
    Quaternion q1,
    Quaternion q2,
  ) => q1.sub(q2);

  /// See [Quaternion.subValue].
  Quaternion QuaternionSubtractValue(
    Quaternion q,
    double sub,
  ) => q.subValue(sub);

  /// See [Quaternion.identity].
  Quaternion QuaternionIdentity()
    => .identity();

  /// See [Quaternion.length].
  double QuaternionLength(
    Quaternion q,
  ) => q.length;

  /// See [Quaternion.normalize].
  Quaternion QuaternionNormalize(
    Quaternion q,
  ) => q.normalize();

  /// See [Quaternion.invert].
  Quaternion QuaternionInvert(
    Quaternion q,
  ) => q.invert();

  /// See [Quaternion.mul].
  Quaternion QuaternionMultiply(
    Quaternion q1,
    Quaternion q2,
  ) => q1.mul(q2);

  /// See [Quaternion.scale].
  Quaternion QuaternionScale(
    Quaternion q,
    double mul,
  ) => q.scale(mul);

  /// See [Quaternion.div].
  Quaternion QuaternionDivide(
    Quaternion q1,
    Quaternion q2,
  ) => q1.div(q2);

  /// See [Quaternion.lerp].
  Quaternion QuaternionLerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => q1.lerp(q2, amount);

  /// See [Quaternion.nLerp].
  Quaternion QuaternionNlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => q1.nLerp(q2, amount);

  /// See [Quaternion.sLerp].
  Quaternion QuaternionSlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => q1.sLerp(q2, amount);

  /// See [Quaternion.cubicHermiteSpline].
  Quaternion QuaternionCubicHermiteSpline(
    Quaternion q1,
    Quaternion outTangent1,
    Quaternion q2,
    Quaternion inTangent2,
    double t,
  ) => q1.cubicHermiteSpline(outTangent1, q2, inTangent2, t);

  /// See [Quaternion.fromVector3ToVector3].
  Quaternion QuaternionFromVector3ToVector3(
    Vector3 from,
    Vector3 to,
  ) => .fromVector3ToVector3(from, to);

  /// See [Quaternion.fromMatrix].
  Quaternion QuaternionFromMatrix(
    Matrix mat,
  ) => .fromMatrix(mat);

  /// See [Quaternion.toMatrix].
  Matrix QuaternionToMatrix(
    Quaternion q,
  ) => q.toMatrix();

  /// See [Quaternion.fromAxisAngle].
  Quaternion QuaternionFromAxisAngle(
    Vector3 axis,
    double angle,
  ) => .fromAxisAngle(axis, angle);

  /// See [Quaternion.toAxisAngle].
  (Vector3 outAxis, double outAngle) QuaternionToAxisAngle(
    Quaternion q,
  ) => q.toAxisAngle();

  /// See [Quaternion.fromEuler].
  Quaternion QuaternionFromEuler(
    double pitch,
    double yaw,
    double roll,
  ) => .fromEuler(pitch, yaw, roll);

  /// See [Quaternion.toEuler].
  Vector3 QuaternionToEuler(
    Quaternion q,
  ) => q.toEuler();

  /// See [Quaternion.transform].
  Quaternion QuaternionTransform(
    Quaternion q,
    Matrix mat,
  ) => q.transform(mat);

  /// See [Quaternion.equals].
  bool QuaternionEquals(
    Quaternion p,
    Quaternion q,
  ) => p.equals(q);
}