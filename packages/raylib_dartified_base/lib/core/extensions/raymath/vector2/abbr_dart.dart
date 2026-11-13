import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibVector2ExtDart get _module => RaylibBase.instance.module();

/// See [RaylibVector2ExtDart.Vector2Zero].
Vector2 Vector2Zero() => _module.Vector2Zero();

/// See [RaylibVector2ExtDart.Vector2One].
Vector2 Vector2One() => _module.Vector2One();

/// See [RaylibVector2ExtDart.Vector2Add].
Vector2 Vector2Add(
  Vector2 v1,
  Vector2 v2,
) => _module.Vector2Add(v1, v2);

/// See [RaylibVector2ExtDart.Vector2AddValue].
Vector2 Vector2AddValue(
  Vector2 v,
  double add,
) => _module.Vector2AddValue(v, add);

/// See [RaylibVector2ExtDart.Vector2Subtract].
Vector2 Vector2Subtract(
  Vector2 v1,
  Vector2 v2,
) => _module.Vector2Subtract(v1, v2);

/// See [RaylibVector2ExtDart.Vector2SubtractValue].
Vector2 Vector2SubtractValue(
  Vector2 v,
  double sub,
) => _module.Vector2SubtractValue(v, sub);

/// See [RaylibVector2ExtDart.Vector2Length].
double Vector2Length(
  Vector2 v,
) => _module.Vector2Length(v);

/// See [RaylibVector2ExtDart.Vector2LengthSqr].
double Vector2LengthSqr(
  Vector2 v,
) => _module.Vector2LengthSqr(v);

/// See [RaylibVector2ExtDart.Vector2DotProduct].
double Vector2DotProduct(
  Vector2 v1,
  Vector2 v2,
) => _module.Vector2DotProduct(v1, v2);

/// See [RaylibVector2ExtDart.Vector2CrossProduct].
double Vector2CrossProduct(
  Vector2 v1,
  Vector2 v2,
) => _module.Vector2CrossProduct(v1, v2);

/// See [RaylibVector2ExtDart.Vector2Distance].
double Vector2Distance(
  Vector2 v1,
  Vector2 v2,
) => _module.Vector2Distance(v1, v2);

/// See [RaylibVector2ExtDart.Vector2DistanceSqr].
double Vector2DistanceSqr(
  Vector2 v1,
  Vector2 v2,
) => _module.Vector2DistanceSqr(v1, v2);

/// See [RaylibVector2ExtDart.Vector2Angle].
double Vector2Angle(
  Vector2 v1,
  Vector2 v2,
) => _module.Vector2Angle(v1, v2);

/// See [RaylibVector2ExtDart.Vector2LineAngle].
double Vector2LineAngle(
  Vector2 start,
  Vector2 end,
) => _module.Vector2LineAngle(start, end);

/// See [RaylibVector2ExtDart.Vector2Scale].
Vector2 Vector2Scale(
  Vector2 v,
  double scale,
) => _module.Vector2Scale(v, scale);

/// See [RaylibVector2ExtDart.Vector2Multiply].
Vector2 Vector2Multiply(
  Vector2 v1,
  Vector2 v2,
) => _module.Vector2Multiply(v1, v2);

/// See [RaylibVector2ExtDart.Vector2Negate].
Vector2 Vector2Negate(
  Vector2 v,
) => _module.Vector2Negate(v);

/// See [RaylibVector2ExtDart.Vector2Divide].
Vector2 Vector2Divide(
  Vector2 v1,
  Vector2 v2,
) => _module.Vector2Divide(v1, v2);

/// See [RaylibVector2ExtDart.Vector2Normalize].
Vector2 Vector2Normalize(
  Vector2 v,
) => _module.Vector2Normalize(v);

/// See [RaylibVector2ExtDart.Vector2Transform].
Vector2 Vector2Transform(
  Vector2 v,
  Matrix mat,
) => _module.Vector2Transform(v, mat);

/// See [RaylibVector2ExtDart.Vector2Lerp].
Vector2 Vector2Lerp(
  Vector2 v1,
  Vector2 v2,
  double amount,
) => _module.Vector2Lerp(v1, v2, amount);

/// See [RaylibVector2ExtDart.Vector2Reflect].
Vector2 Vector2Reflect(
  Vector2 v,
  Vector2 normal,
) => _module.Vector2Reflect(v, normal);

/// See [RaylibVector2ExtDart.Vector2Min].
Vector2 Vector2Min(
  Vector2 v1,
  Vector2 v2,
) => _module.Vector2Min(v1, v2);

/// See [RaylibVector2ExtDart.Vector2Max].
Vector2 Vector2Max(
  Vector2 v1,
  Vector2 v2,
) => _module.Vector2Max(v1, v2);

/// See [RaylibVector2ExtDart.Vector2Rotate].
Vector2 Vector2Rotate(
  Vector2 v,
  double angle,
) => _module.Vector2Rotate(v, angle);

/// See [RaylibVector2ExtDart.Vector2MoveTowards].
Vector2 Vector2MoveTowards(
  Vector2 v,
  Vector2 target,
  double maxDistance,
) => _module.Vector2MoveTowards(v, target, maxDistance);

/// See [RaylibVector2ExtDart.Vector2Invert].
Vector2 Vector2Invert(
  Vector2 v,
) => _module.Vector2Invert(v);

/// See [RaylibVector2ExtDart.Vector2Clamp].
Vector2 Vector2Clamp(
  Vector2 v,
  Vector2 min,
  Vector2 max,
) => _module.Vector2Clamp(v, min, max);

/// See [RaylibVector2ExtDart.Vector2ClampValue].
Vector2 Vector2ClampValue(
  Vector2 v,
  double min,
  double max,
) => _module.Vector2ClampValue(v, min, max);

/// See [RaylibVector2ExtDart.Vector2Equals].
bool Vector2Equals(
  Vector2 p,
  Vector2 q,
) => _module.Vector2Equals(p, q);

/// See [RaylibVector2ExtDart.Vector2Refract].
Vector2 Vector2Refract(
  Vector2 v,
  Vector2 n,
  double r,
) => _module.Vector2Refract(v, n, r);