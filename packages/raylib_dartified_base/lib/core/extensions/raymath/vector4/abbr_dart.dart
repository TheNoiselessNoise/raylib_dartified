import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibVector4ExtDart get _module => RaylibBase.instance.module();

/// See [RaylibVector4ExtDart.Vector4Zero].
Vector4 Vector4Zero() => _module.Vector4Zero();

/// See [RaylibVector4ExtDart.Vector4One].
Vector4 Vector4One() => _module.Vector4One();

/// See [RaylibVector4ExtDart.Vector4Add].
Vector4 Vector4Add(
  Vector4 v1,
  Vector4 v2,
) => _module.Vector4Add(v1, v2);

/// See [RaylibVector4ExtDart.Vector4AddValue].
Vector4 Vector4AddValue(
  Vector4 v,
  double add,
) => _module.Vector4AddValue(v, add);

/// See [RaylibVector4ExtDart.Vector4Subtract].
Vector4 Vector4Subtract(
  Vector4 v1,
  Vector4 v2,
) => _module.Vector4Subtract(v1, v2);

/// See [RaylibVector4ExtDart.Vector4SubtractValue].
Vector4 Vector4SubtractValue(
  Vector4 v,
  double sub,
) => _module.Vector4SubtractValue(v, sub);

/// See [RaylibVector4ExtDart.Vector4Length].
double Vector4Length(
  Vector4 v,
) => _module.Vector4Length(v);

/// See [RaylibVector4ExtDart.Vector4LengthSqr].
double Vector4LengthSqr(
  Vector4 v,
) => _module.Vector4LengthSqr(v);

/// See [RaylibVector4ExtDart.Vector4DotProduct].
double Vector4DotProduct(
  Vector4 v1,
  Vector4 v2,
) => _module.Vector4DotProduct(v1, v2);

/// See [RaylibVector4ExtDart.Vector4Distance].
double Vector4Distance(
  Vector4 v1,
  Vector4 v2,
) => _module.Vector4Distance(v1, v2);

/// See [RaylibVector4ExtDart.Vector4DistanceSqr].
double Vector4DistanceSqr(
  Vector4 v1,
  Vector4 v2,
) => _module.Vector4DistanceSqr(v1, v2);

/// See [RaylibVector4ExtDart.Vector4Scale].
Vector4 Vector4Scale(
  Vector4 v,
  double scale,
) => _module.Vector4Scale(v, scale);

/// See [RaylibVector4ExtDart.Vector4Multiply].
Vector4 Vector4Multiply(
  Vector4 v1,
  Vector4 v2,
) => _module.Vector4Multiply(v1, v2);

/// See [RaylibVector4ExtDart.Vector4Negate].
Vector4 Vector4Negate(
  Vector4 v,
) => _module.Vector4Negate(v);

/// See [RaylibVector4ExtDart.Vector4Divide].
Vector4 Vector4Divide(
  Vector4 v1,
  Vector4 v2,
) => _module.Vector4Divide(v1, v2);

/// See [RaylibVector4ExtDart.Vector4Normalize].
Vector4 Vector4Normalize(
  Vector4 v,
) => _module.Vector4Normalize(v);

/// See [RaylibVector4ExtDart.Vector4Min].
Vector4 Vector4Min(
  Vector4 v1,
  Vector4 v2,
) => _module.Vector4Min(v1, v2);

/// See [RaylibVector4ExtDart.Vector4Max].
Vector4 Vector4Max(
  Vector4 v1,
  Vector4 v2,
) => _module.Vector4Max(v1, v2);

/// See [RaylibVector4ExtDart.Vector4Lerp].
Vector4 Vector4Lerp(
  Vector4 v1,
  Vector4 v2,
  double amount,
) => _module.Vector4Lerp(v1, v2, amount);

/// See [RaylibVector4ExtDart.Vector4MoveTowards].
Vector4 Vector4MoveTowards(
  Vector4 v,
  Vector4 target,
  double maxDistance,
) => _module.Vector4MoveTowards(v, target, maxDistance);

/// See [RaylibVector4ExtDart.Vector4Invert].
Vector4 Vector4Invert(
  Vector4 v,
) => _module.Vector4Invert(v);

/// See [RaylibVector4ExtDart.Vector4Equals].
bool Vector4Equals(
  Vector4 p,
  Vector4 q,
) => _module.Vector4Equals(p, q);