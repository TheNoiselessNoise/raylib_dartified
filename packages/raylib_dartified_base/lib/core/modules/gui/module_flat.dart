part of '../../raylib_dartified_base.dart';

/// Re-exports [RaylibGuiConstants] values as instance members,
/// so constants are accessible directly on the module without a class qualifier.
mixin RaylibGuiModuleExtras<R extends RaylibBase> on RaylibModule<R> {

  /// See [RaylibGuiConstants.RAYGUI_VERSION_MAJOR].
  int get RAYGUI_VERSION_MAJOR => RaylibGuiConstants.RAYGUI_VERSION_MAJOR;

  /// See [RaylibGuiConstants.RAYGUI_VERSION_MINOR].
  int get RAYGUI_VERSION_MINOR => RaylibGuiConstants.RAYGUI_VERSION_MINOR;

  /// See [RaylibGuiConstants.RAYGUI_VERSION_PATCH].
  int get RAYGUI_VERSION_PATCH => RaylibGuiConstants.RAYGUI_VERSION_PATCH;

  /// See [RaylibGuiConstants.RAYGUI_VERSION].
  String get RAYGUI_VERSION => RaylibGuiConstants.RAYGUI_VERSION;

  /// See [RaylibGuiConstants.RAYGUI_SCROLLBAR_LEFT_SIDE].
  int get RAYGUI_SCROLLBAR_LEFT_SIDE => RaylibGuiConstants.RAYGUI_SCROLLBAR_LEFT_SIDE;

  /// See [RaylibGuiConstants.RAYGUI_SCROLLBAR_RIGHT_SIDE].
  int get RAYGUI_SCROLLBAR_RIGHT_SIDE => RaylibGuiConstants.RAYGUI_SCROLLBAR_RIGHT_SIDE;

  /// See [RaylibGuiConstants.RAYGUI_ICON_SIZE].
  int get RAYGUI_ICON_SIZE => RaylibGuiConstants.RAYGUI_ICON_SIZE;

  /// See [RaylibGuiConstants.RAYGUI_ICON_MAX_ICONS].
  int get RAYGUI_ICON_MAX_ICONS => RaylibGuiConstants.RAYGUI_ICON_MAX_ICONS;

  /// See [RaylibGuiConstants.RAYGUI_ICON_MAX_FONT_BACKED].
  int get RAYGUI_ICON_MAX_FONT_BACKED => RaylibGuiConstants.RAYGUI_ICON_MAX_FONT_BACKED;

  /// See [RaylibGuiConstants.RAYGUI_ICON_MAX_NAME_LENGTH].
  int get RAYGUI_ICON_MAX_NAME_LENGTH => RaylibGuiConstants.RAYGUI_ICON_MAX_NAME_LENGTH;

  /// See [RaylibGuiConstants.RAYGUI_ICON_FONT_ATLAS_PADDING].
  int get RAYGUI_ICON_FONT_ATLAS_PADDING => RaylibGuiConstants.RAYGUI_ICON_FONT_ATLAS_PADDING;

  /// See [RaylibGuiConstants.RAYGUI_ICON_DATA_ELEMENTS].
  int get RAYGUI_ICON_DATA_ELEMENTS => RaylibGuiConstants.RAYGUI_ICON_DATA_ELEMENTS;

  /// See [RaylibGuiConstants.RAYGUI_MAX_CONTROLS].
  int get RAYGUI_MAX_CONTROLS => RaylibGuiConstants.RAYGUI_MAX_CONTROLS;

  /// See [RaylibGuiConstants.RAYGUI_MAX_PROPS_BASE].
  int get RAYGUI_MAX_PROPS_BASE => RaylibGuiConstants.RAYGUI_MAX_PROPS_BASE;

  /// See [RaylibGuiConstants.RAYGUI_MAX_PROPS_EXTENDED].
  int get RAYGUI_MAX_PROPS_EXTENDED => RaylibGuiConstants.RAYGUI_MAX_PROPS_EXTENDED;

  /// See [RaylibGuiConstants.RAYGUI_WINDOWBOX_STATUSBAR_HEIGHT].
  int get RAYGUI_WINDOWBOX_STATUSBAR_HEIGHT => RaylibGuiConstants.RAYGUI_WINDOWBOX_STATUSBAR_HEIGHT;

  /// See [RaylibGuiConstants.RAYGUI_WINDOWBOX_CLOSEBUTTON_HEIGHT].
  int get RAYGUI_WINDOWBOX_CLOSEBUTTON_HEIGHT => RaylibGuiConstants.RAYGUI_WINDOWBOX_CLOSEBUTTON_HEIGHT;

  /// See [RaylibGuiConstants.RAYGUI_GROUPBOX_LINE_THICK].
  int get RAYGUI_GROUPBOX_LINE_THICK => RaylibGuiConstants.RAYGUI_GROUPBOX_LINE_THICK;

  /// See [RaylibGuiConstants.RAYGUI_LINE_MARGIN_TEXT].
  int get RAYGUI_LINE_MARGIN_TEXT => RaylibGuiConstants.RAYGUI_LINE_MARGIN_TEXT;

  /// See [RaylibGuiConstants.RAYGUI_LINE_TEXT_PADDING].
  int get RAYGUI_LINE_TEXT_PADDING => RaylibGuiConstants.RAYGUI_LINE_TEXT_PADDING;

  /// See [RaylibGuiConstants.RAYGUI_PANEL_BORDER_WIDTH].
  int get RAYGUI_PANEL_BORDER_WIDTH => RaylibGuiConstants.RAYGUI_PANEL_BORDER_WIDTH;

  /// See [RaylibGuiConstants.RAYGUI_MIN_SCROLLBAR_WIDTH].
  int get RAYGUI_MIN_SCROLLBAR_WIDTH => RaylibGuiConstants.RAYGUI_MIN_SCROLLBAR_WIDTH;

  /// See [RaylibGuiConstants.RAYGUI_MIN_SCROLLBAR_HEIGHT].
  int get RAYGUI_MIN_SCROLLBAR_HEIGHT => RaylibGuiConstants.RAYGUI_MIN_SCROLLBAR_HEIGHT;

  /// See [RaylibGuiConstants.RAYGUI_MIN_MOUSE_WHEEL_SPEED].
  int get RAYGUI_MIN_MOUSE_WHEEL_SPEED => RaylibGuiConstants.RAYGUI_MIN_MOUSE_WHEEL_SPEED;

  /// See [RaylibGuiConstants.RAYGUI_TOGGLEGROUP_MAX_ITEM_TEXT_SIZE].
  int get RAYGUI_TOGGLEGROUP_MAX_ITEM_TEXT_SIZE => RaylibGuiConstants.RAYGUI_TOGGLEGROUP_MAX_ITEM_TEXT_SIZE;

  /// See [RaylibGuiConstants.RAYGUI_TEXTBOX_AUTO_CURSOR_COOLDOWN].
  int get RAYGUI_TEXTBOX_AUTO_CURSOR_COOLDOWN => RaylibGuiConstants.RAYGUI_TEXTBOX_AUTO_CURSOR_COOLDOWN;

  /// See [RaylibGuiConstants.RAYGUI_TEXTBOX_AUTO_CURSOR_DELAY].
  int get RAYGUI_TEXTBOX_AUTO_CURSOR_DELAY => RaylibGuiConstants.RAYGUI_TEXTBOX_AUTO_CURSOR_DELAY;

  /// See [RaylibGuiConstants.RAYGUI_VALUEBOX_MAX_CHARS].
  int get RAYGUI_VALUEBOX_MAX_CHARS => RaylibGuiConstants.RAYGUI_VALUEBOX_MAX_CHARS;

  /// See [RaylibGuiConstants.RAYGUI_COLORBARALPHA_CHECKED_SIZE].
  int get RAYGUI_COLORBARALPHA_CHECKED_SIZE => RaylibGuiConstants.RAYGUI_COLORBARALPHA_CHECKED_SIZE;

  /// See [RaylibGuiConstants.RAYGUI_MESSAGEBOX_BUTTON_HEIGHT].
  int get RAYGUI_MESSAGEBOX_BUTTON_HEIGHT => RaylibGuiConstants.RAYGUI_MESSAGEBOX_BUTTON_HEIGHT;

  /// See [RaylibGuiConstants.RAYGUI_MESSAGEBOX_BUTTON_PADDING].
  int get RAYGUI_MESSAGEBOX_BUTTON_PADDING => RaylibGuiConstants.RAYGUI_MESSAGEBOX_BUTTON_PADDING;

  /// See [RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_BUTTON_HEIGHT].
  int get RAYGUI_TEXTINPUTBOX_BUTTON_HEIGHT => RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_BUTTON_HEIGHT;

  /// See [RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_BUTTON_PADDING].
  int get RAYGUI_TEXTINPUTBOX_BUTTON_PADDING => RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_BUTTON_PADDING;

  /// See [RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_HEIGHT].
  int get RAYGUI_TEXTINPUTBOX_HEIGHT => RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_HEIGHT;

  /// See [RaylibGuiConstants.RAYGUI_GRID_ALPHA].
  double get RAYGUI_GRID_ALPHA => RaylibGuiConstants.RAYGUI_GRID_ALPHA;

  /// See [RaylibGuiConstants.RAYGUI_ICON_TEXT_PADDING].
  int get RAYGUI_ICON_TEXT_PADDING => RaylibGuiConstants.RAYGUI_ICON_TEXT_PADDING;

  /// See [RaylibGuiConstants.RAYGUI_MAX_TEXT_LINES].
  int get RAYGUI_MAX_TEXT_LINES => RaylibGuiConstants.RAYGUI_MAX_TEXT_LINES;

  /// See [RaylibGuiConstants.RAYGUI_ICONS].
  List<int> get RAYGUI_ICONS => RaylibGuiConstants.RAYGUI_ICONS;

}

/// Backend-agnostic contract for the Raygui module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibGuiFlat<R extends RaylibBase> extends RaylibModule<R> with RaylibGuiModuleExtras<R> {

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = _RaylibGuiDartCaptureIds();

  RaylibGuiFlat(super.rl);

  /// Enable gui controls (global state)
  void GuiEnable();

  /// Disable gui controls (global state)
  void GuiDisable();

  /// Lock gui controls (global state)
  void GuiLock();

  /// Unlock gui controls (global state)
  void GuiUnlock();

  /// Check if gui is locked (global state)
  bool GuiIsLocked();

  /// Set gui controls alpha (global state), alpha goes from 0.0 to 1.0
  void GuiSetAlpha(
    double alpha,
  );

  /// Set gui state (global state)
  void GuiSetState(
    int state,
  );

  /// Get gui state (global state)
  int GuiGetState();

  /// Set gui custom font (global state)
  void GuiSetFont(
    Font font,
  );

  /// Get gui custom font (global state)
  Font GuiGetFont();

  /// Set one style property
  void GuiSetStyle(
    int control,
    int property,
    int value,
  );

  /// Get one style property
  int GuiGetStyle(
    int control,
    int property,
  );

  /// Load style file over global style variable (.rgs)
  void GuiLoadStyle(
    XPtr<XChar> fileName,
  );

  /// Load style from memory (binary only)
  void GuiLoadStyleFromMemory(
    XPtr<XUnsignedChar> fileData,
    int dataSize,
  );

  /// Load style default over global style
  void GuiLoadStyleDefault();

  /// Enable gui tooltips (global state)
  void GuiEnableTooltip();

  /// Disable gui tooltips (global state)
  void GuiDisableTooltip();

  /// Set tooltip string
  void GuiSetTooltip(
    XPtr<XChar> tooltip,
  );

  /// Get text with icon id prepended (if supported)
  XPtr<XChar> GuiIconText(
    int iconId,
    XPtr<XChar> text,
  );

  /// Set default icon drawing size
  void GuiSetIconScale(
    int scale,
  );

  /// Get raygui icons data
  XPtr<XUnsignedInt> GuiGetIcons();

  /// Load raygui icons file (.rgi) into internal icons data
  XPtr<XRawPtr<XChar>> GuiLoadIcons(
    XPtr<XChar> fileName,
    bool loadIconsName,
  );

  /// Load raygui icons file (.rgi) from memory into internal icons data
  XPtr<XRawPtr<XChar>> GuiLoadIconsFromMemory(
    XPtr<XUnsignedChar> fileData,
    int dataSize,
    bool loadIconsName,
  );

  /// Draw icon using pixel size at specified position
  void GuiDrawIcon(
    int iconId,
    int posX,
    int posY,
    int pixelSize,
    Color color,
  );

  /// Get text width considering gui style and icon size (if required)
  int GuiGetTextWidth(
    XPtr<XChar> text,
  );

  /// Window Box control, shows a window that can be closed
  int GuiWindowBox(
    Rectangle bounds,
    XPtr<XChar> title,
  );

  /// Group Box control with text name
  int GuiGroupBox(
    Rectangle bounds,
    XPtr<XChar> text,
  );

  /// Line separator control, could contain text
  int GuiLine(
    Rectangle bounds,
    XPtr<XChar> text,
  );

  /// Panel control, useful to group controls
  int GuiPanel(
    Rectangle bounds,
    XPtr<XChar> text,
  );

  /// Scroll Panel control
  int GuiScrollPanel(
    Rectangle bounds,
    XPtr<XChar> text,
    Rectangle content,
    XStructPtr<Vector2> scroll,
    XStructPtr<Rectangle> view,
  );

  /// Label control
  int GuiLabel(
    Rectangle bounds,
    XPtr<XChar> text,
  );

  /// Button control, returns true when clicked
  int GuiButton(
    Rectangle bounds,
    XPtr<XChar> text,
  );

  /// Label button control, returns true when clicked
  int GuiLabelButton(
    Rectangle bounds,
    XPtr<XChar> text,
  );

  /// Toggle Button control
  int GuiToggle(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XBool> active,
  );

  /// Toggle Group control
  int GuiToggleGroup(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> active,
  );

  /// Toggle Slider control
  int GuiToggleSlider(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> active,
  );

  /// Check Box control, returns true when active
  int GuiCheckBox(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XBool> checked,
  );

  /// Combo Box control
  int GuiComboBox(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> active,
  );

  /// Dropdown Box control
  int GuiDropdownBox(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> active,
    bool editMode,
  );

  /// Spinner control
  int GuiSpinner(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> value,
    int minValue,
    int maxValue,
    bool editMode,
  );

  /// Value Box control, updates input text with numbers
  int GuiValueBox(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> value,
    int minValue,
    int maxValue,
    bool editMode,
  );

  /// Value box control for float values
  int GuiValueBoxFloat(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XChar> textValue,
    XPtr<XFloat> value,
    bool editMode,
  );

  /// Text Box control, updates input text
  int GuiTextBox(
    Rectangle bounds,
    XPtr<XChar> text,
    int textSize,
    bool editMode,
  );

  /// Slider control
  int GuiSlider(
    Rectangle bounds,
    XPtr<XChar> textLeft,
    XPtr<XChar> textRight,
    XPtr<XFloat> value,
    double minValue,
    double maxValue,
  );

  /// Slider Bar control
  int GuiSliderBar(
    Rectangle bounds,
    XPtr<XChar> textLeft,
    XPtr<XChar> textRight,
    XPtr<XFloat> value,
    double minValue,
    double maxValue,
  );

  /// Progress Bar control
  int GuiProgressBar(
    Rectangle bounds,
    XPtr<XChar> textLeft,
    XPtr<XChar> textRight,
    XPtr<XFloat> value,
    double minValue,
    double maxValue,
  );

  /// Status Bar control, shows info text
  int GuiStatusBar(
    Rectangle bounds,
    XPtr<XChar> text,
  );

  /// Dummy control for placeholders
  int GuiDummyRec(
    Rectangle bounds,
    XPtr<XChar> text,
  );

  /// Grid control
  int GuiGrid(
    Rectangle bounds,
    XPtr<XChar> text,
    double spacing,
    int subdivs,
    XStructPtr<Vector2> mouseCell,
  );

  /// List View control
  int GuiListView(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> scrollIndex,
    XPtr<XInt> active,
  );

  /// List View control, using text entries list and returning focus entry
  int GuiListViewEx(
    Rectangle bounds,
    XPtr<XRawPtr<XChar>> text,
    int count,
    XPtr<XInt> scrollIndex,
    XPtr<XInt> active,
    XPtr<XInt> focus,
  );

  /// Tab Bar control
  int GuiTabBar(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> hscroll,
    XPtr<XInt> active,
  );

  /// Tab Bar control, using text entries list and returning focus entry
  int GuiTabBarEx(
    Rectangle bounds,
    XPtr<XRawPtr<XChar>> text,
    int count,
    XPtr<XInt> hscroll,
    XPtr<XInt> active,
    XPtr<XInt> focus,
  );

  /// Message Box control, displays a message
  int GuiMessageBox(
    Rectangle bounds,
    XPtr<XChar> title,
    XPtr<XChar> message,
    XPtr<XChar> btnText,
    XPtr<XInt> btnActive,
  );

  /// Text Input Box control, ask for text, supports secret
  int GuiTextInputBox(
    Rectangle bounds,
    XPtr<XChar> title,
    XPtr<XChar> message,
    XPtr<XChar> text,
    int textSize,
    XPtr<XChar> btnText,
    XPtr<XInt> btnActive,
    XPtr<XBool> secretViewActive,
  );

  /// Color Picker control, includes Color bar controls
  int GuiColorPicker(
    Rectangle bounds,
    XPtr<XChar> text,
    XStructPtr<Color> color,
  );

  /// Color Panel control
  int GuiColorPanel(
    Rectangle bounds,
    XPtr<XChar> text,
    XStructPtr<Color> color,
  );

  /// Color Bar Alpha control
  int GuiColorBarAlpha(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XFloat> alpha,
  );

  /// Color Bar Hue control
  int GuiColorBarHue(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XFloat> value,
  );

  /// Color Picker control, using Hue-Saturation-Value color data, includes Color bar controls
  int GuiColorPickerHSV(
    Rectangle bounds,
    XPtr<XChar> text,
    XStructPtr<Vector3> colorHsv,
  );

  /// Color Panel control, using Hue-Saturation-Value color data
  int GuiColorPanelHSV(
    Rectangle bounds,
    XPtr<XChar> text,
    XStructPtr<Vector3> colorHsv,
  );
}
