import 'dart:ffi';
import 'package:raylib_dartified/raylib_dartified.dart';

RaylibGui get _module => Raylib.instance.Gui;

/// See [RaylibGui.GuiEnable].
void GuiEnable() => _module.GuiEnable();

/// See [RaylibGui.GuiDisable].
void GuiDisable() => _module.GuiDisable();

/// See [RaylibGui.GuiLock].
void GuiLock() => _module.GuiLock();

/// See [RaylibGui.GuiUnlock].
void GuiUnlock() => _module.GuiUnlock();

/// See [RaylibGui.GuiIsLocked].
bool GuiIsLocked() => _module.GuiIsLocked();

/// See [RaylibGui.GuiSetAlpha].
void GuiSetAlpha(double alpha) => _module.GuiSetAlpha(alpha);

/// See [RaylibGui.GuiSetState].
void GuiSetState(int state) => _module.GuiSetState(state);

/// See [RaylibGui.GuiGetState].
int GuiGetState() => _module.GuiGetState();

/// See [RaylibGui.GuiSetFont].
void GuiSetFont(FontC font) => _module.GuiSetFont(font);

/// See [RaylibGui.GuiGetFont].
FontC GuiGetFont() => _module.GuiGetFont();

/// See [RaylibGui.GuiSetStyle].
void GuiSetStyle(int control, int property, int value) => _module.GuiSetStyle(control, property, value);

/// See [RaylibGui.GuiGetStyle].
int GuiGetStyle(int control, int property) => _module.GuiGetStyle(control, property);

/// See [RaylibGui.GuiLoadStyle].
void GuiLoadStyle(Pointer<Char> fileName) => _module.GuiLoadStyle(fileName);

/// See [RaylibGui.GuiLoadStyleFromMemory].
void GuiLoadStyleFromMemory(
  Pointer<UnsignedChar> fileData,
  int dataSize,
) => _module.GuiLoadStyleFromMemory(fileData, dataSize);

/// See [RaylibGui.GuiLoadStyleDefault].
void GuiLoadStyleDefault() => _module.GuiLoadStyleDefault();

/// See [RaylibGui.GuiEnableTooltip].
void GuiEnableTooltip() => _module.GuiEnableTooltip();

/// See [RaylibGui.GuiDisableTooltip].
void GuiDisableTooltip() => _module.GuiDisableTooltip();

/// See [RaylibGui.GuiSetTooltip].
void GuiSetTooltip(Pointer<Char> tooltip) => _module.GuiSetTooltip(tooltip);

/// See [RaylibGui.GuiIconText].
Pointer<Char> GuiIconText(int iconId, Pointer<Char> text) => _module.GuiIconText(iconId, text);

/// See [RaylibGui.GuiSetIconScale].
void GuiSetIconScale(int scale) => _module.GuiSetIconScale(scale);

/// See [RaylibGui.GuiGetIcons].
Pointer<UnsignedInt> GuiGetIcons() => _module.GuiGetIcons();

/// See [RaylibGui.GuiLoadIcons].
Pointer<Pointer<Char>> GuiLoadIcons(
  Pointer<Char> fileName,
  bool loadIconsName,
) => _module.GuiLoadIcons(fileName, loadIconsName);

/// See [RaylibGui.GuiLoadIcons].
Pointer<Pointer<Char>> GuiLoadIconsFromMemory(
  Pointer<UnsignedChar> fileData,
  int dataSize,
  bool loadIconsName,
) => _module.GuiLoadIconsFromMemory(fileData, dataSize, loadIconsName);

/// See [RaylibGui.GuiDrawIcon].
void GuiDrawIcon(
  int iconId,
  int posX,
  int posY,
  int pixelSize,
  ColorC color,
) => _module.GuiDrawIcon(iconId, posX, posY, pixelSize, color);

/// See [RaylibGui.GuiGetTextWidth].
int GuiGetTextWidth(Pointer<Char> text) => _module.GuiGetTextWidth(text);

/// See [RaylibGui.GuiWindowBox].
int GuiWindowBox(RectangleC bounds, Pointer<Char> title) => _module.GuiWindowBox(bounds, title);

/// See [RaylibGui.GuiGroupBox].
int GuiGroupBox(RectangleC bounds, Pointer<Char> text) => _module.GuiGroupBox(bounds, text);

/// See [RaylibGui.GuiLine].
int GuiLine(RectangleC bounds, Pointer<Char> text) => _module.GuiLine(bounds, text);

/// See [RaylibGui.GuiPanel].
int GuiPanel(RectangleC bounds, Pointer<Char> text) => _module.GuiPanel(bounds, text);

/// See [RaylibGui.GuiScrollPanel].
int GuiScrollPanel(
  RectangleC bounds,
  Pointer<Char> text,
  RectangleC content,
  Pointer<Vector2C> scroll,
  Pointer<RectangleC> view,
) => _module.GuiScrollPanel(bounds, text, content, scroll, view);

/// See [RaylibGui.GuiLabel].
int GuiLabel(RectangleC bounds, Pointer<Char> text) => _module.GuiLabel(bounds, text);

/// See [RaylibGui.GuiButton].
int GuiButton(RectangleC bounds, Pointer<Char> text) => _module.GuiButton(bounds, text);

/// See [RaylibGui.GuiLabelButton].
int GuiLabelButton(RectangleC bounds, Pointer<Char> text) => _module.GuiLabelButton(bounds, text);

/// See [RaylibGui.GuiToggle].
int GuiToggle(RectangleC bounds, Pointer<Char> text, Pointer<Bool> active) => _module.GuiToggle(bounds, text, active);

/// See [RaylibGui.GuiToggleGroup].
int GuiToggleGroup(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<Int> active,
) => _module.GuiToggleGroup(bounds, text, active);

/// See [RaylibGui.GuiToggleSlider].
int GuiToggleSlider(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<Int> active,
) => _module.GuiToggleSlider(bounds, text, active);

/// See [RaylibGui.GuiCheckBox].
int GuiCheckBox(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<Bool> checked,
) => _module.GuiCheckBox(bounds, text, checked);

/// See [RaylibGui.GuiComboBox].
int GuiComboBox(RectangleC bounds, Pointer<Char> text, Pointer<Int> active) => _module.GuiComboBox(bounds, text, active);

/// See [RaylibGui.GuiDropdownBox].
int GuiDropdownBox(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<Int> active,
  bool editMode,
) => _module.GuiDropdownBox(bounds, text, active, editMode);

/// See [RaylibGui.GuiSpinner].
int GuiSpinner(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<Int> value,
  int minValue,
  int maxValue,
  bool editMode,
) => _module.GuiSpinner(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGui.GuiValueBox].
int GuiValueBox(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<Int> value,
  int minValue,
  int maxValue,
  bool editMode,
) => _module.GuiValueBox(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGui.GuiValueBoxFloat].
int GuiValueBoxFloat(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<Char> textValue,
  Pointer<Float> value,
  bool editMode,
) => _module.GuiValueBoxFloat(bounds, text, textValue, value, editMode);

/// See [RaylibGui.GuiTextBox].
int GuiTextBox(
  RectangleC bounds,
  Pointer<Char> text,
  int textSize,
  bool editMode,
) => _module.GuiTextBox(bounds, text, textSize, editMode);

/// See [RaylibGui.GuiSlider].
int GuiSlider(
  RectangleC bounds,
  Pointer<Char> textLeft,
  Pointer<Char> textRight,
  Pointer<Float> value,
  double minValue,
  double maxValue,
) => _module.GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGui.GuiSliderBar].
int GuiSliderBar(
  RectangleC bounds,
  Pointer<Char> textLeft,
  Pointer<Char> textRight,
  Pointer<Float> value,
  double minValue,
  double maxValue,
) => _module.GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGui.GuiProgressBar].
int GuiProgressBar(
  RectangleC bounds,
  Pointer<Char> textLeft,
  Pointer<Char> textRight,
  Pointer<Float> value,
  double minValue,
  double maxValue,
) => _module.GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGui.GuiStatusBar].
int GuiStatusBar(RectangleC bounds, Pointer<Char> text) => _module.GuiStatusBar(bounds, text);

/// See [RaylibGui.GuiDummyRec].
int GuiDummyRec(RectangleC bounds, Pointer<Char> text) => _module.GuiDummyRec(bounds, text);

/// See [RaylibGui.GuiGrid].
int GuiGrid(
  RectangleC bounds,
  Pointer<Char> text,
  double spacing,
  int subdivs,
  Pointer<Vector2C> mouseCell,
) => _module.GuiGrid(bounds, text, spacing, subdivs, mouseCell);

/// See [RaylibGui.GuiListView].
int GuiListView(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<Int> scrollIndex,
  Pointer<Int> active,
) => _module.GuiListView(bounds, text, scrollIndex, active);

/// See [RaylibGui.GuiListViewEx].
int GuiListViewEx(
  RectangleC bounds,
  Pointer<Pointer<Char>> text,
  int count,
  Pointer<Int> scrollIndex,
  Pointer<Int> active,
  Pointer<Int> focus,
) => _module.GuiListViewEx(bounds, text, count, scrollIndex, active, focus);

/// See [RaylibGui.GuiTabBar].
int GuiTabBar(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<Int> hscroll,
  Pointer<Int> active,
) => _module.GuiTabBar(bounds, text, hscroll, active);

/// See [RaylibGui.GuiTabBarEx].
int GuiTabBarEx(
  RectangleC bounds,
  Pointer<Pointer<Char>> text,
  int count,
  Pointer<Int> hscroll,
  Pointer<Int> active,
  Pointer<Int> focus,
) => _module.GuiTabBarEx(bounds, text, count, hscroll, active, focus);

/// See [RaylibGui.GuiMessageBox].
int GuiMessageBox(
  RectangleC bounds,
  Pointer<Char> title,
  Pointer<Char> message,
  Pointer<Char> btnText,
  Pointer<Int> btnActive,
) => _module.GuiMessageBox(bounds, title, message, btnText, btnActive);

/// See [RaylibGui.GuiTextInputBox].
int GuiTextInputBox(
  RectangleC bounds,
  Pointer<Char> title,
  Pointer<Char> message,
  Pointer<Char> text,
  int textSize,
  Pointer<Char> btnText,
  Pointer<Int> btnActive,
  Pointer<Bool> secretViewActive,
) => _module.GuiTextInputBox(bounds, title, message, text, textSize, btnText, btnActive, secretViewActive);

/// See [RaylibGui.GuiColorPicker].
int GuiColorPicker(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<ColorC> color,
) => _module.GuiColorPicker(bounds, text, color);

/// See [RaylibGui.GuiColorPanel].
int GuiColorPanel(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<ColorC> color,
) => _module.GuiColorPanel(bounds, text, color);

/// See [RaylibGui.GuiColorBarAlpha].
int GuiColorBarAlpha(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<Float> alpha,
) => _module.GuiColorBarAlpha(bounds, text, alpha);

/// See [RaylibGui.GuiColorBarHue].
int GuiColorBarHue(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<Float> value,
) => _module.GuiColorBarHue(bounds, text, value);

/// See [RaylibGui.GuiColorPickerHSV].
int GuiColorPickerHSV(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<Vector3C> colorHsv,
) => _module.GuiColorPickerHSV(bounds, text, colorHsv);

/// See [RaylibGui.GuiColorPanelHSV].
int GuiColorPanelHSV(
  RectangleC bounds,
  Pointer<Char> text,
  Pointer<Vector3C> colorHsv,
) => _module.GuiColorPanelHSV(bounds, text, colorHsv);

