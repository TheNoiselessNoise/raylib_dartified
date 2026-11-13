part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector4] methods/factories.
/// Exists purely for Raylib API symmetry.
abstract class RaylibVector4FlatExt<R extends RaylibBase> extends RaylibModule<R> {

  RaylibVector4FlatExt(super.rl);

  /// Get vector zero
  Vector4 Vector4Zero();

  /// Get vector one
  Vector4 Vector4One();

  /// Add two vectors
  Vector4 Vector4Add(
    Vector4 v1,
    Vector4 v2,
  );

  /// Add value to vector components
  Vector4 Vector4AddValue(
    Vector4 v,
    double add,
  );

  /// Substract vectors
  Vector4 Vector4Subtract(
    Vector4 v1,
    Vector4 v2,
  );

  /// Substract value from vector components
  Vector4 Vector4SubtractValue(
    Vector4 v,
    double add,
  );

  /// Vector length
  double Vector4Length(
    Vector4 v,
  );

  /// Vector square length
  double Vector4LengthSqr(
    Vector4 v,
  );

  /// Vectors dot product
  double Vector4DotProduct(
    Vector4 v1,
    Vector4 v2,
  );

  /// Calculate distance between two vectors
  double Vector4Distance(
    Vector4 v1,
    Vector4 v2,
  );

  /// Calculate square distance between two vectors
  double Vector4DistanceSqr(
    Vector4 v1,
    Vector4 v2,
  );

  /// Scale vector components by value (multiply)
  Vector4 Vector4Scale(
    Vector4 v,
    double scale,
  );

  /// Multiply vector by vector
  Vector4 Vector4Multiply(
    Vector4 v1,
    Vector4 v2,
  );

  /// Negate vector
  Vector4 Vector4Negate(
    Vector4 v,
  );

  /// Divide vector by vector
  Vector4 Vector4Divide(
    Vector4 v1,
    Vector4 v2,
  );

  /// Normalize provided vector
  Vector4 Vector4Normalize(
    Vector4 v,
  );

  /// Get min value for each pair of components
  Vector4 Vector4Min(
    Vector4 v1,
    Vector4 v2,
  );

  /// Get max value for each pair of components
  Vector4 Vector4Max(
    Vector4 v1,
    Vector4 v2,
  );

  /// Calculate linear interpolation between two vectors
  Vector4 Vector4Lerp(
    Vector4 v1,
    Vector4 v2,
    double amount,
  );

  /// Move Vector towards target
  Vector4 Vector4MoveTowards(
    Vector4 v,
    Vector4 target,
    double maxDistance,
  );

  /// Invert the given vector
  Vector4 Vector4Invert(
    Vector4 v,
  );

  /// Check whether two given vectors are almost equal
  bool Vector4Equals(
    Vector4 p,
    Vector4 q,
  );
}