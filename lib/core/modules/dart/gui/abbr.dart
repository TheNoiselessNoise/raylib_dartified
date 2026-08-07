import 'package:raylib_dartified/raylib_dartified.dart';

RaylibGuiD get _module => Raylib.instance.GuiD;

/// See [RaylibGuiD.GuiEnable].
void GuiEnable() => _module.GuiEnable();

/// See [RaylibGuiD.GuiDisable].
void GuiDisable() => _module.GuiDisable();

/// See [RaylibGuiD.GuiLock].
void GuiLock() => _module.GuiLock();

/// See [RaylibGuiD.GuiUnlock].
void GuiUnlock() => _module.GuiUnlock();

/// See [RaylibGuiD.GuiIsLocked].
bool GuiIsLocked() => _module.GuiIsLocked();

/// See [RaylibGuiD.GuiSetAlpha].
void GuiSetAlpha(
  num alpha,
) => _module.GuiSetAlpha(alpha);

/// See [RaylibGuiD.GuiSetState].
void GuiSetState(
  GuiState state,
) => _module.GuiSetState(state);

/// See [RaylibGuiD.GuiGetState].
int GuiGetState() => _module.GuiGetState();

/// See [RaylibGuiD.GuiSetFont].
void GuiSetFont(
  FontD font,
) => _module.GuiSetFont(font);

/// See [RaylibGuiD.GuiGetFont].
FontD GuiGetFont() => _module.GuiGetFont();

/// See [RaylibGuiD.GuiSetStyle].
void GuiSetStyle(
  GuiControl control,
  GuiProperty property,
  num value,
) => _module.GuiSetStyle(control, property, value);

/// See [RaylibGuiD.GuiGetStyle].
int GuiGetStyle(
  GuiControl control,
  GuiProperty property,
) => _module.GuiGetStyle(control, property);

/// See [RaylibGuiD.GuiLoadStyle].
void GuiLoadStyle(
  String fileName,
) => _module.GuiLoadStyle(fileName);

/// See [RaylibGuiD.GuiLoadStyleDefault].
void GuiLoadStyleDefault() => _module.GuiLoadStyleDefault();

/// See [RaylibGuiD.GuiEnableTooltip].
void GuiEnableTooltip() => _module.GuiEnableTooltip();

/// See [RaylibGuiD.GuiDisableTooltip].
void GuiDisableTooltip() => _module.GuiDisableTooltip();

/// See [RaylibGuiD.GuiSetTooltip].
void GuiSetTooltip(
  String? tooltip,
) => _module.GuiSetTooltip(tooltip);

/// See [RaylibGuiD.GuiIconText].
String GuiIconText(
  GuiIconName iconId,
  String? text,
) => _module.GuiIconText(iconId, text);

/// See [RaylibGuiD.GuiSetIconScale].
void GuiSetIconScale(
  num scale,
) => _module.GuiSetIconScale(scale);

/// See [RaylibGuiD.GuiGetIcons].
List<int> GuiGetIcons() => _module.GuiGetIcons();

/// See [RaylibGuiD.GuiLoadIcons].
List<String> GuiLoadIcons(
  String fileName,
  bool loadIconsName,
) => _module.GuiLoadIcons(fileName, loadIconsName);

/// See [RaylibGuiD.GuiDrawIcon].
void GuiDrawIcon(
  GuiIconName iconId,
  num posX,
  num posY,
  num pixelSize,
  ColorD color,
) => _module.GuiDrawIcon(iconId, posX, posY, pixelSize, color);

/// See [RaylibGuiD.GuiGetTextWidth].
int GuiGetTextWidth(
  String? text,
) => _module.GuiGetTextWidth(text);

/// See [RaylibGuiD.GuiWindowBox].
int GuiWindowBox(
  RectangleD bounds,
  String? title,
) => _module.GuiWindowBox(bounds, title);

/// See [RaylibGuiD.GuiGroupBox].
int GuiGroupBox(
  RectangleD bounds,
  String? text,
) => _module.GuiGroupBox(bounds, text);

/// See [RaylibGuiD.GuiLine].
int GuiLine(
  RectangleD bounds,
  String? text,
) => _module.GuiLine(bounds, text);

/// See [RaylibGuiD.GuiPanel].
int GuiPanel(
  RectangleD bounds,
  String? text,
) => _module.GuiPanel(bounds, text);

/// See [RaylibGuiD.GuiTabBar].
(int tab, int active) GuiTabBar(
  RectangleD bounds,
  List<String> text,
) => _module.GuiTabBar(bounds, text);

/// See [RaylibGuiD.GuiScrollPanel].
int GuiScrollPanel(
  RectangleD bounds,
  String? text,
  RectangleD content,
  Vector2D scroll,
  [RectangleD? view]
) => _module.GuiScrollPanel(bounds, text, content, scroll, view);

/// See [RaylibGuiD.GuiLabel].
int GuiLabel(
  RectangleD bounds,
  String? text,
) => _module.GuiLabel(bounds, text);

/// See [RaylibGuiD.GuiButton].
int GuiButton(
  RectangleD bounds,
  String? text,
) => _module.GuiButton(bounds, text);

/// See [RaylibGuiD.GuiLabelButton].
int GuiLabelButton(
  RectangleD bounds,
  String? text,
) => _module.GuiLabelButton(bounds, text);

/// See [RaylibGuiD.GuiToggle].
(int result, bool active) GuiToggle(
  RectangleD bounds,
  String? text,
  bool active,
) => _module.GuiToggle(bounds, text, active);

/// See [RaylibGuiD.GuiToggleGroup].
(int result, int active) GuiToggleGroup(
  RectangleD bounds,
  String? text,
  num active,
) => _module.GuiToggleGroup(bounds, text, active);

/// See [RaylibGuiD.GuiToggleSlider].
(int result, int active) GuiToggleSlider(
  RectangleD bounds,
  String? text,
  num active,
) => _module.GuiToggleSlider(bounds, text, active);

/// See [RaylibGuiD.GuiCheckBox].
(int result, bool checked) GuiCheckBox(
  RectangleD bounds,
  String? text,
  bool checked,
) => _module.GuiCheckBox(bounds, text, checked);

/// See [RaylibGuiD.GuiComboBox].
(int result, int active) GuiComboBox(
  RectangleD bounds,
  String? text,
  num active,
) => _module.GuiComboBox(bounds, text, active);

/// See [RaylibGuiD.GuiDropdownBox].
(int result, int active) GuiDropdownBox(
  RectangleD bounds,
  String? text,
  num active,
  bool editMode,
) => _module.GuiDropdownBox(bounds, text, active, editMode);

/// See [RaylibGuiD.GuiSpinner].
(int result, int value) GuiSpinner(
  RectangleD bounds,
  String? text,
  num value,
  num minValue,
  num maxValue,
  bool editMode,
) => _module.GuiSpinner(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiD.GuiValueBox].
(int result, int value) GuiValueBox(
  RectangleD bounds,
  String? text,
  num value,
  num minValue,
  num maxValue,
  bool editMode,
) => _module.GuiValueBox(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiD.GuiValueBoxFloat].
(int result, double value) GuiValueBoxFloat(
  RectangleD bounds,
  String? text,
  String textValue,
  num value,
  bool editMode,
) => _module.GuiValueBoxFloat(bounds, text, textValue, value, editMode);

/// See [RaylibGuiD.GuiTextBox].
(int result, String value) GuiTextBox(
  RectangleD bounds,
  String? text,
  num textSize,
  bool editMode,
) => _module.GuiTextBox(bounds, text, textSize, editMode);

/// See [RaylibGuiD.GuiSlider].
(int result, double value) GuiSlider(
  RectangleD bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiD.GuiSliderBar].
(int result, double value) GuiSliderBar(
  RectangleD bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiD.GuiProgressBar].
(int result, double value) GuiProgressBar(
  RectangleD bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiD.GuiStatusBar].
int GuiStatusBar(
  RectangleD bounds,
  String? text,
) => _module.GuiStatusBar(bounds, text);

/// See [RaylibGuiD.GuiDummyRec].
int GuiDummyRec(
  RectangleD bounds,
  String? text,
) => _module.GuiDummyRec(bounds, text);

/// See [RaylibGuiD.GuiGrid].
int GuiGrid(
  RectangleD bounds,
  num spacing,
  num subdivs,
  [Vector2D? mouseCell]
) => _module.GuiGrid(bounds, spacing, subdivs, mouseCell);

/// See [RaylibGuiD.GuiListView].
(int result, int? scrollIndex, int? active) GuiListView(
  RectangleD bounds,
  String? text, {
    int? scrollIndex,
    int? active,
  }
) => _module.GuiListView(bounds, text, scrollIndex: scrollIndex, active: active);

/// See [RaylibGuiD.GuiListViewEx].
(int result, int? scrollIndex, int? active, int? focus) GuiListViewEx(
  RectangleD bounds,
  List<String>? text, {
    int? scrollIndex,
    int? active,
    int? focus,
  }
) => _module.GuiListViewEx(bounds, text, scrollIndex: scrollIndex, active: active, focus: focus);

/// See [RaylibGuiD.GuiMessageBox].
int GuiMessageBox(
  RectangleD bounds,
  String? title,
  String message,
  String buttons,
) => _module.GuiMessageBox(bounds, title, message, buttons);

/// See [RaylibGuiD.GuiTextInputBox].
(int result, String value, bool? secretViewActive) GuiTextInputBox(
  RectangleD bounds,
  String? title,
  String? message,
  String buttons,
  String? text,
  num textMaxSize,
  bool? secretViewActive,
) => _module.GuiTextInputBox(bounds, title, message, buttons, text, textMaxSize, secretViewActive);

/// See [RaylibGuiD.GuiColorPicker].
(int result, ColorD color) GuiColorPicker(
  RectangleD bounds,
  ColorD? color,
) => _module.GuiColorPicker(bounds, color);

/// See [RaylibGuiD.GuiColorPanel].
(int result, ColorD color) GuiColorPanel(
  RectangleD bounds,
  ColorD color,
) => _module.GuiColorPanel(bounds, color);

/// See [RaylibGuiD.GuiColorBarAlpha].
(int result, double alpha) GuiColorBarAlpha(
  RectangleD bounds,
  num alpha,
) => _module.GuiColorBarAlpha(bounds, alpha);

/// See [RaylibGuiD.GuiColorBarHue].
(int result, double value) GuiColorBarHue(
  RectangleD bounds,
  num value,
) => _module.GuiColorBarHue(bounds, value);

/// See [RaylibGuiD.GuiColorPickerHSV].
(int result, Vector3D hsv) GuiColorPickerHSV(
  RectangleD bounds,
  [Vector3D? colorHsv]
) => _module.GuiColorPickerHSV(bounds, colorHsv);

/// See [RaylibGuiD.GuiColorPanelHSV].
(int result, Vector3D hsv) GuiColorPanelHSV(
  RectangleD bounds,
  [Vector3D? colorHsv]
) => _module.GuiColorPanelHSV(bounds, colorHsv);

