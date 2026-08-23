part of '../../../raylib_dartified.dart';

class RaylibGuiD extends RaylibGuiModule<Raylib> {

  RaylibGuiD(super.rl);

  @override
  void GuiEnable() => run(
    () => RaylibDebugLabels.GuiEnable(),
    () => rl.GuiFlat.GuiEnable(),
  );

  @override
  void GuiDisable() => run(
    () => RaylibDebugLabels.GuiDisable(),
    () => rl.GuiFlat.GuiDisable(),
  );

  @override
  void GuiLock() => run(
    () => RaylibDebugLabels.GuiLock(),
    () => rl.GuiFlat.GuiLock(),
  );

  @override
  void GuiUnlock() => run(
    () => RaylibDebugLabels.GuiUnlock(),
    () => rl.GuiFlat.GuiUnlock(),
  );

  @override
  bool GuiIsLocked() => run(
    () => RaylibDebugLabels.GuiIsLocked(),
    () => rl.GuiFlat.GuiIsLocked(),
  );

  @override
  void GuiSetAlpha(
    num alpha,
  ) => run(
    () => RaylibDebugLabels.GuiSetAlpha(alpha),
    () => rl.GuiFlat.GuiSetAlpha(
      alpha.toDouble(),
    ),
  );

  @override
  void GuiSetState(
    GuiState state,
  ) => run(
    () => RaylibDebugLabels.GuiSetState(state),
    () => rl.GuiFlat.GuiSetState(
      state.value,
    ),
  );

  @override
  int GuiGetState() => run(
    () => RaylibDebugLabels.GuiGetState(),
    () => rl.GuiFlat.GuiGetState(),
  );

  @override
  void GuiSetFont(
    FontD font,
  ) => run(
    () => RaylibDebugLabels.GuiSetFont(font),
    () => rl.GuiFlat.GuiSetFont(
      font,
    ),
  );

  @override
  FontD GuiGetFont() => run(
    () => RaylibDebugLabels.GuiGetFont(),
    () => rl.GuiFlat.GuiGetFont(),
  );

  @override
  void GuiSetStyle(
    GuiControl control,
    GuiProperty property,
    num value,
  ) => run(
    () => RaylibDebugLabels.GuiSetStyle(control, property, value),
    () => rl.GuiFlat.GuiSetStyle(
      control.value,
      property.value,
      value.toInt(),
    ),
  );

  @override
  int GuiGetStyle(
    GuiControl control,
    GuiProperty property,
  ) => run(
    () => RaylibDebugLabels.GuiGetStyle(control, property),
    () => rl.GuiFlat.GuiGetStyle(
      control.value,
      property.value,
    ),
  );

  @override
  void GuiLoadStyle(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.GuiLoadStyle(fileName),
    () => rl.GuiFlat.GuiLoadStyle(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  void GuiLoadStyleDefault() => run(
    () => RaylibDebugLabels.GuiLoadStyleDefault(),
    () => rl.GuiFlat.GuiLoadStyleDefault(),
  );

  @override
  void GuiEnableTooltip() => run(
    () => RaylibDebugLabels.GuiEnableTooltip(),
    () => rl.GuiFlat.GuiEnableTooltip(),
  );

  @override
  void GuiDisableTooltip() => run(
    () => RaylibDebugLabels.GuiDisableTooltip(),
    () => rl.GuiFlat.GuiDisableTooltip(),
  );

  @override
  void GuiSetTooltip(
    String? tooltip,
  ) => run(
    () => RaylibDebugLabels.GuiSetTooltip(tooltip),
    () => rl.GuiFlat.GuiSetTooltip(
      rl.Temp.String$.ValueOrNull(tooltip),
    ),
  );

  @override
  String GuiIconText(
    GuiIconName iconId,
    String? text,
  ) => run(
    () => RaylibDebugLabels.GuiIconText(iconId, text),
    () => rl.GuiFlat.GuiIconText(
      iconId.value,
      rl.Temp.String$.ValueOrNull(text),
    ).toDartString(),
  );

  @override
  void GuiSetIconScale(
    num scale,
  ) => run(
    () => RaylibDebugLabels.GuiSetIconScale(scale),
    () => rl.GuiFlat.GuiSetIconScale(
      scale.toInt(),
    ),
  );

  @override
  List<int> GuiGetIcons() => run(
    () => RaylibDebugLabels.GuiGetIcons(),
    () {
      final values = rl.GuiFlat.GuiGetIcons();
      return values.readArray(RAYGUI_ICON_MAX_ICONS*RAYGUI_ICON_DATA_ELEMENTS);
    },
  );

  @override
  List<String> GuiLoadIcons(
    String fileName,
    bool loadIconsName,
  ) => run(
    () => RaylibDebugLabels.GuiLoadIcons(fileName, loadIconsName),
    () {
      final fileNamePtr = rl.Temp.String$.ValueOrNull(fileName);
      final values = rl.GuiFlat.GuiLoadIcons(
        fileNamePtr,
        loadIconsName,
      );
      if (!loadIconsName || values.isNull) return [];

      final dataSize = rl.Temp.Int$.Ref1();
      final bytes = rl.CoreFlat.LoadFileData(fileNamePtr, dataSize);
      if (dataSize.value < 10) return [];

      // read iconCount from file header (2 bytes short at offset 8)
      final iconCount = bytes.readInt16(8);
      final icons = values.readStringArray(iconCount);
      values.free();
      return icons;
    },
  );

  @override
  void GuiDrawIcon(
    GuiIconName iconId,
    num posX,
    num posY,
    num pixelSize,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.GuiDrawIcon(iconId, posX, posY, pixelSize, color),
    () => rl.GuiFlat.GuiDrawIcon(
      iconId.value,
      posX.toInt(),
      posY.toInt(),
      pixelSize.toInt(),
      color,
    ),
  );

  @override
  int GuiGetTextWidth(
    String? text,
  ) => run(
    () => RaylibDebugLabels.GuiGetTextWidth(text),
    () => rl.GuiFlat.GuiGetTextWidth(
      rl.Temp.String$.ValueOrNull(text), 
    ),
  );

  @override
  int GuiWindowBox(
    RectangleD bounds,
    String? title,
  ) => run(
    () => RaylibDebugLabels.GuiWindowBox(bounds, title),
    () => rl.GuiFlat.GuiWindowBox(
      bounds,
      rl.Temp.String$.ValueOrNull(title),
    ),
  );

  @override
  int GuiGroupBox(
    RectangleD bounds,
    String? text,
  ) => run(
    () => RaylibDebugLabels.GuiGroupBox(bounds, text),
    () => rl.GuiFlat.GuiGroupBox(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  @override
  int GuiLine(
    RectangleD bounds,
    String? text,
  ) => run(
    () => RaylibDebugLabels.GuiLine(bounds, text),
    () => rl.GuiFlat.GuiLine(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  @override
  int GuiPanel(
    RectangleD bounds,
    String? text,
  ) => run(
    () => RaylibDebugLabels.GuiPanel(bounds, text),
    () => rl.GuiFlat.GuiPanel(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  @override
  (int tab, int active) GuiTabBar(
    RectangleD bounds,
    List<String> text,
  ) => run(
    () => RaylibDebugLabels.GuiTabBar(bounds, text),
    () {
      final active = rl.Temp.Int$.Ref1();
      final currentTabClosingRequested = rl.GuiFlat.GuiTabBar(
        bounds,
        rl.Temp.String$.Array(text).cast(),
        text.length,
        active,
      );
      return (currentTabClosingRequested, active.value);
    },
  );

  @override
  int GuiScrollPanel(
    RectangleD bounds,
    String? text,
    RectangleD content,
    Vector2D scroll,
    [RectangleD? view]
  ) => run(
    () => RaylibDebugLabels.GuiScrollPanel(bounds, text, content, scroll, view),
    () => rl.Temp.Vector2$.RefUpdate1(scroll,
      (ps) => rl.Temp.Rectangle$.RefUpdate1(view,
        (pv) => rl.GuiFlat.GuiScrollPanel(
          bounds,
          rl.Temp.String$.ValueOrNull(text),
          content,
          ps,
          pv,
        ),
      ),
    ),
  );

  @override
  int GuiLabel(
    RectangleD bounds,
    String? text,
  ) => run(
    () => RaylibDebugLabels.GuiLabel(bounds, text),
    () => rl.GuiFlat.GuiLabel(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  @override
  int GuiButton(
    RectangleD bounds,
    String? text,
  ) => run(
    () => RaylibDebugLabels.GuiButton(bounds, text),
    () => rl.GuiFlat.GuiButton(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  @override
  int GuiLabelButton(
    RectangleD bounds,
    String? text,
  ) => run(
    () => RaylibDebugLabels.GuiLabelButton(bounds, text),
    () => rl.GuiFlat.GuiLabelButton(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  @override
  (int result, bool active) GuiToggle(
    RectangleD bounds,
    String? text,
    bool active,
  ) => run(
    () => RaylibDebugLabels.GuiToggle(bounds, text, active),
    () {
      final valuePtr = rl.Temp.Bool$.Ref1(active);
      final result = rl.GuiFlat.GuiToggle(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  @override
  (int result, int active) GuiToggleGroup(
    RectangleD bounds,
    String? text,
    num active,
  ) => run(
    () => RaylibDebugLabels.GuiToggleGroup(bounds, text, active),
    () {
      final valuePtr = rl.Temp.Int$.Ref1(active.toInt());
      final result = rl.GuiFlat.GuiToggleGroup(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  @override
  (int result, int active) GuiToggleSlider(
    RectangleD bounds,
    String? text,
    num active,
  ) => run(
    () => RaylibDebugLabels.GuiToggleSlider(bounds, text, active),
    () {
      final valuePtr = rl.Temp.Int$.Ref1(active.toInt());
      final result = rl.GuiFlat.GuiToggleSlider(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  @override
  (int result, bool checked) GuiCheckBox(
    RectangleD bounds,
    String? text,
    bool checked,
  ) => run(
    () => RaylibDebugLabels.GuiCheckBox(bounds, text, checked),
    () {
      final valuePtr = rl.Temp.Bool$.Ref1(checked);
      final result = rl.GuiFlat.GuiCheckBox(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  @override
  (int result, int active) GuiComboBox(
    RectangleD bounds,
    String? text,
    num active,
  ) => run(
    () => RaylibDebugLabels.GuiComboBox(bounds, text, active),
    () {
      final valuePtr = rl.Temp.Int$.Ref1(active.toInt());
      final result = rl.GuiFlat.GuiComboBox(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  @override
  (int result, int active) GuiDropdownBox(
    RectangleD bounds,
    String? text,
    num active,
    bool editMode,
  ) => run(
    () => RaylibDebugLabels.GuiDropdownBox(bounds, text, active, editMode),
    () {
      final valuePtr = rl.Temp.Int$.Ref1(active.toInt());
      final result = rl.GuiFlat.GuiDropdownBox(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
        editMode,
      );
      return (result, valuePtr.value);
    },
  );

  @override
  (int result, int value) GuiSpinner(
    RectangleD bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => run(
    () => RaylibDebugLabels.GuiSpinner(bounds, text, value, minValue, maxValue, editMode),
    () {
      final valuePtr = rl.Temp.Int$.Ref1(value.toInt());
      final result = rl.GuiFlat.GuiSpinner(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
        minValue.toInt(),
        maxValue.toInt(),
        editMode,
      );
      return (result, valuePtr.value);
    },
  );

  @override
  (int result, int value) GuiValueBox(
    RectangleD bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => run(
    () => RaylibDebugLabels.GuiValueBox(bounds, text, value, minValue, maxValue, editMode),
    () {
      final valuePtr = rl.Temp.Int$.Ref1(value.toInt());
      final result = rl.GuiFlat.GuiValueBox(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
        minValue.toInt(),
        maxValue.toInt(),
        editMode,
      );
      return (result, valuePtr.value);
    },
  );

  @override
  (int result, double value) GuiValueBoxFloat(
    RectangleD bounds,
    String? text,
    String textValue,
    num value,
    bool editMode,
  ) => run(
    () => RaylibDebugLabels.GuiValueBoxFloat(bounds, text, textValue, value, editMode),
    () {
      final valuePtr = rl.Temp.Float32$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiValueBoxFloat(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        rl.Temp.String$.ValueOrNull(textValue),
        valuePtr,
        editMode,
      );
      return (result, valuePtr.value);
    },
  );

  @override
  (int result, String value) GuiTextBox(
    RectangleD bounds,
    String? text,
    num textSize,
    bool editMode,
  ) => run(
    () => RaylibDebugLabels.GuiTextBox(bounds, text, textSize, editMode),
    () {
      final valuePtr = rl.Temp.String$.Ref1(text ?? '', textSize.toInt());
      final result = rl.GuiFlat.GuiTextBox(
        bounds,
        valuePtr,
        textSize.toInt(),
        editMode,
      );
      return (result, valuePtr.toDartString());
    },
  );

  @override
  (int result, double value) GuiSlider(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => run(
    () => RaylibDebugLabels.GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue),
    () {
      final valuePtr = rl.Temp.Float32$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiSlider(
        bounds,
        rl.Temp.String$.ValueOrNull(textLeft),
        rl.Temp.String$.ValueOrNull(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (result, valuePtr.value);
    },
  );

  @override
  (int result, double value) GuiSliderBar(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => run(
    () => RaylibDebugLabels.GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue),
    () {
      final valuePtr = rl.Temp.Float32$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiSliderBar(
        bounds,
        rl.Temp.String$.ValueOrNull(textLeft),
        rl.Temp.String$.ValueOrNull(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (result, valuePtr.value);
    },
  );

  @override
  (int result, double value) GuiProgressBar(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => run(
    () => RaylibDebugLabels.GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue),
    () {
      final valuePtr = rl.Temp.Float32$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiProgressBar(
        bounds,
        rl.Temp.String$.ValueOrNull(textLeft),
        rl.Temp.String$.ValueOrNull(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (result, valuePtr.value);
    },
  );

  @override
  int GuiStatusBar(
    RectangleD bounds,
    String? text,
  ) => run(
    () => RaylibDebugLabels.GuiStatusBar(bounds, text),
    () => rl.GuiFlat.GuiStatusBar(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  @override
  int GuiDummyRec(
    RectangleD bounds,
    String? text,
  ) => run(
    () => RaylibDebugLabels.GuiDummyRec(bounds, text),
    () => rl.GuiFlat.GuiDummyRec(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  @override
  int GuiGrid(
    RectangleD bounds,
    num spacing,
    num subdivs,
    [Vector2D? mouseCell]
  ) => run(
    () => RaylibDebugLabels.GuiGrid(bounds, spacing, subdivs, mouseCell),
    () => rl.Temp.Vector2$.RefUpdate1(mouseCell,
      (pv) => rl.GuiFlat.GuiGrid(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        spacing.toDouble(),
        subdivs.toInt(),
        pv,
      ),
    ),
  );

  @override
  (int result, int? scrollIndex, int? active) GuiListView(
    RectangleD bounds,
    String? text, {
      int? scrollIndex,
      int? active,
    }
  ) => run(
    () => RaylibDebugLabels.GuiListView(bounds, text, scrollIndex: scrollIndex, active: active),
    () {
      final scrollIndexPtr = rl.Temp.Int$.RefOrNull1(scrollIndex);
      final activePtr = rl.Temp.Int$.RefOrNull2(active);
      final result = rl.GuiFlat.GuiListView(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        scrollIndexPtr,
        activePtr,
      );
      return (
        result,
        scrollIndex == null ? null : scrollIndexPtr.value,
        active == null ? null : activePtr.value,
      );
    },
  );

  @override
  (int result, int? scrollIndex, int? active, int? focus) GuiListViewEx(
    RectangleD bounds,
    List<String>? text, {
      int? scrollIndex,
      int? active,
      int? focus,
    }
  ) => run(
    () => RaylibDebugLabels.GuiListViewEx(bounds, text, scrollIndex: scrollIndex, active: active, focus: focus),
    () {
      final scrollIndexPtr = rl.Temp.Int$.RefOrNull1(scrollIndex);
      final activePtr = rl.Temp.Int$.RefOrNull2(active);
      final focusPtr = rl.Temp.Int$.RefOrNull3(focus);
      final result = rl.GuiFlat.GuiListViewEx(
        bounds,
        (text == null ? MemoryPointer.nullptr : rl.Temp.String$.Array(text)).cast(),
        text?.length ?? 0,
        scrollIndexPtr,
        activePtr,
        focusPtr,
      );
      return (
        result,
        scrollIndex == null ? null : scrollIndexPtr.value,
        active == null ? null : activePtr.value,
        focus == null ? null : focusPtr.value,
      );
    },
  );

  @override
  int GuiMessageBox(
    RectangleD bounds,
    String? title,
    String message,
    String buttons,
  ) => run(
    () => RaylibDebugLabels.GuiMessageBox(bounds, title, message, buttons),
    () => rl.GuiFlat.GuiMessageBox(
      bounds,
      rl.Temp.String$.ValueOrNull(title),
      rl.Temp.String$.ValueOrNull(message),
      rl.Temp.String$.ValueOrNull(buttons),
    ),
  );

  @override
  (int result, String value, bool? secretViewActive) GuiTextInputBox(
    RectangleD bounds,
    String? title,
    String? message,
    String buttons,
    String? text,
    num textMaxSize,
    bool? secretViewActive,
  ) => run(
    () => RaylibDebugLabels.GuiTextInputBox(bounds, title, message, buttons, text, textMaxSize, secretViewActive),
    () {
      final valuePtr = rl.Temp.String$.Ref1(text, textMaxSize.toInt());
      final secretViewActivePtr = rl.Temp.Bool$.RefOrNull1(secretViewActive);
      final result = rl.GuiFlat.GuiTextInputBox(
        bounds,
        rl.Temp.String$.ValueOrNull(title),
        rl.Temp.String$.ValueOrNull(message),
        rl.Temp.String$.ValueOrNull(buttons),
        valuePtr,
        textMaxSize.toInt(),
        secretViewActivePtr,
      );
      return (result, valuePtr.toDartString(), secretViewActive == null ? null : secretViewActivePtr.value);
    },
  );

  @override
  (int result, ColorD color) GuiColorPicker(
    RectangleD bounds,
    ColorD? color,
  ) => run(
    () => RaylibDebugLabels.GuiColorPicker(bounds, color),
    () {
      final valuePtr = rl.Temp.Color$.Ref1(color);
      final result = rl.GuiFlat.GuiColorPicker(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        valuePtr,
      );
      return (result, valuePtr.ref);
    },
  );

  @override
  (int result, ColorD color) GuiColorPanel(
    RectangleD bounds,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.GuiColorPanel(bounds, color),
    () {
      final valuePtr = rl.Temp.Color$.Ref1(color);
      final result = rl.GuiFlat.GuiColorPanel(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        valuePtr,
      );
      return (result, valuePtr.ref);
    },
  );

  @override
  (int result, double alpha) GuiColorBarAlpha(
    RectangleD bounds,
    num alpha,
  ) => run(
    () => RaylibDebugLabels.GuiColorBarAlpha(bounds, alpha),
    () {
      final valuePtr = rl.Temp.Float32$.Ref1(alpha.toDouble());
      final result = rl.GuiFlat.GuiColorBarAlpha(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  @override
  (int result, double value) GuiColorBarHue(
    RectangleD bounds,
    num value,
  ) => run(
    () => RaylibDebugLabels.GuiColorBarHue(bounds, value),
    () {
      final valuePtr = rl.Temp.Float32$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiColorBarHue(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  @override
  (int result, Vector3D hsv) GuiColorPickerHSV(
    RectangleD bounds,
    [Vector3D? colorHsv]
  ) => run(
    () => RaylibDebugLabels.GuiColorPickerHSV(bounds, colorHsv),
    () {
      final valuePtr = rl.Temp.Vector3$.Ref1(colorHsv);
      final result = rl.GuiFlat.GuiColorPickerHSV(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        valuePtr,
      );
      return (result, valuePtr.ref);
    },
  );

  @override
  (int result, Vector3D hsv) GuiColorPanelHSV(
    RectangleD bounds,
    [Vector3D? colorHsv]
  ) => run(
    () => RaylibDebugLabels.GuiColorPanelHSV(bounds, colorHsv),
    () {
      final valuePtr = rl.Temp.Vector3$.Ref1(colorHsv);
      final result = rl.GuiFlat.GuiColorPanelHSV(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        valuePtr,
      );
      return (result, valuePtr.ref);
    },
  );
}
