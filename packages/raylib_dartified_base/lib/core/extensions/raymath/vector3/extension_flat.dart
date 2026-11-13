part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector3] methods/factories.
/// Exists purely for Raylib API symmetry.
abstract class RaylibVector3FlatExt<R extends RaylibBase> extends RaylibModule<R> {

  RaylibVector3FlatExt(super.rl);

  /// Vector with components value 0.0f
  Vector3 Vector3Zero();

  /// Vector with components value 1.0f
  Vector3 Vector3One();

  /// Add two vectors
  Vector3 Vector3Add(
    Vector3 v1,
    Vector3 v2,
  );

  /// Add vector and double value
  Vector3 Vector3AddValue(
    Vector3 v,
    double add,
  );

  /// Subtract two vectors
  Vector3 Vector3Subtract(
    Vector3 v1,
    Vector3 v2,
  );

  /// Subtract vector by double value
  Vector3 Vector3SubtractValue(
    Vector3 v,
    double sub,
  );

  /// Multiply vector by scalar
  Vector3 Vector3Scale(
    Vector3 v,
    double scalar,
  );

  /// Multiply vector by vector
  Vector3 Vector3Multiply(
    Vector3 v1,
    Vector3 v2,
  );

  /// Calculate two vectors cross product
  Vector3 Vector3CrossProduct(
    Vector3 v1,
    Vector3 v2,
  );

  /// Calculate one vector perpendicular vector
  Vector3 Vector3Perpendicular(
    Vector3 v,
  );

  /// Calculate vector length
  double Vector3Length(
    Vector3 v,
  );

  /// Calculate vector square length
  double Vector3LengthSqr(
    Vector3 v,
  );

  /// Calculate two vectors dot product
  double Vector3DotProduct(
    Vector3 v1,
    Vector3 v2,
  );

  /// Calculate distance between two vectors
  double Vector3Distance(
    Vector3 v1,
    Vector3 v2,
  );

  /// Calculate square distance between two vectors
  double Vector3DistanceSqr(
    Vector3 v1,
    Vector3 v2,
  );

  /// Calculate angle between two vectors
  double Vector3Angle(
    Vector3 v1,
    Vector3 v2,
  );

  /// Negate provided vector (invert direction)
  Vector3 Vector3Negate(
    Vector3 v,
  );

  /// Divide vector by vector
  Vector3 Vector3Divide(
    Vector3 v1,
    Vector3 v2,
  );

  /// Normalize provided vector
  Vector3 Vector3Normalize(
    Vector3 v,
  );

  /// Calculate the projection of the vector v1 on to v2
  Vector3 Vector3Project(
    Vector3 v1,
    Vector3 v2,
  );

  /// Calculate the rejection of the vector v1 on to v2
  Vector3 Vector3Reject(
    Vector3 v1,
    Vector3 v2,
  );

  /// Orthonormalize provided vectors
  /// Makes vectors normalized and orthogonal to each other
  /// Gram-Schmidt function implementation
  void Vector3OrthoNormalize(
    XStructPtr<Vector3> v1,
    XStructPtr<Vector3> v2,
  );

  /// Transforms a Vector3 by a given Matrix
  Vector3 Vector3Transform(
    Vector3 v,
    Matrix mat,
  );

  /// Transform a vector by quaternion rotation
  Vector3 Vector3RotateByQuaternion(
    Vector3 v,
    Quaternion q,
  );

  /// Rotates a vector around an axis
  Vector3 Vector3RotateByAxisAngle(
    Vector3 v,
    Vector3 axis,
    double angle,
  );

  /// Move Vector towards target
  Vector3 Vector3MoveTowards(
    Vector3 v,
    Vector3 target,
    double maxDistance,
  );

  /// Calculate linear interpolation between two vectors
  Vector3 Vector3Lerp(
    Vector3 v1,
    Vector3 v2,
    double amount,
  );

  /// Calculate cubic hermite interpolation between two vectors and their tangents
  /// as described in the GLTF 2.0 specification: https://registry.khronos.org/glTF/specs/2.0/glTF-2.0.html#interpolation-cubic
  Vector3 Vector3CubicHermite(
    Vector3 v1,
    Vector3 tangent1,
    Vector3 v2,
    Vector3 tangent2,
    double amount,
  );

  /// Calculate reflected vector to normal
  Vector3 Vector3Reflect(
    Vector3 v,
    Vector3 normal,
  );

  /// Get min value for each pair of components
  Vector3 Vector3Min(
    Vector3 v1,
    Vector3 v2,
  );

  /// Get max value for each pair of components
  Vector3 Vector3Max(
    Vector3 v1,
    Vector3 v2,
  );

  /// Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c)
  /// 
  /// NOTE: Assumes P is on the plane of the triangle
  Vector3 Vector3Barycenter(
    Vector3 p,
    Vector3 a,
    Vector3 b,
    Vector3 c,
  );

  /// Projects a Vector3 from screen space into object space
  Vector3 Vector3Unproject(
    Vector3 source,
    Matrix projection,
    Matrix view,
  );

  /// Get Vector3 as float array
  float3 Vector3ToFloatV(
    Vector3 v,
  );

  /// Invert the given vector
  Vector3 Vector3Invert(
    Vector3 v,
  );

  /// Clamp the components of the vector between
  /// min and max values specified by the given vectors
  Vector3 Vector3Clamp(
    Vector3 v,
    Vector3 min,
    Vector3 max,
  );

  /// Clamp the magnitude of the vector between two values
  Vector3 Vector3ClampValue(
    Vector3 v,
    double min,
    double max,
  );

  /// Check whether two given vectors are almost equal
  bool Vector3Equals(
    Vector3 p,
    Vector3 q,
  );

  /// Compute the direction of a refracted ray
  /// v: normalized direction of the incoming ray
  /// n: normalized normal vector of the interface of two optical media
  /// r: ratio of the refractive index of the medium from where the ray comes
  /// to the refractive index of the medium on the other side of the surface
  Vector3 Vector3Refract(
    Vector3 v,
    Vector3 n,
    double r,
  );
}