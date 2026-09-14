part of '../../../../raylib_dartified.dart';

class RaylibVector4Ext extends RaylibModule<Raylib> {
  RaylibVector4Ext(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibCore>();

  /// Add two vectors
  Vector4C Vector4Add(Vector4C v1, Vector4C v2)
    => _Vector4Add(v1, v2);
  late final _Vector4AddPtr = _lookup<NativeFunction<Vector4C Function(Vector4C, Vector4C)>>('Vector4Add');
  late final _Vector4Add = _Vector4AddPtr.asFunction<Vector4C Function(Vector4C, Vector4C)>();

  /// Add value to vector components
  Vector4C Vector4AddValue(Vector4C v, double add)
    => _Vector4AddValue(v, add);
  late final _Vector4AddValuePtr = _lookup<NativeFunction<Vector4C Function(Vector4C, Float)>>('Vector4AddValue');
  late final _Vector4AddValue = _Vector4AddValuePtr.asFunction<Vector4C Function(Vector4C, double)>();

  /// Calculate distance between two vectors
  double Vector4Distance(Vector4C v1, Vector4C v2)
    => _Vector4Distance(v1, v2);
  late final _Vector4DistancePtr = _lookup<NativeFunction<Float Function(Vector4C, Vector4C)>>('Vector4Distance');
  late final _Vector4Distance = _Vector4DistancePtr.asFunction<double Function(Vector4C, Vector4C)>();

  /// Calculate square distance between two vectors
  double Vector4DistanceSqr(Vector4C v1, Vector4C v2)
    => _Vector4DistanceSqr(v1, v2);
  late final _Vector4DistanceSqrPtr = _lookup<NativeFunction<Float Function(Vector4C, Vector4C)>>('Vector4DistanceSqr');
  late final _Vector4DistanceSqr = _Vector4DistanceSqrPtr.asFunction<double Function(Vector4C, Vector4C)>();

  /// Divide vector by vector
  Vector4C Vector4Divide(Vector4C v1, Vector4C v2)
    => _Vector4Divide(v1, v2);
  late final _Vector4DividePtr = _lookup<NativeFunction<Vector4C Function(Vector4C, Vector4C)>>('Vector4Divide');
  late final _Vector4Divide = _Vector4DividePtr.asFunction<Vector4C Function(Vector4C, Vector4C)>();

  /// Vectors dot product
  double Vector4DotProduct(Vector4C v1, Vector4C v2)
    => _Vector4DotProduct(v1, v2);
  late final _Vector4DotProductPtr = _lookup<NativeFunction<Float Function(Vector4C, Vector4C)>>('Vector4DotProduct');
  late final _Vector4DotProduct = _Vector4DotProductPtr.asFunction<double Function(Vector4C, Vector4C)>();

  /// Check whether two given vectors are almost equal
  bool Vector4Equals(Vector4C p, Vector4C q)
    => _Vector4Equals(p, q) != 0;
  late final _Vector4EqualsPtr = _lookup<NativeFunction<Int Function(Vector4C, Vector4C)>>('Vector4Equals');
  late final _Vector4Equals = _Vector4EqualsPtr.asFunction<int Function(Vector4C, Vector4C)>();

  /// Invert the given vector
  Vector4C Vector4Invert(Vector4C v)
    => _Vector4Invert(v);
  late final _Vector4InvertPtr = _lookup<NativeFunction<Vector4C Function(Vector4C)>>('Vector4Invert');
  late final _Vector4Invert =_Vector4InvertPtr.asFunction<Vector4C Function(Vector4C)>();

  /// Vector length
  double Vector4Length(Vector4C v)
    => _Vector4Length(v);
  late final _Vector4LengthPtr = _lookup<NativeFunction<Float Function(Vector4C)>>('Vector4Length');
  late final _Vector4Length =_Vector4LengthPtr.asFunction<double Function(Vector4C)>();

  /// Vector square length
  double Vector4LengthSqr(Vector4C v)
    => _Vector4LengthSqr(v);
  late final _Vector4LengthSqrPtr = _lookup<NativeFunction<Float Function(Vector4C)>>('Vector4LengthSqr');
  late final _Vector4LengthSqr = _Vector4LengthSqrPtr.asFunction<double Function(Vector4C)>();

  /// Calculate linear interpolation between two vectors
  Vector4C Vector4Lerp(Vector4C v1, Vector4C v2, double amount)
    => _Vector4Lerp(v1, v2, amount);
  late final _Vector4LerpPtr = _lookup<NativeFunction<Vector4C Function(Vector4C, Vector4C, Float)>>('Vector4Lerp');
  late final _Vector4Lerp = _Vector4LerpPtr.asFunction<Vector4C Function(Vector4C, Vector4C, double)>();

  /// Get max value for each pair of components
  Vector4C Vector4Max(Vector4C v1, Vector4C v2)
    => _Vector4Max(v1, v2);
  late final _Vector4MaxPtr = _lookup<NativeFunction<Vector4C Function(Vector4C, Vector4C)>>('Vector4Max');
  late final _Vector4Max = _Vector4MaxPtr.asFunction<Vector4C Function(Vector4C, Vector4C)>();

  /// Get min value for each pair of components
  Vector4C Vector4Min(Vector4C v1, Vector4C v2)
    => _Vector4Min(v1, v2);
  late final _Vector4MinPtr = _lookup<NativeFunction<Vector4C Function(Vector4C, Vector4C)>>('Vector4Min');
  late final _Vector4Min = _Vector4MinPtr.asFunction<Vector4C Function(Vector4C, Vector4C)>();

  /// Move Vector towards target
  Vector4C Vector4MoveTowards(Vector4C v, Vector4C target, double maxDistance)
    => _Vector4MoveTowards(v, target, maxDistance);
  late final _Vector4MoveTowardsPtr = _lookup<NativeFunction<Vector4C Function(Vector4C, Vector4C, Float)>>('Vector4MoveTowards');
  late final _Vector4MoveTowards = _Vector4MoveTowardsPtr.asFunction<Vector4C Function(Vector4C, Vector4C, double)>();

  /// Multiply vector by vector
  Vector4C Vector4Multiply(Vector4C v1, Vector4C v2)
    => _Vector4Multiply(v1, v2);
  late final _Vector4MultiplyPtr = _lookup<NativeFunction<Vector4C Function(Vector4C, Vector4C)>>('Vector4Multiply');
  late final _Vector4Multiply = _Vector4MultiplyPtr.asFunction<Vector4C Function(Vector4C, Vector4C)>();

  /// Negate vector
  Vector4C Vector4Negate(Vector4C v)
    => _Vector4Negate(v);
  late final _Vector4NegatePtr = _lookup<NativeFunction<Vector4C Function(Vector4C)>>('Vector4Negate');
  late final _Vector4Negate =_Vector4NegatePtr.asFunction<Vector4C Function(Vector4C)>();

  /// Normalize provided vector
  Vector4C Vector4Normalize(Vector4C v)
    => _Vector4Normalize(v);
  late final _Vector4NormalizePtr = _lookup<NativeFunction<Vector4C Function(Vector4C)>>('Vector4Normalize');
  late final _Vector4Normalize = _Vector4NormalizePtr.asFunction<Vector4C Function(Vector4C)>();

  /// Get vector one
  Vector4C Vector4One()
    => _Vector4One();
  late final _Vector4OnePtr = _lookup<NativeFunction<Vector4C Function()>>('Vector4One');
  late final _Vector4One = _Vector4OnePtr.asFunction<Vector4C Function()>();

  /// Scale vector components by value (multiply)
  Vector4C Vector4Scale(Vector4C v, double scale)
    => _Vector4Scale(v, scale);
  late final _Vector4ScalePtr = _lookup<NativeFunction<Vector4C Function(Vector4C, Float)>>('Vector4Scale');
  late final _Vector4Scale = _Vector4ScalePtr.asFunction<Vector4C Function(Vector4C, double)>();

  /// Substract vectors
  Vector4C Vector4Subtract(Vector4C v1, Vector4C v2)
    => _Vector4Subtract(v1, v2);
  late final _Vector4SubtractPtr = _lookup<NativeFunction<Vector4C Function(Vector4C, Vector4C)>>('Vector4Subtract');
  late final _Vector4Subtract = _Vector4SubtractPtr.asFunction<Vector4C Function(Vector4C, Vector4C)>();

  /// Substract value from vector components
  Vector4C Vector4SubtractValue(Vector4C v, double add)
    => _Vector4SubtractValue(v, add);
  late final _Vector4SubtractValuePtr = _lookup<NativeFunction<Vector4C Function(Vector4C, Float)>>('Vector4SubtractValue');
  late final _Vector4SubtractValue = _Vector4SubtractValuePtr.asFunction<Vector4C Function(Vector4C, double)>();

  /// Get vector zero
  Vector4C Vector4Zero()
    => _Vector4Zero();
  late final _Vector4ZeroPtr = _lookup<NativeFunction<Vector4C Function()>>('Vector4Zero');
  late final _Vector4Zero = _Vector4ZeroPtr.asFunction<Vector4C Function()>();
}
