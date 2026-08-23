import 'package:raylib_dartified/raylib_dartified.dart';

RaylibGuiFlat get _module => Raylib.instance.GuiFlat;

/// See [RaylibGuiFlat.GuiEnable].
void GuiEnable() => _module.GuiEnable();

/// See [RaylibGuiFlat.GuiDisable].
void GuiDisable() => _module.GuiDisable();

/// See [RaylibGuiFlat.GuiLock].
void GuiLock() => _module.GuiLock();

/// See [RaylibGuiFlat.GuiUnlock].
void GuiUnlock() => _module.GuiUnlock();

/// See [RaylibGuiFlat.GuiIsLocked].
bool GuiIsLocked() => _module.GuiIsLocked();

/// See [RaylibGuiFlat.GuiSetAlpha].
void GuiSetAlpha(
  double alpha,
) => _module.GuiSetAlpha(alpha);

/// See [RaylibGuiFlat.GuiSetState].
void GuiSetState(
  int state,
) => _module.GuiSetState(state);

/// See [RaylibGuiFlat.GuiGetState].
int GuiGetState() => _module.GuiGetState();

/// See [RaylibGuiFlat.GuiSetFont].
void GuiSetFont(
  FontD font,
) => _module.GuiSetFont(font);

/// See [RaylibGuiFlat.GuiGetFont].
FontD GuiGetFont() => _module.GuiGetFont();

/// See [RaylibGuiFlat.GuiSetStyle].
void GuiSetStyle(
  int control,
  int property,
  int value,
) => _module.GuiSetStyle(control, property, value);

/// See [RaylibGuiFlat.GuiGetStyle].
int GuiGetStyle(
  int control,
  int property,
) => _module.GuiGetStyle(control, property);

/// See [RaylibGuiFlat.GuiLoadStyle].
void GuiLoadStyle(
  MemoryPointer<RChar> fileName,
) => _module.GuiLoadStyle(fileName);

/// See [RaylibGuiFlat.GuiLoadStyleDefault].
void GuiLoadStyleDefault() => _module.GuiLoadStyleDefault();

/// See [RaylibGuiFlat.GuiEnableTooltip].
void GuiEnableTooltip() => _module.GuiEnableTooltip();

/// See [RaylibGuiFlat.GuiDisableTooltip].
void GuiDisableTooltip() => _module.GuiDisableTooltip();

/// See [RaylibGuiFlat.GuiSetTooltip].
void GuiSetTooltip(
  MemoryPointer<RChar> tooltip,
) => _module.GuiSetTooltip(tooltip);

/// See [RaylibGuiFlat.GuiIconText].
NativeMemoryPointer<RChar> GuiIconText(
  int iconId,
  MemoryPointer<RChar> text,
) => _module.GuiIconText(iconId, text);

/// See [RaylibGuiFlat.GuiSetIconScale].
void GuiSetIconScale(
  int scale,
) => _module.GuiSetIconScale(scale);

/// See [RaylibGuiFlat.GuiGetIcons].
NativeMemoryPointer<RUnsignedInt> GuiGetIcons() => _module.GuiGetIcons();

/// See [RaylibGuiFlat.GuiLoadIcons].
NativeMemoryPointer<RPointer<RChar>> GuiLoadIcons(
  MemoryPointer<RChar> fileName,
  bool loadIconsName,
) => _module.GuiLoadIcons(fileName, loadIconsName);

/// See [RaylibGuiFlat.GuiDrawIcon].
void GuiDrawIcon(
  int iconId,
  int posX,
  int posY,
  int pixelSize,
  ColorD color,
) => _module.GuiDrawIcon(iconId, posX, posY, pixelSize, color);

/// See [RaylibGuiFlat.GuiGetTextWidth].
int GuiGetTextWidth(
  MemoryPointer<RChar> text,
) => _module.GuiGetTextWidth(text);

/// See [RaylibGuiFlat.GuiWindowBox].
int GuiWindowBox(
  RectangleD bounds,
  MemoryPointer<RChar> title,
) => _module.GuiWindowBox(bounds, title);

/// See [RaylibGuiFlat.GuiGroupBox].
int GuiGroupBox(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiGroupBox(bounds, text);

/// See [RaylibGuiFlat.GuiLine].
int GuiLine(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiLine(bounds, text);

/// See [RaylibGuiFlat.GuiPanel].
int GuiPanel(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiPanel(bounds, text);

/// See [RaylibGuiFlat.GuiTabBar].
int GuiTabBar(
  RectangleD bounds,
  MemoryPointer<RPointer<RChar>> text,
  int count,
  MemoryPointer<RInt> active,
) => _module.GuiTabBar(bounds, text, count, active);

/// See [RaylibGuiFlat.GuiScrollPanel].
int GuiScrollPanel(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  RectangleD content,
  StructPointer<Vector2D> scroll,
  StructPointer<RectangleD> view,
) => _module.GuiScrollPanel(bounds, text, content, scroll, view);

/// See [RaylibGuiFlat.GuiLabel].
int GuiLabel(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiLabel(bounds, text);

/// See [RaylibGuiFlat.GuiButton].
int GuiButton(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiButton(bounds, text);

/// See [RaylibGuiFlat.GuiLabelButton].
int GuiLabelButton(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiLabelButton(bounds, text);

/// See [RaylibGuiFlat.GuiToggle].
int GuiToggle(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RBool> active,
) => _module.GuiToggle(bounds, text, active);

/// See [RaylibGuiFlat.GuiToggleGroup].
int GuiToggleGroup(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> active,
) => _module.GuiToggleGroup(bounds, text, active);

/// See [RaylibGuiFlat.GuiToggleSlider].
int GuiToggleSlider(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> active,
) => _module.GuiToggleSlider(bounds, text, active);

/// See [RaylibGuiFlat.GuiCheckBox].
int GuiCheckBox(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RBool> checked,
) => _module.GuiCheckBox(bounds, text, checked);

/// See [RaylibGuiFlat.GuiComboBox].
int GuiComboBox(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> active,
) => _module.GuiComboBox(bounds, text, active);

/// See [RaylibGuiFlat.GuiDropdownBox].
int GuiDropdownBox(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> active,
  bool editMode,
) => _module.GuiDropdownBox(bounds, text, active, editMode);

/// See [RaylibGuiFlat.GuiSpinner].
int GuiSpinner(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> value,
  int minValue,
  int maxValue,
  bool editMode,
) => _module.GuiSpinner(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiFlat.GuiValueBox].
int GuiValueBox(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> value,
  int minValue,
  int maxValue,
  bool editMode,
) => _module.GuiValueBox(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiFlat.GuiValueBoxFloat].
int GuiValueBoxFloat(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> textValue,
  MemoryPointer<RFloat> value,
  bool editMode,
) => _module.GuiValueBoxFloat(bounds, text, textValue, value, editMode);

/// See [RaylibGuiFlat.GuiTextBox].
int GuiTextBox(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  int textSize,
  bool editMode,
) => _module.GuiTextBox(bounds, text, textSize, editMode);

/// See [RaylibGuiFlat.GuiSlider].
int GuiSlider(
  RectangleD bounds,
  MemoryPointer<RChar> textLeft,
  MemoryPointer<RChar> textRight,
  MemoryPointer<RFloat> value,
  double minValue,
  double maxValue,
) => _module.GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiFlat.GuiSliderBar].
int GuiSliderBar(
  RectangleD bounds,
  MemoryPointer<RChar> textLeft,
  MemoryPointer<RChar> textRight,
  MemoryPointer<RFloat> value,
  double minValue,
  double maxValue,
) => _module.GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiFlat.GuiProgressBar].
int GuiProgressBar(
  RectangleD bounds,
  MemoryPointer<RChar> textLeft,
  MemoryPointer<RChar> textRight,
  MemoryPointer<RFloat> value,
  double minValue,
  double maxValue,
) => _module.GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiFlat.GuiStatusBar].
int GuiStatusBar(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiStatusBar(bounds, text);

/// See [RaylibGuiFlat.GuiDummyRec].
int GuiDummyRec(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiDummyRec(bounds, text);

/// See [RaylibGuiFlat.GuiGrid].
int GuiGrid(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  double spacing,
  int subdivs,
  StructPointer<Vector2D> mouseCell,
) => _module.GuiGrid(bounds, text, spacing, subdivs, mouseCell);

/// See [RaylibGuiFlat.GuiListView].
int GuiListView(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> scrollIndex,
  MemoryPointer<RInt> active,
) => _module.GuiListView(bounds, text, scrollIndex, active);

/// See [RaylibGuiFlat.GuiListViewEx].
int GuiListViewEx(
  RectangleD bounds,
  MemoryPointer<RPointer<RChar>> text,
  int count,
  MemoryPointer<RInt> scrollIndex,
  MemoryPointer<RInt> active,
  MemoryPointer<RInt> focus,
) => _module.GuiListViewEx(bounds, text, count, scrollIndex, active, focus);

/// See [RaylibGuiFlat.GuiMessageBox].
int GuiMessageBox(
  RectangleD bounds,
  MemoryPointer<RChar> title,
  MemoryPointer<RChar> message,
  MemoryPointer<RChar> buttons,
) => _module.GuiMessageBox(bounds, title, message, buttons);

/// See [RaylibGuiFlat.GuiTextInputBox].
int GuiTextInputBox(
  RectangleD bounds,
  MemoryPointer<RChar> title,
  MemoryPointer<RChar> message,
  MemoryPointer<RChar> buttons,
  MemoryPointer<RChar> text,
  int textMaxSize,
  MemoryPointer<RBool> secretViewActive,
) => _module.GuiTextInputBox(bounds, title, message, buttons, text, textMaxSize, secretViewActive);

/// See [RaylibGuiFlat.GuiColorPicker].
int GuiColorPicker(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  StructPointer<ColorD> color,
) => _module.GuiColorPicker(bounds, text, color);

/// See [RaylibGuiFlat.GuiColorPanel].
int GuiColorPanel(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  StructPointer<ColorD> color,
) => _module.GuiColorPanel(bounds, text, color);

/// See [RaylibGuiFlat.GuiColorBarAlpha].
int GuiColorBarAlpha(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RFloat> alpha,
) => _module.GuiColorBarAlpha(bounds, text, alpha);

/// See [RaylibGuiFlat.GuiColorBarHue].
int GuiColorBarHue(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RFloat> value,
) => _module.GuiColorBarHue(bounds, text, value);

/// See [RaylibGuiFlat.GuiColorPickerHSV].
int GuiColorPickerHSV(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  StructPointer<Vector3D> colorHsv,
) => _module.GuiColorPickerHSV(bounds, text, colorHsv);

/// See [RaylibGuiFlat.GuiColorPanelHSV].
int GuiColorPanelHSV(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  StructPointer<Vector3D> colorHsv,
) => _module.GuiColorPanelHSV(bounds, text, colorHsv);