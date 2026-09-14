import 'package:raylib_dartified/raylib_dartified.dart';

RaylibVector4Ext get _module => Raylib.instance.module();

/// See [RaylibVector4Ext.Vector4Add].
Vector4C Vector4Add(Vector4C v1, Vector4C v2)
  => _module.Vector4Add(v1, v2);

/// See [RaylibVector4Ext.Vector4AddValue].
Vector4C Vector4AddValue(Vector4C v, double add)
  => _module.Vector4AddValue(v, add);

/// See [RaylibVector4Ext.Vector4Distance].
double Vector4Distance(Vector4C v1, Vector4C v2)
  => _module.Vector4Distance(v1, v2);

/// See [RaylibVector4Ext.Vector4DistanceSqr].
double Vector4DistanceSqr(Vector4C v1, Vector4C v2)
  => _module.Vector4DistanceSqr(v1, v2);

/// See [RaylibVector4Ext.Vector4Divide].
Vector4C Vector4Divide(Vector4C v1, Vector4C v2)
  => _module.Vector4Divide(v1, v2);

/// See [RaylibVector4Ext.Vector4DotProduct].
double Vector4DotProduct(Vector4C v1, Vector4C v2)
  => _module.Vector4DotProduct(v1, v2);

/// See [RaylibVector4Ext.Vector4Equals].
bool Vector4Equals(Vector4C p, Vector4C q)
  => _module.Vector4Equals(p, q);

/// See [RaylibVector4Ext.Vector4Invert].
Vector4C Vector4Invert(Vector4C v)
  => _module.Vector4Invert(v);

/// See [RaylibVector4Ext.Vector4Length].
double Vector4Length(Vector4C v)
  => _module.Vector4Length(v);

/// See [RaylibVector4Ext.Vector4LengthSqr].
double Vector4LengthSqr(Vector4C v)
  => _module.Vector4LengthSqr(v);

/// See [RaylibVector4Ext.Vector4Lerp].
Vector4C Vector4Lerp(Vector4C v1, Vector4C v2, double amount)
  => _module.Vector4Lerp(v1, v2, amount);

/// See [RaylibVector4Ext.Vector4Max].
Vector4C Vector4Max(Vector4C v1, Vector4C v2)
  => _module.Vector4Max(v1, v2);

/// See [RaylibVector4Ext.Vector4Min].
Vector4C Vector4Min(Vector4C v1, Vector4C v2)
  => _module.Vector4Min(v1, v2);

/// See [RaylibVector4Ext.Vector4MoveTowards].
Vector4C Vector4MoveTowards(Vector4C v, Vector4C target, double maxDistance)
  => _module.Vector4MoveTowards(v, target, maxDistance);

/// See [RaylibVector4Ext.Vector4Multiply].
Vector4C Vector4Multiply(Vector4C v1, Vector4C v2)
  => _module.Vector4Multiply(v1, v2);

/// See [RaylibVector4Ext.Vector4Negate].
Vector4C Vector4Negate(Vector4C v)
  => _module.Vector4Negate(v);

/// See [RaylibVector4Ext.Vector4Normalize].
Vector4C Vector4Normalize(Vector4C v)
  => _module.Vector4Normalize(v);

/// See [RaylibVector4Ext.Vector4One].
Vector4C Vector4One()
  => _module.Vector4One();

/// See [RaylibVector4Ext.Vector4Scale].
Vector4C Vector4Scale(Vector4C v, double scale)
  => _module.Vector4Scale(v, scale);

/// See [RaylibVector4Ext.Vector4Subtract].
Vector4C Vector4Subtract(Vector4C v1, Vector4C v2)
  => _module.Vector4Subtract(v1, v2);

/// See [RaylibVector4Ext.Vector4SubtractValue].
Vector4C Vector4SubtractValue(Vector4C v, double add)
  => _module.Vector4SubtractValue(v, add);

/// See [RaylibVector4Ext.Vector4Zero].
Vector4C Vector4Zero()
  => _module.Vector4Zero();
