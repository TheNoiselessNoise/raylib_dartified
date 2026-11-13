import 'package:raylib_dartified/raylib_dartified.dart';

RaylibVector2Ext get _module => Raylib.instance.module();

/// See [RaylibVector2Ext.Vector2Add].
Vector2C Vector2Add(Vector2C v1, Vector2C v2)
  => _module.Vector2Add(v1, v2);

/// See [RaylibVector2Ext.Vector2AddValue].
Vector2C Vector2AddValue(Vector2C v, double add)
  => _module.Vector2AddValue(v, add);

/// See [RaylibVector2Ext.Vector2Angle].
double Vector2Angle(Vector2C v1, Vector2C v2)
  => _module.Vector2Angle(v1, v2);

/// See [RaylibVector2Ext.Vector2Clamp].
Vector2C Vector2Clamp(Vector2C v, Vector2C min, Vector2C max)
  => _module.Vector2Clamp(v, min, max);

/// See [RaylibVector2Ext.Vector2ClampValue].
Vector2C Vector2ClampValue(Vector2C v, double min, double max)
  => _module.Vector2ClampValue(v, min, max);

/// See [RaylibVector2Ext.Vector2CrossProduct].
double Vector2CrossProduct(Vector2C v1, Vector2C v2)
  => _module.Vector2CrossProduct(v1, v2);

/// See [RaylibVector2Ext.Vector2Distance].
double Vector2Distance(Vector2C v1, Vector2C v2)
  => _module.Vector2Distance(v1, v2);

/// See [RaylibVector2Ext.Vector2DistanceSqr].
double Vector2DistanceSqr(Vector2C v1, Vector2C v2)
  => _module.Vector2DistanceSqr(v1, v2);

/// See [RaylibVector2Ext.Vector2Divide].
Vector2C Vector2Divide(Vector2C v1, Vector2C v2)
  => _module.Vector2Divide(v1, v2);

/// See [RaylibVector2Ext.Vector2DotProduct].
double Vector2DotProduct(Vector2C v1, Vector2C v2)
  => _module.Vector2DotProduct(v1, v2);

/// See [RaylibVector2Ext.Vector2Equals].
bool Vector2Equals(Vector2C p, Vector2C q)
  => _module.Vector2Equals(p, q);

/// See [RaylibVector2Ext.Vector2Invert].
Vector2C Vector2Invert(Vector2C v)
  => _module.Vector2Invert(v);

/// See [RaylibVector2Ext.Vector2Length].
double Vector2Length(Vector2C v)
  => _module.Vector2Length(v);

/// See [RaylibVector2Ext.Vector2LengthSqr].
double Vector2LengthSqr(Vector2C v)
  => _module.Vector2LengthSqr(v);

/// See [RaylibVector2Ext.Vector2Lerp].
Vector2C Vector2Lerp(Vector2C v1, Vector2C v2, double amount)
  => _module.Vector2Lerp(v1, v2, amount);

/// See [RaylibVector2Ext.Vector2LineAngle].
double Vector2LineAngle(Vector2C start, Vector2C end)
  => _module.Vector2LineAngle(start, end);

/// See [RaylibVector2Ext.Vector2Max].
Vector2C Vector2Max(Vector2C v1, Vector2C v2)
  => _module.Vector2Max(v1, v2);

/// See [RaylibVector2Ext.Vector2Min].
Vector2C Vector2Min(Vector2C v1, Vector2C v2)
  => _module.Vector2Min(v1, v2);

/// See [RaylibVector2Ext.Vector2MoveTowards].
Vector2C Vector2MoveTowards(Vector2C v, Vector2C target, double maxDistance)
  => _module.Vector2MoveTowards(v, target, maxDistance);

/// See [RaylibVector2Ext.Vector2Multiply].
Vector2C Vector2Multiply(Vector2C v1, Vector2C v2)
  => _module.Vector2Multiply(v1, v2);

/// See [RaylibVector2Ext.Vector2Negate].
Vector2C Vector2Negate(Vector2C v)
  => _module.Vector2Negate(v);

/// See [RaylibVector2Ext.Vector2Normalize].
Vector2C Vector2Normalize(Vector2C v)
  => _module.Vector2Normalize(v);

/// See [RaylibVector2Ext.Vector2One].
Vector2C Vector2One()
  => _module.Vector2One();

/// See [RaylibVector2Ext.Vector2Reflect].
Vector2C Vector2Reflect(Vector2C v, Vector2C normal)
  => _module.Vector2Reflect(v, normal);

/// See [RaylibVector2Ext.Vector2Refract].
Vector2C Vector2Refract(Vector2C v, Vector2C n, double r)
  => _module.Vector2Refract(v, n, r);

/// See [RaylibVector2Ext.Vector2Rotate].
Vector2C Vector2Rotate(Vector2C v, double angle)
  => _module.Vector2Rotate(v, angle);

/// See [RaylibVector2Ext.Vector2Scale].
Vector2C Vector2Scale(Vector2C v, double scale)
  => _module.Vector2Scale(v, scale);

/// See [RaylibVector2Ext.Vector2Subtract].
Vector2C Vector2Subtract(Vector2C v1, Vector2C v2)
  => _module.Vector2Subtract(v1, v2);

/// See [RaylibVector2Ext.Vector2SubtractValue].
Vector2C Vector2SubtractValue(Vector2C v, double sub)
  => _module.Vector2SubtractValue(v, sub);

/// See [RaylibVector2Ext.Vector2Transform].
Vector2C Vector2Transform(Vector2C v, MatrixC mat)
  => _module.Vector2Transform(v, mat);

/// See [RaylibVector2Ext.Vector2Zero].
Vector2C Vector2Zero()
  => _module.Vector2Zero();
