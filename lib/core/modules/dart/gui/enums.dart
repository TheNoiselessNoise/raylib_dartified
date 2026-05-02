part of '../../../raylib.dart';

mixin GuiProperty on Enum {
  int get value;
}

enum GuiState {
  STATE_NORMAL(0),
  STATE_FOCUSED(1),
  STATE_PRESSED(2),
  STATE_DISABLED(3);

  final int value;
  const GuiState(this.value);

  static GuiState fromValue(int value) => switch (value) {
    0 => STATE_NORMAL,
    1 => STATE_FOCUSED,
    2 => STATE_PRESSED,
    3 => STATE_DISABLED,
    _ => throw ArgumentError('Unknown value for GuiState: $value'),
  };
}

enum GuiTextAlignment {
  TEXT_ALIGN_LEFT(0),
  TEXT_ALIGN_CENTER(1),
  TEXT_ALIGN_RIGHT(2);

  final int value;
  const GuiTextAlignment(this.value);

  static GuiTextAlignment fromValue(int value) => switch (value) {
    0 => TEXT_ALIGN_LEFT,
    1 => TEXT_ALIGN_CENTER,
    2 => TEXT_ALIGN_RIGHT,
    _ => throw ArgumentError('Unknown value for GuiTextAlignment: $value'),
  };
}

enum GuiTextAlignmentVertical {
  TEXT_ALIGN_TOP(0),
  TEXT_ALIGN_MIDDLE(1),
  TEXT_ALIGN_BOTTOM(2);

  final int value;
  const GuiTextAlignmentVertical(this.value);

  static GuiTextAlignmentVertical fromValue(int value) => switch (value) {
    0 => TEXT_ALIGN_TOP,
    1 => TEXT_ALIGN_MIDDLE,
    2 => TEXT_ALIGN_BOTTOM,
    _ => throw ArgumentError(
      'Unknown value for GuiTextAlignmentVertical: $value',
    ),
  };
}

enum GuiTextWrapMode {
  TEXT_WRAP_NONE(0),
  TEXT_WRAP_CHAR(1),
  TEXT_WRAP_WORD(2);

  final int value;
  const GuiTextWrapMode(this.value);

  static GuiTextWrapMode fromValue(int value) => switch (value) {
    0 => TEXT_WRAP_NONE,
    1 => TEXT_WRAP_CHAR,
    2 => TEXT_WRAP_WORD,
    _ => throw ArgumentError('Unknown value for GuiTextWrapMode: $value'),
  };
}

enum GuiControl {
  DEFAULT(0),
  LABEL(1),
  BUTTON(2),
  TOGGLE(3),
  SLIDER(4),
  PROGRESSBAR(5),
  CHECKBOX(6),
  COMBOBOX(7),
  DROPDOWNBOX(8),
  TEXTBOX(9),
  VALUEBOX(10),
  CONTROL11(11),
  LISTVIEW(12),
  COLORPICKER(13),
  SCROLLBAR(14),
  STATUSBAR(15);

  final int value;
  const GuiControl(this.value);

  static GuiControl fromValue(int value) => switch (value) {
    0 => DEFAULT,
    1 => LABEL,
    2 => BUTTON,
    3 => TOGGLE,
    4 => SLIDER,
    5 => PROGRESSBAR,
    6 => CHECKBOX,
    7 => COMBOBOX,
    8 => DROPDOWNBOX,
    9 => TEXTBOX,
    10 => VALUEBOX,
    11 => CONTROL11,
    12 => LISTVIEW,
    13 => COLORPICKER,
    14 => SCROLLBAR,
    15 => STATUSBAR,
    _ => throw ArgumentError('Unknown value for GuiControl: $value'),
  };
}

enum GuiControlProperty with GuiProperty {
  BORDER_COLOR_NORMAL(0),
  BASE_COLOR_NORMAL(1),
  TEXT_COLOR_NORMAL(2),
  BORDER_COLOR_FOCUSED(3),
  BASE_COLOR_FOCUSED(4),
  TEXT_COLOR_FOCUSED(5),
  BORDER_COLOR_PRESSED(6),
  BASE_COLOR_PRESSED(7),
  TEXT_COLOR_PRESSED(8),
  BORDER_COLOR_DISABLED(9),
  BASE_COLOR_DISABLED(10),
  TEXT_COLOR_DISABLED(11),
  BORDER_WIDTH(12),
  TEXT_PADDING(13),
  TEXT_ALIGNMENT(14);

  const GuiControlProperty(this.value);

  @override
  final int value;

  static GuiControlProperty fromValue(int value) => switch (value) {
    0 => BORDER_COLOR_NORMAL,
    1 => BASE_COLOR_NORMAL,
    2 => TEXT_COLOR_NORMAL,
    3 => BORDER_COLOR_FOCUSED,
    4 => BASE_COLOR_FOCUSED,
    5 => TEXT_COLOR_FOCUSED,
    6 => BORDER_COLOR_PRESSED,
    7 => BASE_COLOR_PRESSED,
    8 => TEXT_COLOR_PRESSED,
    9 => BORDER_COLOR_DISABLED,
    10 => BASE_COLOR_DISABLED,
    11 => TEXT_COLOR_DISABLED,
    12 => BORDER_WIDTH,
    13 => TEXT_PADDING,
    14 => TEXT_ALIGNMENT,
    _ => throw ArgumentError('Unknown value for GuiControlProperty: $value'),
  };
}

enum GuiDefaultProperty with GuiProperty {
  TEXT_SIZE(16),
  TEXT_SPACING(17),
  LINE_COLOR(18),
  BACKGROUND_COLOR(19),
  TEXT_LINE_SPACING(20),
  TEXT_ALIGNMENT_VERTICAL(21),
  TEXT_WRAP_MODE(22);

  const GuiDefaultProperty(this.value);

  @override
  final int value;

  static GuiDefaultProperty fromValue(int value) => switch (value) {
    16 => TEXT_SIZE,
    17 => TEXT_SPACING,
    18 => LINE_COLOR,
    19 => BACKGROUND_COLOR,
    20 => TEXT_LINE_SPACING,
    21 => TEXT_ALIGNMENT_VERTICAL,
    22 => TEXT_WRAP_MODE,
    _ => throw ArgumentError('Unknown value for GuiDefaultProperty: $value'),
  };
}

enum GuiToggleProperty with GuiProperty {
  GROUP_PADDING(16);

  const GuiToggleProperty(this.value);

  @override
  final int value;

  static GuiToggleProperty fromValue(int value) => switch (value) {
    16 => GROUP_PADDING,
    _ => throw ArgumentError('Unknown value for GuiToggleProperty: $value'),
  };
}

enum GuiSliderProperty with GuiProperty {
  SLIDER_WIDTH(16),
  SLIDER_PADDING(17);

  const GuiSliderProperty(this.value);

  @override
  final int value;

  static GuiSliderProperty fromValue(int value) => switch (value) {
    16 => SLIDER_WIDTH,
    17 => SLIDER_PADDING,
    _ => throw ArgumentError('Unknown value for GuiSliderProperty: $value'),
  };
}

enum GuiProgressBarProperty with GuiProperty {
  PROGRESS_PADDING(16);

  const GuiProgressBarProperty(this.value);

  @override
  final int value;

  static GuiProgressBarProperty fromValue(int value) => switch (value) {
    16 => PROGRESS_PADDING,
    _ => throw ArgumentError(
      'Unknown value for GuiProgressBarProperty: $value',
    ),
  };
}

enum GuiScrollBarProperty with GuiProperty {
  ARROWS_SIZE(16),
  ARROWS_VISIBLE(17),
  SCROLL_SLIDER_PADDING(18),
  SCROLL_SLIDER_SIZE(19),
  SCROLL_PADDING(20),
  SCROLL_SPEED(21);

  const GuiScrollBarProperty(this.value);

  @override
  final int value;

  static GuiScrollBarProperty fromValue(int value) => switch (value) {
    16 => ARROWS_SIZE,
    17 => ARROWS_VISIBLE,
    18 => SCROLL_SLIDER_PADDING,
    19 => SCROLL_SLIDER_SIZE,
    20 => SCROLL_PADDING,
    21 => SCROLL_SPEED,
    _ => throw ArgumentError('Unknown value for GuiScrollBarProperty: $value'),
  };
}

enum GuiCheckBoxProperty with GuiProperty {
  CHECK_PADDING(16);

  const GuiCheckBoxProperty(this.value);

  @override
  final int value;

  static GuiCheckBoxProperty fromValue(int value) => switch (value) {
    16 => CHECK_PADDING,
    _ => throw ArgumentError('Unknown value for GuiCheckBoxProperty: $value'),
  };
}

enum GuiComboBoxProperty with GuiProperty {
  COMBO_BUTTON_WIDTH(16),
  COMBO_BUTTON_SPACING(17);

  const GuiComboBoxProperty(this.value);

  @override
  final int value;

  static GuiComboBoxProperty fromValue(int value) => switch (value) {
    16 => COMBO_BUTTON_WIDTH,
    17 => COMBO_BUTTON_SPACING,
    _ => throw ArgumentError('Unknown value for GuiComboBoxProperty: $value'),
  };
}

enum GuiDropdownBoxProperty with GuiProperty {
  ARROW_PADDING(16),
  DROPDOWN_ITEMS_SPACING(17),
  DROPDOWN_ARROW_HIDDEN(18),
  DROPDOWN_ROLL_UP(19);

  const GuiDropdownBoxProperty(this.value);

  @override
  final int value;

  static GuiDropdownBoxProperty fromValue(int value) => switch (value) {
    16 => ARROW_PADDING,
    17 => DROPDOWN_ITEMS_SPACING,
    18 => DROPDOWN_ARROW_HIDDEN,
    19 => DROPDOWN_ROLL_UP,
    _ => throw ArgumentError(
      'Unknown value for GuiDropdownBoxProperty: $value',
    ),
  };
}

enum GuiTextBoxProperty with GuiProperty {
  TEXT_READONLY(16);

  const GuiTextBoxProperty(this.value);

  @override
  final int value;

  static GuiTextBoxProperty fromValue(int value) => switch (value) {
    16 => TEXT_READONLY,
    _ => throw ArgumentError('Unknown value for GuiTextBoxProperty: $value'),
  };
}

enum GuiValueBoxProperty with GuiProperty {
  SPINNER_BUTTON_WIDTH(16),
  SPINNER_BUTTON_SPACING(17);

  const GuiValueBoxProperty(this.value);

  @override
  final int value;

  static GuiValueBoxProperty fromValue(int value) => switch (value) {
    16 => SPINNER_BUTTON_WIDTH,
    17 => SPINNER_BUTTON_SPACING,
    _ => throw ArgumentError('Unknown value for GuiValueBoxProperty: $value'),
  };
}

enum GuiListViewProperty with GuiProperty {
  LIST_ITEMS_HEIGHT(16),
  LIST_ITEMS_SPACING(17),
  SCROLLBAR_WIDTH(18),
  SCROLLBAR_SIDE(19),
  LIST_ITEMS_BORDER_NORMAL(20),
  LIST_ITEMS_BORDER_WIDTH(21);

  const GuiListViewProperty(this.value);

  @override
  final int value;

  static GuiListViewProperty fromValue(int value) => switch (value) {
    16 => LIST_ITEMS_HEIGHT,
    17 => LIST_ITEMS_SPACING,
    18 => SCROLLBAR_WIDTH,
    19 => SCROLLBAR_SIDE,
    20 => LIST_ITEMS_BORDER_NORMAL,
    21 => LIST_ITEMS_BORDER_WIDTH,
    _ => throw ArgumentError('Unknown value for GuiListViewProperty: $value'),
  };
}

enum GuiColorPickerProperty with GuiProperty {
  COLOR_SELECTOR_SIZE(16),
  HUEBAR_WIDTH(17),
  HUEBAR_PADDING(18),
  HUEBAR_SELECTOR_HEIGHT(19),
  HUEBAR_SELECTOR_OVERFLOW(20);

  const GuiColorPickerProperty(this.value);

  @override
  final int value;

  static GuiColorPickerProperty fromValue(int value) => switch (value) {
    16 => COLOR_SELECTOR_SIZE,
    17 => HUEBAR_WIDTH,
    18 => HUEBAR_PADDING,
    19 => HUEBAR_SELECTOR_HEIGHT,
    20 => HUEBAR_SELECTOR_OVERFLOW,
    _ => throw ArgumentError(
      'Unknown value for GuiColorPickerProperty: $value',
    ),
  };
}

enum GuiIconName {
  ICON_NONE(0),
  ICON_FOLDER_FILE_OPEN(1),
  ICON_FILE_SAVE_CLASSIC(2),
  ICON_FOLDER_OPEN(3),
  ICON_FOLDER_SAVE(4),
  ICON_FILE_OPEN(5),
  ICON_FILE_SAVE(6),
  ICON_FILE_EXPORT(7),
  ICON_FILE_ADD(8),
  ICON_FILE_DELETE(9),
  ICON_FILETYPE_TEXT(10),
  ICON_FILETYPE_AUDIO(11),
  ICON_FILETYPE_IMAGE(12),
  ICON_FILETYPE_PLAY(13),
  ICON_FILETYPE_VIDEO(14),
  ICON_FILETYPE_INFO(15),
  ICON_FILE_COPY(16),
  ICON_FILE_CUT(17),
  ICON_FILE_PASTE(18),
  ICON_CURSOR_HAND(19),
  ICON_CURSOR_POINTER(20),
  ICON_CURSOR_CLASSIC(21),
  ICON_PENCIL(22),
  ICON_PENCIL_BIG(23),
  ICON_BRUSH_CLASSIC(24),
  ICON_BRUSH_PAINTER(25),
  ICON_WATER_DROP(26),
  ICON_COLOR_PICKER(27),
  ICON_RUBBER(28),
  ICON_COLOR_BUCKET(29),
  ICON_TEXT_T(30),
  ICON_TEXT_A(31),
  ICON_SCALE(32),
  ICON_RESIZE(33),
  ICON_FILTER_POINT(34),
  ICON_FILTER_BILINEAR(35),
  ICON_CROP(36),
  ICON_CROP_ALPHA(37),
  ICON_SQUARE_TOGGLE(38),
  ICON_SYMMETRY(39),
  ICON_SYMMETRY_HORIZONTAL(40),
  ICON_SYMMETRY_VERTICAL(41),
  ICON_LENS(42),
  ICON_LENS_BIG(43),
  ICON_EYE_ON(44),
  ICON_EYE_OFF(45),
  ICON_FILTER_TOP(46),
  ICON_FILTER(47),
  ICON_TARGET_POINT(48),
  ICON_TARGET_SMALL(49),
  ICON_TARGET_BIG(50),
  ICON_TARGET_MOVE(51),
  ICON_CURSOR_MOVE(52),
  ICON_CURSOR_SCALE(53),
  ICON_CURSOR_SCALE_RIGHT(54),
  ICON_CURSOR_SCALE_LEFT(55),
  ICON_UNDO(56),
  ICON_REDO(57),
  ICON_REREDO(58),
  ICON_MUTATE(59),
  ICON_ROTATE(60),
  ICON_REPEAT(61),
  ICON_SHUFFLE(62),
  ICON_EMPTYBOX(63),
  ICON_TARGET(64),
  ICON_TARGET_SMALL_FILL(65),
  ICON_TARGET_BIG_FILL(66),
  ICON_TARGET_MOVE_FILL(67),
  ICON_CURSOR_MOVE_FILL(68),
  ICON_CURSOR_SCALE_FILL(69),
  ICON_CURSOR_SCALE_RIGHT_FILL(70),
  ICON_CURSOR_SCALE_LEFT_FILL(71),
  ICON_UNDO_FILL(72),
  ICON_REDO_FILL(73),
  ICON_REREDO_FILL(74),
  ICON_MUTATE_FILL(75),
  ICON_ROTATE_FILL(76),
  ICON_REPEAT_FILL(77),
  ICON_SHUFFLE_FILL(78),
  ICON_EMPTYBOX_SMALL(79),
  ICON_BOX(80),
  ICON_BOX_TOP(81),
  ICON_BOX_TOP_RIGHT(82),
  ICON_BOX_RIGHT(83),
  ICON_BOX_BOTTOM_RIGHT(84),
  ICON_BOX_BOTTOM(85),
  ICON_BOX_BOTTOM_LEFT(86),
  ICON_BOX_LEFT(87),
  ICON_BOX_TOP_LEFT(88),
  ICON_BOX_CENTER(89),
  ICON_BOX_CIRCLE_MASK(90),
  ICON_POT(91),
  ICON_ALPHA_MULTIPLY(92),
  ICON_ALPHA_CLEAR(93),
  ICON_DITHERING(94),
  ICON_MIPMAPS(95),
  ICON_BOX_GRID(96),
  ICON_GRID(97),
  ICON_BOX_CORNERS_SMALL(98),
  ICON_BOX_CORNERS_BIG(99),
  ICON_FOUR_BOXES(100),
  ICON_GRID_FILL(101),
  ICON_BOX_MULTISIZE(102),
  ICON_ZOOM_SMALL(103),
  ICON_ZOOM_MEDIUM(104),
  ICON_ZOOM_BIG(105),
  ICON_ZOOM_ALL(106),
  ICON_ZOOM_CENTER(107),
  ICON_BOX_DOTS_SMALL(108),
  ICON_BOX_DOTS_BIG(109),
  ICON_BOX_CONCENTRIC(110),
  ICON_BOX_GRID_BIG(111),
  ICON_OK_TICK(112),
  ICON_CROSS(113),
  ICON_ARROW_LEFT(114),
  ICON_ARROW_RIGHT(115),
  ICON_ARROW_DOWN(116),
  ICON_ARROW_UP(117),
  ICON_ARROW_LEFT_FILL(118),
  ICON_ARROW_RIGHT_FILL(119),
  ICON_ARROW_DOWN_FILL(120),
  ICON_ARROW_UP_FILL(121),
  ICON_AUDIO(122),
  ICON_FX(123),
  ICON_WAVE(124),
  ICON_WAVE_SINUS(125),
  ICON_WAVE_SQUARE(126),
  ICON_WAVE_TRIANGULAR(127),
  ICON_CROSS_SMALL(128),
  ICON_PLAYER_PREVIOUS(129),
  ICON_PLAYER_PLAY_BACK(130),
  ICON_PLAYER_PLAY(131),
  ICON_PLAYER_PAUSE(132),
  ICON_PLAYER_STOP(133),
  ICON_PLAYER_NEXT(134),
  ICON_PLAYER_RECORD(135),
  ICON_MAGNET(136),
  ICON_LOCK_CLOSE(137),
  ICON_LOCK_OPEN(138),
  ICON_CLOCK(139),
  ICON_TOOLS(140),
  ICON_GEAR(141),
  ICON_GEAR_BIG(142),
  ICON_BIN(143),
  ICON_HAND_POINTER(144),
  ICON_LASER(145),
  ICON_COIN(146),
  ICON_EXPLOSION(147),
  ICON_1UP(148),
  ICON_PLAYER(149),
  ICON_PLAYER_JUMP(150),
  ICON_KEY(151),
  ICON_DEMON(152),
  ICON_TEXT_POPUP(153),
  ICON_GEAR_EX(154),
  ICON_CRACK(155),
  ICON_CRACK_POINTS(156),
  ICON_STAR(157),
  ICON_DOOR(158),
  ICON_EXIT(159),
  ICON_MODE_2D(160),
  ICON_MODE_3D(161),
  ICON_CUBE(162),
  ICON_CUBE_FACE_TOP(163),
  ICON_CUBE_FACE_LEFT(164),
  ICON_CUBE_FACE_FRONT(165),
  ICON_CUBE_FACE_BOTTOM(166),
  ICON_CUBE_FACE_RIGHT(167),
  ICON_CUBE_FACE_BACK(168),
  ICON_CAMERA(169),
  ICON_SPECIAL(170),
  ICON_LINK_NET(171),
  ICON_LINK_BOXES(172),
  ICON_LINK_MULTI(173),
  ICON_LINK(174),
  ICON_LINK_BROKE(175),
  ICON_TEXT_NOTES(176),
  ICON_NOTEBOOK(177),
  ICON_SUITCASE(178),
  ICON_SUITCASE_ZIP(179),
  ICON_MAILBOX(180),
  ICON_MONITOR(181),
  ICON_PRINTER(182),
  ICON_PHOTO_CAMERA(183),
  ICON_PHOTO_CAMERA_FLASH(184),
  ICON_HOUSE(185),
  ICON_HEART(186),
  ICON_CORNER(187),
  ICON_VERTICAL_BARS(188),
  ICON_VERTICAL_BARS_FILL(189),
  ICON_LIFE_BARS(190),
  ICON_INFO(191),
  ICON_CROSSLINE(192),
  ICON_HELP(193),
  ICON_FILETYPE_ALPHA(194),
  ICON_FILETYPE_HOME(195),
  ICON_LAYERS_VISIBLE(196),
  ICON_LAYERS(197),
  ICON_WINDOW(198),
  ICON_HIDPI(199),
  ICON_FILETYPE_BINARY(200),
  ICON_HEX(201),
  ICON_SHIELD(202),
  ICON_FILE_NEW(203),
  ICON_FOLDER_ADD(204),
  ICON_ALARM(205),
  ICON_CPU(206),
  ICON_ROM(207),
  ICON_STEP_OVER(208),
  ICON_STEP_INTO(209),
  ICON_STEP_OUT(210),
  ICON_RESTART(211),
  ICON_BREAKPOINT_ON(212),
  ICON_BREAKPOINT_OFF(213),
  ICON_BURGER_MENU(214),
  ICON_CASE_SENSITIVE(215),
  ICON_REG_EXP(216),
  ICON_FOLDER(217),
  ICON_FILE(218),
  ICON_SAND_TIMER(219),
  ICON_WARNING(220),
  ICON_HELP_BOX(221),
  ICON_INFO_BOX(222),
  ICON_PRIORITY(223),
  ICON_LAYERS_ISO(224),
  ICON_LAYERS2(225),
  ICON_MLAYERS(226),
  ICON_MAPS(227),
  ICON_HOT(228),
  ICON_LABEL(229),
  ICON_NAME_ID(230),
  ICON_SLICING(231),
  ICON_MANUAL_CONTROL(232),
  ICON_COLLISION(233),
  ICON_CIRCLE_ADD(234),
  ICON_CIRCLE_ADD_FILL(235),
  ICON_CIRCLE_WARNING(236),
  ICON_CIRCLE_WARNING_FILL(237),
  ICON_BOX_MORE(238),
  ICON_BOX_MORE_FILL(239),
  ICON_BOX_MINUS(240),
  ICON_BOX_MINUS_FILL(241),
  ICON_UNION(242),
  ICON_INTERSECTION(243),
  ICON_DIFFERENCE(244),
  ICON_SPHERE(245),
  ICON_CYLINDER(246),
  ICON_CONE(247),
  ICON_ELLIPSOID(248),
  ICON_CAPSULE(249),
  ICON_250(250),
  ICON_251(251),
  ICON_252(252),
  ICON_253(253),
  ICON_254(254),
  ICON_255(255);

  final int value;
  const GuiIconName(this.value);

  static GuiIconName fromValue(int value) => switch (value) {
    0 => ICON_NONE,
    1 => ICON_FOLDER_FILE_OPEN,
    2 => ICON_FILE_SAVE_CLASSIC,
    3 => ICON_FOLDER_OPEN,
    4 => ICON_FOLDER_SAVE,
    5 => ICON_FILE_OPEN,
    6 => ICON_FILE_SAVE,
    7 => ICON_FILE_EXPORT,
    8 => ICON_FILE_ADD,
    9 => ICON_FILE_DELETE,
    10 => ICON_FILETYPE_TEXT,
    11 => ICON_FILETYPE_AUDIO,
    12 => ICON_FILETYPE_IMAGE,
    13 => ICON_FILETYPE_PLAY,
    14 => ICON_FILETYPE_VIDEO,
    15 => ICON_FILETYPE_INFO,
    16 => ICON_FILE_COPY,
    17 => ICON_FILE_CUT,
    18 => ICON_FILE_PASTE,
    19 => ICON_CURSOR_HAND,
    20 => ICON_CURSOR_POINTER,
    21 => ICON_CURSOR_CLASSIC,
    22 => ICON_PENCIL,
    23 => ICON_PENCIL_BIG,
    24 => ICON_BRUSH_CLASSIC,
    25 => ICON_BRUSH_PAINTER,
    26 => ICON_WATER_DROP,
    27 => ICON_COLOR_PICKER,
    28 => ICON_RUBBER,
    29 => ICON_COLOR_BUCKET,
    30 => ICON_TEXT_T,
    31 => ICON_TEXT_A,
    32 => ICON_SCALE,
    33 => ICON_RESIZE,
    34 => ICON_FILTER_POINT,
    35 => ICON_FILTER_BILINEAR,
    36 => ICON_CROP,
    37 => ICON_CROP_ALPHA,
    38 => ICON_SQUARE_TOGGLE,
    39 => ICON_SYMMETRY,
    40 => ICON_SYMMETRY_HORIZONTAL,
    41 => ICON_SYMMETRY_VERTICAL,
    42 => ICON_LENS,
    43 => ICON_LENS_BIG,
    44 => ICON_EYE_ON,
    45 => ICON_EYE_OFF,
    46 => ICON_FILTER_TOP,
    47 => ICON_FILTER,
    48 => ICON_TARGET_POINT,
    49 => ICON_TARGET_SMALL,
    50 => ICON_TARGET_BIG,
    51 => ICON_TARGET_MOVE,
    52 => ICON_CURSOR_MOVE,
    53 => ICON_CURSOR_SCALE,
    54 => ICON_CURSOR_SCALE_RIGHT,
    55 => ICON_CURSOR_SCALE_LEFT,
    56 => ICON_UNDO,
    57 => ICON_REDO,
    58 => ICON_REREDO,
    59 => ICON_MUTATE,
    60 => ICON_ROTATE,
    61 => ICON_REPEAT,
    62 => ICON_SHUFFLE,
    63 => ICON_EMPTYBOX,
    64 => ICON_TARGET,
    65 => ICON_TARGET_SMALL_FILL,
    66 => ICON_TARGET_BIG_FILL,
    67 => ICON_TARGET_MOVE_FILL,
    68 => ICON_CURSOR_MOVE_FILL,
    69 => ICON_CURSOR_SCALE_FILL,
    70 => ICON_CURSOR_SCALE_RIGHT_FILL,
    71 => ICON_CURSOR_SCALE_LEFT_FILL,
    72 => ICON_UNDO_FILL,
    73 => ICON_REDO_FILL,
    74 => ICON_REREDO_FILL,
    75 => ICON_MUTATE_FILL,
    76 => ICON_ROTATE_FILL,
    77 => ICON_REPEAT_FILL,
    78 => ICON_SHUFFLE_FILL,
    79 => ICON_EMPTYBOX_SMALL,
    80 => ICON_BOX,
    81 => ICON_BOX_TOP,
    82 => ICON_BOX_TOP_RIGHT,
    83 => ICON_BOX_RIGHT,
    84 => ICON_BOX_BOTTOM_RIGHT,
    85 => ICON_BOX_BOTTOM,
    86 => ICON_BOX_BOTTOM_LEFT,
    87 => ICON_BOX_LEFT,
    88 => ICON_BOX_TOP_LEFT,
    89 => ICON_BOX_CENTER,
    90 => ICON_BOX_CIRCLE_MASK,
    91 => ICON_POT,
    92 => ICON_ALPHA_MULTIPLY,
    93 => ICON_ALPHA_CLEAR,
    94 => ICON_DITHERING,
    95 => ICON_MIPMAPS,
    96 => ICON_BOX_GRID,
    97 => ICON_GRID,
    98 => ICON_BOX_CORNERS_SMALL,
    99 => ICON_BOX_CORNERS_BIG,
    100 => ICON_FOUR_BOXES,
    101 => ICON_GRID_FILL,
    102 => ICON_BOX_MULTISIZE,
    103 => ICON_ZOOM_SMALL,
    104 => ICON_ZOOM_MEDIUM,
    105 => ICON_ZOOM_BIG,
    106 => ICON_ZOOM_ALL,
    107 => ICON_ZOOM_CENTER,
    108 => ICON_BOX_DOTS_SMALL,
    109 => ICON_BOX_DOTS_BIG,
    110 => ICON_BOX_CONCENTRIC,
    111 => ICON_BOX_GRID_BIG,
    112 => ICON_OK_TICK,
    113 => ICON_CROSS,
    114 => ICON_ARROW_LEFT,
    115 => ICON_ARROW_RIGHT,
    116 => ICON_ARROW_DOWN,
    117 => ICON_ARROW_UP,
    118 => ICON_ARROW_LEFT_FILL,
    119 => ICON_ARROW_RIGHT_FILL,
    120 => ICON_ARROW_DOWN_FILL,
    121 => ICON_ARROW_UP_FILL,
    122 => ICON_AUDIO,
    123 => ICON_FX,
    124 => ICON_WAVE,
    125 => ICON_WAVE_SINUS,
    126 => ICON_WAVE_SQUARE,
    127 => ICON_WAVE_TRIANGULAR,
    128 => ICON_CROSS_SMALL,
    129 => ICON_PLAYER_PREVIOUS,
    130 => ICON_PLAYER_PLAY_BACK,
    131 => ICON_PLAYER_PLAY,
    132 => ICON_PLAYER_PAUSE,
    133 => ICON_PLAYER_STOP,
    134 => ICON_PLAYER_NEXT,
    135 => ICON_PLAYER_RECORD,
    136 => ICON_MAGNET,
    137 => ICON_LOCK_CLOSE,
    138 => ICON_LOCK_OPEN,
    139 => ICON_CLOCK,
    140 => ICON_TOOLS,
    141 => ICON_GEAR,
    142 => ICON_GEAR_BIG,
    143 => ICON_BIN,
    144 => ICON_HAND_POINTER,
    145 => ICON_LASER,
    146 => ICON_COIN,
    147 => ICON_EXPLOSION,
    148 => ICON_1UP,
    149 => ICON_PLAYER,
    150 => ICON_PLAYER_JUMP,
    151 => ICON_KEY,
    152 => ICON_DEMON,
    153 => ICON_TEXT_POPUP,
    154 => ICON_GEAR_EX,
    155 => ICON_CRACK,
    156 => ICON_CRACK_POINTS,
    157 => ICON_STAR,
    158 => ICON_DOOR,
    159 => ICON_EXIT,
    160 => ICON_MODE_2D,
    161 => ICON_MODE_3D,
    162 => ICON_CUBE,
    163 => ICON_CUBE_FACE_TOP,
    164 => ICON_CUBE_FACE_LEFT,
    165 => ICON_CUBE_FACE_FRONT,
    166 => ICON_CUBE_FACE_BOTTOM,
    167 => ICON_CUBE_FACE_RIGHT,
    168 => ICON_CUBE_FACE_BACK,
    169 => ICON_CAMERA,
    170 => ICON_SPECIAL,
    171 => ICON_LINK_NET,
    172 => ICON_LINK_BOXES,
    173 => ICON_LINK_MULTI,
    174 => ICON_LINK,
    175 => ICON_LINK_BROKE,
    176 => ICON_TEXT_NOTES,
    177 => ICON_NOTEBOOK,
    178 => ICON_SUITCASE,
    179 => ICON_SUITCASE_ZIP,
    180 => ICON_MAILBOX,
    181 => ICON_MONITOR,
    182 => ICON_PRINTER,
    183 => ICON_PHOTO_CAMERA,
    184 => ICON_PHOTO_CAMERA_FLASH,
    185 => ICON_HOUSE,
    186 => ICON_HEART,
    187 => ICON_CORNER,
    188 => ICON_VERTICAL_BARS,
    189 => ICON_VERTICAL_BARS_FILL,
    190 => ICON_LIFE_BARS,
    191 => ICON_INFO,
    192 => ICON_CROSSLINE,
    193 => ICON_HELP,
    194 => ICON_FILETYPE_ALPHA,
    195 => ICON_FILETYPE_HOME,
    196 => ICON_LAYERS_VISIBLE,
    197 => ICON_LAYERS,
    198 => ICON_WINDOW,
    199 => ICON_HIDPI,
    200 => ICON_FILETYPE_BINARY,
    201 => ICON_HEX,
    202 => ICON_SHIELD,
    203 => ICON_FILE_NEW,
    204 => ICON_FOLDER_ADD,
    205 => ICON_ALARM,
    206 => ICON_CPU,
    207 => ICON_ROM,
    208 => ICON_STEP_OVER,
    209 => ICON_STEP_INTO,
    210 => ICON_STEP_OUT,
    211 => ICON_RESTART,
    212 => ICON_BREAKPOINT_ON,
    213 => ICON_BREAKPOINT_OFF,
    214 => ICON_BURGER_MENU,
    215 => ICON_CASE_SENSITIVE,
    216 => ICON_REG_EXP,
    217 => ICON_FOLDER,
    218 => ICON_FILE,
    219 => ICON_SAND_TIMER,
    220 => ICON_WARNING,
    221 => ICON_HELP_BOX,
    222 => ICON_INFO_BOX,
    223 => ICON_PRIORITY,
    224 => ICON_LAYERS_ISO,
    225 => ICON_LAYERS2,
    226 => ICON_MLAYERS,
    227 => ICON_MAPS,
    228 => ICON_HOT,
    229 => ICON_LABEL,
    230 => ICON_NAME_ID,
    231 => ICON_SLICING,
    232 => ICON_MANUAL_CONTROL,
    233 => ICON_COLLISION,
    234 => ICON_CIRCLE_ADD,
    235 => ICON_CIRCLE_ADD_FILL,
    236 => ICON_CIRCLE_WARNING,
    237 => ICON_CIRCLE_WARNING_FILL,
    238 => ICON_BOX_MORE,
    239 => ICON_BOX_MORE_FILL,
    240 => ICON_BOX_MINUS,
    241 => ICON_BOX_MINUS_FILL,
    242 => ICON_UNION,
    243 => ICON_INTERSECTION,
    244 => ICON_DIFFERENCE,
    245 => ICON_SPHERE,
    246 => ICON_CYLINDER,
    247 => ICON_CONE,
    248 => ICON_ELLIPSOID,
    249 => ICON_CAPSULE,
    250 => ICON_250,
    251 => ICON_251,
    252 => ICON_252,
    253 => ICON_253,
    254 => ICON_254,
    255 => ICON_255,
    _ => throw ArgumentError('Unknown value for GuiIconName: $value'),
  };
}