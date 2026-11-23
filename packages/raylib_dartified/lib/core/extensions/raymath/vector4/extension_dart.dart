part of '../../../raylib_dartified.dart';

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector4] methods/factories.
/// Exists purely for Raylib API symmetry.
final class RaylibVector4ExtDart extends XPackageModule<Raylib> {

  RaylibVector4ExtDart(super.pkg);

  /// See [Vector4.zero].
  Vector4 Vector4Zero() => .zero();

  /// See [Vector4.one].
  Vector4 Vector4One() => .one();

  /// See [Vector4.add].
  Vector4 Vector4Add(
    Vector4 v1,
    Vector4 v2,
  ) => v1.add(v2);

  /// See [Vector4.addValue].
  Vector4 Vector4AddValue(
    Vector4 v,
    double add,
  ) => v.addValue(add);

  /// See [Vector4.sub].
  Vector4 Vector4Subtract(
    Vector4 v1,
    Vector4 v2,
  ) => v1.sub(v2);

  /// See [Vector4.subValue].
  Vector4 Vector4SubtractValue(
    Vector4 v,
    double sub,
  ) => v.subValue(sub);

  /// See [Vector4.length].
  double Vector4Length(
    Vector4 v,
  ) => v.length;

  /// See [Vector4.lengthSqr].
  double Vector4LengthSqr(
    Vector4 v,
  ) => v.lengthSqr;

  /// See [Vector4.dotProduct].
  double Vector4DotProduct(
    Vector4 v1,
    Vector4 v2,
  ) => v1.dotProduct(v2);

  /// See [Vector4.distance].
  double Vector4Distance(
    Vector4 v1,
    Vector4 v2,
  ) => v1.distance(v2);

  /// See [Vector4.distanceSqr].
  double Vector4DistanceSqr(
    Vector4 v1,
    Vector4 v2,
  ) => v1.distanceSqr(v2);

  /// See [Vector4.scale].
  Vector4 Vector4Scale(
    Vector4 v,
    double scale,
  ) => v.scale(scale);

  /// See [Vector4.mul].
  Vector4 Vector4Multiply(
    Vector4 v1,
    Vector4 v2,
  ) => v1.mul(v2);

  /// See [Vector4.negate].
  Vector4 Vector4Negate(
    Vector4 v,
  ) => v.negate();

  /// See [Vector4.div].
  Vector4 Vector4Divide(
    Vector4 v1,
    Vector4 v2,
  ) => v1.div(v2);

  /// See [Vector4.normalize].
  Vector4 Vector4Normalize(
    Vector4 v,
  ) => v.normalize();

  /// See [Vector4.min].
  Vector4 Vector4Min(
    Vector4 v1,
    Vector4 v2,
  ) => v1.min(v2);

  /// See [Vector4.max].
  Vector4 Vector4Max(
    Vector4 v1,
    Vector4 v2,
  ) => v1.max(v2);

  /// See [Vector4.lerp].
  Vector4 Vector4Lerp(
    Vector4 v1,
    Vector4 v2,
    double amount,
  ) => v1.lerp(v2, amount);

  /// See [Vector4.moveTowards].
  Vector4 Vector4MoveTowards(
    Vector4 v,
    Vector4 target,
    double maxDistance,
  ) => v.moveTowards(target, maxDistance);

  /// See [Vector4.invert].
  Vector4 Vector4Invert(
    Vector4 v,
  ) => v.invert();

  /// See [Vector4.equals].
  bool Vector4Equals(
    Vector4 p,
    Vector4 q,
  ) => p.equals(q);
}