import 'dart:ffi';

import 'core/raylib.dart';

RaylibTemp get Temp => Raylib.instance.Temp;

RaylibQuaternions get Q => Raylib.instance.Q;
RaylibMatrices get Matrix => Raylib.instance.Matrix;
RaylibVectors get Vec => Raylib.instance.Vec;
RaylibColors get Color => Raylib.instance.C;
RaylibEasings get Ease => Raylib.instance.Ease;

RaylibCore get Core => Raylib.instance.Core;
RaylibCoreD get CoreD => Raylib.instance.CoreD;
RaylibAudio get Audio => Raylib.instance.Audio;
RaylibAudioD get AudioD => Raylib.instance.AudioD;
RaylibRlgl get Rlgl => Raylib.instance.Rlgl;
RaylibRlglD get RlglD => Raylib.instance.RlglD;
RaylibCamera get Cam => Raylib.instance.Cam;
RaylibCameraD get CamD => Raylib.instance.CamD;
RaylibLight get Light => Raylib.instance.Light;
RaylibLightD get LightD => Raylib.instance.LightD;

RaylibGui get Gui => Raylib.instance.Gui;
RaylibGuiD get GuiD => Raylib.instance.GuiD;

extension StringToRaylibC on String {
  Pointer<Char> get toC => Raylib.instance.Temp.str(this);
}

T registerModule<T extends RaylibModule>(T Function(Raylib rl) moduleLoader)
  => Raylib.instance.registerModule(moduleLoader(Raylib.instance));

T module<T extends RaylibModule>() => Raylib.instance.module<T>();

void disposeRaylib() => Raylib.instance.dispose();

// Functions

double Clamp(num value, num min, num max)
  => Raylib.instance.Clamp(value, min, max);

double Lerp(num start, num end, num amount)
  => Raylib.instance.Lerp(start, end, amount);

double Normalize(num value, num start, num end)
  => Raylib.instance.Normalize(value, start, end);

double Remap(num value, num inputStart, num inputEnd, num outputStart, num outputEnd)
  => Raylib.instance.Remap(value, inputStart, inputEnd, outputStart, outputEnd);

double Wrap(num value, num min, num max)
  => Raylib.instance.Wrap(value, min, max);

bool FloatEquals(double x, double y)
  => Raylib.instance.FloatEquals(x, y);

// Constants

int get RAYLIB_VERSION_MAJOR => Raylib.instance.RAYLIB_VERSION_MAJOR;
int get RAYLIB_VERSION_MINOR => Raylib.instance.RAYLIB_VERSION_MINOR;
int get RAYLIB_VERSION_PATCH => Raylib.instance.RAYLIB_VERSION_PATCH;
String get RAYLIB_VERSION => Raylib.instance.RAYLIB_VERSION;
double get PI => Raylib.instance.PI;
double get DEG2RAD => Raylib.instance.DEG2RAD;
double get RAD2DEG => Raylib.instance.RAD2DEG;
MaterialMapIndex get MATERIAL_MAP_DIFFUSE => Raylib.instance.MATERIAL_MAP_DIFFUSE;
MaterialMapIndex get MATERIAL_MAP_SPECULAR => Raylib.instance.MATERIAL_MAP_SPECULAR;
int get MAX_MATERIAL_MAPS => Raylib.instance.MAX_MATERIAL_MAPS;
int get SHADER_LOC_MAP_DIFFUSE => Raylib.instance.SHADER_LOC_MAP_DIFFUSE;
int get SHADER_LOC_MAP_SPECULAR => Raylib.instance.SHADER_LOC_MAP_SPECULAR;
double get EPSILON => Raylib.instance.EPSILON;
double get M_E => Raylib.instance.M_E;
double get M_LOG2E => Raylib.instance.M_LOG2E;
double get M_LOG10E => Raylib.instance.M_LOG10E;
double get M_LN2 => Raylib.instance.M_LN2;
double get M_LN10 => Raylib.instance.M_LN10;
double get M_PI => Raylib.instance.M_PI;
double get M_PI_2 => Raylib.instance.M_PI_2;
double get M_PI_4 => Raylib.instance.M_PI_4;
double get M_1_PI => Raylib.instance.M_1_PI;
double get M_2_PI => Raylib.instance.M_2_PI;
double get M_2_SQRTPI => Raylib.instance.M_2_SQRTPI;
double get M_SQRT2 => Raylib.instance.M_SQRT2;
double get M_SQRT1_2 => Raylib.instance.M_SQRT1_2;
int get RAND_MAX => Raylib.instance.RAND_MAX;