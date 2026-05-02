part of '../../../raylib.dart';

class RaylibGuiD extends RaylibModuleD with RaylibGuiExtras {
  RaylibGuiD(super.lib);

  void GuiEnable() => run(
    () => 'GuiEnable()',
    () => rl.Gui.GuiEnable(),
  );

  void GuiDisable() => run(
    () => 'GuiDisable()',
    () => rl.Gui.GuiDisable(),
  );

  void GuiLock() => run(
    () => 'GuiLock()',
    () => rl.Gui.GuiLock(),
  );

  void GuiUnlock() => run(
    () => 'GuiUnlock()',
    () => rl.Gui.GuiUnlock(),
  );

  bool GuiIsLocked() => run(
    () => 'GuiIsLocked()',
    () => rl.Gui.GuiIsLocked(),
  );

  void GuiSetAlpha(
    num alpha,
  ) => run(
    () => 'GuiSetAlpha($alpha)',
    () => rl.Gui.GuiSetAlpha(alpha.toDouble()),
  );

  void GuiSetState(
    GuiState state,
  ) => run(
    () => 'GuiSetState($state)',
    () => rl.Gui.GuiSetState(state.value),
  );

  int GuiGetState() => run(
    () => 'GuiGetState()',
    () => rl.Gui.GuiGetState(),
  );

  void GuiSetFont(
    FontD font,
  ) => run(
    () => 'GuiSetFont($font)',
    () => rl.Gui.GuiSetFont(_refFont1(font).ref),
  );

  FontD GuiGetFont() => run(
    () => 'GuiGetFont()',
    () => _refCaptureFont(
      'GuiGetFont',
      rl.Gui.GuiGetFont(),
    ),
  );

  void GuiSetStyle(
    GuiControl control,
    GuiProperty property,
    num value,
  ) => run(
    () => 'GuiSetStyle(${control.name}, ${property.name}, $value)',
    () => rl.Gui.GuiSetStyle(
      control.value,
      property.value,
      value.toInt(),
    ),
  );

  int GuiGetStyle(
    GuiControl control,
    GuiProperty property,
  ) => run(
    () => 'GuiGetStyle(${control.name}, ${property.name})',
    () => rl.Gui.GuiGetStyle(
      control.value,
      property.value,
    ),
  );

  void GuiLoadStyle(
    String fileName,
  ) => run(
    () => 'GuiLoadStyle($fileName)',
    () => rl.Gui.GuiLoadStyle(refStr(fileName)),
  );

  void GuiLoadStyleDefault() => run(
    () => 'GuiLoadStyleDefault()',
    () => rl.Gui.GuiLoadStyleDefault(),
  );

  void GuiEnableTooltip() => run(
    () => 'GuiEnableTooltip()',
    () => rl.Gui.GuiEnableTooltip(),
  );

  void GuiDisableTooltip() => run(
    () => 'GuiDisableTooltip()',
    () => rl.Gui.GuiDisableTooltip(),
  );

  void GuiSetTooltip(
    String? tooltip,
  ) => run(
    () => 'GuiSetTooltip($tooltip)',
    () => rl.Gui.GuiSetTooltip(refStr(tooltip)),
  );

  String GuiIconText(
    GuiIconName iconId,
    String? text,
  ) => run(
    () => 'GuiIconText(${iconId.name}, $text)',
    () => rl.Gui.GuiIconText(
      iconId.value,
      refStr(text),
    ).toD,
  );

  void GuiSetIconScale(
    num scale,
  ) => run(
    () => 'GuiSetIconScale($scale)',
    () => rl.Gui.GuiSetIconScale(scale.toInt()),
  );

  List<int> GuiGetIcons() => run(
    () => 'GuiGetIcons()',
    () {
      final values = rl.Gui.GuiGetIcons();
      return List.generate(RAYGUI_ICON_MAX_ICONS*RAYGUI_ICON_DATA_ELEMENTS, (i) => values[i]);
    },
  );

  List<String> GuiLoadIcons(
    String fileName,
    bool loadIconsName,
  ) => run(
    () => 'GuiLoadIcons($fileName, $loadIconsName)',
    () {
      final values = rl.Gui.GuiLoadIcons(refStr(fileName), loadIconsName);
      if (!loadIconsName || values == nullptr) return [];

      // read iconCount from file header (2 bytes short at offset 8)
      final file = File(fileName).openSync();
      file.setPositionSync(8);
      final bytes = file.readSync(2);
      file.closeSync();
      final iconCount = ByteData.sublistView(bytes).getInt16(0, Endian.little);
      return List.generate(iconCount, (i) => values[i].toD);
    },
  );

  void GuiDrawIcon(
    GuiIconName iconId,
    num posX,
    num posY,
    num pixelSize,
    ColorD color,
  ) => run(
    () => 'GuiDrawIcon(${iconId.name}, $posX, $posY, $pixelSize, $color)',
    () => rl.Gui.GuiDrawIcon(
      iconId.value,
      posX.toInt(),
      posY.toInt(),
      pixelSize.toInt(),
      _refColor1(color).ref,
    ),
  );

  int GuiGetTextWidth(
    String? text,
  ) => run(
    () => 'GuiGetTextWidth($text)',
    () => rl.Gui.GuiGetTextWidth(refStr(text)),
  );

  int GuiWindowBox(
    RectangleD bounds,
    String? title,
  ) => run(
    () => 'GuiWindowBox($bounds, $title)',
    () => rl.Gui.GuiWindowBox(
      _refRectangle1(bounds).ref,
      refStr(title),
    ),
  );

  int GuiGroupBox(
    RectangleD bounds,
    String? text,
  ) => run(
    () => 'GuiGroupBox($bounds, $text)',
    () => rl.Gui.GuiGroupBox(
      _refRectangle1(bounds).ref,
      refStr(text),
    ),
  );

  int GuiLine(
    RectangleD bounds,
    String? text,
  ) => run(
    () => 'GuiLine($bounds, $text)',
    () => rl.Gui.GuiLine(
      _refRectangle1(bounds).ref,
      refStr(text),
    ),
  );

  int GuiPanel(
    RectangleD bounds,
    String? text,
  ) => run(
    () => 'GuiPanel($bounds, $text)',
    () => rl.Gui.GuiPanel(
      _refRectangle1(bounds).ref,
      refStr(text),
    ),
  );

  (int tab, int active) GuiTabBar(
    RectangleD bounds,
    List<String> text,
  ) => run(
    () => 'GuiTabBar($bounds, text: ${text.length})',
    () {
      final active = refInt1();
      final currentTabClosingRequested = rl.Gui.GuiTabBar(
        _refRectangle1(bounds).ref,
        rl.Temp.String$.Array(text),
        text.length,
        active,
      );
      return (currentTabClosingRequested, active.value);
    },
  );

  int GuiScrollPanel(
    RectangleD bounds,
    String? text,
    RectangleD content,
    Vector2D scroll,
    [RectangleD? view]
  ) => run(
    () => 'GuiScrollPanel($bounds, $text, $content, $scroll, $view)',
    () => _refUpdateVector2(scroll,
      (ps) => _refUpdateRectangle(view,
        (pv) => rl.Gui.GuiScrollPanel(
          _refRectangle2(bounds).ref,
          refStr(text),
          _refRectangle3(content).ref,
          ps,
          pv,
        ),
      ),
    ),
  );

  int GuiLabel(
    RectangleD bounds,
    String? text,
  ) => run(
    () => 'GuiLabel($bounds, $text)',
    () => rl.Gui.GuiLabel(
      _refRectangle1(bounds).ref,
      refStr(text),
    ),
  );

  int GuiButton(
    RectangleD bounds,
    String? text,
  ) => run(
    () => 'GuiButton($bounds, $text)',
    () => rl.Gui.GuiButton(
      _refRectangle1(bounds).ref,
      refStr(text),
    ),
  );

  int GuiLabelButton(
    RectangleD bounds,
    String? text,
  ) => run(
    () => 'GuiLabelButton($bounds, $text)',
    () => rl.Gui.GuiLabelButton(
      _refRectangle1(bounds).ref,
      refStr(text),
    ),
  );

  (int result, bool active) GuiToggle(
    RectangleD bounds,
    String? text,
    bool active,
  ) => run(
    () => 'GuiToggle($bounds, $text, $active)',
    () {
      final valuePtr = refBool1(active);
      final result = rl.Gui.GuiToggle(
        _refRectangle1(bounds).ref,
        refStr(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  (int result, int active) GuiToggleGroup(
    RectangleD bounds,
    String? text,
    num active,
  ) => run(
    () => 'GuiToggleGroup($bounds, $text, $active)',
    () {
      final valuePtr = refInt1(active.toInt());
      final result = rl.Gui.GuiToggleGroup(
        _refRectangle1(bounds).ref,
        refStr(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  (int result, int active) GuiToggleSlider(
    RectangleD bounds,
    String? text,
    num active,
  ) => run(
    () => 'GuiToggleSlider($bounds, $text, $active)',
    () {
      final valuePtr = refInt1(active.toInt());
      final result = rl.Gui.GuiToggleSlider(
        _refRectangle1(bounds).ref,
        refStr(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  (int result, bool checked) GuiCheckBox(
    RectangleD bounds,
    String? text,
    bool checked,
  ) => run(
    () => 'GuiCheckBox($bounds, $text, $checked)',
    () {
      final valuePtr = refBool1(checked);
      final result = rl.Gui.GuiCheckBox(
        _refRectangle1(bounds).ref,
        refStr(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  (int result, int active) GuiComboBox(
    RectangleD bounds,
    String? text,
    num active,
  ) => run(
    () => 'GuiComboBox($bounds, $text, $active)',
    () {
      final valuePtr = refInt1(active.toInt());
      final result = rl.Gui.GuiComboBox(
        _refRectangle1(bounds).ref,
        refStr(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  (int result, int active) GuiDropdownBox(
    RectangleD bounds,
    String? text,
    num active,
    bool editMode,
  ) => run(
    () => 'GuiDropdownBox($bounds, $text, $active, $editMode)',
    () {
      final valuePtr = refInt1(active.toInt());
      final result = rl.Gui.GuiDropdownBox(
        _refRectangle1(bounds).ref,
        refStr(text),
        valuePtr,
        editMode,
      );
      return (result, valuePtr.value);
    },
  );

  (int result, int value) GuiSpinner(
    RectangleD bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => run(
    () => 'GuiSpinner($bounds, $text, $value, $minValue, $maxValue, $editMode)',
    () {
      final valuePtr = refInt1(value.toInt());
      final result = rl.Gui.GuiSpinner(
        _refRectangle1(bounds).ref,
        refStr(text),
        valuePtr,
        minValue.toInt(),
        maxValue.toInt(),
        editMode,
      );
      return (result, valuePtr.value);
    },
  );

  (int result, int value) GuiValueBox(
    RectangleD bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => run(
    () => 'GuiValueBox($bounds, $text, $value, $minValue, $maxValue, $editMode)',
    () {
      final valuePtr = refInt1(value.toInt());
      final result = rl.Gui.GuiValueBox(
        _refRectangle1(bounds).ref,
        refStr(text),
        valuePtr,
        minValue.toInt(),
        maxValue.toInt(),
        editMode,
      );
      return (result, valuePtr.value);
    },
  );

  (int result, double value) GuiValueBoxFloat(
    RectangleD bounds,
    String? text,
    String textValue,
    num value,
    bool editMode,
  ) => run(
    () => 'GuiValueBoxFloat($bounds, $text, $textValue, $value, $editMode)',
    () {
      final valuePtr = refFloat1(value.toDouble());
      final result = rl.Gui.GuiValueBoxFloat(
        _refRectangle1(bounds).ref,
        refStr(text),
        refStr(textValue),
        valuePtr,
        editMode,
      );
      return (result, valuePtr.value);
    },
  );

  (int result, String value) GuiTextBox(
    RectangleD bounds,
    String? text,
    num textSize,
    bool editMode,
  ) => run(
    () => 'GuiTextBox($bounds, $text, $textSize, $editMode)',
    () {
      final valuePtr = refString1(text);
      final result = rl.Gui.GuiTextBox(
        _refRectangle1(bounds).ref,
        valuePtr,
        textSize.toInt(),
        editMode,
      );
      return (result, valuePtr.toD);
    },
  );

  (int result, double value) GuiSlider(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => run(
    () => 'GuiSlider($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)',
    () {
      final valuePtr = refFloat1(value.toDouble());
      final result = rl.Gui.GuiSlider(
        _refRectangle1(bounds).ref,
        refStr(textLeft),
        refStr(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (result, valuePtr.value);
    },
  );

  (int result, double value) GuiSliderBar(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => run(
    () => 'GuiSliderBar($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)',
    () {
      final valuePtr = refFloat1(value.toDouble());
      final result = rl.Gui.GuiSliderBar(
        _refRectangle1(bounds).ref,
        refStr(textLeft),
        refStr(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (result, valuePtr.value);
    },
  );

  (int result, double value) GuiProgressBar(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => run(
    () => 'GuiProgressBar($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)',
    () {
      final valuePtr = refFloat1(value.toDouble());
      final result = rl.Gui.GuiProgressBar(
        _refRectangle1(bounds).ref,
        refStr(textLeft),
        refStr(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (result, valuePtr.value);
    },
  );

  int GuiStatusBar(
    RectangleD bounds,
    String? text,
  ) => run(
    () => 'GuiStatusBar($bounds, $text)',
    () => rl.Gui.GuiStatusBar(
      _refRectangle1(bounds).ref,
      refStr(text),
    ),
  );

  int GuiDummyRec(
    RectangleD bounds,
    String? text,
  ) => run(
    () => 'GuiDummyRec($bounds, $text)',
    () => rl.Gui.GuiDummyRec(
      _refRectangle1(bounds).ref,
      refStr(text),
    ),
  );

  // NOTE: for some reason, it accepts `text`, but internally, it's not used
  int GuiGrid(
    RectangleD bounds,
    // String text,
    num spacing,
    num subdivs,
    [Vector2D? mouseCell]
  ) => run(
    // () => 'GuiGrid($bounds, $text, $spacing, $subdivs, $mouseCell)',
    () => 'GuiGrid($bounds, $spacing, $subdivs, $mouseCell)',
    () => _refUpdateVector2(mouseCell,
      (pv) => rl.Gui.GuiGrid(
        _refRectangle1(bounds).ref,
        // str(text),
        nullptr,
        spacing.toDouble(),
        subdivs.toInt(),
        pv,
      ),
    ),
  );

  (int result, int scrollIndex, int active) GuiListView(
    RectangleD bounds,
    String? text, {
      int? scrollIndex,
      int? active,
    }
  ) => run(
    () => 'GuiListView($bounds, $text, $scrollIndex, $active)',
    () {
      final scrollIndexPtr = refInt1OrNull(scrollIndex);
      final activePtr = refInt2OrNull(active);
      final result = rl.Gui.GuiListView(
        _refRectangle1(bounds).ref,
        refStr(text),
        scrollIndexPtr,
        activePtr,
      );
      return (result, scrollIndexPtr.value, activePtr.value);
    },
  );

  (int result, int scrollIndex, int active, int focus) GuiListViewEx(
    RectangleD bounds,
    List<String> text, {
      int? scrollIndex,
      int? active,
      int? focus,
    }
  ) => run(
    () => 'GuiListViewEx($bounds, $text, $scrollIndex, $active, $focus)',
    () {
      final scrollIndexPtr = refInt1OrNull(scrollIndex);
      final activePtr = refInt2OrNull(active);
      final focusPtr = refInt3OrNull(focus);
      final result = rl.Gui.GuiListViewEx(
        _refRectangle1(bounds).ref,
        rl.Temp.String$.Array(text),
        text.length,
        scrollIndexPtr,
        activePtr,
        focusPtr,
      );
      return (result, scrollIndexPtr.value, activePtr.value, focusPtr.value);
    },
  );

  int GuiMessageBox(
    RectangleD bounds,
    String? title,
    String message,
    String buttons,
  ) => run(
    () => 'GuiMessageBox($bounds, $title, $message, $buttons)',
    () => rl.Gui.GuiMessageBox(
      _refRectangle1(bounds).ref,
      refStr(title),
      refStr(message),
      refStr(buttons),
    ),
  );

  (int result, String value) GuiTextInputBox(
    RectangleD bounds,
    String? title,
    String? message,
    String buttons,
    String? text,
    num textMaxSize,
    bool? secretViewActive,
  ) => run(
    () => 'GuiTextInputBox($bounds, $title, $message, $buttons, $text, $textMaxSize, $secretViewActive)',
    () {
      final valuePtr = refString1(text);
      final secretViewActivePtr = refBool1OrNull(secretViewActive);
      final result = rl.Gui.GuiTextInputBox(
        _refRectangle1(bounds).ref,
        refStr(title),
        refStr(message),
        refStr(buttons),
        valuePtr,
        textMaxSize.toInt(),
        secretViewActivePtr,
      );
      return (result, valuePtr.toD);
    },
  );

  // NOTE: for some reason, it accepts `text`, but internally, it's not used
  (int result, ColorD color) GuiColorPicker(
    RectangleD bounds,
    // String text,
    ColorD? color,
  ) => run(
    // () => 'GuiColorPicker($bounds, $text, $color)',
    () => 'GuiColorPicker($bounds, $color)',
    () {
      final valuePtr = _refColor1(color);
      final result = rl.Gui.GuiColorPicker(
        _refRectangle1(bounds).ref,
        // str(text),
        nullptr,
        valuePtr,
      );
      return (result, valuePtr.toD());
    },
  );

  // NOTE: for some reason, it accepts `text`, but internally, it's not used
  (int result, ColorD color) GuiColorPanel(
    RectangleD bounds,
    // String text,
    ColorD color,
  ) => run(
    // () => 'GuiColorPanel($bounds, $text, $color)',
    () => 'GuiColorPanel($bounds, $color)',
    () {
      final valuePtr = _refColor1(color);
      final result = rl.Gui.GuiColorPanel(
        _refRectangle1(bounds).ref,
        // str(text),
        nullptr,
        valuePtr,
      );
      return (result, valuePtr.toD());
    },
  );

  // NOTE: for some reason, it accepts `text`, but internally, it's not used
  (int result, double alpha) GuiColorBarAlpha(
    RectangleD bounds,
    // String text,
    num alpha,
  ) => run(
    // () => 'GuiColorBarAlpha($bounds, $text, $alpha)',
    () => 'GuiColorBarAlpha($bounds, $alpha)',
    () {
      final valuePtr = refFloat1(alpha.toDouble());
      final result = rl.Gui.GuiColorBarAlpha(
        _refRectangle1(bounds).ref,
        // str(text),
        nullptr,
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  // NOTE: for some reason, it accepts `text`, but internally, it's not used
  (int result, double value) GuiColorBarHue(
    RectangleD bounds,
    // String text,
    num value,
  ) => run(
    // () => 'GuiColorBarHue($bounds, $text, $value)',
    () => 'GuiColorBarHue($bounds, $value)',
    () {
      final valuePtr = refFloat1(value.toDouble());
      final result = rl.Gui.GuiColorBarHue(
        _refRectangle1(bounds).ref,
        // str(text),
        nullptr,
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  // NOTE: for some reason, it accepts `text`, but internally, it's not used
  (int result, Vector3D hsv) GuiColorPickerHSV(
    RectangleD bounds,
    // String text,
    [Vector3D? colorHsv]
  ) => run(
    // () => 'GuiColorPickerHSV($bounds, $text, $colorHsv)',
    () => 'GuiColorPickerHSV($bounds, $colorHsv)',
    () {
      final valuePtr = _refVector31(colorHsv);
      final result = rl.Gui.GuiColorPickerHSV(
        _refRectangle1(bounds).ref,
        // str(text),
        nullptr,
        valuePtr,
      );
      return (result, valuePtr.toD());
    },
  );

  // NOTE: for some reason, it accepts `text`, but internally, it's not used
  (int result, Vector3D hsv) GuiColorPanelHSV(
    RectangleD bounds,
    // String text,
    [Vector3D? colorHsv]
  ) => run(
    // () => 'GuiColorPanelHSV($bounds, $text, $colorHsv)',
    () => 'GuiColorPanelHSV($bounds, $colorHsv)',
    () {
      final valuePtr = _refVector31(colorHsv);
      final result = rl.Gui.GuiColorPanelHSV(
        _refRectangle1(bounds).ref,
        // str(text),
        nullptr,
        valuePtr,
      );
      return (result, valuePtr.toD());
    },
  );
}
