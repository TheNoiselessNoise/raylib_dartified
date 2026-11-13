part of '../../../../raylib_dartified.dart';

class RaylibVector3Ext extends RaylibModule<Raylib> {
  RaylibVector3Ext(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibCore>();

  /// Add two vectors
  Vector3C Vector3Add(Vector3C v1, Vector3C v2)
    => _Vector3Add(v1, v2);
  late final _Vector3AddPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C)>>('Vector3Add');
  late final _Vector3Add = _Vector3AddPtr.asFunction<Vector3C Function(Vector3C, Vector3C)>();

  /// Add vector and double value
  Vector3C Vector3AddValue(Vector3C v, double add)
    => _Vector3AddValue(v, add);
  late final _Vector3AddValuePtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Float)>>('Vector3AddValue');
  late final _Vector3AddValue = _Vector3AddValuePtr.asFunction<Vector3C Function(Vector3C, double)>();

  /// Calculate angle between two vectors
  double Vector3Angle(Vector3C v1, Vector3C v2)
    => _Vector3Angle(v1, v2);
  late final _Vector3AnglePtr = _lookup<NativeFunction<Float Function(Vector3C, Vector3C)>>('Vector3Angle');
  late final _Vector3Angle = _Vector3AnglePtr.asFunction<double Function(Vector3C, Vector3C)>();

  /// Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c)
  /// 
  /// NOTE: Assumes P is on the plane of the triangle
  Vector3C Vector3Barycenter(Vector3C p, Vector3C a, Vector3C b, Vector3C c)
    => _Vector3Barycenter(p, a, b, c);
  late final _Vector3BarycenterPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C, Vector3C, Vector3C)>>('Vector3Barycenter');
  late final _Vector3Barycenter = _Vector3BarycenterPtr.asFunction<Vector3C Function(Vector3C, Vector3C, Vector3C, Vector3C)>();

  /// Clamp the components of the vector between
  /// min and max values specified by the given vectors
  Vector3C Vector3Clamp(Vector3C v, Vector3C min, Vector3C max)
    => _Vector3Clamp(v, min, max);
  late final _Vector3ClampPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C, Vector3C)>>('Vector3Clamp');
  late final _Vector3Clamp = _Vector3ClampPtr.asFunction<Vector3C Function(Vector3C, Vector3C, Vector3C)>();

  /// Clamp the magnitude of the vector between two values
  Vector3C Vector3ClampValue(Vector3C v, double min, double max)
    => _Vector3ClampValue(v, min, max);
  late final _Vector3ClampValuePtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Float, Float)>>('Vector3ClampValue');
  late final _Vector3ClampValue = _Vector3ClampValuePtr.asFunction<Vector3C Function(Vector3C, double, double)>();

  /// Calculate two vectors cross product
  Vector3C Vector3CrossProduct(Vector3C v1, Vector3C v2)
    => _Vector3CrossProduct(v1, v2);
  late final _Vector3CrossProductPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C)>>('Vector3CrossProduct');
  late final _Vector3CrossProduct = _Vector3CrossProductPtr.asFunction<Vector3C Function(Vector3C, Vector3C)>();

  /// Calculate cubic hermite interpolation between two vectors and their tangents
  /// as described in the GLTF 2.0 specification: https://registry.khronos.org/glTF/specs/2.0/glTF-2.0.html#interpolation-cubic
  Vector3C Vector3CubicHermite(Vector3C v1, Vector3C tangent1, Vector3C v2, Vector3C tangent2, double amount)
    => _Vector3CubicHermite(v1, tangent1, v2, tangent2, amount);
  late final _Vector3CubicHermitePtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C, Vector3C, Vector3C, Float)>>('Vector3CubicHermite');
  late final _Vector3CubicHermite = _Vector3CubicHermitePtr.asFunction<Vector3C Function(Vector3C, Vector3C, Vector3C, Vector3C, double)>();

  /// Calculate distance between two vectors
  double Vector3Distance(Vector3C v1, Vector3C v2)
    => _Vector3Distance(v1, v2);
  late final _Vector3DistancePtr = _lookup<NativeFunction<Float Function(Vector3C, Vector3C)>>('Vector3Distance');
  late final _Vector3Distance = _Vector3DistancePtr.asFunction<double Function(Vector3C, Vector3C)>();

  /// Calculate square distance between two vectors
  double Vector3DistanceSqr(Vector3C v1, Vector3C v2)
    => _Vector3DistanceSqr(v1, v2);
  late final _Vector3DistanceSqrPtr = _lookup<NativeFunction<Float Function(Vector3C, Vector3C)>>('Vector3DistanceSqr');
  late final _Vector3DistanceSqr = _Vector3DistanceSqrPtr.asFunction<double Function(Vector3C, Vector3C)>();

  /// Divide vector by vector
  Vector3C Vector3Divide(Vector3C v1, Vector3C v2)
    => _Vector3Divide(v1, v2);
  late final _Vector3DividePtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C)>>('Vector3Divide');
  late final _Vector3Divide = _Vector3DividePtr.asFunction<Vector3C Function(Vector3C, Vector3C)>();

  /// Calculate two vectors dot product
  double Vector3DotProduct(Vector3C v1, Vector3C v2)
    => _Vector3DotProduct(v1, v2);
  late final _Vector3DotProductPtr = _lookup<NativeFunction<Float Function(Vector3C, Vector3C)>>('Vector3DotProduct');
  late final _Vector3DotProduct = _Vector3DotProductPtr.asFunction<double Function(Vector3C, Vector3C)>();

  /// Check whether two given vectors are almost equal
  bool Vector3Equals(Vector3C p, Vector3C q)
    => _Vector3Equals(p, q) != 0;
  late final _Vector3EqualsPtr = _lookup<NativeFunction<Int Function(Vector3C, Vector3C)>>('Vector3Equals');
  late final _Vector3Equals = _Vector3EqualsPtr.asFunction<int Function(Vector3C, Vector3C)>();

  /// Invert the given vector
  Vector3C Vector3Invert(Vector3C v)
    => _Vector3Invert(v);
  late final _Vector3InvertPtr = _lookup<NativeFunction<Vector3C Function(Vector3C)>>('Vector3Invert');
  late final _Vector3Invert =_Vector3InvertPtr.asFunction<Vector3C Function(Vector3C)>();

  /// Calculate vector length
  double Vector3Length(Vector3C v)
    => _Vector3Length(v);
  late final _Vector3LengthPtr = _lookup<NativeFunction<Float Function(Vector3C)>>('Vector3Length');
  late final _Vector3Length =_Vector3LengthPtr.asFunction<double Function(Vector3C)>();

  /// Calculate vector square length
  double Vector3LengthSqr(Vector3C v)
    => _Vector3LengthSqr(v);
  late final _Vector3LengthSqrPtr = _lookup<NativeFunction<Float Function(Vector3C)>>('Vector3LengthSqr');
  late final _Vector3LengthSqr = _Vector3LengthSqrPtr.asFunction<double Function(Vector3C)>();

  /// Calculate linear interpolation between two vectors
  Vector3C Vector3Lerp(Vector3C v1, Vector3C v2, double amount)
    => _Vector3Lerp(v1, v2, amount);
  late final _Vector3LerpPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C, Float)>>('Vector3Lerp');
  late final _Vector3Lerp = _Vector3LerpPtr.asFunction<Vector3C Function(Vector3C, Vector3C, double)>();

  /// Get max value for each pair of components
  Vector3C Vector3Max(Vector3C v1, Vector3C v2)
    => _Vector3Max(v1, v2);
  late final _Vector3MaxPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C)>>('Vector3Max');
  late final _Vector3Max = _Vector3MaxPtr.asFunction<Vector3C Function(Vector3C, Vector3C)>();

  /// Get min value for each pair of components
  Vector3C Vector3Min(Vector3C v1, Vector3C v2)
    => _Vector3Min(v1, v2);
  late final _Vector3MinPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C)>>('Vector3Min');
  late final _Vector3Min = _Vector3MinPtr.asFunction<Vector3C Function(Vector3C, Vector3C)>();

  /// Move Vector towards target
  Vector3C Vector3MoveTowards(Vector3C v, Vector3C target, double maxDistance)
    => _Vector3MoveTowards(v, target, maxDistance);
  late final _Vector3MoveTowardsPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C, Float)>>('Vector3MoveTowards');
  late final _Vector3MoveTowards = _Vector3MoveTowardsPtr.asFunction<Vector3C Function(Vector3C, Vector3C, double)>();

  /// Multiply vector by vector
  Vector3C Vector3Multiply(Vector3C v1, Vector3C v2)
    => _Vector3Multiply(v1, v2);
  late final _Vector3MultiplyPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C)>>('Vector3Multiply');
  late final _Vector3Multiply = _Vector3MultiplyPtr.asFunction<Vector3C Function(Vector3C, Vector3C)>();

  /// Negate provided vector (invert direction)
  Vector3C Vector3Negate(Vector3C v)
    => _Vector3Negate(v);
  late final _Vector3NegatePtr = _lookup<NativeFunction<Vector3C Function(Vector3C)>>('Vector3Negate');
  late final _Vector3Negate =_Vector3NegatePtr.asFunction<Vector3C Function(Vector3C)>();

  /// Normalize provided vector
  Vector3C Vector3Normalize(Vector3C v)
    => _Vector3Normalize(v);
  late final _Vector3NormalizePtr = _lookup<NativeFunction<Vector3C Function(Vector3C)>>('Vector3Normalize');
  late final _Vector3Normalize = _Vector3NormalizePtr.asFunction<Vector3C Function(Vector3C)>();

  /// Vector with components value 1.0f
  Vector3C Vector3One()
    => _Vector3One();
  late final _Vector3OnePtr = _lookup<NativeFunction<Vector3C Function()>>('Vector3One');
  late final _Vector3One = _Vector3OnePtr.asFunction<Vector3C Function()>();

  /// Orthonormalize provided vectors
  /// Makes vectors normalized and orthogonal to each other
  /// Gram-Schmidt function implementation
  void Vector3OrthoNormalize(Pointer<Vector3C> v1, Pointer<Vector3C> v2)
    => _Vector3OrthoNormalize(v1, v2);
  late final _Vector3OrthoNormalizePtr = _lookup<NativeFunction<Void Function(Pointer<Vector3C>, Pointer<Vector3C>)>>('Vector3OrthoNormalize');
  late final _Vector3OrthoNormalize = _Vector3OrthoNormalizePtr.asFunction<void Function(Pointer<Vector3C>, Pointer<Vector3C>)>();

  /// Calculate one vector perpendicular vector
  Vector3C Vector3Perpendicular(Vector3C v)
    => _Vector3Perpendicular(v);
  late final _Vector3PerpendicularPtr = _lookup<NativeFunction<Vector3C Function(Vector3C)>>('Vector3Perpendicular');
  late final _Vector3Perpendicular = _Vector3PerpendicularPtr.asFunction<Vector3C Function(Vector3C)>();

  /// Calculate the projection of the vector v1 on to v2
  Vector3C Vector3Project(Vector3C v1, Vector3C v2)
    => _Vector3Project(v1, v2);
  late final _Vector3ProjectPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C)>>('Vector3Project');
  late final _Vector3Project = _Vector3ProjectPtr.asFunction<Vector3C Function(Vector3C, Vector3C)>();

  /// Calculate reflected vector to normal
  Vector3C Vector3Reflect(Vector3C v, Vector3C normal)
    => _Vector3Reflect(v, normal);
  late final _Vector3ReflectPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C)>>('Vector3Reflect');
  late final _Vector3Reflect = _Vector3ReflectPtr.asFunction<Vector3C Function(Vector3C, Vector3C)>();

  /// Compute the direction of a refracted ray
  /// v: normalized direction of the incoming ray
  /// n: normalized normal vector of the interface of two optical media
  /// r: ratio of the refractive index of the medium from where the ray comes
  /// to the refractive index of the medium on the other side of the surface
  Vector3C Vector3Refract(Vector3C v, Vector3C n, double r)
    => _Vector3Refract(v, n, r);
  late final _Vector3RefractPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C, Float)>>('Vector3Refract');
  late final _Vector3Refract = _Vector3RefractPtr.asFunction<Vector3C Function(Vector3C, Vector3C, double)>();

  /// Calculate the rejection of the vector v1 on to v2
  Vector3C Vector3Reject(Vector3C v1, Vector3C v2)
    => _Vector3Reject(v1, v2);
  late final _Vector3RejectPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C)>>('Vector3Reject');
  late final _Vector3Reject = _Vector3RejectPtr.asFunction<Vector3C Function(Vector3C, Vector3C)>();

  /// Rotates a vector around an axis
  Vector3C Vector3RotateByAxisAngle(Vector3C v, Vector3C axis, double angle)
    => _Vector3RotateByAxisAngle(v, axis, angle);
  late final _Vector3RotateByAxisAnglePtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C, Float)>>('Vector3RotateByAxisAngle');
  late final _Vector3RotateByAxisAngle = _Vector3RotateByAxisAnglePtr.asFunction<Vector3C Function(Vector3C, Vector3C, double)>();

  /// Transform a vector by quaternion rotation
  Vector3C Vector3RotateByQuaternion(Vector3C v, QuaternionC q)
    => _Vector3RotateByQuaternion(v, q);
  late final _Vector3RotateByQuaternionPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, QuaternionC)>>('Vector3RotateByQuaternion');
  late final _Vector3RotateByQuaternion = _Vector3RotateByQuaternionPtr.asFunction<Vector3C Function(Vector3C, QuaternionC)>();

  /// Multiply vector by scalar
  Vector3C Vector3Scale(Vector3C v, double scalar)
    => _Vector3Scale(v, scalar);
  late final _Vector3ScalePtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Float)>>('Vector3Scale');
  late final _Vector3Scale = _Vector3ScalePtr.asFunction<Vector3C Function(Vector3C, double)>();

  /// Subtract two vectors
  Vector3C Vector3Subtract(Vector3C v1, Vector3C v2)
    => _Vector3Subtract(v1, v2);
  late final _Vector3SubtractPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Vector3C)>>('Vector3Subtract');
  late final _Vector3Subtract = _Vector3SubtractPtr.asFunction<Vector3C Function(Vector3C, Vector3C)>();

  /// Subtract vector by double value
  Vector3C Vector3SubtractValue(Vector3C v, double sub)
    => _Vector3SubtractValue(v, sub);
  late final _Vector3SubtractValuePtr = _lookup<NativeFunction<Vector3C Function(Vector3C, Float)>>('Vector3SubtractValue');
  late final _Vector3SubtractValue = _Vector3SubtractValuePtr.asFunction<Vector3C Function(Vector3C, double)>();

  /// Get Vector3 as float array
  float3C Vector3ToFloatV(Vector3C v)
    => _Vector3ToFloatV(v);
  late final _Vector3ToFloatVPtr = _lookup<NativeFunction<float3C Function(Vector3C)>>('Vector3ToFloatV');
  late final _Vector3ToFloatV =_Vector3ToFloatVPtr.asFunction<float3C Function(Vector3C)>();

  /// Transforms a Vector3 by a given Matrix
  Vector3C Vector3Transform(Vector3C v, MatrixC mat)
    => _Vector3Transform(v, mat);
  late final _Vector3TransformPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, MatrixC)>>('Vector3Transform');
  late final _Vector3Transform = _Vector3TransformPtr.asFunction<Vector3C Function(Vector3C, MatrixC)>();

  /// Projects a Vector3 from screen space into object space
  Vector3C Vector3Unproject(Vector3C source, MatrixC projection, MatrixC view)
    => _Vector3Unproject(source, projection, view);
  late final _Vector3UnprojectPtr = _lookup<NativeFunction<Vector3C Function(Vector3C, MatrixC, MatrixC)>>('Vector3Unproject');
  late final _Vector3Unproject = _Vector3UnprojectPtr.asFunction<Vector3C Function(Vector3C, MatrixC, MatrixC)>();

  /// Vector with components value 0.0f
  Vector3C Vector3Zero()
    => _Vector3Zero();
  late final _Vector3ZeroPtr = _lookup<NativeFunction<Vector3C Function()>>('Vector3Zero');
  late final _Vector3Zero = _Vector3ZeroPtr.asFunction<Vector3C Function()>();
}
