part of '../../raylib_dartified_base.dart';

/// `ConfigFlags`
enum ConfigFlags with XEnum {
  /// `FLAG_VSYNC_HINT`
  FLAG_VSYNC_HINT(64),
  /// `FLAG_FULLSCREEN_MODE`
  FLAG_FULLSCREEN_MODE(2),
  /// `FLAG_WINDOW_RESIZABLE`
  FLAG_WINDOW_RESIZABLE(4),
  /// `FLAG_WINDOW_UNDECORATED`
  FLAG_WINDOW_UNDECORATED(8),
  /// `FLAG_WINDOW_HIDDEN`
  FLAG_WINDOW_HIDDEN(128),
  /// `FLAG_WINDOW_MINIMIZED`
  FLAG_WINDOW_MINIMIZED(512),
  /// `FLAG_WINDOW_MAXIMIZED`
  FLAG_WINDOW_MAXIMIZED(1024),
  /// `FLAG_WINDOW_UNFOCUSED`
  FLAG_WINDOW_UNFOCUSED(2048),
  /// `FLAG_WINDOW_TOPMOST`
  FLAG_WINDOW_TOPMOST(4096),
  /// `FLAG_WINDOW_ALWAYS_RUN`
  FLAG_WINDOW_ALWAYS_RUN(256),
  /// `FLAG_WINDOW_TRANSPARENT`
  FLAG_WINDOW_TRANSPARENT(16),
  /// `FLAG_WINDOW_HIGHDPI`
  FLAG_WINDOW_HIGHDPI(8192),
  /// `FLAG_WINDOW_MOUSE_PASSTHROUGH`
  FLAG_WINDOW_MOUSE_PASSTHROUGH(16384),
  /// `FLAG_BORDERLESS_WINDOWED_MODE`
  FLAG_BORDERLESS_WINDOWED_MODE(32768),
  /// `FLAG_MSAA_4X_HINT`
  FLAG_MSAA_4X_HINT(32),
  /// `FLAG_INTERLACED_HINT`
  FLAG_INTERLACED_HINT(65536);

  const ConfigFlags(this.value);

  @override
  final int value;

  /// Returns the [ConfigFlags] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static ConfigFlags fromValue(int value) => switch (value) {
    64 => FLAG_VSYNC_HINT,
    2 => FLAG_FULLSCREEN_MODE,
    4 => FLAG_WINDOW_RESIZABLE,
    8 => FLAG_WINDOW_UNDECORATED,
    128 => FLAG_WINDOW_HIDDEN,
    512 => FLAG_WINDOW_MINIMIZED,
    1024 => FLAG_WINDOW_MAXIMIZED,
    2048 => FLAG_WINDOW_UNFOCUSED,
    4096 => FLAG_WINDOW_TOPMOST,
    256 => FLAG_WINDOW_ALWAYS_RUN,
    16 => FLAG_WINDOW_TRANSPARENT,
    8192 => FLAG_WINDOW_HIGHDPI,
    16384 => FLAG_WINDOW_MOUSE_PASSTHROUGH,
    32768 => FLAG_BORDERLESS_WINDOWED_MODE,
    32 => FLAG_MSAA_4X_HINT,
    65536 => FLAG_INTERLACED_HINT,
    _ => throw ArgumentError('Unknown value for $ConfigFlags: $value'),
  };
}

/// `TraceLogLevel`
enum TraceLogLevel with XEnum {
  /// `LOG_ALL`
  LOG_ALL(0),
  /// `LOG_TRACE`
  LOG_TRACE(1),
  /// `LOG_DEBUG`
  LOG_DEBUG(2),
  /// `LOG_INFO`
  LOG_INFO(3),
  /// `LOG_WARNING`
  LOG_WARNING(4),
  /// `LOG_ERROR`
  LOG_ERROR(5),
  /// `LOG_FATAL`
  LOG_FATAL(6),
  /// `LOG_NONE`
  LOG_NONE(7);

  const TraceLogLevel(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [TraceLogLevel] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static TraceLogLevel fromValue(int value) => switch (value) {
    0 => LOG_ALL,
    1 => LOG_TRACE,
    2 => LOG_DEBUG,
    3 => LOG_INFO,
    4 => LOG_WARNING,
    5 => LOG_ERROR,
    6 => LOG_FATAL,
    7 => LOG_NONE,
    _ => throw ArgumentError('Unknown value for $TraceLogLevel: $value'),
  };
}

/// `KeyboardKey`
enum KeyboardKey with XEnum {
  /// `KEY_NULL`
  KEY_NULL(0),
  /// `KEY_APOSTROPHE`
  KEY_APOSTROPHE(39),
  /// `KEY_COMMA`
  KEY_COMMA(44),
  /// `KEY_MINUS`
  KEY_MINUS(45),
  /// `KEY_PERIOD`
  KEY_PERIOD(46),
  /// `KEY_SLASH`
  KEY_SLASH(47),
  /// `KEY_ZERO`
  KEY_ZERO(48),
  /// `KEY_ONE`
  KEY_ONE(49),
  /// `KEY_TWO`
  KEY_TWO(50),
  /// `KEY_THREE`
  KEY_THREE(51),
  /// `KEY_FOUR`
  KEY_FOUR(52),
  /// `KEY_FIVE`
  KEY_FIVE(53),
  /// `KEY_SIX`
  KEY_SIX(54),
  /// `KEY_SEVEN`
  KEY_SEVEN(55),
  /// `KEY_EIGHT`
  KEY_EIGHT(56),
  /// `KEY_NINE`
  KEY_NINE(57),
  /// `KEY_SEMICOLON`
  KEY_SEMICOLON(59),
  /// `KEY_EQUAL`
  KEY_EQUAL(61),
  /// `KEY_A`
  KEY_A(65),
  /// `KEY_B`
  KEY_B(66),
  /// `KEY_C`
  KEY_C(67),
  /// `KEY_D`
  KEY_D(68),
  /// `KEY_E`
  KEY_E(69),
  /// `KEY_F`
  KEY_F(70),
  /// `KEY_G`
  KEY_G(71),
  /// `KEY_H`
  KEY_H(72),
  /// `KEY_I`
  KEY_I(73),
  /// `KEY_J`
  KEY_J(74),
  /// `KEY_K`
  KEY_K(75),
  /// `KEY_L`
  KEY_L(76),
  /// `KEY_M`
  KEY_M(77),
  /// `KEY_N`
  KEY_N(78),
  /// `KEY_O`
  KEY_O(79),
  /// `KEY_P`
  KEY_P(80),
  /// `KEY_Q`
  KEY_Q(81),
  /// `KEY_R`
  KEY_R(82),
  /// `KEY_S`
  KEY_S(83),
  /// `KEY_T`
  KEY_T(84),
  /// `KEY_U`
  KEY_U(85),
  /// `KEY_V`
  KEY_V(86),
  /// `KEY_W`
  KEY_W(87),
  /// `KEY_X`
  KEY_X(88),
  /// `KEY_Y`
  KEY_Y(89),
  /// `KEY_Z`
  KEY_Z(90),
  /// `KEY_LEFT_BRACKET`
  KEY_LEFT_BRACKET(91),
  /// `KEY_BACKSLASH`
  KEY_BACKSLASH(92),
  /// `KEY_RIGHT_BRACKET`
  KEY_RIGHT_BRACKET(93),
  /// `KEY_GRAVE`
  KEY_GRAVE(96),
  /// `KEY_SPACE`
  KEY_SPACE(32),
  /// `KEY_ESCAPE`
  KEY_ESCAPE(256),
  /// `KEY_ENTER`
  KEY_ENTER(257),
  /// `KEY_TAB`
  KEY_TAB(258),
  /// `KEY_BACKSPACE`
  KEY_BACKSPACE(259),
  /// `KEY_INSERT`
  KEY_INSERT(260),
  /// `KEY_DELETE`
  KEY_DELETE(261),
  /// `KEY_RIGHT`
  KEY_RIGHT(262),
  /// `KEY_LEFT`
  KEY_LEFT(263),
  /// `KEY_DOWN`
  KEY_DOWN(264),
  /// `KEY_UP`
  KEY_UP(265),
  /// `KEY_PAGE_UP`
  KEY_PAGE_UP(266),
  /// `KEY_PAGE_DOWN`
  KEY_PAGE_DOWN(267),
  /// `KEY_HOME`
  KEY_HOME(268),
  /// `KEY_END`
  KEY_END(269),
  /// `KEY_CAPS_LOCK`
  KEY_CAPS_LOCK(280),
  /// `KEY_SCROLL_LOCK`
  KEY_SCROLL_LOCK(281),
  /// `KEY_NUM_LOCK`
  KEY_NUM_LOCK(282),
  /// `KEY_PRINT_SCREEN`
  KEY_PRINT_SCREEN(283),
  /// `KEY_PAUSE`
  KEY_PAUSE(284),
  /// `KEY_F1`
  KEY_F1(290),
  /// `KEY_F2`
  KEY_F2(291),
  /// `KEY_F3`
  KEY_F3(292),
  /// `KEY_F4`
  KEY_F4(293),
  /// `KEY_F5`
  KEY_F5(294),
  /// `KEY_F6`
  KEY_F6(295),
  /// `KEY_F7`
  KEY_F7(296),
  /// `KEY_F8`
  KEY_F8(297),
  /// `KEY_F9`
  KEY_F9(298),
  /// `KEY_F10`
  KEY_F10(299),
  /// `KEY_F11`
  KEY_F11(300),
  /// `KEY_F12`
  KEY_F12(301),
  /// `KEY_LEFT_SHIFT`
  KEY_LEFT_SHIFT(340),
  /// `KEY_LEFT_CONTROL`
  KEY_LEFT_CONTROL(341),
  /// `KEY_LEFT_ALT`
  KEY_LEFT_ALT(342),
  /// `KEY_LEFT_SUPER`
  KEY_LEFT_SUPER(343),
  /// `KEY_RIGHT_SHIFT`
  KEY_RIGHT_SHIFT(344),
  /// `KEY_RIGHT_CONTROL`
  KEY_RIGHT_CONTROL(345),
  /// `KEY_RIGHT_ALT`
  KEY_RIGHT_ALT(346),
  /// `KEY_RIGHT_SUPER`
  KEY_RIGHT_SUPER(347),
  /// `KEY_KB_MENU`
  KEY_KB_MENU(348),
  /// `KEY_KP_0`
  KEY_KP_0(320),
  /// `KEY_KP_1`
  KEY_KP_1(321),
  /// `KEY_KP_2`
  KEY_KP_2(322),
  /// `KEY_KP_3`
  KEY_KP_3(323),
  /// `KEY_KP_4`
  KEY_KP_4(324),
  /// `KEY_KP_5`
  KEY_KP_5(325),
  /// `KEY_KP_6`
  KEY_KP_6(326),
  /// `KEY_KP_7`
  KEY_KP_7(327),
  /// `KEY_KP_8`
  KEY_KP_8(328),
  /// `KEY_KP_9`
  KEY_KP_9(329),
  /// `KEY_KP_DECIMAL`
  KEY_KP_DECIMAL(330),
  /// `KEY_KP_DIVIDE`
  KEY_KP_DIVIDE(331),
  /// `KEY_KP_MULTIPLY`
  KEY_KP_MULTIPLY(332),
  /// `KEY_KP_SUBTRACT`
  KEY_KP_SUBTRACT(333),
  /// `KEY_KP_ADD`
  KEY_KP_ADD(334),
  /// `KEY_KP_ENTER`
  KEY_KP_ENTER(335),
  /// `KEY_KP_EQUAL`
  KEY_KP_EQUAL(336),
  /// `KEY_BACK`
  KEY_BACK(4),
  /// `KEY_MENU`
  KEY_MENU(5),
  /// `KEY_VOLUME_UP`
  KEY_VOLUME_UP(24),
  /// `KEY_VOLUME_DOWN`
  KEY_VOLUME_DOWN(25);

  const KeyboardKey(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [KeyboardKey] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static KeyboardKey fromValue(int value) => switch (value) {
    0 => KEY_NULL,
    39 => KEY_APOSTROPHE,
    44 => KEY_COMMA,
    45 => KEY_MINUS,
    46 => KEY_PERIOD,
    47 => KEY_SLASH,
    48 => KEY_ZERO,
    49 => KEY_ONE,
    50 => KEY_TWO,
    51 => KEY_THREE,
    52 => KEY_FOUR,
    53 => KEY_FIVE,
    54 => KEY_SIX,
    55 => KEY_SEVEN,
    56 => KEY_EIGHT,
    57 => KEY_NINE,
    59 => KEY_SEMICOLON,
    61 => KEY_EQUAL,
    65 => KEY_A,
    66 => KEY_B,
    67 => KEY_C,
    68 => KEY_D,
    69 => KEY_E,
    70 => KEY_F,
    71 => KEY_G,
    72 => KEY_H,
    73 => KEY_I,
    74 => KEY_J,
    75 => KEY_K,
    76 => KEY_L,
    77 => KEY_M,
    78 => KEY_N,
    79 => KEY_O,
    80 => KEY_P,
    81 => KEY_Q,
    82 => KEY_R,
    83 => KEY_S,
    84 => KEY_T,
    85 => KEY_U,
    86 => KEY_V,
    87 => KEY_W,
    88 => KEY_X,
    89 => KEY_Y,
    90 => KEY_Z,
    91 => KEY_LEFT_BRACKET,
    92 => KEY_BACKSLASH,
    93 => KEY_RIGHT_BRACKET,
    96 => KEY_GRAVE,
    32 => KEY_SPACE,
    256 => KEY_ESCAPE,
    257 => KEY_ENTER,
    258 => KEY_TAB,
    259 => KEY_BACKSPACE,
    260 => KEY_INSERT,
    261 => KEY_DELETE,
    262 => KEY_RIGHT,
    263 => KEY_LEFT,
    264 => KEY_DOWN,
    265 => KEY_UP,
    266 => KEY_PAGE_UP,
    267 => KEY_PAGE_DOWN,
    268 => KEY_HOME,
    269 => KEY_END,
    280 => KEY_CAPS_LOCK,
    281 => KEY_SCROLL_LOCK,
    282 => KEY_NUM_LOCK,
    283 => KEY_PRINT_SCREEN,
    284 => KEY_PAUSE,
    290 => KEY_F1,
    291 => KEY_F2,
    292 => KEY_F3,
    293 => KEY_F4,
    294 => KEY_F5,
    295 => KEY_F6,
    296 => KEY_F7,
    297 => KEY_F8,
    298 => KEY_F9,
    299 => KEY_F10,
    300 => KEY_F11,
    301 => KEY_F12,
    340 => KEY_LEFT_SHIFT,
    341 => KEY_LEFT_CONTROL,
    342 => KEY_LEFT_ALT,
    343 => KEY_LEFT_SUPER,
    344 => KEY_RIGHT_SHIFT,
    345 => KEY_RIGHT_CONTROL,
    346 => KEY_RIGHT_ALT,
    347 => KEY_RIGHT_SUPER,
    348 => KEY_KB_MENU,
    320 => KEY_KP_0,
    321 => KEY_KP_1,
    322 => KEY_KP_2,
    323 => KEY_KP_3,
    324 => KEY_KP_4,
    325 => KEY_KP_5,
    326 => KEY_KP_6,
    327 => KEY_KP_7,
    328 => KEY_KP_8,
    329 => KEY_KP_9,
    330 => KEY_KP_DECIMAL,
    331 => KEY_KP_DIVIDE,
    332 => KEY_KP_MULTIPLY,
    333 => KEY_KP_SUBTRACT,
    334 => KEY_KP_ADD,
    335 => KEY_KP_ENTER,
    336 => KEY_KP_EQUAL,
    4 => KEY_BACK,
    5 => KEY_MENU,
    24 => KEY_VOLUME_UP,
    25 => KEY_VOLUME_DOWN,
    _ => throw ArgumentError('Unknown value for $KeyboardKey: $value'),
  };
}

/// `MouseButton`
enum MouseButton with XEnum {
  /// `MOUSE_BUTTON_LEFT`
  MOUSE_BUTTON_LEFT(0),
  /// `MOUSE_BUTTON_RIGHT`
  MOUSE_BUTTON_RIGHT(1),
  /// `MOUSE_BUTTON_MIDDLE`
  MOUSE_BUTTON_MIDDLE(2),
  /// `MOUSE_BUTTON_SIDE`
  MOUSE_BUTTON_SIDE(3),
  /// `MOUSE_BUTTON_EXTRA`
  MOUSE_BUTTON_EXTRA(4),
  /// `MOUSE_BUTTON_FORWARD`
  MOUSE_BUTTON_FORWARD(5),
  /// `MOUSE_BUTTON_BACK`
  MOUSE_BUTTON_BACK(6);

  const MouseButton(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [MouseButton] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static MouseButton fromValue(int value) => switch (value) {
    0 => MOUSE_BUTTON_LEFT,
    1 => MOUSE_BUTTON_RIGHT,
    2 => MOUSE_BUTTON_MIDDLE,
    3 => MOUSE_BUTTON_SIDE,
    4 => MOUSE_BUTTON_EXTRA,
    5 => MOUSE_BUTTON_FORWARD,
    6 => MOUSE_BUTTON_BACK,
    _ => throw ArgumentError('Unknown value for $MouseButton: $value'),
  };
}

/// `MouseCursor`
enum MouseCursor with XEnum {
  /// `MOUSE_CURSOR_DEFAULT`
  MOUSE_CURSOR_DEFAULT(0),
  /// `MOUSE_CURSOR_ARROW`
  MOUSE_CURSOR_ARROW(1),
  /// `MOUSE_CURSOR_IBEAM`
  MOUSE_CURSOR_IBEAM(2),
  /// `MOUSE_CURSOR_CROSSHAIR`
  MOUSE_CURSOR_CROSSHAIR(3),
  /// `MOUSE_CURSOR_POINTING_HAND`
  MOUSE_CURSOR_POINTING_HAND(4),
  /// `MOUSE_CURSOR_RESIZE_EW`
  MOUSE_CURSOR_RESIZE_EW(5),
  /// `MOUSE_CURSOR_RESIZE_NS`
  MOUSE_CURSOR_RESIZE_NS(6),
  /// `MOUSE_CURSOR_RESIZE_NWSE`
  MOUSE_CURSOR_RESIZE_NWSE(7),
  /// `MOUSE_CURSOR_RESIZE_NESW`
  MOUSE_CURSOR_RESIZE_NESW(8),
  /// `MOUSE_CURSOR_RESIZE_ALL`
  MOUSE_CURSOR_RESIZE_ALL(9),
  /// `MOUSE_CURSOR_NOT_ALLOWED`
  MOUSE_CURSOR_NOT_ALLOWED(10);

  const MouseCursor(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [MouseCursor] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static MouseCursor fromValue(int value) => switch (value) {
    0 => MOUSE_CURSOR_DEFAULT,
    1 => MOUSE_CURSOR_ARROW,
    2 => MOUSE_CURSOR_IBEAM,
    3 => MOUSE_CURSOR_CROSSHAIR,
    4 => MOUSE_CURSOR_POINTING_HAND,
    5 => MOUSE_CURSOR_RESIZE_EW,
    6 => MOUSE_CURSOR_RESIZE_NS,
    7 => MOUSE_CURSOR_RESIZE_NWSE,
    8 => MOUSE_CURSOR_RESIZE_NESW,
    9 => MOUSE_CURSOR_RESIZE_ALL,
    10 => MOUSE_CURSOR_NOT_ALLOWED,
    _ => throw ArgumentError('Unknown value for $MouseCursor: $value'),
  };
}

/// `GamepadButton`
enum GamepadButton with XEnum {
  /// `GAMEPAD_BUTTON_UNKNOWN`
  GAMEPAD_BUTTON_UNKNOWN(0),
  /// `GAMEPAD_BUTTON_LEFT_FACE_UP`
  GAMEPAD_BUTTON_LEFT_FACE_UP(1),
  /// `GAMEPAD_BUTTON_LEFT_FACE_RIGHT`
  GAMEPAD_BUTTON_LEFT_FACE_RIGHT(2),
  /// `GAMEPAD_BUTTON_LEFT_FACE_DOWN`
  GAMEPAD_BUTTON_LEFT_FACE_DOWN(3),
  /// `GAMEPAD_BUTTON_LEFT_FACE_LEFT`
  GAMEPAD_BUTTON_LEFT_FACE_LEFT(4),
  /// `GAMEPAD_BUTTON_RIGHT_FACE_UP`
  GAMEPAD_BUTTON_RIGHT_FACE_UP(5),
  /// `GAMEPAD_BUTTON_RIGHT_FACE_RIGHT`
  GAMEPAD_BUTTON_RIGHT_FACE_RIGHT(6),
  /// `GAMEPAD_BUTTON_RIGHT_FACE_DOWN`
  GAMEPAD_BUTTON_RIGHT_FACE_DOWN(7),
  /// `GAMEPAD_BUTTON_RIGHT_FACE_LEFT`
  GAMEPAD_BUTTON_RIGHT_FACE_LEFT(8),
  /// `GAMEPAD_BUTTON_LEFT_TRIGGER_1`
  GAMEPAD_BUTTON_LEFT_TRIGGER_1(9),
  /// `GAMEPAD_BUTTON_LEFT_TRIGGER_2`
  GAMEPAD_BUTTON_LEFT_TRIGGER_2(10),
  /// `GAMEPAD_BUTTON_RIGHT_TRIGGER_1`
  GAMEPAD_BUTTON_RIGHT_TRIGGER_1(11),
  /// `GAMEPAD_BUTTON_RIGHT_TRIGGER_2`
  GAMEPAD_BUTTON_RIGHT_TRIGGER_2(12),
  /// `GAMEPAD_BUTTON_MIDDLE_LEFT`
  GAMEPAD_BUTTON_MIDDLE_LEFT(13),
  /// `GAMEPAD_BUTTON_MIDDLE`
  GAMEPAD_BUTTON_MIDDLE(14),
  /// `GAMEPAD_BUTTON_MIDDLE_RIGHT`
  GAMEPAD_BUTTON_MIDDLE_RIGHT(15),
  /// `GAMEPAD_BUTTON_LEFT_THUMB`
  GAMEPAD_BUTTON_LEFT_THUMB(16),
  /// `GAMEPAD_BUTTON_RIGHT_THUMB`
  GAMEPAD_BUTTON_RIGHT_THUMB(17);

  const GamepadButton(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GamepadButton] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GamepadButton fromValue(int value) => switch (value) {
    0 => GAMEPAD_BUTTON_UNKNOWN,
    1 => GAMEPAD_BUTTON_LEFT_FACE_UP,
    2 => GAMEPAD_BUTTON_LEFT_FACE_RIGHT,
    3 => GAMEPAD_BUTTON_LEFT_FACE_DOWN,
    4 => GAMEPAD_BUTTON_LEFT_FACE_LEFT,
    5 => GAMEPAD_BUTTON_RIGHT_FACE_UP,
    6 => GAMEPAD_BUTTON_RIGHT_FACE_RIGHT,
    7 => GAMEPAD_BUTTON_RIGHT_FACE_DOWN,
    8 => GAMEPAD_BUTTON_RIGHT_FACE_LEFT,
    9 => GAMEPAD_BUTTON_LEFT_TRIGGER_1,
    10 => GAMEPAD_BUTTON_LEFT_TRIGGER_2,
    11 => GAMEPAD_BUTTON_RIGHT_TRIGGER_1,
    12 => GAMEPAD_BUTTON_RIGHT_TRIGGER_2,
    13 => GAMEPAD_BUTTON_MIDDLE_LEFT,
    14 => GAMEPAD_BUTTON_MIDDLE,
    15 => GAMEPAD_BUTTON_MIDDLE_RIGHT,
    16 => GAMEPAD_BUTTON_LEFT_THUMB,
    17 => GAMEPAD_BUTTON_RIGHT_THUMB,
    _ => throw ArgumentError('Unknown value for $GamepadButton: $value'),
  };
}

/// `GamepadAxis`
enum GamepadAxis with XEnum {
  /// `GAMEPAD_AXIS_LEFT_X`
  GAMEPAD_AXIS_LEFT_X(0),
  /// `GAMEPAD_AXIS_LEFT_Y`
  GAMEPAD_AXIS_LEFT_Y(1),
  /// `GAMEPAD_AXIS_RIGHT_X`
  GAMEPAD_AXIS_RIGHT_X(2),
  /// `GAMEPAD_AXIS_RIGHT_Y`
  GAMEPAD_AXIS_RIGHT_Y(3),
  /// `GAMEPAD_AXIS_LEFT_TRIGGER`
  GAMEPAD_AXIS_LEFT_TRIGGER(4),
  /// `GAMEPAD_AXIS_RIGHT_TRIGGER`
  GAMEPAD_AXIS_RIGHT_TRIGGER(5);

  const GamepadAxis(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GamepadAxis] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GamepadAxis fromValue(int value) => switch (value) {
    0 => GAMEPAD_AXIS_LEFT_X,
    1 => GAMEPAD_AXIS_LEFT_Y,
    2 => GAMEPAD_AXIS_RIGHT_X,
    3 => GAMEPAD_AXIS_RIGHT_Y,
    4 => GAMEPAD_AXIS_LEFT_TRIGGER,
    5 => GAMEPAD_AXIS_RIGHT_TRIGGER,
    _ => throw ArgumentError('Unknown value for $GamepadAxis: $value'),
  };
}

/// `MaterialMapIndex`
enum MaterialMapIndex with XEnum {
  /// `MATERIAL_MAP_ALBEDO`
  MATERIAL_MAP_ALBEDO(0),
  /// `MATERIAL_MAP_METALNESS`
  MATERIAL_MAP_METALNESS(1),
  /// `MATERIAL_MAP_NORMAL`
  MATERIAL_MAP_NORMAL(2),
  /// `MATERIAL_MAP_ROUGHNESS`
  MATERIAL_MAP_ROUGHNESS(3),
  /// `MATERIAL_MAP_OCCLUSION`
  MATERIAL_MAP_OCCLUSION(4),
  /// `MATERIAL_MAP_EMISSION`
  MATERIAL_MAP_EMISSION(5),
  /// `MATERIAL_MAP_HEIGHT`
  MATERIAL_MAP_HEIGHT(6),
  /// `MATERIAL_MAP_CUBEMAP`
  MATERIAL_MAP_CUBEMAP(7),
  /// `MATERIAL_MAP_IRRADIANCE`
  MATERIAL_MAP_IRRADIANCE(8),
  /// `MATERIAL_MAP_PREFILTER`
  MATERIAL_MAP_PREFILTER(9),
  /// `MATERIAL_MAP_BRDF`
  MATERIAL_MAP_BRDF(10);

  const MaterialMapIndex(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [MaterialMapIndex] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static MaterialMapIndex fromValue(int value) => switch (value) {
    0 => MATERIAL_MAP_ALBEDO,
    1 => MATERIAL_MAP_METALNESS,
    2 => MATERIAL_MAP_NORMAL,
    3 => MATERIAL_MAP_ROUGHNESS,
    4 => MATERIAL_MAP_OCCLUSION,
    5 => MATERIAL_MAP_EMISSION,
    6 => MATERIAL_MAP_HEIGHT,
    7 => MATERIAL_MAP_CUBEMAP,
    8 => MATERIAL_MAP_IRRADIANCE,
    9 => MATERIAL_MAP_PREFILTER,
    10 => MATERIAL_MAP_BRDF,
    _ => throw ArgumentError('Unknown value for $MaterialMapIndex: $value'),
  };
}

/// `ShaderLocationIndex`
enum ShaderLocationIndex with XEnum {
  /// `SHADER_LOC_VERTEX_POSITION`
  SHADER_LOC_VERTEX_POSITION(0),
  /// `SHADER_LOC_VERTEX_TEXCOORD01`
  SHADER_LOC_VERTEX_TEXCOORD01(1),
  /// `SHADER_LOC_VERTEX_TEXCOORD02`
  SHADER_LOC_VERTEX_TEXCOORD02(2),
  /// `SHADER_LOC_VERTEX_NORMAL`
  SHADER_LOC_VERTEX_NORMAL(3),
  /// `SHADER_LOC_VERTEX_TANGENT`
  SHADER_LOC_VERTEX_TANGENT(4),
  /// `SHADER_LOC_VERTEX_COLOR`
  SHADER_LOC_VERTEX_COLOR(5),
  /// `SHADER_LOC_MATRIX_MVP`
  SHADER_LOC_MATRIX_MVP(6),
  /// `SHADER_LOC_MATRIX_VIEW`
  SHADER_LOC_MATRIX_VIEW(7),
  /// `SHADER_LOC_MATRIX_PROJECTION`
  SHADER_LOC_MATRIX_PROJECTION(8),
  /// `SHADER_LOC_MATRIX_MODEL`
  SHADER_LOC_MATRIX_MODEL(9),
  /// `SHADER_LOC_MATRIX_NORMAL`
  SHADER_LOC_MATRIX_NORMAL(10),
  /// `SHADER_LOC_VECTOR_VIEW`
  SHADER_LOC_VECTOR_VIEW(11),
  /// `SHADER_LOC_COLOR_DIFFUSE`
  SHADER_LOC_COLOR_DIFFUSE(12),
  /// `SHADER_LOC_COLOR_SPECULAR`
  SHADER_LOC_COLOR_SPECULAR(13),
  /// `SHADER_LOC_COLOR_AMBIENT`
  SHADER_LOC_COLOR_AMBIENT(14),
  /// `SHADER_LOC_MAP_ALBEDO`
  SHADER_LOC_MAP_ALBEDO(15),
  /// `SHADER_LOC_MAP_METALNESS`
  SHADER_LOC_MAP_METALNESS(16),
  /// `SHADER_LOC_MAP_NORMAL`
  SHADER_LOC_MAP_NORMAL(17),
  /// `SHADER_LOC_MAP_ROUGHNESS`
  SHADER_LOC_MAP_ROUGHNESS(18),
  /// `SHADER_LOC_MAP_OCCLUSION`
  SHADER_LOC_MAP_OCCLUSION(19),
  /// `SHADER_LOC_MAP_EMISSION`
  SHADER_LOC_MAP_EMISSION(20),
  /// `SHADER_LOC_MAP_HEIGHT`
  SHADER_LOC_MAP_HEIGHT(21),
  /// `SHADER_LOC_MAP_CUBEMAP`
  SHADER_LOC_MAP_CUBEMAP(22),
  /// `SHADER_LOC_MAP_IRRADIANCE`
  SHADER_LOC_MAP_IRRADIANCE(23),
  /// `SHADER_LOC_MAP_PREFILTER`
  SHADER_LOC_MAP_PREFILTER(24),
  /// `SHADER_LOC_MAP_BRDF`
  SHADER_LOC_MAP_BRDF(25),
  /// `SHADER_LOC_VERTEX_BONEIDS`
  SHADER_LOC_VERTEX_BONEIDS(26),
  /// `SHADER_LOC_VERTEX_BONEWEIGHTS`
  SHADER_LOC_VERTEX_BONEWEIGHTS(27),
  /// `SHADER_LOC_MATRIX_BONETRANSFORMS`
  SHADER_LOC_MATRIX_BONETRANSFORMS(28),
  /// `SHADER_LOC_VERTEX_INSTANCETRANSFORM`
  SHADER_LOC_VERTEX_INSTANCETRANSFORM(29);

  const ShaderLocationIndex(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [ShaderLocationIndex] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static ShaderLocationIndex fromValue(int value) => switch (value) {
    0 => SHADER_LOC_VERTEX_POSITION,
    1 => SHADER_LOC_VERTEX_TEXCOORD01,
    2 => SHADER_LOC_VERTEX_TEXCOORD02,
    3 => SHADER_LOC_VERTEX_NORMAL,
    4 => SHADER_LOC_VERTEX_TANGENT,
    5 => SHADER_LOC_VERTEX_COLOR,
    6 => SHADER_LOC_MATRIX_MVP,
    7 => SHADER_LOC_MATRIX_VIEW,
    8 => SHADER_LOC_MATRIX_PROJECTION,
    9 => SHADER_LOC_MATRIX_MODEL,
    10 => SHADER_LOC_MATRIX_NORMAL,
    11 => SHADER_LOC_VECTOR_VIEW,
    12 => SHADER_LOC_COLOR_DIFFUSE,
    13 => SHADER_LOC_COLOR_SPECULAR,
    14 => SHADER_LOC_COLOR_AMBIENT,
    15 => SHADER_LOC_MAP_ALBEDO,
    16 => SHADER_LOC_MAP_METALNESS,
    17 => SHADER_LOC_MAP_NORMAL,
    18 => SHADER_LOC_MAP_ROUGHNESS,
    19 => SHADER_LOC_MAP_OCCLUSION,
    20 => SHADER_LOC_MAP_EMISSION,
    21 => SHADER_LOC_MAP_HEIGHT,
    22 => SHADER_LOC_MAP_CUBEMAP,
    23 => SHADER_LOC_MAP_IRRADIANCE,
    24 => SHADER_LOC_MAP_PREFILTER,
    25 => SHADER_LOC_MAP_BRDF,
    26 => SHADER_LOC_VERTEX_BONEIDS,
    27 => SHADER_LOC_VERTEX_BONEWEIGHTS,
    28 => SHADER_LOC_MATRIX_BONETRANSFORMS,
    29 => SHADER_LOC_VERTEX_INSTANCETRANSFORM,
    _ => throw ArgumentError('Unknown value for $ShaderLocationIndex: $value'),
  };
}

/// `ShaderUniformDataType`
enum ShaderUniformDataType with XEnum {
  /// `SHADER_UNIFORM_FLOAT`
  SHADER_UNIFORM_FLOAT(0),
  /// `SHADER_UNIFORM_VEC2`
  SHADER_UNIFORM_VEC2(1),
  /// `SHADER_UNIFORM_VEC3`
  SHADER_UNIFORM_VEC3(2),
  /// `SHADER_UNIFORM_VEC4`
  SHADER_UNIFORM_VEC4(3),
  /// `SHADER_UNIFORM_INT`
  SHADER_UNIFORM_INT(4),
  /// `SHADER_UNIFORM_IVEC2`
  SHADER_UNIFORM_IVEC2(5),
  /// `SHADER_UNIFORM_IVEC3`
  SHADER_UNIFORM_IVEC3(6),
  /// `SHADER_UNIFORM_IVEC4`
  SHADER_UNIFORM_IVEC4(7),
  /// `SHADER_UNIFORM_UINT`
  SHADER_UNIFORM_UINT(8),
  /// `SHADER_UNIFORM_UIVEC2`
  SHADER_UNIFORM_UIVEC2(9),
  /// `SHADER_UNIFORM_UIVEC3`
  SHADER_UNIFORM_UIVEC3(10),
  /// `SHADER_UNIFORM_UIVEC4`
  SHADER_UNIFORM_UIVEC4(11),
  /// `SHADER_UNIFORM_SAMPLER2D`
  SHADER_UNIFORM_SAMPLER2D(12);

  const ShaderUniformDataType(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [ShaderUniformDataType] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static ShaderUniformDataType fromValue(int value) => switch (value) {
    0 => SHADER_UNIFORM_FLOAT,
    1 => SHADER_UNIFORM_VEC2,
    2 => SHADER_UNIFORM_VEC3,
    3 => SHADER_UNIFORM_VEC4,
    4 => SHADER_UNIFORM_INT,
    5 => SHADER_UNIFORM_IVEC2,
    6 => SHADER_UNIFORM_IVEC3,
    7 => SHADER_UNIFORM_IVEC4,
    8 => SHADER_UNIFORM_UINT,
    9 => SHADER_UNIFORM_UIVEC2,
    10 => SHADER_UNIFORM_UIVEC3,
    11 => SHADER_UNIFORM_UIVEC4,
    12 => SHADER_UNIFORM_SAMPLER2D,
    _ => throw ArgumentError('Unknown value for $ShaderUniformDataType: $value'),
  };
}

/// `PixelFormat`
enum PixelFormat with XEnum {
  /// `PIXELFORMAT_NONE` (for uninitialized [Texture] and [Image] slots only)
  PIXELFORMAT_NONE(0),
  /// `PIXELFORMAT_UNCOMPRESSED_GRAYSCALE`
  PIXELFORMAT_UNCOMPRESSED_GRAYSCALE(1),
  /// `PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA`
  PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA(2),
  /// `PIXELFORMAT_UNCOMPRESSED_R5G6B5`
  PIXELFORMAT_UNCOMPRESSED_R5G6B5(3),
  /// `PIXELFORMAT_UNCOMPRESSED_R8G8B8`
  PIXELFORMAT_UNCOMPRESSED_R8G8B8(4),
  /// `PIXELFORMAT_UNCOMPRESSED_R5G5B5A1`
  PIXELFORMAT_UNCOMPRESSED_R5G5B5A1(5),
  /// `PIXELFORMAT_UNCOMPRESSED_R4G4B4A4`
  PIXELFORMAT_UNCOMPRESSED_R4G4B4A4(6),
  /// `PIXELFORMAT_UNCOMPRESSED_R8G8B8A8`
  PIXELFORMAT_UNCOMPRESSED_R8G8B8A8(7),
  /// `PIXELFORMAT_UNCOMPRESSED_R32`
  PIXELFORMAT_UNCOMPRESSED_R32(8),
  /// `PIXELFORMAT_UNCOMPRESSED_R32G32B32`
  PIXELFORMAT_UNCOMPRESSED_R32G32B32(9),
  /// `PIXELFORMAT_UNCOMPRESSED_R32G32B32A32`
  PIXELFORMAT_UNCOMPRESSED_R32G32B32A32(10),
  /// `PIXELFORMAT_UNCOMPRESSED_R16`
  PIXELFORMAT_UNCOMPRESSED_R16(11),
  /// `PIXELFORMAT_UNCOMPRESSED_R16G16B16`
  PIXELFORMAT_UNCOMPRESSED_R16G16B16(12),
  /// `PIXELFORMAT_UNCOMPRESSED_R16G16B16A16`
  PIXELFORMAT_UNCOMPRESSED_R16G16B16A16(13),
  /// `PIXELFORMAT_COMPRESSED_DXT1_RGB`
  PIXELFORMAT_COMPRESSED_DXT1_RGB(14),
  /// `PIXELFORMAT_COMPRESSED_DXT1_RGBA`
  PIXELFORMAT_COMPRESSED_DXT1_RGBA(15),
  /// `PIXELFORMAT_COMPRESSED_DXT3_RGBA`
  PIXELFORMAT_COMPRESSED_DXT3_RGBA(16),
  /// `PIXELFORMAT_COMPRESSED_DXT5_RGBA`
  PIXELFORMAT_COMPRESSED_DXT5_RGBA(17),
  /// `PIXELFORMAT_COMPRESSED_ETC1_RGB`
  PIXELFORMAT_COMPRESSED_ETC1_RGB(18),
  /// `PIXELFORMAT_COMPRESSED_ETC2_RGB`
  PIXELFORMAT_COMPRESSED_ETC2_RGB(19),
  /// `PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA`
  PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA(20),
  /// `PIXELFORMAT_COMPRESSED_PVRT_RGB`
  PIXELFORMAT_COMPRESSED_PVRT_RGB(21),
  /// `PIXELFORMAT_COMPRESSED_PVRT_RGBA`
  PIXELFORMAT_COMPRESSED_PVRT_RGBA(22),
  /// `PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA`
  PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA(23),
  /// `PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA`
  PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA(24);

  const PixelFormat(this.value);
  
  @override
  final int value;

  /// Returns the [PixelFormat] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static PixelFormat fromValue(int value) => switch (value) {
    0 => PIXELFORMAT_NONE,
    1 => PIXELFORMAT_UNCOMPRESSED_GRAYSCALE,
    2 => PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA,
    3 => PIXELFORMAT_UNCOMPRESSED_R5G6B5,
    4 => PIXELFORMAT_UNCOMPRESSED_R8G8B8,
    5 => PIXELFORMAT_UNCOMPRESSED_R5G5B5A1,
    6 => PIXELFORMAT_UNCOMPRESSED_R4G4B4A4,
    7 => PIXELFORMAT_UNCOMPRESSED_R8G8B8A8,
    8 => PIXELFORMAT_UNCOMPRESSED_R32,
    9 => PIXELFORMAT_UNCOMPRESSED_R32G32B32,
    10 => PIXELFORMAT_UNCOMPRESSED_R32G32B32A32,
    11 => PIXELFORMAT_UNCOMPRESSED_R16,
    12 => PIXELFORMAT_UNCOMPRESSED_R16G16B16,
    13 => PIXELFORMAT_UNCOMPRESSED_R16G16B16A16,
    14 => PIXELFORMAT_COMPRESSED_DXT1_RGB,
    15 => PIXELFORMAT_COMPRESSED_DXT1_RGBA,
    16 => PIXELFORMAT_COMPRESSED_DXT3_RGBA,
    17 => PIXELFORMAT_COMPRESSED_DXT5_RGBA,
    18 => PIXELFORMAT_COMPRESSED_ETC1_RGB,
    19 => PIXELFORMAT_COMPRESSED_ETC2_RGB,
    20 => PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA,
    21 => PIXELFORMAT_COMPRESSED_PVRT_RGB,
    22 => PIXELFORMAT_COMPRESSED_PVRT_RGBA,
    23 => PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA,
    24 => PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA,
    _ => throw ArgumentError('Unknown value for $PixelFormat: $value'),
  };
}

/// `TextureFilter`
enum TextureFilter with XEnum {
  /// `TEXTURE_FILTER_POINT`
  TEXTURE_FILTER_POINT(0),
  /// `TEXTURE_FILTER_BILINEAR`
  TEXTURE_FILTER_BILINEAR(1),
  /// `TEXTURE_FILTER_TRILINEAR`
  TEXTURE_FILTER_TRILINEAR(2),
  /// `TEXTURE_FILTER_ANISOTROPIC_4X`
  TEXTURE_FILTER_ANISOTROPIC_4X(3),
  /// `TEXTURE_FILTER_ANISOTROPIC_8X`
  TEXTURE_FILTER_ANISOTROPIC_8X(4),
  /// `TEXTURE_FILTER_ANISOTROPIC_16X`
  TEXTURE_FILTER_ANISOTROPIC_16X(5);

  const TextureFilter(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [TextureFilter] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static TextureFilter fromValue(int value) => switch (value) {
    0 => TEXTURE_FILTER_POINT,
    1 => TEXTURE_FILTER_BILINEAR,
    2 => TEXTURE_FILTER_TRILINEAR,
    3 => TEXTURE_FILTER_ANISOTROPIC_4X,
    4 => TEXTURE_FILTER_ANISOTROPIC_8X,
    5 => TEXTURE_FILTER_ANISOTROPIC_16X,
    _ => throw ArgumentError('Unknown value for $TextureFilter: $value'),
  };
}

/// `TextureWrap`
enum TextureWrap with XEnum {
  /// `TEXTURE_WRAP_REPEAT`
  TEXTURE_WRAP_REPEAT(0),
  /// `TEXTURE_WRAP_CLAMP`
  TEXTURE_WRAP_CLAMP(1),
  /// `TEXTURE_WRAP_MIRROR_REPEAT`
  TEXTURE_WRAP_MIRROR_REPEAT(2),
  /// `TEXTURE_WRAP_MIRROR_CLAMP`
  TEXTURE_WRAP_MIRROR_CLAMP(3);

  const TextureWrap(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [TextureWrap] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static TextureWrap fromValue(int value) => switch (value) {
    0 => TEXTURE_WRAP_REPEAT,
    1 => TEXTURE_WRAP_CLAMP,
    2 => TEXTURE_WRAP_MIRROR_REPEAT,
    3 => TEXTURE_WRAP_MIRROR_CLAMP,
    _ => throw ArgumentError('Unknown value for $TextureWrap: $value'),
  };
}

/// `CubemapLayout`
enum CubemapLayout with XEnum {
  /// `CUBEMAP_LAYOUT_AUTO_DETECT`
  CUBEMAP_LAYOUT_AUTO_DETECT(0),
  /// `CUBEMAP_LAYOUT_LINE_VERTICAL`
  CUBEMAP_LAYOUT_LINE_VERTICAL(1),
  /// `CUBEMAP_LAYOUT_LINE_HORIZONTAL`
  CUBEMAP_LAYOUT_LINE_HORIZONTAL(2),
  /// `CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR`
  CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR(3),
  /// `CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE`
  CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE(4);

  const CubemapLayout(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [CubemapLayout] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static CubemapLayout fromValue(int value) => switch (value) {
    0 => CUBEMAP_LAYOUT_AUTO_DETECT,
    1 => CUBEMAP_LAYOUT_LINE_VERTICAL,
    2 => CUBEMAP_LAYOUT_LINE_HORIZONTAL,
    3 => CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR,
    4 => CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE,
    _ => throw ArgumentError('Unknown value for $CubemapLayout: $value'),
  };
}

/// `FontType`
enum FontType with XEnum {
  /// `FONT_DEFAULT`
  FONT_DEFAULT(0),
  /// `FONT_BITMAP`
  FONT_BITMAP(1),
  /// `FONT_SDF`
  FONT_SDF(2);

  const FontType(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [FontType] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static FontType fromValue(int value) => switch (value) {
    0 => FONT_DEFAULT,
    1 => FONT_BITMAP,
    2 => FONT_SDF,
    _ => throw ArgumentError('Unknown value for $FontType: $value'),
  };
}

/// `BlendMode`
enum BlendMode with XEnum {
  /// `BLEND_ALPHA`
  BLEND_ALPHA(0),
  /// `BLEND_ADDITIVE`
  BLEND_ADDITIVE(1),
  /// `BLEND_MULTIPLIED`
  BLEND_MULTIPLIED(2),
  /// `BLEND_ADD_COLORS`
  BLEND_ADD_COLORS(3),
  /// `BLEND_SUBTRACT_COLORS`
  BLEND_SUBTRACT_COLORS(4),
  /// `BLEND_ALPHA_PREMULTIPLY`
  BLEND_ALPHA_PREMULTIPLY(5),
  /// `BLEND_CUSTOM`
  BLEND_CUSTOM(6),
  /// `BLEND_CUSTOM_SEPARATE`
  BLEND_CUSTOM_SEPARATE(7);

  const BlendMode(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [BlendMode] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static BlendMode fromValue(int value) => switch (value) {
    0 => BLEND_ALPHA,
    1 => BLEND_ADDITIVE,
    2 => BLEND_MULTIPLIED,
    3 => BLEND_ADD_COLORS,
    4 => BLEND_SUBTRACT_COLORS,
    5 => BLEND_ALPHA_PREMULTIPLY,
    6 => BLEND_CUSTOM,
    7 => BLEND_CUSTOM_SEPARATE,
    _ => throw ArgumentError('Unknown value for $BlendMode: $value'),
  };
}

/// `Gesture`
enum Gesture with XEnum {
  /// `GESTURE_NONE`
  GESTURE_NONE(0),
  /// `GESTURE_TAP`
  GESTURE_TAP(1),
  /// `GESTURE_DOUBLETAP`
  GESTURE_DOUBLETAP(2),
  /// `GESTURE_HOLD`
  GESTURE_HOLD(4),
  /// `GESTURE_DRAG`
  GESTURE_DRAG(8),
  /// `GESTURE_SWIPE_RIGHT`
  GESTURE_SWIPE_RIGHT(16),
  /// `GESTURE_SWIPE_LEFT`
  GESTURE_SWIPE_LEFT(32),
  /// `GESTURE_SWIPE_UP`
  GESTURE_SWIPE_UP(64),
  /// `GESTURE_SWIPE_DOWN`
  GESTURE_SWIPE_DOWN(128),
  /// `GESTURE_PINCH_IN`
  GESTURE_PINCH_IN(256),
  /// `GESTURE_PINCH_OUT`
  GESTURE_PINCH_OUT(512);

  const Gesture(this.value);

  @override
  final int value;

  /// Returns the [Gesture] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static Gesture fromValue(int value) => switch (value) {
    0 => GESTURE_NONE,
    1 => GESTURE_TAP,
    2 => GESTURE_DOUBLETAP,
    4 => GESTURE_HOLD,
    8 => GESTURE_DRAG,
    16 => GESTURE_SWIPE_RIGHT,
    32 => GESTURE_SWIPE_LEFT,
    64 => GESTURE_SWIPE_UP,
    128 => GESTURE_SWIPE_DOWN,
    256 => GESTURE_PINCH_IN,
    512 => GESTURE_PINCH_OUT,
    _ => throw ArgumentError('Unknown value for $Gesture: $value'),
  };
}

/// `CameraMode`
enum CameraMode with XEnum {
  /// `CAMERA_CUSTOM`
  CAMERA_CUSTOM(0),
  /// `CAMERA_FREE`
  CAMERA_FREE(1),
  /// `CAMERA_ORBITAL`
  CAMERA_ORBITAL(2),
  /// `CAMERA_FIRST_PERSON`
  CAMERA_FIRST_PERSON(3),
  /// `CAMERA_THIRD_PERSON`
  CAMERA_THIRD_PERSON(4);

  const CameraMode(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [CameraMode] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static CameraMode fromValue(int value) => switch (value) {
    0 => CAMERA_CUSTOM,
    1 => CAMERA_FREE,
    2 => CAMERA_ORBITAL,
    3 => CAMERA_FIRST_PERSON,
    4 => CAMERA_THIRD_PERSON,
    _ => throw ArgumentError('Unknown value for $CameraMode: $value'),
  };
}

/// `CameraProjection`
enum CameraProjection with XEnum {
  /// `CAMERA_PERSPECTIVE`
  CAMERA_PERSPECTIVE(0),
  /// `CAMERA_ORTHOGRAPHIC`
  CAMERA_ORTHOGRAPHIC(1);

  const CameraProjection(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [CameraProjection] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static CameraProjection fromValue(int value) => switch (value) {
    0 => CAMERA_PERSPECTIVE,
    1 => CAMERA_ORTHOGRAPHIC,
    _ => throw ArgumentError('Unknown value for $CameraProjection: $value'),
  };
}

/// `NPatchLayout`
enum NPatchLayout with XEnum {
  /// `NPATCH_NINE_PATCH`
  NPATCH_NINE_PATCH(0),
  /// `NPATCH_THREE_PATCH_VERTICAL`
  NPATCH_THREE_PATCH_VERTICAL(1),
  /// `NPATCH_THREE_PATCH_HORIZONTAL`
  NPATCH_THREE_PATCH_HORIZONTAL(2);

  const NPatchLayout(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [NPatchLayout] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static NPatchLayout fromValue(int value) => switch (value) {
    0 => NPATCH_NINE_PATCH,
    1 => NPATCH_THREE_PATCH_VERTICAL,
    2 => NPATCH_THREE_PATCH_HORIZONTAL,
    _ => throw ArgumentError('Unknown value for $NPatchLayout: $value'),
  };
}

/// `AutomationEventType`
enum AutomationEventType with XEnum {
  /// `EVENT_NONE`
  EVENT_NONE(0),

  // Input events

  /// `INPUT_KEY_UP`, param[0]: key
  INPUT_KEY_UP(1),
  /// `INPUT_KEY_DOWN`, param[0]: key
  INPUT_KEY_DOWN(2),
  /// `INPUT_KEY_PRESSED`, param[0]: key
  INPUT_KEY_PRESSED(3),
  /// `INPUT_KEY_RELEASED`, param[0]: key
  INPUT_KEY_RELEASED(4),
  /// `INPUT_MOUSE_BUTTON_UP`, param[0]: button
  INPUT_MOUSE_BUTTON_UP(5),
  /// `INPUT_MOUSE_BUTTON_DOWN`, param[0]: button
  INPUT_MOUSE_BUTTON_DOWN(6),
  /// `INPUT_MOUSE_POSITION`, param[0]: x, param[1]: y
  INPUT_MOUSE_POSITION(7),
  /// `INPUT_MOUSE_WHEEL_MOTION`, param[0]: x delta, param[1]: y delta
  INPUT_MOUSE_WHEEL_MOTION(8),
  /// `INPUT_GAMEPAD_CONNECT`, param[0]: gamepad
  INPUT_GAMEPAD_CONNECT(9),
  /// `INPUT_GAMEPAD_DISCONNECT`, param[0]: gamepad
  INPUT_GAMEPAD_DISCONNECT(10),
  /// `INPUT_GAMEPAD_BUTTON_UP`, param[0]: button
  INPUT_GAMEPAD_BUTTON_UP(11),
  /// `INPUT_GAMEPAD_BUTTON_DOWN`, param[0]: button
  INPUT_GAMEPAD_BUTTON_DOWN(12),
  /// `INPUT_GAMEPAD_AXIS_MOTION`, param[0]: axis, param[1]: delta
  INPUT_GAMEPAD_AXIS_MOTION(13),
  /// `INPUT_TOUCH_UP`, param[0]: id
  INPUT_TOUCH_UP(14),
  /// `INPUT_TOUCH_DOWN`, param[0]: id
  INPUT_TOUCH_DOWN(15),
  /// `INPUT_TOUCH_POSITION`, param[0]: x, param[1]: y
  INPUT_TOUCH_POSITION(16),
  /// `INPUT_GESTURE`, param[0]: gesture
  INPUT_GESTURE(17),

  // Window events

  /// `WINDOW_CLOSE`, no params
  WINDOW_CLOSE(18),
  /// `WINDOW_MAXIMIZE`, no params
  WINDOW_MAXIMIZE(19),
  /// `WINDOW_MINIMIZE`, no params
  WINDOW_MINIMIZE(20),
  /// `WINDOW_RESIZE`, param[0]: width, param[1]: height
  WINDOW_RESIZE(21),

  // Custom events
  
  /// `ACTION_TAKE_SCREENSHOT`, no params
  ACTION_TAKE_SCREENSHOT(22),
  /// `ACTION_SETTARGETFPS`, param[0]: fps
  ACTION_SETTARGETFPS(23);

  const AutomationEventType(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [AutomationEventType] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static AutomationEventType fromValue(int value) => switch (value) {
    0 => EVENT_NONE,
    1 => INPUT_KEY_UP,
    2 => INPUT_KEY_DOWN,
    3 => INPUT_KEY_PRESSED,
    4 => INPUT_KEY_RELEASED,
    5 => INPUT_MOUSE_BUTTON_UP,
    6 => INPUT_MOUSE_BUTTON_DOWN,
    7 => INPUT_MOUSE_POSITION,
    8 => INPUT_MOUSE_WHEEL_MOTION,
    9 => INPUT_GAMEPAD_CONNECT,
    10 => INPUT_GAMEPAD_DISCONNECT,
    11 => INPUT_GAMEPAD_BUTTON_UP,
    12 => INPUT_GAMEPAD_BUTTON_DOWN,
    13 => INPUT_GAMEPAD_AXIS_MOTION,
    14 => INPUT_TOUCH_UP,
    15 => INPUT_TOUCH_DOWN,
    16 => INPUT_TOUCH_POSITION,
    17 => INPUT_GESTURE,
    18 => WINDOW_CLOSE,
    19 => WINDOW_MAXIMIZE,
    20 => WINDOW_MINIMIZE,
    21 => WINDOW_RESIZE,
    22 => ACTION_TAKE_SCREENSHOT,
    23 => ACTION_SETTARGETFPS,
    _ => throw ArgumentError('Unknown value for $AutomationEventType: $value'),
  };
}

/// `TouchAction`
enum TouchAction with XEnum {
  /// `TOUCH_ACTION_UP`
  TOUCH_ACTION_UP(0),
  /// `TOUCH_ACTION_DOWN`
  TOUCH_ACTION_DOWN(1),
  /// `TOUCH_ACTION_MOVE`
  TOUCH_ACTION_MOVE(2),
  /// `TOUCH_ACTION_CANCEL`
  TOUCH_ACTION_CANCEL(3);

  const TouchAction(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [TouchAction] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static TouchAction fromValue(int value) => switch (value) {
    0 => TOUCH_ACTION_UP,
    1 => TOUCH_ACTION_DOWN,
    2 => TOUCH_ACTION_MOVE,
    3 => TOUCH_ACTION_CANCEL,
    _ => throw ArgumentError("Unknown value for $TouchAction: $value"),
  };
}