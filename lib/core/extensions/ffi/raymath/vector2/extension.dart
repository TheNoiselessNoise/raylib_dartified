part of '../../../../raylib_dartified.dart';

class RaylibVector2Ext extends RaylibModule<Raylib> {
  RaylibVector2Ext(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibCore>();

  /// Add two vectors (v1 + v2)
  Vector2C Vector2Add(Vector2C v1, Vector2C v2)
    => _Vector2Add(v1, v2);
  late final _Vector2AddPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C)>>('Vector2Add');
  late final _Vector2Add = _Vector2AddPtr.asFunction<Vector2C Function(Vector2C, Vector2C)>();

  /// Add vector and double value
  Vector2C Vector2AddValue(Vector2C v, double add)
    => _Vector2AddValue(v, add);
  late final _Vector2AddValuePtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Float)>>('Vector2AddValue');
  late final _Vector2AddValue = _Vector2AddValuePtr.asFunction<Vector2C Function(Vector2C, double)>();

  /// Calculate the signed angle from v1 to v2, relative to the origin (0, 0)
  /// 
  /// NOTE: Coordinate system convention: positive X right, positive Y down
  /// positive angles appear clockwise, and negative angles appear counterclockwise
  double Vector2Angle(Vector2C v1, Vector2C v2)
    => _Vector2Angle(v1, v2);
  late final _Vector2AnglePtr = _lookup<NativeFunction<Float Function(Vector2C, Vector2C)>>('Vector2Angle');
  late final _Vector2Angle = _Vector2AnglePtr.asFunction<double Function(Vector2C, Vector2C)>();

  /// Clamp the components of the vector between
  /// min and max values specified by the given vectors
  Vector2C Vector2Clamp(Vector2C v, Vector2C min, Vector2C max)
    => _Vector2Clamp(v, min, max);
  late final _Vector2ClampPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Vector2C)>>('Vector2Clamp');
  late final _Vector2Clamp = _Vector2ClampPtr.asFunction<Vector2C Function(Vector2C, Vector2C, Vector2C)>();

  /// Clamp the magnitude of the vector between two min and max values
  Vector2C Vector2ClampValue(Vector2C v, double min, double max)
    => _Vector2ClampValue(v, min, max);
  late final _Vector2ClampValuePtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Float, Float)>>('Vector2ClampValue');
  late final _Vector2ClampValue = _Vector2ClampValuePtr.asFunction<Vector2C Function(Vector2C, double, double)>();

  /// Calculate two vectors cross product
  double Vector2CrossProduct(Vector2C v1, Vector2C v2)
    => _Vector2CrossProduct(v1, v2);
  late final _Vector2CrossProductPtr = _lookup<NativeFunction<Float Function(Vector2C, Vector2C)>>('Vector2CrossProduct');
  late final _Vector2CrossProduct = _Vector2CrossProductPtr.asFunction<double Function(Vector2C, Vector2C)>();

  /// Calculate distance between two vectors
  double Vector2Distance(Vector2C v1, Vector2C v2)
    => _Vector2Distance(v1, v2);
  late final _Vector2DistancePtr = _lookup<NativeFunction<Float Function(Vector2C, Vector2C)>>('Vector2Distance');
  late final _Vector2Distance = _Vector2DistancePtr.asFunction<double Function(Vector2C, Vector2C)>();

  /// Calculate square distance between two vectors
  double Vector2DistanceSqr(Vector2C v1, Vector2C v2)
    => _Vector2DistanceSqr(v1, v2);
  late final _Vector2DistanceSqrPtr = _lookup<NativeFunction<Float Function(Vector2C, Vector2C)>>('Vector2DistanceSqr');
  late final _Vector2DistanceSqr = _Vector2DistanceSqrPtr.asFunction<double Function(Vector2C, Vector2C)>();

  /// Divide vector by vector
  Vector2C Vector2Divide(Vector2C v1, Vector2C v2)
    => _Vector2Divide(v1, v2);
  late final _Vector2DividePtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C)>>('Vector2Divide');
  late final _Vector2Divide = _Vector2DividePtr.asFunction<Vector2C Function(Vector2C, Vector2C)>();

  /// Calculate two vectors dot product
  double Vector2DotProduct(Vector2C v1, Vector2C v2)
    => _Vector2DotProduct(v1, v2);
  late final _Vector2DotProductPtr = _lookup<NativeFunction<Float Function(Vector2C, Vector2C)>>('Vector2DotProduct');
  late final _Vector2DotProduct = _Vector2DotProductPtr.asFunction<double Function(Vector2C, Vector2C)>();

  /// Check whether two given vectors are almost equal
  bool Vector2Equals(Vector2C p, Vector2C q)
    => _Vector2Equals(p, q) != 0;
  late final _Vector2EqualsPtr = _lookup<NativeFunction<Int Function(Vector2C, Vector2C)>>('Vector2Equals');
  late final _Vector2Equals = _Vector2EqualsPtr.asFunction<int Function(Vector2C, Vector2C)>();

  /// Invert the given vector
  Vector2C Vector2Invert(Vector2C v)
    => _Vector2Invert(v);
  late final _Vector2InvertPtr = _lookup<NativeFunction<Vector2C Function(Vector2C)>>('Vector2Invert');
  late final _Vector2Invert =_Vector2InvertPtr.asFunction<Vector2C Function(Vector2C)>();

  /// Calculate vector length
  double Vector2Length(Vector2C v)
    => _Vector2Length(v);
  late final _Vector2LengthPtr = _lookup<NativeFunction<Float Function(Vector2C)>>('Vector2Length');
  late final _Vector2Length =_Vector2LengthPtr.asFunction<double Function(Vector2C)>();

  /// Calculate vector square length
  double Vector2LengthSqr(Vector2C v)
    => _Vector2LengthSqr(v);
  late final _Vector2LengthSqrPtr = _lookup<NativeFunction<Float Function(Vector2C)>>('Vector2LengthSqr');
  late final _Vector2LengthSqr = _Vector2LengthSqrPtr.asFunction<double Function(Vector2C)>();

  /// Calculate linear interpolation between two vectors
  Vector2C Vector2Lerp(Vector2C v1, Vector2C v2, double amount)
    => _Vector2Lerp(v1, v2, amount);
  late final _Vector2LerpPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Float)>>('Vector2Lerp');
  late final _Vector2Lerp = _Vector2LerpPtr.asFunction<Vector2C Function(Vector2C, Vector2C, double)>();

  /// Calculate angle defined by a two vectors line
  /// 
  /// NOTE: Parameters need to be normalized
  double Vector2LineAngle(Vector2C start, Vector2C end)
    => _Vector2LineAngle(start, end);
  late final _Vector2LineAnglePtr = _lookup<NativeFunction<Float Function(Vector2C, Vector2C)>>('Vector2LineAngle');
  late final _Vector2LineAngle = _Vector2LineAnglePtr.asFunction<double Function(Vector2C, Vector2C)>();

  /// Get max value for each pair of components
  Vector2C Vector2Max(Vector2C v1, Vector2C v2)
    => _Vector2Max(v1, v2);
  late final _Vector2MaxPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C)>>('Vector2Max');
  late final _Vector2Max = _Vector2MaxPtr.asFunction<Vector2C Function(Vector2C, Vector2C)>();

  /// Get min value for each pair of components
  Vector2C Vector2Min(Vector2C v1, Vector2C v2)
    => _Vector2Min(v1, v2);
  late final _Vector2MinPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C)>>('Vector2Min');
  late final _Vector2Min = _Vector2MinPtr.asFunction<Vector2C Function(Vector2C, Vector2C)>();

  /// Move Vector towards target
  Vector2C Vector2MoveTowards(Vector2C v, Vector2C target, double maxDistance)
    => _Vector2MoveTowards(v, target, maxDistance);
  late final _Vector2MoveTowardsPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Float)>>('Vector2MoveTowards');
  late final _Vector2MoveTowards = _Vector2MoveTowardsPtr.asFunction<Vector2C Function(Vector2C, Vector2C, double)>();

  /// Multiply vector by vector
  Vector2C Vector2Multiply(Vector2C v1, Vector2C v2)
    => _Vector2Multiply(v1, v2);
  late final _Vector2MultiplyPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C)>>('Vector2Multiply');
  late final _Vector2Multiply = _Vector2MultiplyPtr.asFunction<Vector2C Function(Vector2C, Vector2C)>();

  /// Negate vector
  Vector2C Vector2Negate(Vector2C v)
    => _Vector2Negate(v);
  late final _Vector2NegatePtr = _lookup<NativeFunction<Vector2C Function(Vector2C)>>('Vector2Negate');
  late final _Vector2Negate =_Vector2NegatePtr.asFunction<Vector2C Function(Vector2C)>();

  /// Normalize provided vector
  Vector2C Vector2Normalize(Vector2C v)
    => _Vector2Normalize(v);
  late final _Vector2NormalizePtr = _lookup<NativeFunction<Vector2C Function(Vector2C)>>('Vector2Normalize');
  late final _Vector2Normalize = _Vector2NormalizePtr.asFunction<Vector2C Function(Vector2C)>();

  /// Vector with components value 1.0f
  Vector2C Vector2One()
    => _Vector2One();
  late final _Vector2OnePtr = _lookup<NativeFunction<Vector2C Function()>>('Vector2One');
  late final _Vector2One = _Vector2OnePtr.asFunction<Vector2C Function()>();

  /// Calculate reflected vector to normal
  Vector2C Vector2Reflect(Vector2C v, Vector2C normal)
    => _Vector2Reflect(v, normal);
  late final _Vector2ReflectPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C)>>('Vector2Reflect');
  late final _Vector2Reflect = _Vector2ReflectPtr.asFunction<Vector2C Function(Vector2C, Vector2C)>();

  /// Compute the direction of a refracted ray
  /// v: normalized direction of the incoming ray
  /// n: normalized normal vector of the interface of two optical media
  /// r: ratio of the refractive index of the medium from where the ray comes
  /// to the refractive index of the medium on the other side of the surface
  Vector2C Vector2Refract(Vector2C v, Vector2C n, double r)
    => _Vector2Refract(v, n, r);
  late final _Vector2RefractPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Float)>>('Vector2Refract');
  late final _Vector2Refract = _Vector2RefractPtr.asFunction<Vector2C Function(Vector2C, Vector2C, double)>();

  /// Rotate vector by angle
  Vector2C Vector2Rotate(Vector2C v, double angle)
    => _Vector2Rotate(v, angle);
  late final _Vector2RotatePtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Float)>>('Vector2Rotate');
  late final _Vector2Rotate = _Vector2RotatePtr.asFunction<Vector2C Function(Vector2C, double)>();

  /// Scale vector (multiply by value)
  Vector2C Vector2Scale(Vector2C v, double scale)
    => _Vector2Scale(v, scale);
  late final _Vector2ScalePtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Float)>>('Vector2Scale');
  late final _Vector2Scale = _Vector2ScalePtr.asFunction<Vector2C Function(Vector2C, double)>();

  /// Subtract two vectors (v1 - v2)
  Vector2C Vector2Subtract(Vector2C v1, Vector2C v2)
    => _Vector2Subtract(v1, v2);
  late final _Vector2SubtractPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C)>>('Vector2Subtract');
  late final _Vector2Subtract = _Vector2SubtractPtr.asFunction<Vector2C Function(Vector2C, Vector2C)>();

  /// Subtract vector by double value
  Vector2C Vector2SubtractValue(Vector2C v, double sub)
    => _Vector2SubtractValue(v, sub);
  late final _Vector2SubtractValuePtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Float)>>('Vector2SubtractValue');
  late final _Vector2SubtractValue = _Vector2SubtractValuePtr.asFunction<Vector2C Function(Vector2C, double)>();

  /// Transforms a Vector2 by a given Matrix
  Vector2C Vector2Transform(Vector2C v, MatrixC mat)
    => _Vector2Transform(v, mat);
  late final _Vector2TransformPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, MatrixC)>>('Vector2Transform');
  late final _Vector2Transform = _Vector2TransformPtr.asFunction<Vector2C Function(Vector2C, MatrixC)>();

  /// Vector with components value 0.0f
  Vector2C Vector2Zero()
    => _Vector2Zero();
  late final _Vector2ZeroPtr = _lookup<NativeFunction<Vector2C Function()>>('Vector2Zero');
  late final _Vector2Zero = _Vector2ZeroPtr.asFunction<Vector2C Function()>();
}
