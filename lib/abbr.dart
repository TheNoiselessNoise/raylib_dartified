import 'dart:ffi';
import 'core/raylib_dartified.dart';
import 'package:raylib_dartified_base/raylib_dartified_base.dart'
  show
    RaylibConstants,
    RaylibFunctions,
    RaylibGuiConstants,
    RaylibRlglConstants,
    MaterialMapIndex,
    RaylibModule;

RaylibTemp get Temp => Raylib.instance.Temp;
RaylibColors get Color => Raylib.instance.Color;
RaylibEasings get Ease => Raylib.instance.Ease;
RaylibQuaternions get Quat => Raylib.instance.Quat;
RaylibMatrices get Matrix => Raylib.instance.Matrix;
RaylibVectors get Vector => Raylib.instance.Vector;

RaylibAudio get Audio => Raylib.instance.Audio;
RaylibAudioD get AudioD => Raylib.instance.AudioD;
RaylibCamera get Camera => Raylib.instance.Camera;
RaylibCameraD get CameraD => Raylib.instance.CameraD;
RaylibCore get Core => Raylib.instance.Core;
RaylibCoreD get CoreD => Raylib.instance.CoreD;
RaylibGui get Gui => Raylib.instance.Gui;
RaylibGuiD get GuiD => Raylib.instance.GuiD;
RaylibLight get Light => Raylib.instance.Light;
RaylibLightD get LightD => Raylib.instance.LightD;
RaylibRlgl get Rlgl => Raylib.instance.Rlgl;
RaylibRlglD get RlglD => Raylib.instance.RlglD;
RaylibUtils get Utils => Raylib.instance.Utils;

extension StringToRaylibC on String {
  Pointer<Char> get toC => Raylib.instance.Temp.str(this);
}

T registerModule<T extends RaylibModule>(T Function(Raylib rl) moduleLoader)
  => Raylib.instance.registerModule(moduleLoader(Raylib.instance));

T module<T extends RaylibModule>() => Raylib.instance.module<T>();

void disposeRaylib() => Raylib.instance.dispose();

// Functions

double Clamp(num value, num min, num max)
  => RaylibFunctions.Clamp(value, min, max);

double Lerp(num start, num end, num amount)
  => RaylibFunctions.Lerp(start, end, amount);

double Normalize(num value, num start, num end)
  => RaylibFunctions.Normalize(value, start, end);

double Remap(num value, num inputStart, num inputEnd, num outputStart, num outputEnd)
  => RaylibFunctions.Remap(value, inputStart, inputEnd, outputStart, outputEnd);

double Wrap(num value, num min, num max)
  => RaylibFunctions.Wrap(value, min, max);

bool FloatEquals(double x, double y)
  => RaylibFunctions.FloatEquals(x, y);

// Constants

// Core

int get RAYLIB_VERSION_MAJOR => RaylibConstants.RAYLIB_VERSION_MAJOR;
int get RAYLIB_VERSION_MINOR => RaylibConstants.RAYLIB_VERSION_MINOR;
int get RAYLIB_VERSION_PATCH => RaylibConstants.RAYLIB_VERSION_PATCH;
String get RAYLIB_VERSION => RaylibConstants.RAYLIB_VERSION;
double get PI => RaylibConstants.PI;
double get DEG2RAD => RaylibConstants.DEG2RAD;
double get RAD2DEG => RaylibConstants.RAD2DEG;
MaterialMapIndex get MATERIAL_MAP_DIFFUSE => RaylibConstants.MATERIAL_MAP_DIFFUSE;
MaterialMapIndex get MATERIAL_MAP_SPECULAR => RaylibConstants.MATERIAL_MAP_SPECULAR;
int get MAX_MATERIAL_MAPS => RaylibConstants.MAX_MATERIAL_MAPS;
int get SHADER_LOC_MAP_DIFFUSE => RaylibConstants.SHADER_LOC_MAP_DIFFUSE;
int get SHADER_LOC_MAP_SPECULAR => RaylibConstants.SHADER_LOC_MAP_SPECULAR;
double get EPSILON => RaylibConstants.EPSILON;
double get M_E => RaylibConstants.M_E;
double get M_LOG2E => RaylibConstants.M_LOG2E;
double get M_LOG10E => RaylibConstants.M_LOG10E;
double get M_LN2 => RaylibConstants.M_LN2;
double get M_LN10 => RaylibConstants.M_LN10;
double get M_PI => RaylibConstants.M_PI;
double get M_PI_2 => RaylibConstants.M_PI_2;
double get M_PI_4 => RaylibConstants.M_PI_4;
double get M_1_PI => RaylibConstants.M_1_PI;
double get M_2_PI => RaylibConstants.M_2_PI;
double get M_2_SQRTPI => RaylibConstants.M_2_SQRTPI;
double get M_SQRT2 => RaylibConstants.M_SQRT2;
double get M_SQRT1_2 => RaylibConstants.M_SQRT1_2;
int get RAND_MAX => RaylibConstants.RAND_MAX;

// Gui

int get RAYGUI_VERSION_MAJOR => RaylibGuiConstants.RAYGUI_VERSION_MAJOR;
int get RAYGUI_VERSION_MINOR => RaylibGuiConstants.RAYGUI_VERSION_MINOR;
int get RAYGUI_VERSION_PATCH => RaylibGuiConstants.RAYGUI_VERSION_PATCH;
String get RAYGUI_VERSION => RaylibGuiConstants.RAYGUI_VERSION;
int get RAYGUI_SCROLLBAR_LEFT_SIDE => RaylibGuiConstants.RAYGUI_SCROLLBAR_LEFT_SIDE;
int get RAYGUI_SCROLLBAR_RIGHT_SIDE => RaylibGuiConstants.RAYGUI_SCROLLBAR_RIGHT_SIDE;
int get RAYGUI_ICON_SIZE => RaylibGuiConstants.RAYGUI_ICON_SIZE;
int get RAYGUI_ICON_MAX_ICONS => RaylibGuiConstants.RAYGUI_ICON_MAX_ICONS;
int get RAYGUI_ICON_MAX_NAME_LENGTH => RaylibGuiConstants.RAYGUI_ICON_MAX_NAME_LENGTH;
int get RAYGUI_ICON_DATA_ELEMENTS => RaylibGuiConstants.RAYGUI_ICON_DATA_ELEMENTS;
int get RAYGUI_MAX_CONTROLS => RaylibGuiConstants.RAYGUI_MAX_CONTROLS;
int get RAYGUI_MAX_PROPS_BASE => RaylibGuiConstants.RAYGUI_MAX_PROPS_BASE;
int get RAYGUI_MAX_PROPS_EXTENDED => RaylibGuiConstants.RAYGUI_MAX_PROPS_EXTENDED;
int get RAYGUI_WINDOWBOX_STATUSBAR_HEIGHT => RaylibGuiConstants.RAYGUI_WINDOWBOX_STATUSBAR_HEIGHT;
int get RAYGUI_GROUPBOX_LINE_THICK => RaylibGuiConstants.RAYGUI_GROUPBOX_LINE_THICK;
int get RAYGUI_LINE_MARGIN_TEXT => RaylibGuiConstants.RAYGUI_LINE_MARGIN_TEXT;
int get RAYGUI_LINE_TEXT_PADDING => RaylibGuiConstants.RAYGUI_LINE_TEXT_PADDING;
int get RAYGUI_PANEL_BORDER_WIDTH => RaylibGuiConstants.RAYGUI_PANEL_BORDER_WIDTH;
int get RAYGUI_TABBAR_ITEM_WIDTH => RaylibGuiConstants.RAYGUI_TABBAR_ITEM_WIDTH;
int get RAYGUI_MIN_SCROLLBAR_WIDTH => RaylibGuiConstants.RAYGUI_MIN_SCROLLBAR_WIDTH;
int get RAYGUI_MIN_SCROLLBAR_HEIGHT => RaylibGuiConstants.RAYGUI_MIN_SCROLLBAR_HEIGHT;
int get RAYGUI_MIN_MOUSE_WHEEL_SPEED => RaylibGuiConstants.RAYGUI_MIN_MOUSE_WHEEL_SPEED;
int get RAYGUI_TOGGLEGROUP_MAX_ITEMS => RaylibGuiConstants.RAYGUI_TOGGLEGROUP_MAX_ITEMS;
int get RAYGUI_TEXTBOX_AUTO_CURSOR_COOLDOWN => RaylibGuiConstants.RAYGUI_TEXTBOX_AUTO_CURSOR_COOLDOWN;
int get RAYGUI_TEXTBOX_AUTO_CURSOR_DELAY => RaylibGuiConstants.RAYGUI_TEXTBOX_AUTO_CURSOR_DELAY;
int get RAYGUI_VALUEBOX_MAX_CHARS => RaylibGuiConstants.RAYGUI_VALUEBOX_MAX_CHARS;
int get RAYGUI_COLORBARALPHA_CHECKED_SIZE => RaylibGuiConstants.RAYGUI_COLORBARALPHA_CHECKED_SIZE;
int get RAYGUI_MESSAGEBOX_BUTTON_HEIGHT => RaylibGuiConstants.RAYGUI_MESSAGEBOX_BUTTON_HEIGHT;
int get RAYGUI_MESSAGEBOX_BUTTON_PADDING => RaylibGuiConstants.RAYGUI_MESSAGEBOX_BUTTON_PADDING;
int get RAYGUI_TEXTINPUTBOX_BUTTON_HEIGHT => RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_BUTTON_HEIGHT;
int get RAYGUI_TEXTINPUTBOX_BUTTON_PADDING => RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_BUTTON_PADDING;
int get RAYGUI_TEXTINPUTBOX_HEIGHT => RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_HEIGHT;
double get RAYGUI_GRID_ALPHA => RaylibGuiConstants.RAYGUI_GRID_ALPHA;
int get RAYGUI_MAX_LINE_BUFFER_SIZE => RaylibGuiConstants.RAYGUI_MAX_LINE_BUFFER_SIZE;
int get RAYGUI_ICON_TEXT_PADDING => RaylibGuiConstants.RAYGUI_ICON_TEXT_PADDING;
int get RAYGUI_MAX_TEXT_LINES => RaylibGuiConstants.RAYGUI_MAX_TEXT_LINES;
int get RAYGUI_TEXTSPLIT_MAX_ITEMS => RaylibGuiConstants.RAYGUI_TEXTSPLIT_MAX_ITEMS;
int get RAYGUI_TEXTSPLIT_MAX_TEXT_SIZE => RaylibGuiConstants.RAYGUI_TEXTSPLIT_MAX_TEXT_SIZE;
int get RAYGUI_TEXTFORMAT_MAX_SIZE => RaylibGuiConstants.RAYGUI_TEXTFORMAT_MAX_SIZE;
List<int> get RAYGUI_ICONS => RaylibGuiConstants.RAYGUI_ICONS;

// Rlgl

String get RLGL_VERSION => RaylibRlglConstants.RLGL_VERSION;
int get RL_DEFAULT_BATCH_BUFFER_ELEMENTS => RaylibRlglConstants.RL_DEFAULT_BATCH_BUFFER_ELEMENTS;
int get RL_DEFAULT_BATCH_BUFFERS => RaylibRlglConstants.RL_DEFAULT_BATCH_BUFFERS;
int get RL_DEFAULT_BATCH_DRAWCALLS => RaylibRlglConstants.RL_DEFAULT_BATCH_DRAWCALLS;
int get RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS => RaylibRlglConstants.RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS;
int get RL_MAX_MATRIX_STACK_SIZE => RaylibRlglConstants.RL_MAX_MATRIX_STACK_SIZE;
int get RL_MAX_SHADER_LOCATIONS => RaylibRlglConstants.RL_MAX_SHADER_LOCATIONS;
double get RL_CULL_DISTANCE_NEAR => RaylibRlglConstants.RL_CULL_DISTANCE_NEAR;
double get RL_CULL_DISTANCE_FAR => RaylibRlglConstants.RL_CULL_DISTANCE_FAR;
int get RL_TEXTURE_WRAP_S => RaylibRlglConstants.RL_TEXTURE_WRAP_S;
int get RL_TEXTURE_WRAP_T => RaylibRlglConstants.RL_TEXTURE_WRAP_T;
int get RL_TEXTURE_MAG_FILTER => RaylibRlglConstants.RL_TEXTURE_MAG_FILTER;
int get RL_TEXTURE_MIN_FILTER => RaylibRlglConstants.RL_TEXTURE_MIN_FILTER;
int get RL_TEXTURE_FILTER_NEAREST => RaylibRlglConstants.RL_TEXTURE_FILTER_NEAREST;
int get RL_TEXTURE_FILTER_LINEAR => RaylibRlglConstants.RL_TEXTURE_FILTER_LINEAR;
int get RL_TEXTURE_FILTER_MIP_NEAREST => RaylibRlglConstants.RL_TEXTURE_FILTER_MIP_NEAREST;
int get RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR => RaylibRlglConstants.RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR;
int get RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST => RaylibRlglConstants.RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST;
int get RL_TEXTURE_FILTER_MIP_LINEAR => RaylibRlglConstants.RL_TEXTURE_FILTER_MIP_LINEAR;
int get RL_TEXTURE_FILTER_ANISOTROPIC => RaylibRlglConstants.RL_TEXTURE_FILTER_ANISOTROPIC;
int get RL_TEXTURE_MIPMAP_BIAS_RATIO => RaylibRlglConstants.RL_TEXTURE_MIPMAP_BIAS_RATIO;
int get RL_TEXTURE_WRAP_REPEAT => RaylibRlglConstants.RL_TEXTURE_WRAP_REPEAT;
int get RL_TEXTURE_WRAP_CLAMP => RaylibRlglConstants.RL_TEXTURE_WRAP_CLAMP;
int get RL_TEXTURE_WRAP_MIRROR_REPEAT => RaylibRlglConstants.RL_TEXTURE_WRAP_MIRROR_REPEAT;
int get RL_TEXTURE_WRAP_MIRROR_CLAMP => RaylibRlglConstants.RL_TEXTURE_WRAP_MIRROR_CLAMP;
int get RL_MODELVIEW => RaylibRlglConstants.RL_MODELVIEW;
int get RL_PROJECTION => RaylibRlglConstants.RL_PROJECTION;
int get RL_TEXTURE => RaylibRlglConstants.RL_TEXTURE;
int get RL_LINES => RaylibRlglConstants.RL_LINES;
int get RL_TRIANGLES => RaylibRlglConstants.RL_TRIANGLES;
int get RL_QUADS => RaylibRlglConstants.RL_QUADS;
int get RL_UNSIGNED_BYTE => RaylibRlglConstants.RL_UNSIGNED_BYTE;
int get RL_FLOAT => RaylibRlglConstants.RL_FLOAT;
int get RL_STREAM_DRAW => RaylibRlglConstants.RL_STREAM_DRAW;
int get RL_STREAM_READ => RaylibRlglConstants.RL_STREAM_READ;
int get RL_STREAM_COPY => RaylibRlglConstants.RL_STREAM_COPY;
int get RL_STATIC_DRAW => RaylibRlglConstants.RL_STATIC_DRAW;
int get RL_STATIC_READ => RaylibRlglConstants.RL_STATIC_READ;
int get RL_STATIC_COPY => RaylibRlglConstants.RL_STATIC_COPY;
int get RL_DYNAMIC_DRAW => RaylibRlglConstants.RL_DYNAMIC_DRAW;
int get RL_DYNAMIC_READ => RaylibRlglConstants.RL_DYNAMIC_READ;
int get RL_DYNAMIC_COPY => RaylibRlglConstants.RL_DYNAMIC_COPY;
int get RL_FRAGMENT_SHADER => RaylibRlglConstants.RL_FRAGMENT_SHADER;
int get RL_VERTEX_SHADER => RaylibRlglConstants.RL_VERTEX_SHADER;
int get RL_COMPUTE_SHADER => RaylibRlglConstants.RL_COMPUTE_SHADER;
int get RL_ZERO => RaylibRlglConstants.RL_ZERO;
int get RL_ONE => RaylibRlglConstants.RL_ONE;
int get RL_SRC_COLOR => RaylibRlglConstants.RL_SRC_COLOR;
int get RL_ONE_MINUS_SRC_COLOR => RaylibRlglConstants.RL_ONE_MINUS_SRC_COLOR;
int get RL_SRC_ALPHA => RaylibRlglConstants.RL_SRC_ALPHA;
int get RL_ONE_MINUS_SRC_ALPHA => RaylibRlglConstants.RL_ONE_MINUS_SRC_ALPHA;
int get RL_DST_ALPHA => RaylibRlglConstants.RL_DST_ALPHA;
int get RL_ONE_MINUS_DST_ALPHA => RaylibRlglConstants.RL_ONE_MINUS_DST_ALPHA;
int get RL_DST_COLOR => RaylibRlglConstants.RL_DST_COLOR;
int get RL_ONE_MINUS_DST_COLOR => RaylibRlglConstants.RL_ONE_MINUS_DST_COLOR;
int get RL_SRC_ALPHA_SATURATE => RaylibRlglConstants.RL_SRC_ALPHA_SATURATE;
int get RL_CONSTANT_COLOR => RaylibRlglConstants.RL_CONSTANT_COLOR;
int get RL_ONE_MINUS_CONSTANT_COLOR => RaylibRlglConstants.RL_ONE_MINUS_CONSTANT_COLOR;
int get RL_CONSTANT_ALPHA => RaylibRlglConstants.RL_CONSTANT_ALPHA;
int get RL_ONE_MINUS_CONSTANT_ALPHA => RaylibRlglConstants.RL_ONE_MINUS_CONSTANT_ALPHA;
int get RL_FUNC_ADD => RaylibRlglConstants.RL_FUNC_ADD;
int get RL_MIN => RaylibRlglConstants.RL_MIN;
int get RL_MAX => RaylibRlglConstants.RL_MAX;
int get RL_FUNC_SUBTRACT => RaylibRlglConstants.RL_FUNC_SUBTRACT;
int get RL_FUNC_REVERSE_SUBTRACT => RaylibRlglConstants.RL_FUNC_REVERSE_SUBTRACT;
int get RL_BLEND_EQUATION => RaylibRlglConstants.RL_BLEND_EQUATION;
int get RL_BLEND_EQUATION_RGB => RaylibRlglConstants.RL_BLEND_EQUATION_RGB;
int get RL_BLEND_EQUATION_ALPHA => RaylibRlglConstants.RL_BLEND_EQUATION_ALPHA;
int get RL_BLEND_DST_RGB => RaylibRlglConstants.RL_BLEND_DST_RGB;
int get RL_BLEND_SRC_RGB => RaylibRlglConstants.RL_BLEND_SRC_RGB;
int get RL_BLEND_DST_ALPHA => RaylibRlglConstants.RL_BLEND_DST_ALPHA;
int get RL_BLEND_SRC_ALPHA => RaylibRlglConstants.RL_BLEND_SRC_ALPHA;
int get RL_BLEND_COLOR => RaylibRlglConstants.RL_BLEND_COLOR;
int get RL_READ_FRAMEBUFFER => RaylibRlglConstants.RL_READ_FRAMEBUFFER;
int get RL_DRAW_FRAMEBUFFER => RaylibRlglConstants.RL_DRAW_FRAMEBUFFER;
int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION;
int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD;
int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL;
int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR;
int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT;
int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2 => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2;
int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES;
int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEIDS => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEIDS;
int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS;
int get RL_SHADER_LOC_MAP_DIFFUSE => RaylibRlglConstants.RL_SHADER_LOC_MAP_DIFFUSE;
int get RL_SHADER_LOC_MAP_SPECULAR => RaylibRlglConstants.RL_SHADER_LOC_MAP_SPECULAR;