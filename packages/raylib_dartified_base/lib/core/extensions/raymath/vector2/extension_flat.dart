part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector2] methods/factories.
/// Exists purely for Raylib API symmetry.
abstract class RaylibVector2FlatExt<R extends RaylibBase> extends RaylibModule<R> {

  RaylibVector2FlatExt(super.rl);

  /// Vector with components value 0.0f
  Vector2 Vector2Zero();

  /// Vector with components value 1.0f
  Vector2 Vector2One();

  /// Add two vectors (v1 + v2)
  Vector2 Vector2Add(
    Vector2 v1,
    Vector2 v2,
  );

  /// Add vector and double value
  Vector2 Vector2AddValue(
    Vector2 v,
    double add,
  );

  /// Subtract two vectors (v1 - v2)
  Vector2 Vector2Subtract(
    Vector2 v1,
    Vector2 v2,
  );

  /// Subtract vector by double value
  Vector2 Vector2SubtractValue(
    Vector2 v,
    double sub,
  );

  /// Calculate vector length
  double Vector2Length(
    Vector2 v,
  );

  /// Calculate vector square length
  double Vector2LengthSqr(
    Vector2 v,
  );

  /// Calculate two vectors dot product
  double Vector2DotProduct(
    Vector2 v1,
    Vector2 v2,
  );

  /// Calculate two vectors cross product
  double Vector2CrossProduct(
    Vector2 v1,
    Vector2 v2,
  );

  /// Calculate distance between two vectors
  double Vector2Distance(
    Vector2 v1,
    Vector2 v2,
  );

  /// Calculate square distance between two vectors
  double Vector2DistanceSqr(
    Vector2 v1,
    Vector2 v2,
  );

  /// Calculate the signed angle from v1 to v2, relative to the origin (0, 0)
  /// 
  /// NOTE: Coordinate system convention: positive X right, positive Y down
  /// positive angles appear clockwise, and negative angles appear counterclockwise
  double Vector2Angle(
    Vector2 v1,
    Vector2 v2,
  );

  /// Calculate angle defined by a two vectors line
  /// 
  /// NOTE: Parameters need to be normalized
  double Vector2LineAngle(
    Vector2 start,
    Vector2 end,
  );

  /// Scale vector (multiply by value)
  Vector2 Vector2Scale(
    Vector2 v,
    double scale,
  );

  /// Multiply vector by vector
  Vector2 Vector2Multiply(
    Vector2 v1,
    Vector2 v2,
  );

  /// Negate vector
  Vector2 Vector2Negate(
    Vector2 v,
  );

  /// Divide vector by vector
  Vector2 Vector2Divide(
    Vector2 v1,
    Vector2 v2,
  );

  /// Normalize provided vector
  Vector2 Vector2Normalize(
    Vector2 v,
  );

  /// Transforms a Vector2 by a given Matrix
  Vector2 Vector2Transform(
    Vector2 v,
    Matrix mat,
  );

  /// Calculate linear interpolation between two vectors
  Vector2 Vector2Lerp(
    Vector2 v1,
    Vector2 v2,
    double amount,
  );

  /// Calculate reflected vector to normal
  Vector2 Vector2Reflect(
    Vector2 v,
    Vector2 normal,
  );

  /// Get min value for each pair of components
  Vector2 Vector2Min(
    Vector2 v1,
    Vector2 v2,
  );

  /// Get max value for each pair of components
  Vector2 Vector2Max(
    Vector2 v1,
    Vector2 v2,
  );

  /// Rotate vector by angle
  Vector2 Vector2Rotate(
    Vector2 v,
    double angle,
  );

  /// Move Vector towards target
  Vector2 Vector2MoveTowards(
    Vector2 v,
    Vector2 target,
    double maxDistance,
  );

  /// Invert the given vector
  Vector2 Vector2Invert(
    Vector2 v,
  );

  /// Clamp the components of the vector between
  /// min and max values specified by the given vectors
  Vector2 Vector2Clamp(
    Vector2 v,
    Vector2 min,
    Vector2 max,
  );

  /// Clamp the magnitude of the vector between two min and max values
  Vector2 Vector2ClampValue(
    Vector2 v,
    double min,
    double max,
  );

  /// Check whether two given vectors are almost equal
  bool Vector2Equals(
    Vector2 p,
    Vector2 q,
  );

  /// Compute the direction of a refracted ray
  /// v: normalized direction of the incoming ray
  /// n: normalized normal vector of the interface of two optical media
  /// r: ratio of the refractive index of the medium from where the ray comes
  /// to the refractive index of the medium on the other side of the surface
  Vector2 Vector2Refract(
    Vector2 v,
    Vector2 n,
    double r,
  );
}