part of '../../../raylib_dartified.dart';

class RaylibGui extends RaylibModule<Raylib> with RaylibGuiModuleExtras<Raylib> {
  RaylibGui(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibGui>();

  /// Enable gui controls (global state)
  void GuiEnable()
    => _GuiEnable();
  late final _GuiEnablePtr = _lookup<NativeFunction<Void Function()>>('GuiEnable');
  late final _GuiEnable = _GuiEnablePtr.asFunction<void Function()>();

  /// Disable gui controls (global state)
  void GuiDisable()
    => _GuiDisable();
  late final _GuiDisablePtr = _lookup<NativeFunction<Void Function()>>('GuiDisable');
  late final _GuiDisable = _GuiDisablePtr.asFunction<void Function()>();

  /// Lock gui controls (global state)
  void GuiLock()
    => _GuiLock();
  late final _GuiLockPtr = _lookup<NativeFunction<Void Function()>>('GuiLock');
  late final _GuiLock = _GuiLockPtr.asFunction<void Function()>();

  /// Unlock gui controls (global state)
  void GuiUnlock()
    => _GuiUnlock();
  late final _GuiUnlockPtr = _lookup<NativeFunction<Void Function()>>('GuiUnlock');
  late final _GuiUnlock = _GuiUnlockPtr.asFunction<void Function()>();

  /// Check if gui is locked (global state)
  bool GuiIsLocked()
    => _GuiIsLocked();
  late final _GuiIsLockedPtr = _lookup<NativeFunction<Bool Function()>>('GuiIsLocked');
  late final _GuiIsLocked = _GuiIsLockedPtr.asFunction<bool Function()>();

  /// Set gui controls alpha (global state), alpha goes from 0.0 to 1.0
  void GuiSetAlpha(double alpha)
    => _GuiSetAlpha(alpha);
  late final _GuiSetAlphaPtr = _lookup<NativeFunction<Void Function(Float)>>('GuiSetAlpha');
  late final _GuiSetAlpha = _GuiSetAlphaPtr.asFunction<void Function(double)>();

  /// Set gui state (global state)
  void GuiSetState(int state)
    => _GuiSetState(state);
  late final _GuiSetStatePtr = _lookup<NativeFunction<Void Function(Int)>>('GuiSetState');
  late final _GuiSetState = _GuiSetStatePtr.asFunction<void Function(int)>();

  /// Get gui state (global state)
  int GuiGetState()
    => _GuiGetState();
  late final _GuiGetStatePtr = _lookup<NativeFunction<Int Function()>>('GuiGetState');
  late final _GuiGetState = _GuiGetStatePtr.asFunction<int Function()>();

  /// Set gui custom font (global state)
  void GuiSetFont(FontC font)
    => _GuiSetFont(font);
  late final _GuiSetFontPtr = _lookup<NativeFunction<Void Function(FontC)>>('GuiSetFont');
  late final _GuiSetFont = _GuiSetFontPtr.asFunction<void Function(FontC)>();

  /// Get gui custom font (global state)
  FontC GuiGetFont()
    => _GuiGetFont();
  late final _GuiGetFontPtr = _lookup<NativeFunction<FontC Function()>>('GuiGetFont');
  late final _GuiGetFont = _GuiGetFontPtr.asFunction<FontC Function()>();

  /// Set one style property
  void GuiSetStyle(int control, int property, int value)
    => _GuiSetStyle(control, property, value);
  late final _GuiSetStylePtr = _lookup<NativeFunction<Void Function(Int, Int, Int)>>('GuiSetStyle');
  late final _GuiSetStyle = _GuiSetStylePtr.asFunction<void Function(int, int, int)>();

  /// Get one style property
  int GuiGetStyle(int control, int property)
    => _GuiGetStyle(control, property);
  late final _GuiGetStylePtr = _lookup<NativeFunction<Int Function(Int, Int)>>('GuiGetStyle');
  late final _GuiGetStyle = _GuiGetStylePtr.asFunction<int Function(int, int)>();

  /// Load style file over global style variable (.rgs)
  void GuiLoadStyle(Pointer<Char> fileName)
    => _GuiLoadStyle(fileName);
  late final _GuiLoadStylePtr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('GuiLoadStyle');
  late final _GuiLoadStyle = _GuiLoadStylePtr.asFunction<void Function(Pointer<Char>)>();

  /// Load style default over global style
  void GuiLoadStyleDefault()
    => _GuiLoadStyleDefault();
  late final _GuiLoadStyleDefaultPtr = _lookup<NativeFunction<Void Function()>>('GuiLoadStyleDefault');
  late final _GuiLoadStyleDefault = _GuiLoadStyleDefaultPtr.asFunction<void Function()>();

  /// Enable gui tooltips (global state)
  void GuiEnableTooltip()
    => _GuiEnableTooltip();
  late final _GuiEnableTooltipPtr = _lookup<NativeFunction<Void Function()>>('GuiEnableTooltip');
  late final _GuiEnableTooltip = _GuiEnableTooltipPtr.asFunction<void Function()>();

  /// Disable gui tooltips (global state)
  void GuiDisableTooltip()
    => _GuiDisableTooltip();
  late final _GuiDisableTooltipPtr = _lookup<NativeFunction<Void Function()>>('GuiDisableTooltip');
  late final _GuiDisableTooltip = _GuiDisableTooltipPtr.asFunction<void Function()>();

  /// Set tooltip string
  void GuiSetTooltip(Pointer<Char> tooltip)
    => _GuiSetTooltip(tooltip);
  late final _GuiSetTooltipPtr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('GuiSetTooltip');
  late final _GuiSetTooltip = _GuiSetTooltipPtr.asFunction<void Function(Pointer<Char>)>();

  /// Get text with icon id prepended (if supported)
  Pointer<Char> GuiIconText(int iconId, Pointer<Char> text)
    => _GuiIconText(iconId, text);
  late final _GuiIconTextPtr = _lookup<NativeFunction<Pointer<Char> Function(Int, Pointer<Char>)>>('GuiIconText');
  late final _GuiIconText = _GuiIconTextPtr.asFunction<Pointer<Char> Function(int, Pointer<Char>)>();

  /// Set default icon drawing size
  void GuiSetIconScale(int scale)
    => _GuiSetIconScale(scale);
  late final _GuiSetIconScalePtr = _lookup<NativeFunction<Void Function(Int)>>('GuiSetIconScale');
  late final _GuiSetIconScale = _GuiSetIconScalePtr.asFunction<void Function(int)>();

  /// Get raygui icons data
  Pointer<UnsignedInt> GuiGetIcons()
    => _GuiGetIcons();
  late final _GuiGetIconsPtr = _lookup<NativeFunction<Pointer<UnsignedInt> Function()>>('GuiGetIcons');
  late final _GuiGetIcons = _GuiGetIconsPtr.asFunction<Pointer<UnsignedInt> Function()>();

  /// Load raygui icons file (.rgi) into internal icons data
  Pointer<Pointer<Char>> GuiLoadIcons(Pointer<Char> fileName, bool loadIconsName)
    => _GuiLoadIcons(fileName, loadIconsName);
  late final _GuiLoadIconsPtr = _lookup<NativeFunction<Pointer<Pointer<Char>> Function(Pointer<Char>, Bool)>>('GuiLoadIcons');
  late final _GuiLoadIcons = _GuiLoadIconsPtr.asFunction<Pointer<Pointer<Char>> Function(Pointer<Char>, bool)>();

  /// Draw icon using pixel size at specified position
  void GuiDrawIcon(int iconId, int posX, int posY, int pixelSize, ColorC color)
    => _GuiDrawIcon(iconId, posX, posY, pixelSize, color);
  late final _GuiDrawIconPtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, ColorC)>>('GuiDrawIcon');
  late final _GuiDrawIcon = _GuiDrawIconPtr.asFunction<void Function(int, int, int, int, ColorC)>();

  /// Get text width considering gui style and icon size (if required)
  int GuiGetTextWidth(Pointer<Char> text)
    => _GuiGetTextWidth(text);
  late final _GuiGetTextWidthPtr = _lookup<NativeFunction<Int Function(Pointer<Char>)>>('GuiGetTextWidth');
  late final _GuiGetTextWidth = _GuiGetTextWidthPtr.asFunction<int Function(Pointer<Char>)>();

  /// Window Box control, shows a window that can be closed
  int GuiWindowBox(RectangleC bounds, Pointer<Char> title)
    => _GuiWindowBox(bounds, title);
  late final _GuiWindowBoxPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>('GuiWindowBox');
  late final _GuiWindowBox = _GuiWindowBoxPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  /// Group Box control with text name
  int GuiGroupBox(RectangleC bounds, Pointer<Char> text)
    => _GuiGroupBox(bounds, text);
  late final _GuiGroupBoxPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>('GuiGroupBox');
  late final _GuiGroupBox = _GuiGroupBoxPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  /// Line separator control, could contain text
  int GuiLine(RectangleC bounds, Pointer<Char> text)
    => _GuiLine(bounds, text);
  late final _GuiLinePtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>('GuiLine');
  late final _GuiLine = _GuiLinePtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  /// Panel control, useful to group controls
  int GuiPanel(RectangleC bounds, Pointer<Char> text)
    => _GuiPanel(bounds, text);
  late final _GuiPanelPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>('GuiPanel');
  late final _GuiPanel = _GuiPanelPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  /// Tab Bar control, returns TAB to be closed or -1
  int GuiTabBar(RectangleC bounds, Pointer<Pointer<Char>> text, int count, Pointer<Int> active)
    => _GuiTabBar(bounds, text, count, active);
  late final _GuiTabBarPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Pointer<Char>>, Int, Pointer<Int>)>>('GuiTabBar');
  late final _GuiTabBar = _GuiTabBarPtr.asFunction<int Function(RectangleC, Pointer<Pointer<Char>>, int, Pointer<Int>)>();

  /// Scroll Panel control
  int GuiScrollPanel(RectangleC bounds, Pointer<Char> text, RectangleC content, Pointer<Vector2C> scroll, Pointer<RectangleC> view)
    => _GuiScrollPanel(bounds, text, content, scroll, view);
  late final _GuiScrollPanelPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, RectangleC, Pointer<Vector2C>, Pointer<RectangleC>)>>('GuiScrollPanel');
  late final _GuiScrollPanel = _GuiScrollPanelPtr.asFunction<int Function(RectangleC, Pointer<Char>, RectangleC, Pointer<Vector2C>, Pointer<RectangleC>)>();

  /// Label control
  int GuiLabel(RectangleC bounds, Pointer<Char> text)
    => _GuiLabel(bounds, text);
  late final _GuiLabelPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>('GuiLabel');
  late final _GuiLabel = _GuiLabelPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  /// Button control, returns true when clicked
  int GuiButton(RectangleC bounds, Pointer<Char> text)
    => _GuiButton(bounds, text);
  late final _GuiButtonPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>('GuiButton');
  late final _GuiButton = _GuiButtonPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  /// Label button control, returns true when clicked
  int GuiLabelButton(RectangleC bounds, Pointer<Char> text)
    => _GuiLabelButton(bounds, text);
  late final _GuiLabelButtonPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>('GuiLabelButton');
  late final _GuiLabelButton = _GuiLabelButtonPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  /// Toggle Button control
  int GuiToggle(RectangleC bounds, Pointer<Char> text, Pointer<Bool> active)
    => _GuiToggle(bounds, text, active);
  late final _GuiTogglePtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Bool>)>>('GuiToggle');
  late final _GuiToggle = _GuiTogglePtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Bool>)>();

  /// Toggle Group control
  int GuiToggleGroup(RectangleC bounds, Pointer<Char> text, Pointer<Int> active)
    => _GuiToggleGroup(bounds, text, active);
  late final _GuiToggleGroupPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Int>)>>('GuiToggleGroup');
  late final _GuiToggleGroup = _GuiToggleGroupPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Int>)>();

  /// Toggle Slider control
  int GuiToggleSlider(RectangleC bounds, Pointer<Char> text, Pointer<Int> active)
    => _GuiToggleSlider(bounds, text, active);
  late final _GuiToggleSliderPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Int>)>>('GuiToggleSlider');
  late final _GuiToggleSlider = _GuiToggleSliderPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Int>)>();

  /// Check Box control, returns true when active
  int GuiCheckBox(RectangleC bounds, Pointer<Char> text, Pointer<Bool> checked)
    => _GuiCheckBox(bounds, text, checked);
  late final _GuiCheckBoxPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Bool>)>>('GuiCheckBox');
  late final _GuiCheckBox = _GuiCheckBoxPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Bool>)>();

  /// Combo Box control
  int GuiComboBox(RectangleC bounds, Pointer<Char> text, Pointer<Int> active)
    => _GuiComboBox(bounds, text, active);
  late final _GuiComboBoxPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Int>)>>('GuiComboBox');
  late final _GuiComboBox = _GuiComboBoxPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Int>)>();

  /// Dropdown Box control
  int GuiDropdownBox(RectangleC bounds, Pointer<Char> text, Pointer<Int> active, bool editMode)
    => _GuiDropdownBox(bounds, text, active, editMode);
  late final _GuiDropdownBoxPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Int>, Bool)>>('GuiDropdownBox');
  late final _GuiDropdownBox = _GuiDropdownBoxPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Int>, bool)>();

  /// Spinner control
  int GuiSpinner(RectangleC bounds, Pointer<Char> text, Pointer<Int> value, int minValue, int maxValue, bool editMode)
    => _GuiSpinner(bounds, text, value, minValue, maxValue, editMode);
  late final _GuiSpinnerPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Int>, Int, Int, Bool)>>('GuiSpinner');
  late final _GuiSpinner = _GuiSpinnerPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Int>, int, int, bool)>();

  /// Value Box control, updates input text with numbers
  int GuiValueBox(RectangleC bounds, Pointer<Char> text, Pointer<Int> value, int minValue, int maxValue, bool editMode)
    => _GuiValueBox(bounds, text, value, minValue, maxValue, editMode);
  late final _GuiValueBoxPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Int>, Int, Int, Bool)>>('GuiValueBox');
  late final _GuiValueBox = _GuiValueBoxPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Int>, int, int, bool)>();

  /// Value box control for float values
  int GuiValueBoxFloat(RectangleC bounds, Pointer<Char> text, Pointer<Char> textValue, Pointer<Float> value, bool editMode)
    => _GuiValueBoxFloat(bounds, text, textValue, value, editMode);
  late final _GuiValueBoxFloatPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Float>, Bool)>>('GuiValueBoxFloat');
  late final _GuiValueBoxFloat = _GuiValueBoxFloatPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Float>, bool)>();

  /// Text Box control, updates input text
  int GuiTextBox(RectangleC bounds, Pointer<Char> text, int textSize, bool editMode)
    => _GuiTextBox(bounds, text, textSize, editMode);
  late final _GuiTextBoxPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Int, Bool)>>('GuiTextBox');
  late final _GuiTextBox = _GuiTextBoxPtr.asFunction<int Function(RectangleC, Pointer<Char>, int, bool)>();

  /// Slider control
  int GuiSlider(RectangleC bounds, Pointer<Char> textLeft, Pointer<Char> textRight, Pointer<Float> value, double minValue, double maxValue)
    => _GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue);
  late final _GuiSliderPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Float>, Float, Float)>>('GuiSlider');
  late final _GuiSlider = _GuiSliderPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Float>, double, double)>();

  /// Slider Bar control
  int GuiSliderBar(RectangleC bounds, Pointer<Char> textLeft, Pointer<Char> textRight, Pointer<Float> value, double minValue, double maxValue)
    => _GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue);
  late final _GuiSliderBarPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Float>, Float, Float)>>('GuiSliderBar');
  late final _GuiSliderBar = _GuiSliderBarPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Float>, double, double)>();

  /// Progress Bar control
  int GuiProgressBar(RectangleC bounds, Pointer<Char> textLeft, Pointer<Char> textRight, Pointer<Float> value, double minValue, double maxValue)
    => _GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue);
  late final _GuiProgressBarPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Float>, Float, Float)>>('GuiProgressBar');
  late final _GuiProgressBar = _GuiProgressBarPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Float>, double, double)>();

  /// Status Bar control, shows info text
  int GuiStatusBar(RectangleC bounds, Pointer<Char> text)
    => _GuiStatusBar(bounds, text);
  late final _GuiStatusBarPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>('GuiStatusBar');
  late final _GuiStatusBar = _GuiStatusBarPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  /// Dummy control for placeholders
  int GuiDummyRec(RectangleC bounds, Pointer<Char> text)
    => _GuiDummyRec(bounds, text);
  late final _GuiDummyRecPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>('GuiDummyRec');
  late final _GuiDummyRec = _GuiDummyRecPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  /// Grid control
  int GuiGrid(RectangleC bounds, Pointer<Char> text, double spacing, int subdivs, Pointer<Vector2C> mouseCell)
    => _GuiGrid(bounds, text, spacing, subdivs, mouseCell);
  late final _GuiGridPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Float, Int, Pointer<Vector2C>)>>('GuiGrid');
  late final _GuiGrid = _GuiGridPtr.asFunction<int Function(RectangleC, Pointer<Char>, double, int, Pointer<Vector2C>)>();

  /// List View control
  int GuiListView(RectangleC bounds, Pointer<Char> text, Pointer<Int> scrollIndex, Pointer<Int> active)
    => _GuiListView(bounds, text, scrollIndex, active);
  late final _GuiListViewPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Int>, Pointer<Int>)>>('GuiListView');
  late final _GuiListView = _GuiListViewPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Int>, Pointer<Int>)>();

  /// List View with extended parameters
  int GuiListViewEx(RectangleC bounds, Pointer<Pointer<Char>> text, int count, Pointer<Int> scrollIndex, Pointer<Int> active, Pointer<Int> focus)
    => _GuiListViewEx(bounds, text, count, scrollIndex, active, focus);
  late final _GuiListViewExPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Pointer<Char>>, Int, Pointer<Int>, Pointer<Int>, Pointer<Int>)>>('GuiListViewEx');
  late final _GuiListViewEx = _GuiListViewExPtr.asFunction<int Function(RectangleC, Pointer<Pointer<Char>>, int, Pointer<Int>, Pointer<Int>, Pointer<Int>)>();

  /// Message Box control, displays a message
  int GuiMessageBox(RectangleC bounds, Pointer<Char> title, Pointer<Char> message, Pointer<Char> buttons)
    => _GuiMessageBox(bounds, title, message, buttons);
  late final _GuiMessageBoxPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Char>)>>('GuiMessageBox');
  late final _GuiMessageBox = _GuiMessageBoxPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Char>)>();

  /// Text Input Box control, ask for text, supports secret
  int GuiTextInputBox(RectangleC bounds, Pointer<Char> title, Pointer<Char> message, Pointer<Char> buttons, Pointer<Char> text, int textMaxSize, Pointer<Bool> secretViewActive)
    => _GuiTextInputBox(bounds, title, message, buttons, text, textMaxSize, secretViewActive);
  late final _GuiTextInputBoxPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Char>, Pointer<Char>, Int, Pointer<Bool>)>>('GuiTextInputBox');
  late final _GuiTextInputBox = _GuiTextInputBoxPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Char>, Pointer<Char>, int, Pointer<Bool>)>();

  /// Color Picker control (multiple color controls)
  int GuiColorPicker(RectangleC bounds, Pointer<Char> text, Pointer<ColorC> color)
    => _GuiColorPicker(bounds, text, color);
  late final _GuiColorPickerPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<ColorC>)>>('GuiColorPicker');
  late final _GuiColorPicker = _GuiColorPickerPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<ColorC>)>();

  /// Color Panel control
  int GuiColorPanel(RectangleC bounds, Pointer<Char> text, Pointer<ColorC> color)
    => _GuiColorPanel(bounds, text, color);
  late final _GuiColorPanelPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<ColorC>)>>('GuiColorPanel');
  late final _GuiColorPanel = _GuiColorPanelPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<ColorC>)>();

  /// Color Bar Alpha control
  int GuiColorBarAlpha(RectangleC bounds, Pointer<Char> text, Pointer<Float> alpha)
    => _GuiColorBarAlpha(bounds, text, alpha);
  late final _GuiColorBarAlphaPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Float>)>>('GuiColorBarAlpha');
  late final _GuiColorBarAlpha = _GuiColorBarAlphaPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Float>)>();

  /// Color Bar Hue control
  int GuiColorBarHue(RectangleC bounds, Pointer<Char> text, Pointer<Float> value)
    => _GuiColorBarHue(bounds, text, value);
  late final _GuiColorBarHuePtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Float>)>>('GuiColorBarHue');
  late final _GuiColorBarHue = _GuiColorBarHuePtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Float>)>();

  /// Color Picker control that avoids conversion to RGB on each call (multiple color controls)
  int GuiColorPickerHSV(RectangleC bounds, Pointer<Char> text, Pointer<Vector3C> colorHsv)
    => _GuiColorPickerHSV(bounds, text, colorHsv);
  late final _GuiColorPickerHSVPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Vector3C>)>>('GuiColorPickerHSV');
  late final _GuiColorPickerHSV = _GuiColorPickerHSVPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Vector3C>)>();

  /// Color Panel control that updates Hue-Saturation-Value color value, used by GuiColorPickerHSV()
  int GuiColorPanelHSV(RectangleC bounds, Pointer<Char> text, Pointer<Vector3C> colorHsv)
    => _GuiColorPanelHSV(bounds, text, colorHsv);
  late final _GuiColorPanelHSVPtr = _lookup<NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Vector3C>)>>('GuiColorPanelHSV');
  late final _GuiColorPanelHSV = _GuiColorPanelHSVPtr.asFunction<int Function(RectangleC, Pointer<Char>, Pointer<Vector3C>)>();
}
