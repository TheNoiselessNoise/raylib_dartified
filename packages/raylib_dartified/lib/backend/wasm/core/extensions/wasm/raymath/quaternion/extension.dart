part of '../../../../backend.dart';

final class RaylibQuaternionExt extends XPackageModuleWasm<Raylib> {
  /// Add two quaternions
  late final XF3<void> QuaternionAdd;
  /// Add quaternion and double value
  late final XF3<void> QuaternionAddValue;
  /// Calculate quaternion cubic spline interpolation using Cubic Hermite Spline algorithm
  /// as described in the GLTF 2.0 specification: https://registry.khronos.org/glTF/specs/2.0/glTF-2.0.html#interpolation-cubic
  late final XF6<void> QuaternionCubicHermiteSpline;
  /// Divide two quaternions
  late final XF3<void> QuaternionDivide;
  /// Check whether two given quaternions are almost equal
  late final XF2<bool> QuaternionEquals;
  /// Get rotation quaternion for an angle and axis
  /// 
  /// NOTE: Angle must be provided in radians
  late final XF3<void> QuaternionFromAxisAngle;
  /// Get the quaternion equivalent to Euler angles
  /// 
  /// NOTE: Rotation order is ZYX
  late final XF4<void> QuaternionFromEuler;
  /// Get a quaternion for a given rotation matrix
  late final XF2<void> QuaternionFromMatrix;
  /// Calculate quaternion based on the rotation from one vector to another
  late final XF3<void> QuaternionFromVector3ToVector3;
  /// Get identity quaternion
  late final XF1<void> QuaternionIdentity;
  /// Invert provided quaternion
  late final XF2<void> QuaternionInvert;
  /// Computes the length of a quaternion
  late final XF1<double> QuaternionLength;
  /// Calculate linear interpolation between two quaternions
  late final XF4<void> QuaternionLerp;
  /// Calculate two quaternion multiplication
  late final XF3<void> QuaternionMultiply;
  /// Calculate slerp-optimized interpolation between two quaternions
  late final XF4<void> QuaternionNlerp;
  /// Normalize provided quaternion
  late final XF2<void> QuaternionNormalize;
  /// Scale quaternion by double value
  late final XF3<void> QuaternionScale;
  /// Calculates spherical linear interpolation between two quaternions
  late final XF4<void> QuaternionSlerp;
  /// Subtract two quaternions
  late final XF3<void> QuaternionSubtract;
  /// Subtract quaternion and double value
  late final XF3<void> QuaternionSubtractValue;
  /// Get the rotation angle and axis for a given quaternion
  late final XF3<void> QuaternionToAxisAngle;
  /// Get the Euler angles equivalent to quaternion (roll, pitch, yaw)
  /// 
  /// NOTE: Angles are returned in a Vector3 struct in radians
  late final XF2<void> QuaternionToEuler;
  /// Get a matrix for a given quaternion
  late final XF2<void> QuaternionToMatrix;
  /// Transform a quaternion given a transformation matrix
  late final XF3<void> QuaternionTransform;

  RaylibQuaternionExt(super.pkg) {
    QuaternionAdd                  = swrap2('QuaternionAdd');
    QuaternionAddValue             = swrap2('QuaternionAddValue');
    QuaternionCubicHermiteSpline   = swrap5('QuaternionCubicHermiteSpline');
    QuaternionDivide               = swrap2('QuaternionDivide');
    QuaternionEquals               = dwrap2('QuaternionEquals');
    QuaternionFromAxisAngle        = swrap2('QuaternionFromAxisAngle');
    QuaternionFromEuler            = swrap3('QuaternionFromEuler');
    QuaternionFromMatrix           = swrap1('QuaternionFromMatrix');
    QuaternionFromVector3ToVector3 = swrap2('QuaternionFromVector3ToVector3');
    QuaternionIdentity             = swrap0('QuaternionIdentity');
    QuaternionInvert               = swrap1('QuaternionInvert');
    QuaternionLength               = dwrap1('QuaternionLength');
    QuaternionLerp                 = swrap3('QuaternionLerp');
    QuaternionMultiply             = swrap2('QuaternionMultiply');
    QuaternionNlerp                = swrap3('QuaternionNlerp');
    QuaternionNormalize            = swrap1('QuaternionNormalize');
    QuaternionScale                = swrap2('QuaternionScale');
    QuaternionSlerp                = swrap3('QuaternionSlerp');
    QuaternionSubtract             = swrap2('QuaternionSubtract');
    QuaternionSubtractValue        = swrap2('QuaternionSubtractValue');
    QuaternionToAxisAngle          = dwrap3('QuaternionToAxisAngle');
    QuaternionToEuler              = swrap1('QuaternionToEuler');
    QuaternionToMatrix             = swrap1('QuaternionToMatrix');
    QuaternionTransform            = swrap2('QuaternionTransform');
  }
}