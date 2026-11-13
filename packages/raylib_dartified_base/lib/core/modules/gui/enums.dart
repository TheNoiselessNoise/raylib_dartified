part of '../../raylib_dartified_base.dart';

/// Marker for raygui property enums, each exposing a raw [value] for use
/// with the GUI styling API.
mixin GuiProperty on XEnum {}

/// `GuiResult`
/// 
/// Gui control result
sealed class GuiResult {
  /// The underlying name.
  final String name;

  /// The underlying native integer value.
  final int value;

  const GuiResult(this.value, this.name);

  /// `RESULT_NONE`
  static const RESULT_NONE = _GuiResultConst(0, 'RESULT_NONE');
  
  /// `RESULT_PRESSED`
  static const RESULT_PRESSED = _GuiResultConst(1, 'RESULT_PRESSED');
  
  /// `RESULT_CHANGED`
  static const RESULT_CHANGED = _GuiResultConst(2, 'RESULT_CHANGED');
  
  /// `RESULT_TAB_CLOSE`
  ///
  /// GuiTabBar(), tab close request
  static const RESULT_TAB_CLOSE = _GuiResultConst(4, 'RESULT_TAB_CLOSE');

  /// Returns the custom [GuiResult] for the given native [value].
  factory GuiResult.custom(int value) = GuiResultCustom;

  /// Returns the [GuiResult] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  factory GuiResult.fromValue(int value) => switch (value) {
    0 => RESULT_NONE,
    1 => RESULT_PRESSED,
    2 => RESULT_CHANGED,
    4 => RESULT_TAB_CLOSE,
    _ => GuiResultCustom(value),
  };

  bool operator <(GuiResult other) => value < other.value;
  bool operator >(GuiResult other) => value > other.value;
  bool operator <=(GuiResult other) => value <= other.value;
  bool operator >=(GuiResult other) => value >= other.value;
}

final class _GuiResultConst extends GuiResult {
  const _GuiResultConst(super.value, super.name);
}

class GuiResultCustom extends GuiResult {
  const GuiResultCustom(int value) : super(value, 'RESULT_CUSTOM');
}

/// `GuiState`
/// 
/// Gui control state
enum GuiState with XEnum {
  /// `STATE_NORMAL`
  STATE_NORMAL(0),
  /// `STATE_FOCUSED`
  STATE_FOCUSED(1),
  /// `STATE_PRESSED`
  STATE_PRESSED(2),
  /// `STATE_DISABLED`
  STATE_DISABLED(3);

  const GuiState(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiState] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiState fromValue(int value) => switch (value) {
    0 => STATE_NORMAL,
    1 => STATE_FOCUSED,
    2 => STATE_PRESSED,
    3 => STATE_DISABLED,
    _ => throw ArgumentError('Unknown value for $GuiState: $value'),
  };
}

/// `GuiTextAlignment`
/// 
/// Gui control text alignment
enum GuiTextAlignment with XEnum {
  /// `TEXT_ALIGN_LEFT`
  TEXT_ALIGN_LEFT(0),
  /// `TEXT_ALIGN_CENTER`
  TEXT_ALIGN_CENTER(1),
  /// `TEXT_ALIGN_RIGHT`
  TEXT_ALIGN_RIGHT(2);
  
  const GuiTextAlignment(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiTextAlignment] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiTextAlignment fromValue(int value) => switch (value) {
    0 => TEXT_ALIGN_LEFT,
    1 => TEXT_ALIGN_CENTER,
    2 => TEXT_ALIGN_RIGHT,
    _ => throw ArgumentError('Unknown value for $GuiTextAlignment: $value'),
  };
}

/// `GuiTextAlignmentVertical`
/// 
/// Gui control text alignment vertical
enum GuiTextAlignmentVertical with XEnum {
  /// `TEXT_ALIGN_TOP`
  TEXT_ALIGN_TOP(0),
  /// `TEXT_ALIGN_MIDDLE`
  TEXT_ALIGN_MIDDLE(1),
  /// `TEXT_ALIGN_BOTTOM`
  TEXT_ALIGN_BOTTOM(2);
  
  const GuiTextAlignmentVertical(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiTextAlignmentVertical] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiTextAlignmentVertical fromValue(int value) => switch (value) {
    0 => TEXT_ALIGN_TOP,
    1 => TEXT_ALIGN_MIDDLE,
    2 => TEXT_ALIGN_BOTTOM,
    _ => throw ArgumentError('Unknown value for $GuiTextAlignmentVertical: $value'),
  };
}

/// `GuiTextWrapMode`
/// 
/// Gui control text wrap mode
enum GuiTextWrapMode with XEnum {
  /// `TEXT_WRAP_NONE`
  TEXT_WRAP_NONE(0),
  /// `TEXT_WRAP_CHAR`
  TEXT_WRAP_CHAR(1),
  /// `TEXT_WRAP_WORD`
  TEXT_WRAP_WORD(2);
  
  const GuiTextWrapMode(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiTextWrapMode] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiTextWrapMode fromValue(int value) => switch (value) {
    0 => TEXT_WRAP_NONE,
    1 => TEXT_WRAP_CHAR,
    2 => TEXT_WRAP_WORD,
    _ => throw ArgumentError('Unknown value for $GuiTextWrapMode: $value'),
  };
}

/// `GuiControl`
/// 
/// Gui controls
enum GuiControl with XEnum {
  /// `DEFAULT`
  /// 
  /// Populates to all controls when set
  DEFAULT(0),
  /// `LABEL`
  /// 
  /// Used also for: LABELBUTTON
  LABEL(1),
  /// `BUTTON`
  BUTTON(2),
  /// `TOGGLE`
  /// 
  /// Used also for: TOGGLEGROUP
  TOGGLE(3),
  /// `SLIDER`
  /// 
  /// Used also for: SLIDERBAR, TOGGLESLIDER
  SLIDER(4),
  /// `PROGRESSBAR`
  PROGRESSBAR(5),
  /// `CHECKBOX`
  CHECKBOX(6),
  /// `COMBOBOX`
  COMBOBOX(7),
  /// `DROPDOWNBOX`
  DROPDOWNBOX(8),
  /// `TEXTBOX`
  /// 
  /// Used also for: TEXTBOXMULTI
  TEXTBOX(9),
  /// `VALUEBOX`
  VALUEBOX(10),
  /// `TABBAR`
  TABBAR(11),
  /// `LISTVIEW`
  LISTVIEW(12),
  /// `COLORPICKER`
  COLORPICKER(13),
  /// `SCROLLBAR`
  SCROLLBAR(14),
  /// `STATUSBAR`
  STATUSBAR(15);
  
  const GuiControl(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiControl] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
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
    11 => TABBAR,
    12 => LISTVIEW,
    13 => COLORPICKER,
    14 => SCROLLBAR,
    15 => STATUSBAR,
    _ => throw ArgumentError('Unknown value for $GuiControl: $value'),
  };
}

/// `GuiControlProperty`
/// 
/// Controls BASE properties for every control
enum GuiControlProperty with XEnum , GuiProperty {
  /// `BORDER_COLOR_NORMAL`
  /// 
  /// Control border color in STATE_NORMAL
  BORDER_COLOR_NORMAL(0),
  /// `BASE_COLOR_NORMAL`
  /// 
  /// Control base color in STATE_NORMAL
  BASE_COLOR_NORMAL(1),
  /// `TEXT_COLOR_NORMAL`
  /// 
  /// Control text color in STATE_NORMAL
  TEXT_COLOR_NORMAL(2),
  /// `BORDER_COLOR_FOCUSED`
  /// 
  /// Control border color in STATE_FOCUSED
  BORDER_COLOR_FOCUSED(3),
  /// `BASE_COLOR_FOCUSED`
  /// 
  /// Control base color in STATE_FOCUSED
  BASE_COLOR_FOCUSED(4),
  /// `TEXT_COLOR_FOCUSED`
  /// 
  /// Control text color in STATE_FOCUSED
  TEXT_COLOR_FOCUSED(5),
  /// `BORDER_COLOR_PRESSED`
  /// 
  /// Control border color in STATE_PRESSED
  BORDER_COLOR_PRESSED(6),
  /// `BASE_COLOR_PRESSED`
  /// 
  /// Control base color in STATE_PRESSED
  BASE_COLOR_PRESSED(7),
  /// `TEXT_COLOR_PRESSED`
  /// 
  /// Control text color in STATE_PRESSED
  TEXT_COLOR_PRESSED(8),
  /// `BORDER_COLOR_DISABLED`
  /// 
  /// Control border color in STATE_DISABLED
  BORDER_COLOR_DISABLED(9),
  /// `BASE_COLOR_DISABLED`
  /// 
  /// Control base color in STATE_DISABLED
  BASE_COLOR_DISABLED(10),
  /// `TEXT_COLOR_DISABLED`
  /// 
  /// Control text color in STATE_DISABLED
  TEXT_COLOR_DISABLED(11),
  /// `BORDER_WIDTH`
  /// 
  /// Control border size, 0 for no border
  BORDER_WIDTH(12),
  /// `TEXT_PADDING`
  /// 
  /// Control text padding, not considering border
  TEXT_PADDING(13),
  /// `TEXT_ALIGNMENT`
  /// 
  /// Control text horizontal alignment inside control text bound (after border and padding): 0-Left, 1-Center, 2-Right
  TEXT_ALIGNMENT(14),
  /// `BASEPROP16`
  /// 
  /// Not used yet...
  BASEPROP16(15);

  const GuiControlProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiControlProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
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
    15 => BASEPROP16,
    _ => throw ArgumentError('Unknown value for $GuiControlProperty: $value'),
  };
}

/// `GuiDefaultProperty`
/// 
/// Controls EXTENDED properties
enum GuiDefaultProperty with XEnum , GuiProperty {
  /// `TEXT_SIZE`
  /// 
  /// Text size (glyphs max height)
  TEXT_SIZE(16),
  /// `TEXT_SPACING`
  /// 
  /// Text spacing between glyphs
  TEXT_SPACING(17),
  /// `LINE_COLOR`
  /// 
  /// Line control color
  LINE_COLOR(18),
  /// `BACKGROUND_COLOR`
  /// 
  /// Background color
  BACKGROUND_COLOR(19),
  /// `TEXT_LINE_SPACING`
  /// 
  /// Text spacing between lines
  TEXT_LINE_SPACING(20),
  /// `TEXT_ALIGNMENT_VERTICAL`
  /// 
  /// Text vertical alignment inside text bounds (after border and padding): 0-Top, 1-Middle, 2-Bottom
  TEXT_ALIGNMENT_VERTICAL(21),
  /// `TEXT_WRAP_MODE`
  /// 
  /// Text wrap-mode inside text bounds
  TEXT_WRAP_MODE(22),
  /// `EXTPROP08`
  /// 
  /// Not used yet...
  EXTPROP08(23);

  const GuiDefaultProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiDefaultProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiDefaultProperty fromValue(int value) => switch (value) {
    16 => TEXT_SIZE,
    17 => TEXT_SPACING,
    18 => LINE_COLOR,
    19 => BACKGROUND_COLOR,
    20 => TEXT_LINE_SPACING,
    21 => TEXT_ALIGNMENT_VERTICAL,
    22 => TEXT_WRAP_MODE,
    23 => EXTPROP08,
    _ => throw ArgumentError('Unknown value for $GuiDefaultProperty: $value'),
  };
}

/// `GuiToggleProperty`
/// 
/// Toggle/ToggleGroup
enum GuiToggleProperty with XEnum , GuiProperty {
  /// `GROUP_PADDING`
  /// 
  /// ToggleGroup separation between toggles
  GROUP_PADDING(16),
  /// `GROUP_WIDTH_FULL`
  /// 
  /// ToggleGroup bounds width considers all items: 0-Width per item, 1-Full width
  GROUP_WIDTH_FULL(17);

  const GuiToggleProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiToggleProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiToggleProperty fromValue(int value) => switch (value) {
    16 => GROUP_PADDING,
    17 => GROUP_WIDTH_FULL,
    _ => throw ArgumentError('Unknown value for $GuiToggleProperty: $value'),
  };
}

/// `GuiSliderProperty`
/// 
/// Slider/SliderBar
enum GuiSliderProperty with XEnum , GuiProperty {
  /// `SLIDER_WIDTH`
  /// 
  /// Slider size of internal bar
  SLIDER_WIDTH(16),
  /// `SLIDER_PADDING`
  /// 
  /// Slider/SliderBar internal bar padding
  SLIDER_PADDING(17);

  const GuiSliderProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiSliderProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiSliderProperty fromValue(int value) => switch (value) {
    16 => SLIDER_WIDTH,
    17 => SLIDER_PADDING,
    _ => throw ArgumentError('Unknown value for $GuiSliderProperty: $value'),
  };
}

/// `GuiProgressBarProperty`
/// 
/// ProgressBar
enum GuiProgressBarProperty with XEnum , GuiProperty {
  /// `PROGRESS_PADDING`
  /// 
  /// ProgressBar internal padding
  PROGRESS_PADDING(16),
  /// `PROGRESS_PADDING`
  /// 
  /// ProgressBar increment side: 0-Left->Right, 1-Right->Left
  PROGRESS_SIDE(17);

  const GuiProgressBarProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiProgressBarProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiProgressBarProperty fromValue(int value) => switch (value) {
    16 => PROGRESS_PADDING,
    _ => throw ArgumentError('Unknown value for $GuiProgressBarProperty: $value'),
  };
}

/// `GuiScrollBarProperty`
/// 
/// ScrollBar
enum GuiScrollBarProperty with XEnum , GuiProperty {
  /// `ARROWS_SIZE`
  /// 
  /// ScrollBar arrows size
  ARROWS_SIZE(16),
  /// `ARROWS_VISIBLE`
  /// 
  /// ScrollBar arrows visible
  ARROWS_VISIBLE(17),
  /// `SCROLL_SLIDER_PADDING`
  /// 
  /// ScrollBar slider internal padding
  SCROLL_SLIDER_PADDING(18),
  /// `SCROLL_SLIDER_SIZE`
  /// 
  /// ScrollBar slider size
  SCROLL_SLIDER_SIZE(19),
  /// `SCROLL_PADDING`
  /// 
  /// ScrollBar scroll padding from arrows
  SCROLL_PADDING(20),
  /// `SCROLL_SPEED`
  /// 
  /// ScrollBar scrolling speed
  SCROLL_SPEED(21);

  const GuiScrollBarProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiScrollBarProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiScrollBarProperty fromValue(int value) => switch (value) {
    16 => ARROWS_SIZE,
    17 => ARROWS_VISIBLE,
    18 => SCROLL_SLIDER_PADDING,
    19 => SCROLL_SLIDER_SIZE,
    20 => SCROLL_PADDING,
    21 => SCROLL_SPEED,
    _ => throw ArgumentError('Unknown value for $GuiScrollBarProperty: $value'),
  };
}

/// `GuiCheckBoxProperty`
/// 
/// CheckBox
enum GuiCheckBoxProperty with XEnum , GuiProperty {
  /// `CHECK_PADDING`
  /// 
  /// CheckBox internal check padding
  CHECK_PADDING(16);

  const GuiCheckBoxProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiCheckBoxProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiCheckBoxProperty fromValue(int value) => switch (value) {
    16 => CHECK_PADDING,
    _ => throw ArgumentError('Unknown value for $GuiCheckBoxProperty: $value'),
  };
}

/// `GuiComboBoxProperty`
/// 
/// ComboBox
enum GuiComboBoxProperty with XEnum , GuiProperty {
  /// `COMBO_BUTTON_WIDTH`
  /// 
  /// ComboBox right button width
  COMBO_BUTTON_WIDTH(16),
  /// `COMBO_BUTTON_SPACING`
  /// 
  /// ComboBox button separation
  COMBO_BUTTON_SPACING(17);

  const GuiComboBoxProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiComboBoxProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiComboBoxProperty fromValue(int value) => switch (value) {
    16 => COMBO_BUTTON_WIDTH,
    17 => COMBO_BUTTON_SPACING,
    _ => throw ArgumentError('Unknown value for $GuiComboBoxProperty: $value'),
  };
}

/// `GuiDropdownBoxProperty`
/// 
/// DropdownBox
enum GuiDropdownBoxProperty with XEnum , GuiProperty {
  /// `ARROW_PADDING`
  /// 
  /// DropdownBox arrow separation from border and items
  ARROW_PADDING(16),
  /// `DROPDOWN_ITEMS_SPACING`
  /// 
  /// DropdownBox items separation
  DROPDOWN_ITEMS_SPACING(17),
  /// `DROPDOWN_ARROW_HIDDEN`
  /// 
  /// DropdownBox arrow hidden
  DROPDOWN_ARROW_HIDDEN(18),
  /// `DROPDOWN_ROLL_UP`
  /// 
  /// DropdownBox roll up flag: 0-Roll down, 1-Roll up
  DROPDOWN_ROLL_UP(19);

  const GuiDropdownBoxProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiDropdownBoxProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiDropdownBoxProperty fromValue(int value) => switch (value) {
    16 => ARROW_PADDING,
    17 => DROPDOWN_ITEMS_SPACING,
    18 => DROPDOWN_ARROW_HIDDEN,
    19 => DROPDOWN_ROLL_UP,
    _ => throw ArgumentError('Unknown value for $GuiDropdownBoxProperty: $value'),
  };
}

/// `GuiTextBoxProperty`
/// 
/// TextBox/TextBoxMulti/ValueBox/Spinner
enum GuiTextBoxProperty with XEnum , GuiProperty {
  /// `TEXT_READONLY`
  /// 
  /// TextBox in read-only mode: 0-Text editable, 1-Text read-only
  TEXT_READONLY(16);

  const GuiTextBoxProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiTextBoxProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiTextBoxProperty fromValue(int value) => switch (value) {
    16 => TEXT_READONLY,
    _ => throw ArgumentError('Unknown value for $GuiTextBoxProperty: $value'),
  };
}

/// `GuiValueBoxProperty`
/// 
/// ValueBox/Spinner
enum GuiValueBoxProperty with XEnum , GuiProperty {
  /// `SPINNER_BUTTON_WIDTH`
  /// 
  /// Spinner left/right buttons width
  SPINNER_BUTTON_WIDTH(16),
  /// `SPINNER_BUTTON_SPACING`
  /// 
  /// Spinner buttons separation
  SPINNER_BUTTON_SPACING(17);

  const GuiValueBoxProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiValueBoxProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiValueBoxProperty fromValue(int value) => switch (value) {
    16 => SPINNER_BUTTON_WIDTH,
    17 => SPINNER_BUTTON_SPACING,
    _ => throw ArgumentError('Unknown value for $GuiValueBoxProperty: $value'),
  };
}

/// `GuiTabBarProperty`
/// 
/// TabBar
enum GuiTabBarProperty with XEnum , GuiProperty {
  /// `TAB_ITEMS_WIDTH`
  /// 
  /// TabBar tab items width
  TAB_ITEMS_WIDTH(16),
  /// `TAB_CLOSE_BUTTON`
  /// 
  /// TabBar tab close button: 0-Not shown, 1-Shown
  TAB_CLOSE_BUTTON(17),
  /// `TAB_LINE_SIDE`
  /// 
  /// TabBar tabs side: 0-Bottom, 1-Top
  TAB_LINE_SIDE(18);

  const GuiTabBarProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiTabBarProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiTabBarProperty fromValue(int value) => switch (value) {
    16 => TAB_ITEMS_WIDTH,
    17 => TAB_CLOSE_BUTTON,
    18 => TAB_LINE_SIDE,
    _ => throw ArgumentError('Unknown value for $GuiTabBarProperty: $value'),
  };
}

/// `GuiListViewProperty`
/// 
/// ListView
enum GuiListViewProperty with XEnum , GuiProperty {
  /// `LIST_ITEMS_HEIGHT`
  /// 
  /// ListView items height
  LIST_ITEMS_HEIGHT(16),
  /// `LIST_ITEMS_SPACING`
  /// 
  /// ListView items separation
  LIST_ITEMS_SPACING(17),
  /// `SCROLLBAR_WIDTH`
  /// 
  /// ListView scrollbar size (usually width)
  SCROLLBAR_WIDTH(18),
  /// `SCROLLBAR_SIDE`
  /// 
  /// ListView scrollbar side: 0-Left side, 1-Right Side
  SCROLLBAR_SIDE(19),
  /// `LIST_ITEMS_BORDER_NORMAL`
  /// 
  /// ListView items border enabled in normal state
  LIST_ITEMS_BORDER_NORMAL(20),
  /// `LIST_ITEMS_BORDER_WIDTH`
  /// 
  /// ListView items border width
  LIST_ITEMS_BORDER_WIDTH(21);

  const GuiListViewProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiListViewProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiListViewProperty fromValue(int value) => switch (value) {
    16 => LIST_ITEMS_HEIGHT,
    17 => LIST_ITEMS_SPACING,
    18 => SCROLLBAR_WIDTH,
    19 => SCROLLBAR_SIDE,
    20 => LIST_ITEMS_BORDER_NORMAL,
    21 => LIST_ITEMS_BORDER_WIDTH,
    _ => throw ArgumentError('Unknown value for $GuiListViewProperty: $value'),
  };
}

/// `GuiColorPickerProperty`
/// 
/// ColorPicker
enum GuiColorPickerProperty with XEnum , GuiProperty {
  /// `COLOR_SELECTOR_SIZE`
  /// 
  /// ColorPicker selector square size
  COLOR_SELECTOR_SIZE(16),
  /// `HUEBAR_WIDTH`
  /// 
  /// ColorPicker right hue bar width
  HUEBAR_WIDTH(17),
  /// `HUEBAR_PADDING`
  /// 
  /// ColorPicker right hue bar separation from panel
  HUEBAR_PADDING(18),
  /// `HUEBAR_SELECTOR_HEIGHT`
  /// 
  /// ColorPicker right hue bar selector height
  HUEBAR_SELECTOR_HEIGHT(19),
  /// `HUEBAR_SELECTOR_OVERFLOW`
  /// 
  /// ColorPicker right hue bar selector overflow
  HUEBAR_SELECTOR_OVERFLOW(20);

  const GuiColorPickerProperty(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiColorPickerProperty] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static GuiColorPickerProperty fromValue(int value) => switch (value) {
    16 => COLOR_SELECTOR_SIZE,
    17 => HUEBAR_WIDTH,
    18 => HUEBAR_PADDING,
    19 => HUEBAR_SELECTOR_HEIGHT,
    20 => HUEBAR_SELECTOR_OVERFLOW,
    _ => throw ArgumentError('Unknown value for $GuiColorPickerProperty: $value'),
  };
}

/// `GuiIconName`
enum GuiIconName with XEnum {
  /// `ICON_NONE`
  ICON_NONE(0),
  /// `ICON_FOLDER_FILE_OPEN`
  ICON_FOLDER_FILE_OPEN(1),
  /// `ICON_FILE_SAVE_CLASSIC`
  ICON_FILE_SAVE_CLASSIC(2),
  /// `ICON_FOLDER_OPEN`
  ICON_FOLDER_OPEN(3),
  /// `ICON_FOLDER_SAVE`
  ICON_FOLDER_SAVE(4),
  /// `ICON_FILE_OPEN`
  ICON_FILE_OPEN(5),
  /// `ICON_FILE_SAVE`
  ICON_FILE_SAVE(6),
  /// `ICON_FILE_EXPORT`
  ICON_FILE_EXPORT(7),
  /// `ICON_FILE_ADD`
  ICON_FILE_ADD(8),
  /// `ICON_FILE_DELETE`
  ICON_FILE_DELETE(9),
  /// `ICON_FILETYPE_TEXT`
  ICON_FILETYPE_TEXT(10),
  /// `ICON_FILETYPE_AUDIO`
  ICON_FILETYPE_AUDIO(11),
  /// `ICON_FILETYPE_IMAGE`
  ICON_FILETYPE_IMAGE(12),
  /// `ICON_FILETYPE_PLAY`
  ICON_FILETYPE_PLAY(13),
  /// `ICON_FILETYPE_VIDEO`
  ICON_FILETYPE_VIDEO(14),
  /// `ICON_FILETYPE_INFO`
  ICON_FILETYPE_INFO(15),
  /// `ICON_FILE_COPY`
  ICON_FILE_COPY(16),
  /// `ICON_FILE_CUT`
  ICON_FILE_CUT(17),
  /// `ICON_FILE_PASTE`
  ICON_FILE_PASTE(18),
  /// `ICON_CURSOR_HAND`
  ICON_CURSOR_HAND(19),
  /// `ICON_CURSOR_POINTER`
  ICON_CURSOR_POINTER(20),
  /// `ICON_CURSOR_CLASSIC`
  ICON_CURSOR_CLASSIC(21),
  /// `ICON_PENCIL`
  ICON_PENCIL(22),
  /// `ICON_PENCIL_BIG`
  ICON_PENCIL_BIG(23),
  /// `ICON_BRUSH_CLASSIC`
  ICON_BRUSH_CLASSIC(24),
  /// `ICON_BRUSH_PAINTER`
  ICON_BRUSH_PAINTER(25),
  /// `ICON_WATER_DROP`
  ICON_WATER_DROP(26),
  /// `ICON_COLOR_PICKER`
  ICON_COLOR_PICKER(27),
  /// `ICON_RUBBER`
  ICON_RUBBER(28),
  /// `ICON_COLOR_BUCKET`
  ICON_COLOR_BUCKET(29),
  /// `ICON_TEXT_T`
  ICON_TEXT_T(30),
  /// `ICON_TEXT_A`
  ICON_TEXT_A(31),
  /// `ICON_SCALE`
  ICON_SCALE(32),
  /// `ICON_RESIZE`
  ICON_RESIZE(33),
  /// `ICON_FILTER_POINT`
  ICON_FILTER_POINT(34),
  /// `ICON_FILTER_BILINEAR`
  ICON_FILTER_BILINEAR(35),
  /// `ICON_CROP`
  ICON_CROP(36),
  /// `ICON_CROP_ALPHA`
  ICON_CROP_ALPHA(37),
  /// `ICON_SQUARE_TOGGLE`
  ICON_SQUARE_TOGGLE(38),
  /// `ICON_SYMMETRY`
  ICON_SYMMETRY(39),
  /// `ICON_SYMMETRY_HORIZONTAL`
  ICON_SYMMETRY_HORIZONTAL(40),
  /// `ICON_SYMMETRY_VERTICAL`
  ICON_SYMMETRY_VERTICAL(41),
  /// `ICON_LENS`
  ICON_LENS(42),
  /// `ICON_LENS_BIG`
  ICON_LENS_BIG(43),
  /// `ICON_EYE_ON`
  ICON_EYE_ON(44),
  /// `ICON_EYE_OFF`
  ICON_EYE_OFF(45),
  /// `ICON_FILTER_TOP`
  ICON_FILTER_TOP(46),
  /// `ICON_FILTER`
  ICON_FILTER(47),
  /// `ICON_TARGET_POINT`
  ICON_TARGET_POINT(48),
  /// `ICON_TARGET_SMALL`
  ICON_TARGET_SMALL(49),
  /// `ICON_TARGET_BIG`
  ICON_TARGET_BIG(50),
  /// `ICON_TARGET_MOVE`
  ICON_TARGET_MOVE(51),
  /// `ICON_CURSOR_MOVE`
  ICON_CURSOR_MOVE(52),
  /// `ICON_CURSOR_SCALE`
  ICON_CURSOR_SCALE(53),
  /// `ICON_CURSOR_SCALE_RIGHT`
  ICON_CURSOR_SCALE_RIGHT(54),
  /// `ICON_CURSOR_SCALE_LEFT`
  ICON_CURSOR_SCALE_LEFT(55),
  /// `ICON_UNDO`
  ICON_UNDO(56),
  /// `ICON_REDO`
  ICON_REDO(57),
  /// `ICON_REREDO`
  ICON_REREDO(58),
  /// `ICON_MUTATE`
  ICON_MUTATE(59),
  /// `ICON_ROTATE`
  ICON_ROTATE(60),
  /// `ICON_REPEAT`
  ICON_REPEAT(61),
  /// `ICON_SHUFFLE`
  ICON_SHUFFLE(62),
  /// `ICON_EMPTYBOX`
  ICON_EMPTYBOX(63),
  /// `ICON_TARGET`
  ICON_TARGET(64),
  /// `ICON_TARGET_SMALL_FILL`
  ICON_TARGET_SMALL_FILL(65),
  /// `ICON_TARGET_BIG_FILL`
  ICON_TARGET_BIG_FILL(66),
  /// `ICON_TARGET_MOVE_FILL`
  ICON_TARGET_MOVE_FILL(67),
  /// `ICON_CURSOR_MOVE_FILL`
  ICON_CURSOR_MOVE_FILL(68),
  /// `ICON_CURSOR_SCALE_FILL`
  ICON_CURSOR_SCALE_FILL(69),
  /// `ICON_CURSOR_SCALE_RIGHT_FILL`
  ICON_CURSOR_SCALE_RIGHT_FILL(70),
  /// `ICON_CURSOR_SCALE_LEFT_FILL`
  ICON_CURSOR_SCALE_LEFT_FILL(71),
  /// `ICON_UNDO_FILL`
  ICON_UNDO_FILL(72),
  /// `ICON_REDO_FILL`
  ICON_REDO_FILL(73),
  /// `ICON_REREDO_FILL`
  ICON_REREDO_FILL(74),
  /// `ICON_MUTATE_FILL`
  ICON_MUTATE_FILL(75),
  /// `ICON_ROTATE_FILL`
  ICON_ROTATE_FILL(76),
  /// `ICON_REPEAT_FILL`
  ICON_REPEAT_FILL(77),
  /// `ICON_SHUFFLE_FILL`
  ICON_SHUFFLE_FILL(78),
  /// `ICON_EMPTYBOX_SMALL`
  ICON_EMPTYBOX_SMALL(79),
  /// `ICON_BOX`
  ICON_BOX(80),
  /// `ICON_BOX_TOP`
  ICON_BOX_TOP(81),
  /// `ICON_BOX_TOP_RIGHT`
  ICON_BOX_TOP_RIGHT(82),
  /// `ICON_BOX_RIGHT`
  ICON_BOX_RIGHT(83),
  /// `ICON_BOX_BOTTOM_RIGHT`
  ICON_BOX_BOTTOM_RIGHT(84),
  /// `ICON_BOX_BOTTOM`
  ICON_BOX_BOTTOM(85),
  /// `ICON_BOX_BOTTOM_LEFT`
  ICON_BOX_BOTTOM_LEFT(86),
  /// `ICON_BOX_LEFT`
  ICON_BOX_LEFT(87),
  /// `ICON_BOX_TOP_LEFT`
  ICON_BOX_TOP_LEFT(88),
  /// `ICON_BOX_CENTER`
  ICON_BOX_CENTER(89),
  /// `ICON_BOX_CIRCLE_MASK`
  ICON_BOX_CIRCLE_MASK(90),
  /// `ICON_POT`
  ICON_POT(91),
  /// `ICON_ALPHA_MULTIPLY`
  ICON_ALPHA_MULTIPLY(92),
  /// `ICON_ALPHA_CLEAR`
  ICON_ALPHA_CLEAR(93),
  /// `ICON_DITHERING`
  ICON_DITHERING(94),
  /// `ICON_MIPMAPS`
  ICON_MIPMAPS(95),
  /// `ICON_BOX_GRID`
  ICON_BOX_GRID(96),
  /// `ICON_GRID`
  ICON_GRID(97),
  /// `ICON_BOX_CORNERS_SMALL`
  ICON_BOX_CORNERS_SMALL(98),
  /// `ICON_BOX_CORNERS_BIG`
  ICON_BOX_CORNERS_BIG(99),
  /// `ICON_FOUR_BOXES`
  ICON_FOUR_BOXES(100),
  /// `ICON_GRID_FILL`
  ICON_GRID_FILL(101),
  /// `ICON_BOX_MULTISIZE`
  ICON_BOX_MULTISIZE(102),
  /// `ICON_ZOOM_SMALL`
  ICON_ZOOM_SMALL(103),
  /// `ICON_ZOOM_MEDIUM`
  ICON_ZOOM_MEDIUM(104),
  /// `ICON_ZOOM_BIG`
  ICON_ZOOM_BIG(105),
  /// `ICON_ZOOM_ALL`
  ICON_ZOOM_ALL(106),
  /// `ICON_ZOOM_CENTER`
  ICON_ZOOM_CENTER(107),
  /// `ICON_BOX_DOTS_SMALL`
  ICON_BOX_DOTS_SMALL(108),
  /// `ICON_BOX_DOTS_BIG`
  ICON_BOX_DOTS_BIG(109),
  /// `ICON_BOX_CONCENTRIC`
  ICON_BOX_CONCENTRIC(110),
  /// `ICON_BOX_GRID_BIG`
  ICON_BOX_GRID_BIG(111),
  /// `ICON_OK_TICK`
  ICON_OK_TICK(112),
  /// `ICON_CROSS`
  ICON_CROSS(113),
  /// `ICON_ARROW_LEFT`
  ICON_ARROW_LEFT(114),
  /// `ICON_ARROW_RIGHT`
  ICON_ARROW_RIGHT(115),
  /// `ICON_ARROW_DOWN`
  ICON_ARROW_DOWN(116),
  /// `ICON_ARROW_UP`
  ICON_ARROW_UP(117),
  /// `ICON_ARROW_LEFT_FILL`
  ICON_ARROW_LEFT_FILL(118),
  /// `ICON_ARROW_RIGHT_FILL`
  ICON_ARROW_RIGHT_FILL(119),
  /// `ICON_ARROW_DOWN_FILL`
  ICON_ARROW_DOWN_FILL(120),
  /// `ICON_ARROW_UP_FILL`
  ICON_ARROW_UP_FILL(121),
  /// `ICON_AUDIO`
  ICON_AUDIO(122),
  /// `ICON_FX`
  ICON_FX(123),
  /// `ICON_WAVE`
  ICON_WAVE(124),
  /// `ICON_WAVE_SINUS`
  ICON_WAVE_SINUS(125),
  /// `ICON_WAVE_SQUARE`
  ICON_WAVE_SQUARE(126),
  /// `ICON_WAVE_TRIANGULAR`
  ICON_WAVE_TRIANGULAR(127),
  /// `ICON_CROSS_SMALL`
  ICON_CROSS_SMALL(128),
  /// `ICON_PLAYER_PREVIOUS`
  ICON_PLAYER_PREVIOUS(129),
  /// `ICON_PLAYER_PLAY_BACK`
  ICON_PLAYER_PLAY_BACK(130),
  /// `ICON_PLAYER_PLAY`
  ICON_PLAYER_PLAY(131),
  /// `ICON_PLAYER_PAUSE`
  ICON_PLAYER_PAUSE(132),
  /// `ICON_PLAYER_STOP`
  ICON_PLAYER_STOP(133),
  /// `ICON_PLAYER_NEXT`
  ICON_PLAYER_NEXT(134),
  /// `ICON_PLAYER_RECORD`
  ICON_PLAYER_RECORD(135),
  /// `ICON_MAGNET`
  ICON_MAGNET(136),
  /// `ICON_LOCK_CLOSE`
  ICON_LOCK_CLOSE(137),
  /// `ICON_LOCK_OPEN`
  ICON_LOCK_OPEN(138),
  /// `ICON_CLOCK`
  ICON_CLOCK(139),
  /// `ICON_TOOLS`
  ICON_TOOLS(140),
  /// `ICON_GEAR`
  ICON_GEAR(141),
  /// `ICON_GEAR_BIG`
  ICON_GEAR_BIG(142),
  /// `ICON_BIN`
  ICON_BIN(143),
  /// `ICON_HAND_POINTER`
  ICON_HAND_POINTER(144),
  /// `ICON_LASER`
  ICON_LASER(145),
  /// `ICON_COIN`
  ICON_COIN(146),
  /// `ICON_EXPLOSION`
  ICON_EXPLOSION(147),
  /// `ICON_1UP`
  ICON_1UP(148),
  /// `ICON_PLAYER`
  ICON_PLAYER(149),
  /// `ICON_PLAYER_JUMP`
  ICON_PLAYER_JUMP(150),
  /// `ICON_KEY`
  ICON_KEY(151),
  /// `ICON_DEMON`
  ICON_DEMON(152),
  /// `ICON_TEXT_POPUP`
  ICON_TEXT_POPUP(153),
  /// `ICON_GEAR_EX`
  ICON_GEAR_EX(154),
  /// `ICON_CRACK`
  ICON_CRACK(155),
  /// `ICON_CRACK_POINTS`
  ICON_CRACK_POINTS(156),
  /// `ICON_STAR`
  ICON_STAR(157),
  /// `ICON_DOOR`
  ICON_DOOR(158),
  /// `ICON_EXIT`
  ICON_EXIT(159),
  /// `ICON_MODE_2D`
  ICON_MODE_2D(160),
  /// `ICON_MODE_3D`
  ICON_MODE_3D(161),
  /// `ICON_CUBE`
  ICON_CUBE(162),
  /// `ICON_CUBE_FACE_TOP`
  ICON_CUBE_FACE_TOP(163),
  /// `ICON_CUBE_FACE_LEFT`
  ICON_CUBE_FACE_LEFT(164),
  /// `ICON_CUBE_FACE_FRONT`
  ICON_CUBE_FACE_FRONT(165),
  /// `ICON_CUBE_FACE_BOTTOM`
  ICON_CUBE_FACE_BOTTOM(166),
  /// `ICON_CUBE_FACE_RIGHT`
  ICON_CUBE_FACE_RIGHT(167),
  /// `ICON_CUBE_FACE_BACK`
  ICON_CUBE_FACE_BACK(168),
  /// `ICON_CAMERA`
  ICON_CAMERA(169),
  /// `ICON_SPECIAL`
  ICON_SPECIAL(170),
  /// `ICON_LINK_NET`
  ICON_LINK_NET(171),
  /// `ICON_LINK_BOXES`
  ICON_LINK_BOXES(172),
  /// `ICON_LINK_MULTI`
  ICON_LINK_MULTI(173),
  /// `ICON_LINK`
  ICON_LINK(174),
  /// `ICON_LINK_BROKE`
  ICON_LINK_BROKE(175),
  /// `ICON_TEXT_NOTES`
  ICON_TEXT_NOTES(176),
  /// `ICON_NOTEBOOK`
  ICON_NOTEBOOK(177),
  /// `ICON_SUITCASE`
  ICON_SUITCASE(178),
  /// `ICON_SUITCASE_ZIP`
  ICON_SUITCASE_ZIP(179),
  /// `ICON_MAILBOX`
  ICON_MAILBOX(180),
  /// `ICON_MONITOR`
  ICON_MONITOR(181),
  /// `ICON_PRINTER`
  ICON_PRINTER(182),
  /// `ICON_PHOTO_CAMERA`
  ICON_PHOTO_CAMERA(183),
  /// `ICON_PHOTO_CAMERA_FLASH`
  ICON_PHOTO_CAMERA_FLASH(184),
  /// `ICON_HOUSE`
  ICON_HOUSE(185),
  /// `ICON_HEART`
  ICON_HEART(186),
  /// `ICON_CORNER`
  ICON_CORNER(187),
  /// `ICON_VERTICAL_BARS`
  ICON_VERTICAL_BARS(188),
  /// `ICON_VERTICAL_BARS_FILL`
  ICON_VERTICAL_BARS_FILL(189),
  /// `ICON_LIFE_BARS`
  ICON_LIFE_BARS(190),
  /// `ICON_INFO`
  ICON_INFO(191),
  /// `ICON_CROSSLINE`
  ICON_CROSSLINE(192),
  /// `ICON_HELP`
  ICON_HELP(193),
  /// `ICON_FILETYPE_ALPHA`
  ICON_FILETYPE_ALPHA(194),
  /// `ICON_FILETYPE_HOME`
  ICON_FILETYPE_HOME(195),
  /// `ICON_LAYERS_VISIBLE`
  ICON_LAYERS_VISIBLE(196),
  /// `ICON_LAYERS`
  ICON_LAYERS(197),
  /// `ICON_WINDOW`
  ICON_WINDOW(198),
  /// `ICON_HIDPI`
  ICON_HIDPI(199),
  /// `ICON_FILETYPE_BINARY`
  ICON_FILETYPE_BINARY(200),
  /// `ICON_HEX`
  ICON_HEX(201),
  /// `ICON_SHIELD`
  ICON_SHIELD(202),
  /// `ICON_FILE_NEW`
  ICON_FILE_NEW(203),
  /// `ICON_FOLDER_ADD`
  ICON_FOLDER_ADD(204),
  /// `ICON_ALARM`
  ICON_ALARM(205),
  /// `ICON_CPU`
  ICON_CPU(206),
  /// `ICON_ROM`
  ICON_ROM(207),
  /// `ICON_STEP_OVER`
  ICON_STEP_OVER(208),
  /// `ICON_STEP_INTO`
  ICON_STEP_INTO(209),
  /// `ICON_STEP_OUT`
  ICON_STEP_OUT(210),
  /// `ICON_RESTART`
  ICON_RESTART(211),
  /// `ICON_BREAKPOINT_ON`
  ICON_BREAKPOINT_ON(212),
  /// `ICON_BREAKPOINT_OFF`
  ICON_BREAKPOINT_OFF(213),
  /// `ICON_BURGER_MENU`
  ICON_BURGER_MENU(214),
  /// `ICON_CASE_SENSITIVE`
  ICON_CASE_SENSITIVE(215),
  /// `ICON_REG_EXP`
  ICON_REG_EXP(216),
  /// `ICON_FOLDER`
  ICON_FOLDER(217),
  /// `ICON_FILE`
  ICON_FILE(218),
  /// `ICON_SAND_TIMER`
  ICON_SAND_TIMER(219),
  /// `ICON_WARNING`
  ICON_WARNING(220),
  /// `ICON_HELP_BOX`
  ICON_HELP_BOX(221),
  /// `ICON_INFO_BOX`
  ICON_INFO_BOX(222),
  /// `ICON_PRIORITY`
  ICON_PRIORITY(223),
  /// `ICON_LAYERS_ISO`
  ICON_LAYERS_ISO(224),
  /// `ICON_LAYERS2`
  ICON_LAYERS2(225),
  /// `ICON_MLAYERS`
  ICON_MLAYERS(226),
  /// `ICON_MAPS`
  ICON_MAPS(227),
  /// `ICON_HOT`
  ICON_HOT(228),
  /// `ICON_LABEL`
  ICON_LABEL(229),
  /// `ICON_NAME_ID`
  ICON_NAME_ID(230),
  /// `ICON_SLICING`
  ICON_SLICING(231),
  /// `ICON_MANUAL_CONTROL`
  ICON_MANUAL_CONTROL(232),
  /// `ICON_COLLISION`
  ICON_COLLISION(233),
  /// `ICON_CIRCLE_ADD`
  ICON_CIRCLE_ADD(234),
  /// `ICON_CIRCLE_ADD_FILL`
  ICON_CIRCLE_ADD_FILL(235),
  /// `ICON_CIRCLE_WARNING`
  ICON_CIRCLE_WARNING(236),
  /// `ICON_CIRCLE_WARNING_FILL`
  ICON_CIRCLE_WARNING_FILL(237),
  /// `ICON_BOX_MORE`
  ICON_BOX_MORE(238),
  /// `ICON_BOX_MORE_FILL`
  ICON_BOX_MORE_FILL(239),
  /// `ICON_BOX_MINUS`
  ICON_BOX_MINUS(240),
  /// `ICON_BOX_MINUS_FILL`
  ICON_BOX_MINUS_FILL(241),
  /// `ICON_UNION`
  ICON_UNION(242),
  /// `ICON_INTERSECTION`
  ICON_INTERSECTION(243),
  /// `ICON_DIFFERENCE`
  ICON_DIFFERENCE(244),
  /// `ICON_SPHERE`
  ICON_SPHERE(245),
  /// `ICON_CYLINDER`
  ICON_CYLINDER(246),
  /// `ICON_CONE`
  ICON_CONE(247),
  /// `ICON_ELLIPSOID`
  ICON_ELLIPSOID(248),
  /// `ICON_CAPSULE`
  ICON_CAPSULE(249),
  /// `ICON_FILETYPE_FONT`
  ICON_FILETYPE_FONT(250),
  /// `ICON_FILETYPE_3D`
  ICON_FILETYPE_3D(251),
  /// `ICON_FILETYPE_CODE_XML`
  ICON_FILETYPE_CODE_XML(252),
  /// `ICON_FILETYPE_CODE_C`
  ICON_FILETYPE_CODE_C(253),
  /// `ICON_FILETYPE_CODE_PYTHON`
  ICON_FILETYPE_CODE_PYTHON(254),
  /// `ICON_FILETYPE_CODE_JS`
  ICON_FILETYPE_CODE_JS(255),
  /// `ICON_FILETYPE_ICON`
  ICON_FILETYPE_ICON(256);
  
  const GuiIconName(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [GuiIconName] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
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
    250 => ICON_FILETYPE_FONT,
    251 => ICON_FILETYPE_3D,
    252 => ICON_FILETYPE_CODE_XML,
    253 => ICON_FILETYPE_CODE_C,
    254 => ICON_FILETYPE_CODE_PYTHON,
    255 => ICON_FILETYPE_CODE_JS,
    256 => ICON_FILETYPE_ICON,
    _ => throw ArgumentError('Unknown value for $GuiIconName: $value'),
  };
}