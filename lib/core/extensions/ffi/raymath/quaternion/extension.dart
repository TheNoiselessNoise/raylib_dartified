part of '../../../../raylib_dartified.dart';

class RaylibQuaternionExt extends RaylibModule<Raylib> {
  RaylibQuaternionExt(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibCore>();

  /// Add two quaternions
  QuaternionC QuaternionAdd(QuaternionC q1, QuaternionC q2)
    => _QuaternionAdd(q1, q2);
  late final _QuaternionAddPtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC, QuaternionC)>>('QuaternionAdd');
  late final _QuaternionAdd = _QuaternionAddPtr.asFunction<QuaternionC Function(QuaternionC, QuaternionC)>();

  /// Add quaternion and double value
  QuaternionC QuaternionAddValue(QuaternionC q, double add)
    => _QuaternionAddValue(q, add);
  late final _QuaternionAddValuePtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC, Float)>>('QuaternionAddValue');
  late final _QuaternionAddValue = _QuaternionAddValuePtr.asFunction<QuaternionC Function(QuaternionC, double)>();

  /// Calculate quaternion cubic spline interpolation using Cubic Hermite Spline algorithm
  /// as described in the GLTF 2.0 specification: https://registry.khronos.org/glTF/specs/2.0/glTF-2.0.html#interpolation-cubic
  QuaternionC QuaternionCubicHermiteSpline(QuaternionC q1, QuaternionC outTangent1, QuaternionC q2, QuaternionC inTangent2, double t)
    => _QuaternionCubicHermiteSpline(q1, outTangent1, q2, inTangent2, t);
  late final _QuaternionCubicHermiteSplinePtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC, QuaternionC, QuaternionC, QuaternionC, Float)>>('QuaternionCubicHermiteSpline');
  late final _QuaternionCubicHermiteSpline = _QuaternionCubicHermiteSplinePtr.asFunction<QuaternionC Function(QuaternionC, QuaternionC, QuaternionC, QuaternionC, double)>();

  /// Divide two quaternions
  QuaternionC QuaternionDivide(QuaternionC q1, QuaternionC q2)
    => _QuaternionDivide(q1, q2);
  late final _QuaternionDividePtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC, QuaternionC)>>('QuaternionDivide');
  late final _QuaternionDivide = _QuaternionDividePtr.asFunction<QuaternionC Function(QuaternionC, QuaternionC)>();

  /// Check whether two given quaternions are almost equal
  bool QuaternionEquals(QuaternionC p, QuaternionC q)
    => _QuaternionEquals(p, q) != 0;
  late final _QuaternionEqualsPtr = _lookup<NativeFunction<Int Function(QuaternionC, QuaternionC)>>('QuaternionEquals');
  late final _QuaternionEquals = _QuaternionEqualsPtr.asFunction<int Function(QuaternionC, QuaternionC)>();

  /// Get rotation quaternion for an angle and axis
  /// 
  /// NOTE: Angle must be provided in radians
  QuaternionC QuaternionFromAxisAngle(Vector3C axis, double angle)
    => _QuaternionFromAxisAngle(axis, angle);
  late final _QuaternionFromAxisAnglePtr = _lookup<NativeFunction<QuaternionC Function(Vector3C, Float)>>('QuaternionFromAxisAngle');
  late final _QuaternionFromAxisAngle = _QuaternionFromAxisAnglePtr.asFunction<QuaternionC Function(Vector3C, double)>();

  /// Get the quaternion equivalent to Euler angles
  /// 
  /// NOTE: Rotation order is ZYX
  QuaternionC QuaternionFromEuler(double pitch, double yaw, double roll)
    => _QuaternionFromEuler(pitch, yaw, roll);
  late final _QuaternionFromEulerPtr = _lookup<NativeFunction<QuaternionC Function(Float, Float, Float)>>('QuaternionFromEuler');
  late final _QuaternionFromEuler = _QuaternionFromEulerPtr.asFunction<QuaternionC Function(double, double, double)>();

  /// Get a quaternion for a given rotation matrix
  QuaternionC QuaternionFromMatrix(MatrixC mat)
    => _QuaternionFromMatrix(mat);
  late final _QuaternionFromMatrixPtr = _lookup<NativeFunction<QuaternionC Function(MatrixC)>>('QuaternionFromMatrix');
  late final _QuaternionFromMatrix = _QuaternionFromMatrixPtr.asFunction<QuaternionC Function(MatrixC)>();

  /// Calculate quaternion based on the rotation from one vector to another
  QuaternionC QuaternionFromVector3ToVector3(Vector3C from, Vector3C to)
    => _QuaternionFromVector3ToVector3(from, to);
  late final _QuaternionFromVector3ToVector3Ptr = _lookup<NativeFunction<QuaternionC Function(Vector3C, Vector3C)>>('QuaternionFromVector3ToVector3');
  late final _QuaternionFromVector3ToVector3 = _QuaternionFromVector3ToVector3Ptr.asFunction<QuaternionC Function(Vector3C, Vector3C)>();

  /// Get identity quaternion
  QuaternionC QuaternionIdentity()
    => _QuaternionIdentity();
  late final _QuaternionIdentityPtr = _lookup<NativeFunction<QuaternionC Function()>>('QuaternionIdentity');
  late final _QuaternionIdentity = _QuaternionIdentityPtr.asFunction<QuaternionC Function()>();

  /// Invert provided quaternion
  QuaternionC QuaternionInvert(QuaternionC q)
    => _QuaternionInvert(q);
  late final _QuaternionInvertPtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC)>>('QuaternionInvert');
  late final _QuaternionInvert = _QuaternionInvertPtr.asFunction<QuaternionC Function(QuaternionC)>();

  /// Computes the length of a quaternion
  double QuaternionLength(QuaternionC q)
    => _QuaternionLength(q);
  late final _QuaternionLengthPtr = _lookup<NativeFunction<Float Function(QuaternionC)>>('QuaternionLength');
  late final _QuaternionLength = _QuaternionLengthPtr.asFunction<double Function(QuaternionC)>();

  /// Calculate linear interpolation between two quaternions
  QuaternionC QuaternionLerp(QuaternionC q1, QuaternionC q2, double amount)
    => _QuaternionLerp(q1, q2, amount);
  late final _QuaternionLerpPtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC, QuaternionC, Float)>>('QuaternionLerp');
  late final _QuaternionLerp = _QuaternionLerpPtr.asFunction<QuaternionC Function(QuaternionC, QuaternionC, double)>();

  /// Calculate two quaternion multiplication
  QuaternionC QuaternionMultiply(QuaternionC q1, QuaternionC q2)
    => _QuaternionMultiply(q1, q2);
  late final _QuaternionMultiplyPtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC, QuaternionC)>>('QuaternionMultiply');
  late final _QuaternionMultiply = _QuaternionMultiplyPtr.asFunction<QuaternionC Function(QuaternionC, QuaternionC)>();

  /// Calculate slerp-optimized interpolation between two quaternions
  QuaternionC QuaternionNlerp(QuaternionC q1, QuaternionC q2, double amount)
    => _QuaternionNlerp(q1, q2, amount);
  late final _QuaternionNlerpPtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC, QuaternionC, Float)>>('QuaternionNlerp');
  late final _QuaternionNlerp = _QuaternionNlerpPtr.asFunction<QuaternionC Function(QuaternionC, QuaternionC, double)>();

  /// Normalize provided quaternion
  QuaternionC QuaternionNormalize(QuaternionC q)
    => _QuaternionNormalize(q);
  late final _QuaternionNormalizePtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC)>>('QuaternionNormalize');
  late final _QuaternionNormalize = _QuaternionNormalizePtr.asFunction<QuaternionC Function(QuaternionC)>();

  /// Scale quaternion by double value
  QuaternionC QuaternionScale(QuaternionC q, double mul)
    => _QuaternionScale(q, mul);
  late final _QuaternionScalePtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC, Float)>>('QuaternionScale');
  late final _QuaternionScale = _QuaternionScalePtr.asFunction<QuaternionC Function(QuaternionC, double)>();

  /// Calculates spherical linear interpolation between two quaternions
  QuaternionC QuaternionSlerp(QuaternionC q1, QuaternionC q2, double amount)
    => _QuaternionSlerp(q1, q2, amount);
  late final _QuaternionSlerpPtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC, QuaternionC, Float)>>('QuaternionSlerp');
  late final _QuaternionSlerp = _QuaternionSlerpPtr.asFunction<QuaternionC Function(QuaternionC, QuaternionC, double)>();

  /// Subtract two quaternions
  QuaternionC QuaternionSubtract(QuaternionC q1, QuaternionC q2)
    => _QuaternionSubtract(q1, q2);
  late final _QuaternionSubtractPtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC, QuaternionC)>>('QuaternionSubtract');
  late final _QuaternionSubtract = _QuaternionSubtractPtr.asFunction<QuaternionC Function(QuaternionC, QuaternionC)>();

  /// Subtract quaternion and double value
  QuaternionC QuaternionSubtractValue(QuaternionC q, double sub)
    => _QuaternionSubtractValue(q, sub);
  late final _QuaternionSubtractValuePtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC, Float)>>('QuaternionSubtractValue');
  late final _QuaternionSubtractValue = _QuaternionSubtractValuePtr.asFunction<QuaternionC Function(QuaternionC, double)>();

  /// Get the rotation angle and axis for a given quaternion
  void QuaternionToAxisAngle(QuaternionC q, Pointer<Vector3C> outAxis, Pointer<Float> outAngle)
    => _QuaternionToAxisAngle(q, outAxis, outAngle);
  late final _QuaternionToAxisAnglePtr = _lookup<NativeFunction<Void Function(QuaternionC, Pointer<Vector3C>, Pointer<Float>)>>('QuaternionToAxisAngle');
  late final _QuaternionToAxisAngle = _QuaternionToAxisAnglePtr.asFunction<void Function(QuaternionC, Pointer<Vector3C>, Pointer<Float>)>();

  /// Get the Euler angles equivalent to quaternion (roll, pitch, yaw)
  /// 
  /// NOTE: Angles are returned in a Vector3 struct in radians
  Vector3C QuaternionToEuler(QuaternionC q)
    => _QuaternionToEuler(q);
  late final _QuaternionToEulerPtr = _lookup<NativeFunction<Vector3C Function(QuaternionC)>>('QuaternionToEuler');
  late final _QuaternionToEuler = _QuaternionToEulerPtr.asFunction<Vector3C Function(QuaternionC)>();

  /// Get a matrix for a given quaternion
  MatrixC QuaternionToMatrix(QuaternionC q)
    => _QuaternionToMatrix(q);
  late final _QuaternionToMatrixPtr = _lookup<NativeFunction<MatrixC Function(QuaternionC)>>('QuaternionToMatrix');
  late final _QuaternionToMatrix = _QuaternionToMatrixPtr.asFunction<MatrixC Function(QuaternionC)>();

  /// Transform a quaternion given a transformation matrix
  QuaternionC QuaternionTransform(QuaternionC q, MatrixC mat)
    => _QuaternionTransform(q, mat);
  late final _QuaternionTransformPtr = _lookup<NativeFunction<QuaternionC Function(QuaternionC, MatrixC)>>('QuaternionTransform');
  late final _QuaternionTransform = _QuaternionTransformPtr.asFunction<QuaternionC Function(QuaternionC, MatrixC)>();
}
