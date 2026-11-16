part of '../../../../raylib_dartified_web.dart';

final class RaylibVector2Ext extends RaylibModuleWasm {
  /// Add two vectors (v1 + v2)
  late final XF3<void> Vector2Add;
  /// Add vector and double value
  late final XF3<void> Vector2AddValue;
  /// Calculate the signed angle from v1 to v2, relative to the origin (0, 0)
  /// 
  /// NOTE: Coordinate system convention: positive X right, positive Y down
  /// positive angles appear clockwise, and negative angles appear counterclockwise
  late final XF2<double> Vector2Angle;
  /// Clamp the components of the vector between
  /// min and max values specified by the given vectors
  late final XF4<void> Vector2Clamp;
  /// Clamp the magnitude of the vector between two min and max values
  late final XF4<void> Vector2ClampValue;
  /// Calculate two vectors cross product
  late final XF2<double> Vector2CrossProduct;
  /// Calculate distance between two vectors
  late final XF2<double> Vector2Distance;
  /// Calculate square distance between two vectors
  late final XF2<double> Vector2DistanceSqr;
  /// Divide vector by vector
  late final XF3<void> Vector2Divide;
  /// Calculate two vectors dot product
  late final XF2<double> Vector2DotProduct;
  /// Check whether two given vectors are almost equal
  late final XF2<bool> Vector2Equals;
  /// Invert the given vector
  late final XF2<void> Vector2Invert;
  /// Calculate vector length
  late final XF1<double> Vector2Length;
  /// Calculate vector square length
  late final XF1<double> Vector2LengthSqr;
  /// Calculate linear interpolation between two vectors
  late final XF4<void> Vector2Lerp;
  /// Calculate angle defined by a two vectors line
  /// 
  /// NOTE: Parameters need to be normalized
  late final XF2<double> Vector2LineAngle;
  /// Get max value for each pair of components
  late final XF3<void> Vector2Max;
  /// Get min value for each pair of components
  late final XF3<void> Vector2Min;
  /// Move Vector towards target
  late final XF4<void> Vector2MoveTowards;
  /// Multiply vector by vector
  late final XF3<void> Vector2Multiply;
  /// Negate vector
  late final XF2<void> Vector2Negate;
  /// Normalize provided vector
  late final XF2<void> Vector2Normalize;
  /// Vector with components value 1.0f
  late final XF1<void> Vector2One;
  /// Calculate reflected vector to normal
  late final XF3<void> Vector2Reflect;
  /// Compute the direction of a refracted ray
  /// v: normalized direction of the incoming ray
  /// n: normalized normal vector of the interface of two optical media
  /// r: ratio of the refractive index of the medium from where the ray comes
  /// to the refractive index of the medium on the other side of the surface
  late final XF4<void> Vector2Refract;
  /// Rotate vector by angle
  late final XF3<void> Vector2Rotate;
  /// Scale vector (multiply by value)
  late final XF3<void> Vector2Scale;
  /// Subtract two vectors (v1 - v2)
  late final XF3<void> Vector2Subtract;
  /// Subtract vector by double value
  late final XF3<void> Vector2SubtractValue;
  /// Transforms a Vector2 by a given Matrix
  late final XF3<void> Vector2Transform;
  /// Vector with components value 0.0f
  late final XF1<void> Vector2Zero;

  RaylibVector2Ext(super.rl) {
    Vector2Add           = swrap2('Vector2Add');
    Vector2AddValue      = swrap2('Vector2AddValue');
    Vector2Angle         = dwrap2('Vector2Angle');
    Vector2Clamp         = swrap3('Vector2Clamp');
    Vector2ClampValue    = swrap3('Vector2ClampValue');
    Vector2CrossProduct  = dwrap2('Vector2CrossProduct');
    Vector2Distance      = dwrap2('Vector2Distance');
    Vector2DistanceSqr   = dwrap2('Vector2DistanceSqr');
    Vector2Divide        = swrap2('Vector2Divide');
    Vector2DotProduct    = dwrap2('Vector2DotProduct');
    Vector2Equals        = dwrap2('Vector2Equals');
    Vector2Invert        = swrap1('Vector2Invert');
    Vector2Length        = dwrap1('Vector2Length');
    Vector2LengthSqr     = dwrap1('Vector2LengthSqr');
    Vector2Lerp          = swrap3('Vector2Lerp');
    Vector2LineAngle     = dwrap2('Vector2LineAngle');
    Vector2Max           = swrap2('Vector2Max');
    Vector2Min           = swrap2('Vector2Min');
    Vector2MoveTowards   = swrap3('Vector2MoveTowards');
    Vector2Multiply      = swrap2('Vector2Multiply');
    Vector2Negate        = swrap1('Vector2Negate');
    Vector2Normalize     = swrap1('Vector2Normalize');
    Vector2One           = swrap0('Vector2One');
    Vector2Reflect       = swrap2('Vector2Reflect');
    Vector2Refract       = swrap3('Vector2Refract');
    Vector2Rotate        = swrap2('Vector2Rotate');
    Vector2Scale         = swrap2('Vector2Scale');
    Vector2Subtract      = swrap2('Vector2Subtract');
    Vector2SubtractValue = swrap2('Vector2SubtractValue');
    Vector2Transform     = swrap2('Vector2Transform');
    Vector2Zero          = swrap0('Vector2Zero');
  }
}
