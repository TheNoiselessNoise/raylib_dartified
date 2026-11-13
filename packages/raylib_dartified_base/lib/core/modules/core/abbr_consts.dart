import 'package:raylib_dartified_base/raylib_dartified_base.dart';

/// See [RaylibConstants.RAYLIB_VERSION_MAJOR].
int get RAYLIB_VERSION_MAJOR => RaylibConstants.RAYLIB_VERSION_MAJOR;

/// See [RaylibConstants.RAYLIB_VERSION_MINOR].
int get RAYLIB_VERSION_MINOR => RaylibConstants.RAYLIB_VERSION_MINOR;

/// See [RaylibConstants.RAYLIB_VERSION_PATCH].
int get RAYLIB_VERSION_PATCH => RaylibConstants.RAYLIB_VERSION_PATCH;

/// See [RaylibConstants.RAYLIB_VERSION].
String get RAYLIB_VERSION => RaylibConstants.RAYLIB_VERSION;

/// See [RaylibConstants.PI].
double get PI => RaylibConstants.PI;

/// See [RaylibConstants.DEG2RAD].
double get DEG2RAD => RaylibConstants.DEG2RAD;

/// See [RaylibConstants.RAD2DEG].
double get RAD2DEG => RaylibConstants.RAD2DEG;

/// See [RaylibConstants.MATERIAL_MAP_DIFFUSE].
MaterialMapIndex get MATERIAL_MAP_DIFFUSE => RaylibConstants.MATERIAL_MAP_DIFFUSE;

/// See [RaylibConstants.MATERIAL_MAP_SPECULAR].
MaterialMapIndex get MATERIAL_MAP_SPECULAR => RaylibConstants.MATERIAL_MAP_SPECULAR;

/// See [RaylibConstants.MAX_MATERIAL_MAPS].
int get MAX_MATERIAL_MAPS => RaylibConstants.MAX_MATERIAL_MAPS;

/// See [RaylibConstants.SHADER_LOC_MAP_DIFFUSE].
ShaderLocationIndex get SHADER_LOC_MAP_DIFFUSE => RaylibConstants.SHADER_LOC_MAP_DIFFUSE;

/// See [RaylibConstants.SHADER_LOC_MAP_SPECULAR].
ShaderLocationIndex get SHADER_LOC_MAP_SPECULAR => RaylibConstants.SHADER_LOC_MAP_SPECULAR;

/// See [RaylibConstants.EPSILON].
double get EPSILON => RaylibConstants.EPSILON;

/// See [RaylibConstants.M_E].
double get M_E => RaylibConstants.M_E;

/// See [RaylibConstants.M_LOG2E].
double get M_LOG2E => RaylibConstants.M_LOG2E;

/// See [RaylibConstants.M_LOG10E].
double get M_LOG10E => RaylibConstants.M_LOG10E;

/// See [RaylibConstants.M_LN2].
double get M_LN2 => RaylibConstants.M_LN2;

/// See [RaylibConstants.M_LN10].
double get M_LN10 => RaylibConstants.M_LN10;

/// See [RaylibConstants.M_PI].
double get M_PI => RaylibConstants.M_PI;

/// See [RaylibConstants.M_PI_2].
double get M_PI_2 => RaylibConstants.M_PI_2;

/// See [RaylibConstants.M_PI_4].
double get M_PI_4 => RaylibConstants.M_PI_4;

/// See [RaylibConstants.M_1_PI].
double get M_1_PI => RaylibConstants.M_1_PI;

/// See [RaylibConstants.M_2_PI].
double get M_2_PI => RaylibConstants.M_2_PI;

/// See [RaylibConstants.M_2_SQRTPI].
double get M_2_SQRTPI => RaylibConstants.M_2_SQRTPI;

/// See [RaylibConstants.M_SQRT2].
double get M_SQRT2 => RaylibConstants.M_SQRT2;

/// See [RaylibConstants.M_SQRT1_2].
double get M_SQRT1_2 => RaylibConstants.M_SQRT1_2;

/// See [RaylibConstants.RAND_MAX].
int get RAND_MAX => RaylibConstants.RAND_MAX;

/// See [RaylibConstants.MAX_TOUCH_POINTS].
int get MAX_TOUCH_POINTS => RaylibConstants.MAX_TOUCH_POINTS;

/// See [RaylibFunctions.Clamp].
double Clamp(num value, num min, num max)
  => RaylibFunctions.Clamp(value, min, max);

/// See [RaylibFunctions.Lerp].
double Lerp(num start, num end, num amount)
  => RaylibFunctions.Lerp(start, end, amount);

/// See [RaylibFunctions.Normalize].
double Normalize(num value, num start, num end)
  => RaylibFunctions.Normalize(value, start, end);

/// See [RaylibFunctions.Remap].
double Remap(num value, num inputStart, num inputEnd, num outputStart, num outputEnd)
  => RaylibFunctions.Remap(value, inputStart, inputEnd, outputStart, outputEnd);

/// See [RaylibFunctions.Wrap].
double Wrap(num value, num min, num max)
  => RaylibFunctions.Wrap(value, min, max);

/// See [RaylibFunctions.FloatEquals].
bool FloatEquals(double x, double y)
  => RaylibFunctions.FloatEquals(x, y);