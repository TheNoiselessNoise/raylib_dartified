part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector2] methods/factories.
/// Exists purely for Raylib API symmetry.
final class RaylibVector2ExtDart<R extends RaylibBase> extends RaylibModule<R> {

  RaylibVector2ExtDart(super.rl);

  /// See [Vector2.zero].
  Vector2 Vector2Zero() => debugRun(
    () => 'Vector2Zero()',
    () => .zero(),
  );

  /// See [Vector2.one].
  Vector2 Vector2One() => debugRun(
    () => 'Vector2One()',
    () => .one(),
  );

  /// See [Vector2.add].
  Vector2 Vector2Add(
    Vector2 v1,
    Vector2 v2,
  ) => debugRun(
    () => 'Vector2Add($v1, $v2)',
    () => v1.add(v2),
  );

  /// See [Vector2.addValue].
  Vector2 Vector2AddValue(
    Vector2 v,
    double add,
  ) => debugRun(
    () => 'Vector2AddValue($v, $add)',
    () => v.addValue(add),
  );

  /// See [Vector2.sub].
  Vector2 Vector2Subtract(
    Vector2 v1,
    Vector2 v2,
  ) => debugRun(
    () => 'Vector2Subtract($v1, $v2)',
    () => v1.sub(v2),
  );

  /// See [Vector2.subValue].
  Vector2 Vector2SubtractValue(
    Vector2 v,
    double sub,
  ) => debugRun(
    () => 'Vector2SubtractValue($v, $sub)',
    () => v.subValue(sub),
  );

  /// See [Vector2.length].
  double Vector2Length(
    Vector2 v,
  ) => debugRun(
    () => 'Vector2Length($v)',
    () => v.length,
  );

  /// See [Vector2.lengthSqr].
  double Vector2LengthSqr(
    Vector2 v,
  ) => debugRun(
    () => 'Vector2LengthSqr($v)',
    () => v.lengthSqr,
  );

  /// See [Vector2.dotProduct].
  double Vector2DotProduct(
    Vector2 v1,
    Vector2 v2,
  ) => debugRun(
    () => 'Vector2DotProduct($v1, $v2)',
    () => v1.dotProduct(v2),
  );

  /// See [Vector2.crossProduct].
  double Vector2CrossProduct(
    Vector2 v1,
    Vector2 v2,
  ) => debugRun(
    () => 'Vector2CrossProduct($v1, $v2)',
    () => v1.crossProduct(v2),
  );

  /// See [Vector2.distance].
  double Vector2Distance(
    Vector2 v1,
    Vector2 v2,
  ) => debugRun(
    () => 'Vector2Distance($v1, $v2)',
    () => v1.distance(v2),
  );

  /// See [Vector2.distanceSqr].
  double Vector2DistanceSqr(
    Vector2 v1,
    Vector2 v2,
  ) => debugRun(
    () => 'Vector2DistanceSqr($v1, $v2)',
    () => v1.distanceSqr(v2),
  );

  /// See [Vector2.angle].
  double Vector2Angle(
    Vector2 v1,
    Vector2 v2,
  ) => debugRun(
    () => 'Vector2Angle($v1, $v2)',
    () => v1.angle(v2),
  );

  /// See [Vector2.lineAngle].
  double Vector2LineAngle(
    Vector2 start,
    Vector2 end,
  ) => debugRun(
    () => 'Vector2LineAngle($start, $end)',
    () => start.lineAngle(end),
  );

  /// See [Vector2.scale].
  Vector2 Vector2Scale(
    Vector2 v,
    double scale,
  ) => debugRun(
    () => 'Vector2Scale($v, $scale)',
    () => v.scale(scale),
  );

  /// See [Vector2.mul].
  Vector2 Vector2Multiply(
    Vector2 v1,
    Vector2 v2,
  ) => debugRun(
    () => 'Vector2Multiply($v1, $v2)',
    () => v1.mul(v2),
  );

  /// See [Vector2.negate].
  Vector2 Vector2Negate(
    Vector2 v,
  ) => debugRun(
    () => 'Vector2Negate($v)',
    () => v.negate(),
  );

  /// See [Vector2.div].
  Vector2 Vector2Divide(
    Vector2 v1,
    Vector2 v2,
  ) => debugRun(
    () => 'Vector2Divide($v1, $v2)',
    () => v1.div(v2),
  );

  /// See [Vector2.normalize].
  Vector2 Vector2Normalize(
    Vector2 v,
  ) => debugRun(
    () => 'Vector2Normalize($v)',
    () => v.normalize(),
  );

  /// See [Vector2.transform].
  Vector2 Vector2Transform(
    Vector2 v,
    Matrix mat,
  ) => debugRun(
    () => 'Vector2Transform($v, $mat)',
    () => v.transform(mat),
  );

  /// See [Vector2.lerp].
  Vector2 Vector2Lerp(
    Vector2 v1,
    Vector2 v2,
    double amount,
  ) => debugRun(
    () => 'Vector2Lerp($v1, $v2, $amount)',
    () => v1.lerp(v2, amount),
  );

  /// See [Vector2.reflect].
  Vector2 Vector2Reflect(
    Vector2 v,
    Vector2 normal,
  ) => debugRun(
    () => 'Vector2Reflect($v, $normal)',
    () => v.reflect(normal),
  );

  /// See [Vector2.min].
  Vector2 Vector2Min(
    Vector2 v1,
    Vector2 v2,
  ) => debugRun(
    () => 'Vector2Min($v1, $v2)',
    () => v1.min(v2),
  );

  /// See [Vector2.max].
  Vector2 Vector2Max(
    Vector2 v1,
    Vector2 v2,
  ) => debugRun(
    () => 'Vector2Max($v1, $v2)',
    () => v1.max(v2),
  );

  /// See [Vector2.rotate].
  Vector2 Vector2Rotate(
    Vector2 v,
    double angle,
  ) => debugRun(
    () => 'Vector2Rotate($v, $angle)',
    () => v.rotate(angle),
  );

  /// See [Vector2.moveTowards].
  Vector2 Vector2MoveTowards(
    Vector2 v,
    Vector2 target,
    double maxDistance,
  ) => debugRun(
    () => 'Vector2MoveTowards($v, $target, $maxDistance)',
    () => v.moveTowards(target, maxDistance),
  );

  /// See [Vector2.invert].
  Vector2 Vector2Invert(
    Vector2 v,
  ) => debugRun(
    () => 'Vector2Invert($v)',
    () => v.invert(),
  );

  /// See [Vector2.clamp].
  Vector2 Vector2Clamp(
    Vector2 v,
    Vector2 min,
    Vector2 max,
  ) => debugRun(
    () => 'Vector2Clamp($v, $min, $max)',
    () => v.clamp(min, max),
  );

  /// See [Vector2.clampValue].
  Vector2 Vector2ClampValue(
    Vector2 v,
    double min,
    double max,
  ) => debugRun(
    () => 'Vector2ClampValue($v, $min, $max)',
    () => v.clampValue(min, max),
  );

  /// See [Vector2.equals].
  bool Vector2Equals(
    Vector2 p,
    Vector2 q,
  ) => debugRun(
    () => 'Vector2Equals($p, $q)',
    () => p.equals(q),
  );

  /// See [Vector2.refract].
  Vector2 Vector2Refract(
    Vector2 v,
    Vector2 n,
    double r,
  ) => debugRun(
    () => 'Vector2Refract($v, $n, $r)',
    () => v.refract(n, r),
  );
}