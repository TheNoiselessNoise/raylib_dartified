import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibGuiDart get _module => RaylibBase.instance.module();

/// See [RaylibGuiDart.GuiEnable].
void GuiEnable() => _module.GuiEnable();

/// See [RaylibGuiDart.GuiDisable].
void GuiDisable() => _module.GuiDisable();

/// See [RaylibGuiDart.GuiLock].
void GuiLock() => _module.GuiLock();

/// See [RaylibGuiDart.GuiUnlock].
void GuiUnlock() => _module.GuiUnlock();

/// See [RaylibGuiDart.GuiIsLocked].
bool GuiIsLocked() => _module.GuiIsLocked();

/// See [RaylibGuiDart.GuiSetAlpha].
void GuiSetAlpha(
  num alpha,
) => _module.GuiSetAlpha(alpha);

/// See [RaylibGuiDart.GuiSetState].
void GuiSetState(
  GuiState state,
) => _module.GuiSetState(state);

/// See [RaylibGuiDart.GuiGetState].
int GuiGetState() => _module.GuiGetState();

/// See [RaylibGuiDart.GuiSetFont].
void GuiSetFont(
  Font font,
) => _module.GuiSetFont(font);

/// See [RaylibGuiDart.GuiGetFont].
Font GuiGetFont() => _module.GuiGetFont();

/// See [RaylibGuiDart.GuiSetStyle].
void GuiSetStyle(
  GuiControl control,
  GuiProperty property,
  num value,
) => _module.GuiSetStyle(control, property, value);

/// See [RaylibGuiDart.GuiGetStyle].
int GuiGetStyle(
  GuiControl control,
  GuiProperty property,
) => _module.GuiGetStyle(control, property);

/// See [RaylibGuiDart.GuiLoadStyle].
void GuiLoadStyle(
  String fileName,
) => _module.GuiLoadStyle(fileName);

/// See [RaylibGuiDart.GuiLoadStyleFromMemory].
void GuiLoadStyleFromMemory(
  Uint8List fileData,
) => _module.GuiLoadStyleFromMemory(fileData);

/// See [RaylibGuiDart.GuiLoadStyleDefault].
void GuiLoadStyleDefault() => _module.GuiLoadStyleDefault();

/// See [RaylibGuiDart.GuiEnableTooltip].
void GuiEnableTooltip() => _module.GuiEnableTooltip();

/// See [RaylibGuiDart.GuiDisableTooltip].
void GuiDisableTooltip() => _module.GuiDisableTooltip();

/// See [RaylibGuiDart.GuiSetTooltip].
void GuiSetTooltip(
  String? tooltip,
) => _module.GuiSetTooltip(tooltip);

/// See [RaylibGuiDart.GuiIconText].
String GuiIconText(
  GuiIconName iconId,
  String? text,
) => _module.GuiIconText(iconId, text);

/// See [RaylibGuiDart.GuiSetIconScale].
void GuiSetIconScale(
  num scale,
) => _module.GuiSetIconScale(scale);

/// See [RaylibGuiDart.GuiGetIcons].
List<int> GuiGetIcons() => _module.GuiGetIcons();

/// See [RaylibGuiDart.GuiLoadIcons].
List<String> GuiLoadIcons(
  String fileName,
  bool loadIconsName,
) => _module.GuiLoadIcons(fileName, loadIconsName);

/// See [RaylibGuiDart.GuiLoadIconsFromMemory].
List<String> GuiLoadIconsFromMemory(
  Uint8List fileData,
  bool loadIconsName,
) => _module.GuiLoadIconsFromMemory(fileData, loadIconsName);

/// See [RaylibGuiDart.GuiDrawIcon].
void GuiDrawIcon(
  GuiIconName iconId,
  num posX,
  num posY,
  num pixelSize,
  Color color,
) => _module.GuiDrawIcon(iconId, posX, posY, pixelSize, color);

/// See [RaylibGuiDart.GuiGetTextWidth].
int GuiGetTextWidth(
  String? text,
) => _module.GuiGetTextWidth(text);

/// See [RaylibGuiDart.GuiWindowBox].
GuiResult GuiWindowBox(
  Rectangle bounds,
  String? title,
) => _module.GuiWindowBox(bounds, title);

/// See [RaylibGuiDart.GuiGroupBox].
GuiResult GuiGroupBox(
  Rectangle bounds,
  String? text,
) => _module.GuiGroupBox(bounds, text);

/// See [RaylibGuiDart.GuiLine].
GuiResult GuiLine(
  Rectangle bounds,
  String? text,
) => _module.GuiLine(bounds, text);

/// See [RaylibGuiDart.GuiPanel].
GuiResult GuiPanel(
  Rectangle bounds,
  String? text,
) => _module.GuiPanel(bounds, text);

/// See [RaylibGuiDart.GuiScrollPanel].
GuiResult GuiScrollPanel(
  Rectangle bounds,
  String? text,
  Rectangle content, {
  Vector2? scroll,
  Rectangle? view,
}) => _module.GuiScrollPanel(bounds, text, content, scroll: scroll, view: view);

/// See [RaylibGuiDart.GuiLabel].
GuiResult GuiLabel(
  Rectangle bounds,
  String? text,
) => _module.GuiLabel(bounds, text);

/// See [RaylibGuiDart.GuiButton].
GuiResult GuiButton(
  Rectangle bounds,
  String? text,
) => _module.GuiButton(bounds, text);

/// See [RaylibGuiDart.GuiLabelButton].
GuiResult GuiLabelButton(
  Rectangle bounds,
  String? text,
) => _module.GuiLabelButton(bounds, text);

/// See [RaylibGuiDart.GuiToggle].
(GuiResult result, bool active) GuiToggle(
  Rectangle bounds,
  String? text,
  bool active,
) => _module.GuiToggle(bounds, text, active);

/// See [RaylibGuiDart.GuiToggleGroup].
(GuiResult result, int active) GuiToggleGroup(
  Rectangle bounds,
  String? text,
  num active,
) => _module.GuiToggleGroup(bounds, text, active);

/// See [RaylibGuiDart.GuiToggleSlider].
(GuiResult result, int active) GuiToggleSlider(
  Rectangle bounds,
  String? text,
  num active,
) => _module.GuiToggleSlider(bounds, text, active);

/// See [RaylibGuiDart.GuiCheckBox].
(GuiResult result, bool checked) GuiCheckBox(
  Rectangle bounds,
  String? text,
  bool checked,
) => _module.GuiCheckBox(bounds, text, checked);

/// See [RaylibGuiDart.GuiComboBox].
(GuiResult result, int active) GuiComboBox(
  Rectangle bounds,
  String? text,
  num active,
) => _module.GuiComboBox(bounds, text, active);

/// See [RaylibGuiDart.GuiDropdownBox].
(GuiResult result, int active) GuiDropdownBox(
  Rectangle bounds,
  String? text,
  num active,
  bool editMode,
) => _module.GuiDropdownBox(bounds, text, active, editMode);

/// See [RaylibGuiDart.GuiSpinner].
(GuiResult result, int value) GuiSpinner(
  Rectangle bounds,
  String? text,
  num value,
  num minValue,
  num maxValue,
  bool editMode,
) => _module.GuiSpinner(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiDart.GuiValueBox].
(GuiResult result, int value) GuiValueBox(
  Rectangle bounds,
  String? text,
  num value,
  num minValue,
  num maxValue,
  bool editMode,
) => _module.GuiValueBox(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiDart.GuiValueBoxFloat].
(GuiResult result, double value) GuiValueBoxFloat(
  Rectangle bounds,
  String? text,
  String textValue,
  num value,
  bool editMode,
) => _module.GuiValueBoxFloat(bounds, text, textValue, value, editMode);

/// See [RaylibGuiDart.GuiTextBox].
(GuiResult result, String value) GuiTextBox(
  Rectangle bounds,
  String? text,
  num textSize,
  bool editMode,
) => _module.GuiTextBox(bounds, text, textSize, editMode);

/// See [RaylibGuiDart.GuiSlider].
(GuiResult result, double value) GuiSlider(
  Rectangle bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiDart.GuiSliderBar].
(GuiResult result, double value) GuiSliderBar(
  Rectangle bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiDart.GuiProgressBar].
(GuiResult result, double value) GuiProgressBar(
  Rectangle bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiDart.GuiStatusBar].
GuiResult GuiStatusBar(
  Rectangle bounds,
  String? text,
) => _module.GuiStatusBar(bounds, text);

/// See [RaylibGuiDart.GuiDummyRec].
GuiResult GuiDummyRec(
  Rectangle bounds,
  String? text,
) => _module.GuiDummyRec(bounds, text);

/// See [RaylibGuiDart.GuiGrid].
GuiResult GuiGrid(
  Rectangle bounds,
  num spacing,
  num subdivs, {
  Vector2? mouseCell,
}) => _module.GuiGrid(bounds, spacing, subdivs, mouseCell: mouseCell);

/// See [RaylibGuiDart.GuiListView].
(GuiResult result, int? scrollIndex, int? active) GuiListView(
  Rectangle bounds,
  String? text, {
  int? scrollIndex,
  int? active,
}) => _module.GuiListView(bounds, text, scrollIndex: scrollIndex, active: active);

/// See [RaylibGuiDart.GuiListViewEx].
(GuiResult result, int? scrollIndex, int? active, int? focus) GuiListViewEx(
  Rectangle bounds,
  List<String>? text, {
  int? scrollIndex,
  int? active,
  int? focus,
}) => _module.GuiListViewEx(bounds, text, scrollIndex: scrollIndex, active: active, focus: focus);

/// See [RaylibGuiDart.GuiTabBar].
(GuiResult result, int active) GuiTabBar(
  Rectangle bounds,
  String? text,
  int active,
) => _module.GuiTabBar(bounds, text, active);

/// See [RaylibGuiDart.GuiTabBarEx].
(GuiResult result, int active) GuiTabBarEx(
  Rectangle bounds,
  List<String>? text, {
  int? active,
}) => _module.GuiTabBarEx(bounds, text, active: active);

/// See [RaylibGuiDart.GuiMessageBox].
(GuiResult result, int btnActive) GuiMessageBox(
  Rectangle bounds,
  String? title,
  String message,
  String btnText,
) => _module.GuiMessageBox(bounds, title, message, btnText);

/// See [RaylibGuiDart.GuiTextInputBox].
(GuiResult result, String value, int btnActive, bool? secretViewActive) GuiTextInputBox(
  Rectangle bounds,
  String? title,
  String? message,
  String? text,
  num textSize,
  String btnText,
  [bool? secretViewActive]
) => _module.GuiTextInputBox(bounds, title, message, text, textSize, btnText, secretViewActive);

/// See [RaylibGuiDart.GuiColorPicker].
(GuiResult result, Color color) GuiColorPicker(
  Rectangle bounds,
  Color? color,
) => _module.GuiColorPicker(bounds, color);

/// See [RaylibGuiDart.GuiColorPanel].
(GuiResult result, Color color) GuiColorPanel(
  Rectangle bounds,
  Color color,
) => _module.GuiColorPanel(bounds, color);

/// See [RaylibGuiDart.GuiColorBarAlpha].
(GuiResult result, double alpha) GuiColorBarAlpha(
  Rectangle bounds,
  num alpha,
) => _module.GuiColorBarAlpha(bounds, alpha);

/// See [RaylibGuiDart.GuiColorBarHue].
(GuiResult result, double value) GuiColorBarHue(
  Rectangle bounds,
  num value,
) => _module.GuiColorBarHue(bounds, value);

/// See [RaylibGuiDart.GuiColorPickerHSV].
(GuiResult result, Vector3 hsv) GuiColorPickerHSV(
  Rectangle bounds,
  [Vector3? colorHsv]
) => _module.GuiColorPickerHSV(bounds, colorHsv);

/// See [RaylibGuiDart.GuiColorPanelHSV].
(GuiResult result, Vector3 hsv) GuiColorPanelHSV(
  Rectangle bounds,
  [Vector3? colorHsv]
) => _module.GuiColorPanelHSV(bounds, colorHsv);
