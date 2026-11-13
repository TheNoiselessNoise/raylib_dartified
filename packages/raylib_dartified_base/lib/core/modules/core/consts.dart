part of '../../raylib_dartified_base.dart';

/// Dart-side mirror of compile-time constants.
class RaylibConstants {
  
  /// `RAYLIB_VERSION_MAJOR`
  static int RAYLIB_VERSION_MAJOR = 6;

  /// `RAYLIB_VERSION_MINOR`
  static int RAYLIB_VERSION_MINOR = 0;

  /// `RAYLIB_VERSION_PATCH`
  static int RAYLIB_VERSION_PATCH = 0;

  /// `RAYLIB_VERSION`
  static String RAYLIB_VERSION = '6.0';

  /// `PI`
  static double PI = 3.1415927410125732;

  /// `DEG2RAD`
  static double DEG2RAD = 0.01745329238474369;

  /// `RAD2DEG`
  static double RAD2DEG = 57.2957763671875;

  /// `MATERIAL_MAP_DIFFUSE`
  static MaterialMapIndex MATERIAL_MAP_DIFFUSE = .MATERIAL_MAP_ALBEDO;

  /// `MATERIAL_MAP_SPECULAR`
  static MaterialMapIndex MATERIAL_MAP_SPECULAR = .MATERIAL_MAP_METALNESS;

  /// `MAX_MATERIAL_MAPS`
  static int MAX_MATERIAL_MAPS = 12;

  /// `SHADER_LOC_MAP_DIFFUSE`
  static ShaderLocationIndex SHADER_LOC_MAP_DIFFUSE = .SHADER_LOC_MAP_ALBEDO;

  /// `SHADER_LOC_MAP_SPECULAR`
  static ShaderLocationIndex SHADER_LOC_MAP_SPECULAR = .SHADER_LOC_MAP_METALNESS;

  /// `EPSILON`
  static double EPSILON = 9.999999974752427e-7;

  /// `M_E`
  static double M_E = 2.718281828459045;

  /// `M_LOG2E`
  static double M_LOG2E = 1.4426950408889634;

  /// `M_LOG10E`
  static double M_LOG10E = 0.4342944819032518;

  /// `M_LN2`
  static double M_LN2 = 0.6931471805599453;

  /// `M_LN10`
  static double M_LN10 = 2.302585092994046;

  /// `M_PI`
  static double M_PI = 3.141592653589793;

  /// `M_PI_2`
  static double M_PI_2 = 1.5707963267948966;

  /// `M_PI_4`
  static double M_PI_4 = 0.7853981633974483;

  /// `M_1_PI`
  static double M_1_PI = 0.3183098861837907;

  /// `M_2_PI`
  static double M_2_PI = 0.6366197723675814;

  /// `M_2_SQRTPI`
  static double M_2_SQRTPI = 1.1283791670955126;

  /// `M_SQRT2`
  static double M_SQRT2 = 1.4142135623730951;

  /// `M_SQRT1_2`
  static double M_SQRT1_2 = 0.7071067811865476;

  /// `M_SQRT1_2`
  static int RAND_MAX = 2147483647;
  
  /// `MAX_TOUCH_POINTS`
  static int MAX_TOUCH_POINTS = 8;
}

/// Pure Dart implementations of Raylib's inline/math utility functions,
/// shared across backends to avoid duplicating logic that doesn't touch native memory.
class RaylibFunctions {

  /// Clamps [value] to the range `[min, max]`.
  static double Clamp(num value, num min, num max) {
    num result = (value < min) ? min : value;
    if (result > max) result = max;
    return result.toDouble();
  }

  /// Linear interpolation between [start] and [end] by [amount].
  ///
  /// [amount] should be in the range `[0.0, 1.0]`.
  static double Lerp(num start, num end, num amount) {
    return (start + amount*(end - start)).toDouble();
  }

  /// Normalizes [value] from the range `[start, end]` to `[0.0, 1.0]`.
  static double Normalize(num value, num start, num end) {
    return (value - start)/(end - start);
  }

  /// Remaps [value] from the input range `[inputStart, inputEnd]`
  /// to the output range `[outputStart, outputEnd]`.
  static double Remap(num value, num inputStart, num inputEnd, num outputStart, num outputEnd) {
    return (value - inputStart)/(inputEnd - inputStart)*(outputEnd - outputStart) + outputStart;
  }

  /// Wraps [value] within the range `[min, max]`.
  static double Wrap(num value, num min, num max) {
    return value - (max - min)*((value - min)/(max - min)).floorToDouble();
  }

  /// Returns `true` if [x] and [y] are approximately equal.
  ///
  /// Uses epsilon-based comparison scaled to the magnitude of the compared values.
  static bool FloatEquals(double x, double y) {
    return ((x - y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max(x.abs(), y.abs())));
  }

}