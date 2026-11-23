part of '../../../../backend.dart';

final class RaylibVector3Ext extends XPackageModuleWasm<Raylib> {
  /// Add two vectors
  late final XF3<void> Vector3Add;
  /// Add vector and double value
  late final XF3<void> Vector3AddValue;
  /// Calculate angle between two vectors
  late final XF2<double> Vector3Angle;
  /// Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c)
  /// 
  /// NOTE: Assumes P is on the plane of the triangle
  late final XF5<void> Vector3Barycenter;
  /// Clamp the components of the vector between
  /// min and max values specified by the given vectors
  late final XF4<void> Vector3Clamp;
  /// Clamp the magnitude of the vector between two values
  late final XF4<void> Vector3ClampValue;
  /// Calculate two vectors cross product
  late final XF3<void> Vector3CrossProduct;
  /// Calculate cubic hermite interpolation between two vectors and their tangents
  /// as described in the GLTF 2.0 specification: https://registry.khronos.org/glTF/specs/2.0/glTF-2.0.html#interpolation-cubic
  late final XF6<void> Vector3CubicHermite;
  /// Calculate distance between two vectors
  late final XF2<double> Vector3Distance;
  /// Calculate square distance between two vectors
  late final XF2<double> Vector3DistanceSqr;
  /// Divide vector by vector
  late final XF3<void> Vector3Divide;
  /// Calculate two vectors dot product
  late final XF2<double> Vector3DotProduct;
  /// Check whether two given vectors are almost equal
  late final XF2<bool> Vector3Equals;
  /// Invert the given vector
  late final XF2<void> Vector3Invert;
  /// Calculate vector length
  late final XF1<double> Vector3Length;
  /// Calculate vector square length
  late final XF1<double> Vector3LengthSqr;
  /// Calculate linear interpolation between two vectors
  late final XF4<void> Vector3Lerp;
  /// Get max value for each pair of components
  late final XF3<void> Vector3Max;
  /// Get min value for each pair of components
  late final XF3<void> Vector3Min;
  /// Move Vector towards target
  late final XF4<void> Vector3MoveTowards;
  /// Multiply vector by vector
  late final XF3<void> Vector3Multiply;
  /// Negate provided vector (invert direction)
  late final XF2<void> Vector3Negate;
  /// Normalize provided vector
  late final XF2<void> Vector3Normalize;
  /// Vector with components value 1.0f
  late final XF1<void> Vector3One;
  /// Orthonormalize provided vectors
  /// Makes vectors normalized and orthogonal to each other
  /// Gram-Schmidt function implementation
  late final XF2<void> Vector3OrthoNormalize;
  /// Calculate one vector perpendicular vector
  late final XF2<void> Vector3Perpendicular;
  /// Calculate the projection of the vector v1 on to v2
  late final XF3<void> Vector3Project;
  /// Calculate reflected vector to normal
  late final XF3<void> Vector3Reflect;
  /// Compute the direction of a refracted ray
  /// v: normalized direction of the incoming ray
  /// n: normalized normal vector of the interface of two optical media
  /// r: ratio of the refractive index of the medium from where the ray comes
  /// to the refractive index of the medium on the other side of the surface
  late final XF4<void> Vector3Refract;
  /// Calculate the rejection of the vector v1 on to v2
  late final XF3<void> Vector3Reject;
  /// Rotates a vector around an axis
  late final XF4<void> Vector3RotateByAxisAngle;
  /// Transform a vector by quaternion rotation
  late final XF3<void> Vector3RotateByQuaternion;
  /// Multiply vector by scalar
  late final XF3<void> Vector3Scale;
  /// Subtract two vectors
  late final XF3<void> Vector3Subtract;
  /// Subtract vector by double value
  late final XF3<void> Vector3SubtractValue;
  /// Get Vector3 as float array
  late final XF2<void> Vector3ToFloatV;
  /// Transforms a Vector3 by a given Matrix
  late final XF3<void> Vector3Transform;
  /// Projects a Vector3 from screen space into object space
  late final XF4<void> Vector3Unproject;
  /// Vector with components value 0.0f
  late final XF1<void> Vector3Zero;

  RaylibVector3Ext(super.pkg) {
    Vector3Add                = swrap2('Vector3Add');
    Vector3AddValue           = swrap2('Vector3AddValue');
    Vector3Angle              = dwrap2('Vector3Angle');
    Vector3Barycenter         = swrap4('Vector3Barycenter');
    Vector3Clamp              = swrap3('Vector3Clamp');
    Vector3ClampValue         = swrap3('Vector3ClampValue');
    Vector3CrossProduct       = swrap2('Vector3CrossProduct');
    Vector3CubicHermite       = swrap5('Vector3CubicHermite');
    Vector3Distance           = dwrap2('Vector3Distance');
    Vector3DistanceSqr        = dwrap2('Vector3DistanceSqr');
    Vector3Divide             = swrap2('Vector3Divide');
    Vector3DotProduct         = dwrap2('Vector3DotProduct');
    Vector3Equals             = dwrap2('Vector3Equals');
    Vector3Invert             = swrap1('Vector3Invert');
    Vector3Length             = dwrap1('Vector3Length');
    Vector3LengthSqr          = dwrap1('Vector3LengthSqr');
    Vector3Lerp               = swrap3('Vector3Lerp');
    Vector3Max                = swrap2('Vector3Max');
    Vector3Min                = swrap2('Vector3Min');
    Vector3MoveTowards        = swrap3('Vector3MoveTowards');
    Vector3Multiply           = swrap2('Vector3Multiply');
    Vector3Negate             = swrap1('Vector3Negate');
    Vector3Normalize          = swrap1('Vector3Normalize');
    Vector3One                = swrap0('Vector3One');
    Vector3OrthoNormalize     = dwrap2('Vector3OrthoNormalize');
    Vector3Perpendicular      = swrap1('Vector3Perpendicular');
    Vector3Project            = swrap2('Vector3Project');
    Vector3Reflect            = swrap2('Vector3Reflect');
    Vector3Refract            = swrap3('Vector3Refract');
    Vector3Reject             = swrap2('Vector3Reject');
    Vector3RotateByAxisAngle  = swrap3('Vector3RotateByAxisAngle');
    Vector3RotateByQuaternion = swrap2('Vector3RotateByQuaternion');
    Vector3Scale              = swrap2('Vector3Scale');
    Vector3Subtract           = swrap2('Vector3Subtract');
    Vector3SubtractValue      = swrap2('Vector3SubtractValue');
    Vector3ToFloatV           = swrap1('Vector3ToFloatV');
    Vector3Transform          = swrap2('Vector3Transform');
    Vector3Unproject          = swrap3('Vector3Unproject');
    Vector3Zero               = swrap0('Vector3Zero');
  }
}
