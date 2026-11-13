part of '../../../../raylib_dartified_web.dart';

class RaylibVector4Ext extends RaylibModuleWasm {
  /// Add two vectors
  late final XF3<void> Vector4Add;
  /// Add value to vector components
  late final XF3<void> Vector4AddValue;
  /// Calculate distance between two vectors
  late final XF2<double> Vector4Distance;
  /// Calculate square distance between two vectors
  late final XF2<double> Vector4DistanceSqr;
  /// Divide vector by vector
  late final XF3<void> Vector4Divide;
  /// Vectors dot product
  late final XF2<double> Vector4DotProduct;
  /// Check whether two given vectors are almost equal
  late final XF2<bool> Vector4Equals;
  /// Invert the given vector
  late final XF2<void> Vector4Invert;
  /// Vector length
  late final XF1<double> Vector4Length;
  /// Vector square length
  late final XF1<double> Vector4LengthSqr;
  /// Calculate linear interpolation between two vectors
  late final XF4<void> Vector4Lerp;
  /// Get max value for each pair of components
  late final XF3<void> Vector4Max;
  /// Get min value for each pair of components
  late final XF3<void> Vector4Min;
  /// Move Vector towards target
  late final XF4<void> Vector4MoveTowards;
  /// Multiply vector by vector
  late final XF3<void> Vector4Multiply;
  /// Negate vector
  late final XF2<void> Vector4Negate;
  /// Normalize provided vector
  late final XF2<void> Vector4Normalize;
  /// Get vector one
  late final XF1<void> Vector4One;
  /// Scale vector components by value (multiply)
  late final XF3<void> Vector4Scale;
  /// Substract vectors
  late final XF3<void> Vector4Subtract;
  /// Substract value from vector components
  late final XF3<void> Vector4SubtractValue;
  /// Get vector zero
  late final XF1<void> Vector4Zero;

  RaylibVector4Ext(super.rl) {
    Vector4Add           = swrap2('Vector4Add');
    Vector4AddValue      = swrap2('Vector4AddValue');
    Vector4Distance      = dwrap2('Vector4Distance');
    Vector4DistanceSqr   = dwrap2('Vector4DistanceSqr');
    Vector4Divide        = swrap2('Vector4Divide');
    Vector4DotProduct    = dwrap2('Vector4DotProduct');
    Vector4Equals        = dwrap2('Vector4Equals');
    Vector4Invert        = swrap1('Vector4Invert');
    Vector4Length        = dwrap1('Vector4Length');
    Vector4LengthSqr     = dwrap1('Vector4LengthSqr');
    Vector4Lerp          = swrap3('Vector4Lerp');
    Vector4Max           = swrap2('Vector4Max');
    Vector4Min           = swrap2('Vector4Min');
    Vector4MoveTowards   = swrap3('Vector4MoveTowards');
    Vector4Multiply      = swrap2('Vector4Multiply');
    Vector4Negate        = swrap1('Vector4Negate');
    Vector4Normalize     = swrap1('Vector4Normalize');
    Vector4One           = swrap0('Vector4One');
    Vector4Scale         = swrap2('Vector4Scale');
    Vector4Subtract      = swrap2('Vector4Subtract');
    Vector4SubtractValue = swrap2('Vector4SubtractValue');
    Vector4Zero          = swrap0('Vector4Zero');
  }
}
