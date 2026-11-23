part of '../../../raylib_dartified.dart';

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector2] methods/factories.
/// Exists purely for Raylib API symmetry.
final class RaylibVector2ExtDart extends XPackageModule<Raylib> {

  RaylibVector2ExtDart(super.pkg);

  /// See [Vector2.zero].
  Vector2 Vector2Zero() => .zero();

  /// See [Vector2.one].
  Vector2 Vector2One() => .one();

  /// See [Vector2.add].
  Vector2 Vector2Add(
    Vector2 v1,
    Vector2 v2,
  ) => v1.add(v2);

  /// See [Vector2.addValue].
  Vector2 Vector2AddValue(
    Vector2 v,
    double add,
  ) => v.addValue(add);

  /// See [Vector2.sub].
  Vector2 Vector2Subtract(
    Vector2 v1,
    Vector2 v2,
  ) => v1.sub(v2);

  /// See [Vector2.subValue].
  Vector2 Vector2SubtractValue(
    Vector2 v,
    double sub,
  ) => v.subValue(sub);

  /// See [Vector2.length].
  double Vector2Length(
    Vector2 v,
  ) => v.length;

  /// See [Vector2.lengthSqr].
  double Vector2LengthSqr(
    Vector2 v,
  ) => v.lengthSqr;

  /// See [Vector2.dotProduct].
  double Vector2DotProduct(
    Vector2 v1,
    Vector2 v2,
  ) => v1.dotProduct(v2);

  /// See [Vector2.crossProduct].
  double Vector2CrossProduct(
    Vector2 v1,
    Vector2 v2,
  ) => v1.crossProduct(v2);

  /// See [Vector2.distance].
  double Vector2Distance(
    Vector2 v1,
    Vector2 v2,
  ) => v1.distance(v2);

  /// See [Vector2.distanceSqr].
  double Vector2DistanceSqr(
    Vector2 v1,
    Vector2 v2,
  ) => v1.distanceSqr(v2);

  /// See [Vector2.angle].
  double Vector2Angle(
    Vector2 v1,
    Vector2 v2,
  ) => v1.angle(v2);

  /// See [Vector2.lineAngle].
  double Vector2LineAngle(
    Vector2 start,
    Vector2 end,
  ) => start.lineAngle(end);

  /// See [Vector2.scale].
  Vector2 Vector2Scale(
    Vector2 v,
    double scale,
  ) => v.scale(scale);

  /// See [Vector2.mul].
  Vector2 Vector2Multiply(
    Vector2 v1,
    Vector2 v2,
  ) => v1.mul(v2);

  /// See [Vector2.negate].
  Vector2 Vector2Negate(
    Vector2 v,
  ) => v.negate();

  /// See [Vector2.div].
  Vector2 Vector2Divide(
    Vector2 v1,
    Vector2 v2,
  ) => v1.div(v2);

  /// See [Vector2.normalize].
  Vector2 Vector2Normalize(
    Vector2 v,
  ) => v.normalize();

  /// See [Vector2.transform].
  Vector2 Vector2Transform(
    Vector2 v,
    Matrix mat,
  ) => v.transform(mat);

  /// See [Vector2.lerp].
  Vector2 Vector2Lerp(
    Vector2 v1,
    Vector2 v2,
    double amount,
  ) => v1.lerp(v2, amount);

  /// See [Vector2.reflect].
  Vector2 Vector2Reflect(
    Vector2 v,
    Vector2 normal,
  ) => v.reflect(normal);

  /// See [Vector2.min].
  Vector2 Vector2Min(
    Vector2 v1,
    Vector2 v2,
  ) => v1.min(v2);

  /// See [Vector2.max].
  Vector2 Vector2Max(
    Vector2 v1,
    Vector2 v2,
  ) => v1.max(v2);

  /// See [Vector2.rotate].
  Vector2 Vector2Rotate(
    Vector2 v,
    double angle,
  ) => v.rotate(angle);

  /// See [Vector2.moveTowards].
  Vector2 Vector2MoveTowards(
    Vector2 v,
    Vector2 target,
    double maxDistance,
  ) => v.moveTowards(target, maxDistance);

  /// See [Vector2.invert].
  Vector2 Vector2Invert(
    Vector2 v,
  ) => v.invert();

  /// See [Vector2.clamp].
  Vector2 Vector2Clamp(
    Vector2 v,
    Vector2 min,
    Vector2 max,
  ) => v.clamp(min, max);

  /// See [Vector2.clampValue].
  Vector2 Vector2ClampValue(
    Vector2 v,
    double min,
    double max,
  ) => v.clampValue(min, max);

  /// See [Vector2.equals].
  bool Vector2Equals(
    Vector2 p,
    Vector2 q,
  ) => p.equals(q);

  /// See [Vector2.refract].
  Vector2 Vector2Refract(
    Vector2 v,
    Vector2 n,
    double r,
  ) => v.refract(n, r);
}