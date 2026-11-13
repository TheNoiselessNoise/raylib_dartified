part of '../../raylib_dartified_base.dart';

class _RaylibGuiDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibGuiDart.GuiEnable].
  String GuiEnable() => 'GuiEnable()';

  /// Label for [RaylibGuiDart.GuiDisable].
  String GuiDisable() => 'GuiDisable()';

  /// Label for [RaylibGuiDart.GuiLock].
  String GuiLock() => 'GuiLock()';

  /// Label for [RaylibGuiDart.GuiUnlock].
  String GuiUnlock() => 'GuiUnlock()';

  /// Label for [RaylibGuiDart.GuiIsLocked].
  String GuiIsLocked() => 'GuiIsLocked()';

  /// Label for [RaylibGuiDart.GuiSetAlpha].
  String GuiSetAlpha(
    num alpha,
  ) => 'GuiSetAlpha($alpha)';

  /// Label for [RaylibGuiDart.GuiSetState].
  String GuiSetState(
    GuiState state,
  ) => 'GuiSetState($state)';

  /// Label for [RaylibGuiDart.GuiGetState].
  String GuiGetState() => 'GuiGetState()';

  /// Label for [RaylibGuiDart.GuiSetFont].
  String GuiSetFont(
    Font font,
  ) => 'GuiSetFont($font)';

  /// Label for [RaylibGuiDart.GuiGetFont].
  String GuiGetFont() => 'GuiGetFont()';

  /// Label for [RaylibGuiDart.GuiSetStyle].
  String GuiSetStyle(
    GuiControl control,
    GuiProperty property,
    num value,
  ) => 'GuiSetStyle(${control.name}, ${property.name}, $value)';

  /// Label for [RaylibGuiDart.GuiGetStyle].
  String GuiGetStyle(
    GuiControl control,
    GuiProperty property,
  ) => 'GuiGetStyle(${control.name}, ${property.name})';

  /// Label for [RaylibGuiDart.GuiLoadStyle].
  String GuiLoadStyle(
    String fileName,
  ) => 'GuiLoadStyle($fileName)';

  /// Label for [RaylibGuiDart.GuiLoadStyleFromMemory].
  String GuiLoadStyleFromMemory(
    Uint8List fileData,
  ) => 'GuiLoadStyleFromMemory(data: ${fileData.length})';

  /// Label for [RaylibGuiDart.GuiLoadStyleDefault].
  String GuiLoadStyleDefault() => 'GuiLoadStyleDefault()';

  /// Label for [RaylibGuiDart.GuiEnableTooltip].
  String GuiEnableTooltip() => 'GuiEnableTooltip()';

  /// Label for [RaylibGuiDart.GuiDisableTooltip].
  String GuiDisableTooltip() => 'GuiDisableTooltip()';

  /// Label for [RaylibGuiDart.GuiSetTooltip].
  String GuiSetTooltip(
    String? tooltip,
  ) => 'GuiSetTooltip($tooltip)';

  /// Label for [RaylibGuiDart.GuiIconText].
  String GuiIconText(
    GuiIconName iconId,
    String? text,
  ) => 'GuiIconText(${iconId.name}, $text)';

  /// Label for [RaylibGuiDart.GuiSetIconScale].
  String GuiSetIconScale(
    num scale,
  ) => 'GuiSetIconScale($scale)';

  /// Label for [RaylibGuiDart.GuiGetIcons].
  String GuiGetIcons() => 'GuiGetIcons()';

  /// Label for [RaylibGuiDart.GuiLoadIcons].
  String GuiLoadIcons(
    String fileName,
    bool loadIconsName,
  ) => 'GuiLoadIcons($fileName, $loadIconsName)';

  /// Label for [RaylibGuiDart.GuiLoadIconsFromMemory].
  String GuiLoadIconsFromMemory(
    Uint8List fileData,
    bool loadIconsName,
  ) => 'GuiLoadIconsFromMemory(fileData: ${fileData.length}, $loadIconsName)';

  /// Label for [RaylibGuiDart.GuiDrawIcon].
  String GuiDrawIcon(
    GuiIconName iconId,
    num posX,
    num posY,
    num pixelSize,
    Color color,
  ) => 'GuiDrawIcon(${iconId.name}, $posX, $posY, $pixelSize, $color)';

  /// Label for [RaylibGuiDart.GuiGetTextWidth].
  String GuiGetTextWidth(
    String? text,
  ) => 'GuiGetTextWidth($text)';

  /// Label for [RaylibGuiDart.GuiWindowBox].
  String GuiWindowBox(
    Rectangle bounds,
    String? title,
  ) => 'GuiWindowBox($bounds, $title)';

  /// Label for [RaylibGuiDart.GuiGroupBox].
  String GuiGroupBox(
    Rectangle bounds,
    String? text,
  ) => 'GuiGroupBox($bounds, $text)';

  /// Label for [RaylibGuiDart.GuiLine].
  String GuiLine(
    Rectangle bounds,
    String? text,
  ) => 'GuiLine($bounds, $text)';

  /// Label for [RaylibGuiDart.GuiPanel].
  String GuiPanel(
    Rectangle bounds,
    String? text,
  ) => 'GuiPanel($bounds, $text)';

  /// Label for [RaylibGuiDart.GuiScrollPanel].
  String GuiScrollPanel(
    Rectangle bounds,
    String? text,
    Rectangle content, {
    Vector2? scroll,
    Rectangle? view,
  }) => 'GuiScrollPanel($bounds, $text, $content, scroll: $scroll, view: $view)';

  /// Label for [RaylibGuiDart.GuiLabel].
  String GuiLabel(
    Rectangle bounds,
    String? text,
  ) => 'GuiLabel($bounds, $text)';

  /// Label for [RaylibGuiDart.GuiButton].
  String GuiButton(
    Rectangle bounds,
    String? text,
  ) => 'GuiButton($bounds, $text)';

  /// Label for [RaylibGuiDart.GuiLabelButton].
  String GuiLabelButton(
    Rectangle bounds,
    String? text,
  ) => 'GuiLabelButton($bounds, $text)';

  /// Label for [RaylibGuiDart.GuiToggle].
  String GuiToggle(
    Rectangle bounds,
    String? text,
    bool active,
  ) => 'GuiToggle($bounds, $text, $active)';

  /// Label for [RaylibGuiDart.GuiToggleGroup].
  String GuiToggleGroup(
    Rectangle bounds,
    String? text,
    num active,
  ) => 'GuiToggleGroup($bounds, $text, $active)';

  /// Label for [RaylibGuiDart.GuiToggleSlider].
  String GuiToggleSlider(
    Rectangle bounds,
    String? text,
    num active,
  ) => 'GuiToggleSlider($bounds, $text, $active)';

  /// Label for [RaylibGuiDart.GuiCheckBox].
  String GuiCheckBox(
    Rectangle bounds,
    String? text,
    bool checked,
  ) => 'GuiCheckBox($bounds, $text, $checked)';

  /// Label for [RaylibGuiDart.GuiComboBox].
  String GuiComboBox(
    Rectangle bounds,
    String? text,
    num active,
  ) => 'GuiComboBox($bounds, $text, $active)';

  /// Label for [RaylibGuiDart.GuiDropdownBox].
  String GuiDropdownBox(
    Rectangle bounds,
    String? text,
    num active,
    bool editMode,
  ) => 'GuiDropdownBox($bounds, $text, $active, $editMode)';

  /// Label for [RaylibGuiDart.GuiSpinner].
  String GuiSpinner(
    Rectangle bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => 'GuiSpinner($bounds, $text, $value, $minValue, $maxValue, $editMode)';

  /// Label for [RaylibGuiDart.GuiValueBox].
  String GuiValueBox(
    Rectangle bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => 'GuiValueBox($bounds, $text, $value, $minValue, $maxValue, $editMode)';

  /// Label for [RaylibGuiDart.GuiValueBoxFloat].
  String GuiValueBoxFloat(
    Rectangle bounds,
    String? text,
    String textValue,
    num value,
    bool editMode,
  ) => 'GuiValueBoxFloat($bounds, $text, $textValue, $value, $editMode)';

  /// Label for [RaylibGuiDart.GuiTextBox].
  String GuiTextBox(
    Rectangle bounds,
    String? text,
    num textSize,
    bool editMode,
  ) => 'GuiTextBox($bounds, $text, $textSize, $editMode)';

  /// Label for [RaylibGuiDart.GuiSlider].
  String GuiSlider(
    Rectangle bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => 'GuiSlider($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)';

  /// Label for [RaylibGuiDart.GuiSliderBar].
  String GuiSliderBar(
    Rectangle bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => 'GuiSliderBar($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)';

  /// Label for [RaylibGuiDart.GuiProgressBar].
  String GuiProgressBar(
    Rectangle bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => 'GuiProgressBar($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)';

  /// Label for [RaylibGuiDart.GuiStatusBar].
  String GuiStatusBar(
    Rectangle bounds,
    String? text,
  ) => 'GuiStatusBar($bounds, $text)';

  /// Label for [RaylibGuiDart.GuiDummyRec].
  String GuiDummyRec(
    Rectangle bounds,
    String? text,
  ) => 'GuiDummyRec($bounds, $text)';

  /// Label for [RaylibGuiDart.GuiGrid].
  String GuiGrid(
    Rectangle bounds,
    num spacing,
    num subdivs, {
    Vector2? mouseCell
  }) => 'GuiGrid($bounds, $spacing, $subdivs, mouseCell: $mouseCell)';

  /// Label for [RaylibGuiDart.GuiListView].
  String GuiListView(
    Rectangle bounds,
    String? text, {
      int? scrollIndex,
      int? active,
    }
  ) => 'GuiListView($bounds, $text, $scrollIndex, $active)';

  /// Label for [RaylibGuiDart.GuiListViewEx].
  String GuiListViewEx(
    Rectangle bounds,
    List<String>? text, {
      int? scrollIndex,
      int? active,
      int? focus,
    }
  ) => 'GuiListViewEx($bounds, $text, $scrollIndex, $active, $focus)';

  /// Label for [RaylibGuiDart.GuiTabBar].
  String GuiTabBar(
    Rectangle bounds,
    String? text, {
    int? active,
  }) => 'GuiTabBar($bounds, text: $text, active: $active)';

  /// Label for [RaylibGuiDart.GuiTabBarEx].
  String GuiTabBarEx(
    Rectangle bounds,
    List<String>? text, {
    int? active,
  }) => 'GuiTabBarEx($bounds, text: ${text?.length}, active: $active)';

  /// Label for [RaylibGuiDart.GuiMessageBox].
  String GuiMessageBox(
    Rectangle bounds,
    String? title,
    String message,
    String buttons,
  ) => 'GuiMessageBox($bounds, $title, $message, $buttons)';

  /// Label for [RaylibGuiDart.GuiTextInputBox].
  String GuiTextInputBox(
    Rectangle bounds,
    String? title,
    String? message,
    String? text,
    num textSize,
    String btnText,
    [bool? secretViewActive]
  ) => 'GuiTextInputBox($bounds, $title, $message, $text, $textSize, $btnText, $secretViewActive)';

  /// Label for [RaylibGuiDart.GuiColorPicker].
  String GuiColorPicker(
    Rectangle bounds,
    Color? color,
  ) => 'GuiColorPicker($bounds, $color)';

  /// Label for [RaylibGuiDart.GuiColorPanel].
  String GuiColorPanel(
    Rectangle bounds,
    Color color,
  ) => 'GuiColorPanel($bounds, $color)';

  /// Label for [RaylibGuiDart.GuiColorBarAlpha].
  String GuiColorBarAlpha(
    Rectangle bounds,
    num alpha,
  ) => 'GuiColorBarAlpha($bounds, $alpha)';

  /// Label for [RaylibGuiDart.GuiColorBarHue].
  String GuiColorBarHue(
    Rectangle bounds,
    num value,
  ) => 'GuiColorBarHue($bounds, $value)';

  /// Label for [RaylibGuiDart.GuiColorPickerHSV].
  String GuiColorPickerHSV(
    Rectangle bounds,
    [Vector3? colorHsv]
  ) => 'GuiColorPickerHSV($bounds, $colorHsv)';

  /// Label for [RaylibGuiDart.GuiColorPanelHSV].
  String GuiColorPanelHSV(
    Rectangle bounds,
    [Vector3? colorHsv]
  ) => 'GuiColorPanelHSV($bounds, $colorHsv)';
  
}
