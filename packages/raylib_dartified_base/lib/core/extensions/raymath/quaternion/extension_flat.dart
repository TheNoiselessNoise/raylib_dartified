part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's quaternion math API as module-level functions by delegating
/// to the corresponding [Quaternion] methods/factories.
/// Exists purely for Raylib API symmetry.
abstract class RaylibQuaternionFlatExt<R extends RaylibBase> extends RaylibModule<R> {

  RaylibQuaternionFlatExt(super.rl);

  /// Add two quaternions
  Quaternion QuaternionAdd(
    Quaternion q1,
    Quaternion q2,
  );

  /// Add quaternion and double value
  Quaternion QuaternionAddValue(
    Quaternion q,
    double add,
  );

  /// Subtract two quaternions
  Quaternion QuaternionSubtract(
    Quaternion q1,
    Quaternion q2,
  );

  /// Subtract quaternion and double value
  Quaternion QuaternionSubtractValue(
    Quaternion q,
    double sub,
  );

  /// Get identity quaternion
  Quaternion QuaternionIdentity();

  /// Computes the length of a quaternion
  double QuaternionLength(
    Quaternion q,
  );

  /// Normalize provided quaternion
  Quaternion QuaternionNormalize(
    Quaternion q,
  );

  /// Invert provided quaternion
  Quaternion QuaternionInvert(
    Quaternion q,
  );

  /// Calculate two quaternion multiplication
  Quaternion QuaternionMultiply(
    Quaternion q1,
    Quaternion q2,
  );

  /// Scale quaternion by double value
  Quaternion QuaternionScale(
    Quaternion q,
    double mul,
  );

  /// Divide two quaternions
  Quaternion QuaternionDivide(
    Quaternion q1,
    Quaternion q2,
  );

  /// Calculate linear interpolation between two quaternions
  Quaternion QuaternionLerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  );

  /// Calculate slerp-optimized interpolation between two quaternions
  Quaternion QuaternionNlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  );

  /// Calculates spherical linear interpolation between two quaternions
  Quaternion QuaternionSlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  );

  /// Calculate quaternion cubic spline interpolation using Cubic Hermite Spline algorithm
  /// as described in the GLTF 2.0 specification: https://registry.khronos.org/glTF/specs/2.0/glTF-2.0.html#interpolation-cubic
  Quaternion QuaternionCubicHermiteSpline(
    Quaternion q1,
    Quaternion outTangent1,
    Quaternion q2,
    Quaternion inTangent2,
    double t,
  );

  /// Calculate quaternion based on the rotation from one vector to another
  Quaternion QuaternionFromVector3ToVector3(
    Vector3 from,
    Vector3 to,
  );

  /// Get a quaternion for a given rotation matrix
  Quaternion QuaternionFromMatrix(
    Matrix mat,
  );

  /// Get a matrix for a given quaternion
  Matrix QuaternionToMatrix(
    Quaternion q,
  );

  /// Get rotation quaternion for an angle and axis
  /// 
  /// NOTE: Angle must be provided in radians
  Quaternion QuaternionFromAxisAngle(
    Vector3 axis,
    double angle,
  );

  /// Get the rotation angle and axis for a given quaternion
  void QuaternionToAxisAngle(
    Quaternion q,
    XStructPtr<Vector3> outAxis,
    XPtr<XFloat> outAngle,
  );

  /// Get the quaternion equivalent to Euler angles
  /// 
  /// NOTE: Rotation order is ZYX
  Quaternion QuaternionFromEuler(
    double pitch,
    double yaw,
    double roll,
  );

  /// Get the Euler angles equivalent to quaternion (roll, pitch, yaw)
  /// 
  /// NOTE: Angles are returned in a Vector3 struct in radians
  Vector3 QuaternionToEuler(
    Quaternion q,
  );

  /// Transform a quaternion given a transformation matrix
  Quaternion QuaternionTransform(
    Quaternion q,
    Matrix mat,
  );

  /// Check whether two given quaternions are almost equal
  bool QuaternionEquals(
    Quaternion p,
    Quaternion q,
  );
}