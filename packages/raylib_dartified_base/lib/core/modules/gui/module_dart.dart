part of '../../raylib_dartified_base.dart';

/// Backend-agnostic Raygui module.
final class RaylibGuiDart<R extends RaylibBase> extends RaylibModule<R> with RaylibGuiModuleExtras<R> {

  RaylibGuiDart(super.rl);

  RaylibCoreFlat get _coreFlat => rl.module();
  RaylibGuiFlat get _flat => rl.module();

  /// Enable gui controls (global state)
  void GuiEnable() => debugRun(
    () => 'GuiEnable()',
    () => _flat.GuiEnable(),
  );

  /// Disable gui controls (global state)
  void GuiDisable() => debugRun(
    () => 'GuiDisable()',
    () => _flat.GuiDisable(),
  );

  /// Lock gui controls (global state)
  void GuiLock() => debugRun(
    () => 'GuiLock()',
    () => _flat.GuiLock(),
  );

  /// Unlock gui controls (global state)
  void GuiUnlock() => debugRun(
    () => 'GuiUnlock()',
    () => _flat.GuiUnlock(),
  );

  /// Check if gui is locked (global state)
  bool GuiIsLocked() => debugRun(
    () => 'GuiIsLocked()',
    () => _flat.GuiIsLocked(),
  );

  /// Set gui controls alpha (global state), alpha goes from 0.0 to 1.0
  void GuiSetAlpha(
    num alpha,
  ) => debugRun(
    () => 'GuiSetAlpha($alpha)',
    () => _flat.GuiSetAlpha(
      alpha.toDouble(),
    ),
  );

  /// Set gui state (global state)
  void GuiSetState(
    GuiState state,
  ) => debugRun(
    () => 'GuiSetState($state)',
    () => _flat.GuiSetState(
      state.value,
    ),
  );

  /// Get gui state (global state)
  int GuiGetState() => debugRun(
    () => 'GuiGetState()',
    () => _flat.GuiGetState(),
  );

  /// Set gui custom font (global state)
  void GuiSetFont(
    Font font,
  ) => debugRun(
    () => 'GuiSetFont($font)',
    () => _flat.GuiSetFont(
      font,
    ),
  );

  /// Get gui custom font (global state)
  Font GuiGetFont() => debugRun(
    () => 'GuiGetFont()',
    () => _flat.GuiGetFont(),
  );

  /// Set one style property
  void GuiSetStyle(
    GuiControl control,
    GuiProperty property,
    num value,
  ) => debugRun(
    () => 'GuiSetStyle(${control.name}, ${property.name}, $value)',
    () => _flat.GuiSetStyle(
      control.value,
      property.value,
      value.toInt(),
    ),
  );

  /// Get one style property
  int GuiGetStyle(
    GuiControl control,
    GuiProperty property,
  ) => debugRun(
    () => 'GuiGetStyle(${control.name}, ${property.name})',
    () => _flat.GuiGetStyle(
      control.value,
      property.value,
    ),
  );

  /// Load style file over global style variable (.rgs)
  void GuiLoadStyle(
    String fileName,
  ) => debugRun(
    () => 'GuiLoadStyle($fileName)',
    () => _flat.GuiLoadStyle(
      String$.ValueOrNull(fileName),
    ),
  );

  /// Load style from memory (binary only)
  void GuiLoadStyleFromMemory(
    Uint8List fileData,
  ) => debugRun(
    () => 'GuiLoadStyleFromMemory(data: ${fileData.length})',
    () => _flat.GuiLoadStyleFromMemory(
      UnsignedChar$.Array(fileData),
      fileData.length,
    ),
  );

  /// Load style default over global style
  void GuiLoadStyleDefault() => debugRun(
    () => 'GuiLoadStyleDefault()',
    () => _flat.GuiLoadStyleDefault(),
  );

  /// Enable gui tooltips (global state)
  void GuiEnableTooltip() => debugRun(
    () => 'GuiEnableTooltip()',
    () => _flat.GuiEnableTooltip(),
  );

  /// Disable gui tooltips (global state)
  void GuiDisableTooltip() => debugRun(
    () => 'GuiDisableTooltip()',
    () => _flat.GuiDisableTooltip(),
  );

  /// Set tooltip string
  void GuiSetTooltip(
    String? tooltip,
  ) => debugRun(
    () => 'GuiSetTooltip($tooltip)',
    () => _flat.GuiSetTooltip(
      String$.ValueOrNull(tooltip),
    ),
  );

  /// Get text with icon id prepended (if supported)
  String GuiIconText(
    GuiIconName iconId,
    String? text,
  ) => debugRun(
    () => 'GuiIconText(${iconId.name}, $text)',
    () => _flat.GuiIconText(
      iconId.value,
      String$.ValueOrNull(text),
    ).toDartString(),
  );

  /// Set default icon drawing size
  void GuiSetIconScale(
    num scale,
  ) => debugRun(
    () => 'GuiSetIconScale($scale)',
    () => _flat.GuiSetIconScale(
      scale.toInt(),
    ),
  );

  /// Get raygui icons data
  List<int> GuiGetIcons() => debugRun(
    () => 'GuiGetIcons()',
    () {
      final values = _flat.GuiGetIcons();
      return values.readArray(RAYGUI_ICON_MAX_ICONS*RAYGUI_ICON_DATA_ELEMENTS);
    },
  );

  /// Load raygui icons file (.rgi) into internal icons data
  List<String> GuiLoadIcons(
    String fileName,
    bool loadIconsName,
  ) => debugRun(
    () => 'GuiLoadIcons($fileName, $loadIconsName)',
    () {
      final fileNamePtr = String$.ValueOrNull(fileName);
      final values = _flat.GuiLoadIcons(
        fileNamePtr,
        loadIconsName,
      );
      if (!loadIconsName || values.isNull) return [];

      final dataSize = Int$.Ref1();
      final bytes = _coreFlat.LoadFileData(fileNamePtr, dataSize);
      if (dataSize.value < 10) return [];

      // read iconCount from file header (2 bytes short at offset 8)
      final iconCount = bytes.readInt16(8);
      try {
        return values.readStringArray(iconCount);
      } finally {
        values.readPtrArray(iconCount).forEach((p) => p.free());
        values.free();
      }
    },
  );

  /// Load raygui icons file (.rgi) from memory into internal icons data
  List<String> GuiLoadIconsFromMemory(
    Uint8List fileData,
    bool loadIconsName,
  ) => debugRun(
    () => 'GuiLoadIconsFromMemory(fileData: ${fileData.length}, $loadIconsName)',
    () {
      final values = _flat.GuiLoadIconsFromMemory(
        UnsignedChar$.Array(fileData),
        fileData.length,
        loadIconsName,
      );
      if (!loadIconsName || values.isNull) return [];
      if (fileData.length < 10) return [];

      // read iconCount from fileData (2 bytes short at offset 8)
      final iconCount = fileData.buffer.asByteData().getInt16(8, Endian.little);
      try {
        return values.readStringArray(iconCount);
      } finally {
        values.readPtrArray(iconCount).forEach((p) => p.free());
        values.free();
      }
    }
  );

  /// Draw icon using pixel size at specified position
  void GuiDrawIcon(
    GuiIconName iconId,
    num posX,
    num posY,
    num pixelSize,
    Color color,
  ) => debugRun(
    () => 'GuiDrawIcon(${iconId.name}, $posX, $posY, $pixelSize, $color)',
    () => _flat.GuiDrawIcon(
      iconId.value,
      posX.toInt(),
      posY.toInt(),
      pixelSize.toInt(),
      color,
    ),
  );

  /// Get text width considering gui style and icon size (if required)
  int GuiGetTextWidth(
    String? text,
  ) => debugRun(
    () => 'GuiGetTextWidth($text)',
    () => _flat.GuiGetTextWidth(
      String$.ValueOrNull(text), 
    ),
  );

  /// Window Box control, shows a window that can be closed
  GuiResult GuiWindowBox(
    Rectangle bounds,
    String? title,
  ) => debugRun(
    () => 'GuiWindowBox($bounds, $title)',
    () => .fromValue(_flat.GuiWindowBox(
      bounds,
      String$.ValueOrNull(title),
    )),
  );

  /// Group Box control with text name
  GuiResult GuiGroupBox(
    Rectangle bounds,
    String? text,
  ) => debugRun(
    () => 'GuiGroupBox($bounds, $text)',
    () => .fromValue(_flat.GuiGroupBox(
      bounds,
      String$.ValueOrNull(text),
    )),
  );

  /// Line separator control, could contain text
  GuiResult GuiLine(
    Rectangle bounds,
    String? text,
  ) => debugRun(
    () => 'GuiLine($bounds, $text)',
    () => .fromValue(_flat.GuiLine(
      bounds,
      String$.ValueOrNull(text),
    )),
  );

  /// Panel control, useful to group controls
  GuiResult GuiPanel(
    Rectangle bounds,
    String? text,
  ) => debugRun(
    () => 'GuiPanel($bounds, $text)',
    () => .fromValue(_flat.GuiPanel(
      bounds,
      String$.ValueOrNull(text),
    )),
  );

  /// Scroll Panel control
  GuiResult GuiScrollPanel(
    Rectangle bounds,
    String? text,
    Rectangle content, {
    Vector2? scroll,
    Rectangle? view,
  }) => debugRun(
    () => 'GuiScrollPanel($bounds, $text, $content, scroll: $scroll, view: $view)',
    () => .fromValue(_flat.GuiScrollPanel(
      bounds,
      String$.ValueOrNull(text),
      content,
      Vector2$.RefUnique(scroll),
      Rectangle$.RefUnique(view),
    )),
  );

  /// Label control
  GuiResult GuiLabel(
    Rectangle bounds,
    String? text,
  ) => debugRun(
    () => 'GuiLabel($bounds, $text)',
    () => .fromValue(_flat.GuiLabel(
      bounds,
      String$.ValueOrNull(text),
    )),
  );

  /// Button control, returns true when clicked
  GuiResult GuiButton(
    Rectangle bounds,
    String? text,
  ) => debugRun(
    () => 'GuiButton($bounds, $text)',
    () => .fromValue(_flat.GuiButton(
      bounds,
      String$.ValueOrNull(text),
    )),
  );

  /// Label button control, returns true when clicked
  GuiResult GuiLabelButton(
    Rectangle bounds,
    String? text,
  ) => debugRun(
    () => 'GuiLabelButton($bounds, $text)',
    () => .fromValue(_flat.GuiLabelButton(
      bounds,
      String$.ValueOrNull(text),
    )),
  );

  /// Toggle Button control
  (GuiResult result, bool active) GuiToggle(
    Rectangle bounds,
    String? text,
    bool active,
  ) => debugRun(
    () => 'GuiToggle($bounds, $text, $active)',
    () {
      final valuePtr = Bool$.Ref1(active);
      final result = _flat.GuiToggle(
        bounds,
        String$.ValueOrNull(text),
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Toggle Group control
  (GuiResult result, int active) GuiToggleGroup(
    Rectangle bounds,
    String? text,
    num active,
  ) => debugRun(
    () => 'GuiToggleGroup($bounds, $text, $active)',
    () {
      final valuePtr = Int$.Ref1(active.toInt());
      final result = _flat.GuiToggleGroup(
        bounds,
        String$.ValueOrNull(text),
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Toggle Slider control
  (GuiResult result, int active) GuiToggleSlider(
    Rectangle bounds,
    String? text,
    num active,
  ) => debugRun(
    () => 'GuiToggleSlider($bounds, $text, $active)',
    () {
      final valuePtr = Int$.Ref1(active.toInt());
      final result = _flat.GuiToggleSlider(
        bounds,
        String$.ValueOrNull(text),
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Check Box control, returns true when active
  (GuiResult result, bool checked) GuiCheckBox(
    Rectangle bounds,
    String? text,
    bool checked,
  ) => debugRun(
    () => 'GuiCheckBox($bounds, $text, $checked)',
    () {
      final valuePtr = Bool$.Ref1(checked);
      final result = _flat.GuiCheckBox(
        bounds,
        String$.ValueOrNull(text),
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Combo Box control
  (GuiResult result, int active) GuiComboBox(
    Rectangle bounds,
    String? text,
    num active,
  ) => debugRun(
    () => 'GuiComboBox($bounds, $text, $active)',
    () {
      final valuePtr = Int$.Ref1(active.toInt());
      final result = _flat.GuiComboBox(
        bounds,
        String$.ValueOrNull(text),
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Dropdown Box control
  (GuiResult result, int active) GuiDropdownBox(
    Rectangle bounds,
    String? text,
    num active,
    bool editMode,
  ) => debugRun(
    () => 'GuiDropdownBox($bounds, $text, $active, $editMode)',
    () {
      final valuePtr = Int$.Ref1(active.toInt());
      final result = _flat.GuiDropdownBox(
        bounds,
        String$.ValueOrNull(text),
        valuePtr,
        editMode,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Spinner control
  (GuiResult result, int value) GuiSpinner(
    Rectangle bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => debugRun(
    () => 'GuiSpinner($bounds, $text, $value, $minValue, $maxValue, $editMode)',
    () {
      final valuePtr = Int$.Ref1(value.toInt());
      final result = _flat.GuiSpinner(
        bounds,
        String$.ValueOrNull(text),
        valuePtr,
        minValue.toInt(),
        maxValue.toInt(),
        editMode,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Value Box control, updates input text with numbers
  (GuiResult result, int value) GuiValueBox(
    Rectangle bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => debugRun(
    () => 'GuiValueBox($bounds, $text, $value, $minValue, $maxValue, $editMode)',
    () {
      final valuePtr = Int$.Ref1(value.toInt());
      final result = _flat.GuiValueBox(
        bounds,
        String$.ValueOrNull(text),
        valuePtr,
        minValue.toInt(),
        maxValue.toInt(),
        editMode,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Value box control for float values
  (GuiResult result, double value) GuiValueBoxFloat(
    Rectangle bounds,
    String? text,
    String textValue,
    num value,
    bool editMode,
  ) => debugRun(
    () => 'GuiValueBoxFloat($bounds, $text, $textValue, $value, $editMode)',
    () {
      final valuePtr = Float$.Ref1(value.toDouble());
      final result = _flat.GuiValueBoxFloat(
        bounds,
        String$.ValueOrNull(text),
        String$.ValueOrNull(textValue),
        valuePtr,
        editMode,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Text Box control, updates input text
  (GuiResult result, String value) GuiTextBox(
    Rectangle bounds,
    String? text,
    num textSize,
    bool editMode,
  ) => debugRun(
    () => 'GuiTextBox($bounds, $text, $textSize, $editMode)',
    () {
      final valuePtr = String$.Ref1(text ?? '', textSize.toInt());
      final result = _flat.GuiTextBox(
        bounds,
        valuePtr,
        textSize.toInt(),
        editMode,
      );
      return (.fromValue(result), valuePtr.toDartString());
    },
  );

  /// Slider control
  (GuiResult result, double value) GuiSlider(
    Rectangle bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => debugRun(
    () => 'GuiSlider($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)',
    () {
      final valuePtr = Float$.Ref1(value.toDouble());
      final result = _flat.GuiSlider(
        bounds,
        String$.ValueOrNull(textLeft),
        String$.ValueOrNull(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Slider Bar control
  (GuiResult result, double value) GuiSliderBar(
    Rectangle bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => debugRun(
    () => 'GuiSliderBar($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)',
    () {
      final valuePtr = Float$.Ref1(value.toDouble());
      final result = _flat.GuiSliderBar(
        bounds,
        String$.ValueOrNull(textLeft),
        String$.ValueOrNull(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Progress Bar control
  (GuiResult result, double value) GuiProgressBar(
    Rectangle bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => debugRun(
    () => 'GuiProgressBar($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)',
    () {
      final valuePtr = Float$.Ref1(value.toDouble());
      final result = _flat.GuiProgressBar(
        bounds,
        String$.ValueOrNull(textLeft),
        String$.ValueOrNull(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Status Bar control, shows info text
  GuiResult GuiStatusBar(
    Rectangle bounds,
    String? text,
  ) => debugRun(
    () => 'GuiStatusBar($bounds, $text)',
    () => .fromValue(_flat.GuiStatusBar(
      bounds,
      String$.ValueOrNull(text),
    )),
  );

  /// Dummy control for placeholders
  GuiResult GuiDummyRec(
    Rectangle bounds,
    String? text,
  ) => debugRun(
    () => 'GuiDummyRec($bounds, $text)',
    () => .fromValue(_flat.GuiDummyRec(
      bounds,
      String$.ValueOrNull(text),
    )),
  );

  /// Grid control
  GuiResult GuiGrid(
    Rectangle bounds,
    num spacing,
    num subdivs, {
    Vector2? mouseCell,
  }) => debugRun(
    () => 'GuiGrid($bounds, $spacing, $subdivs, mouseCell: $mouseCell)',
    () => .fromValue(_flat.GuiGrid(
      bounds,
      .nullptr(), // `text` is not used at all
      spacing.toDouble(),
      subdivs.toInt(),
      Vector2$.RefUnique(mouseCell),
    )),
  );

  /// List View control
  (GuiResult result, int? scrollIndex, int? active) GuiListView(
    Rectangle bounds,
    String? text, {
    int? scrollIndex,
    int? active,
  }) => debugRun(
    () => 'GuiListView($bounds, $text, $scrollIndex, $active)',
    () {
      final scrollIndexPtr = Int$.RefOrNull1(scrollIndex);
      final activePtr = Int$.RefOrNull2(active);
      final result = _flat.GuiListView(
        bounds,
        String$.ValueOrNull(text),
        scrollIndexPtr,
        activePtr,
      );
      return (
        .fromValue(result),
        scrollIndex == null ? null : scrollIndexPtr.value,
        active == null ? null : activePtr.value,
      );
    },
  );

  /// List View control, using text entries list and returning focus entry
  (GuiResult result, int? scrollIndex, int? active, int? focus) GuiListViewEx(
    Rectangle bounds,
    List<String>? text, {
    int? scrollIndex,
    int? active,
    int? focus,
  }) => debugRun(
    () => 'GuiListViewEx($bounds, $text, $scrollIndex, $active, $focus)',
    () {
      final scrollIndexPtr = Int$.RefOrNull1(scrollIndex);
      final activePtr = Int$.RefOrNull2(active);
      final focusPtr = Int$.RefOrNull3(focus);
      final result = _flat.GuiListViewEx(
        bounds,
        text == null ? .nullptr() : String$.Array(text).cast(),
        text?.length ?? 0,
        scrollIndexPtr,
        activePtr,
        focusPtr,
      );
      return (
        .fromValue(result),
        scrollIndex == null ? null : scrollIndexPtr.value,
        active == null ? null : activePtr.value,
        focus == null ? null : focusPtr.value,
      );
    },
  );

  /// Tab Bar control
  (GuiResult result, int active) GuiTabBar(
    Rectangle bounds,
    String? text,
    int active,
  ) => debugRun(
    () => 'GuiTabBar($bounds, text: $text, active: $active)',
    () {
      final activePtr = Int$.Ref1(active);
      final result = _flat.GuiTabBar(
        bounds,
        String$.ValueOrNull(text),
        .nullptr(), // `hscroll` is not used at all
        activePtr,
      );
      return (.fromValue(result), activePtr.value);
    },
  );

  /// Tab Bar control, using text entries list and returning focus entry
  (GuiResult result, int active) GuiTabBarEx(
    Rectangle bounds,
    List<String>? text, {
    int? active,
  }) => debugRun(
    () => 'GuiTabBarEx($bounds, text: ${text?.length}, active: $active)',
    () {
      final activePtr = Int$.RefOrNull1(active);
      final result = _flat.GuiTabBarEx(
        bounds,
        text == null ? .nullptr() : String$.Array(text).cast(),
        text?.length ?? 0,
        .nullptr(), // `hscroll` is not used at all
        activePtr,
        .nullptr(), // `focus` is not used at all
      );
      return (.fromValue(result), activePtr.value);
    },
  );

  /// Message Box control, displays a message
  (GuiResult result, int btnActive) GuiMessageBox(
    Rectangle bounds,
    String? title,
    String message,
    String btnText,
  ) => debugRun(
    () => 'GuiMessageBox($bounds, $title, $message, $btnText)',
    () {
      final btnActivePtr = Int$.Ref1();
      int result = _flat.GuiMessageBox(
        bounds,
        String$.ValueOrNull(title),
        String$.ValueOrNull(message),
        String$.ValueOrNull(btnText),
        btnActivePtr,
      );
      return (.fromValue(result), btnActivePtr.value);
    },
  );

  /// Text Input Box control, ask for text, supports secret
  (GuiResult result, String value, int btnActive, bool? secretViewActive) GuiTextInputBox(
    Rectangle bounds,
    String? title,
    String? message,
    String? text,
    num textSize,
    String btnText,
    [bool? secretViewActive]
  ) => debugRun(
    () => 'GuiTextInputBox($bounds, $title, $message, $text, $textSize, $btnText, $secretViewActive)',
    () {
      final textPtr = String$.Ref1(text, textSize.toInt());
      final btnActivePtr = Int$.Ref1();
      final secretViewActivePtr = Bool$.RefOrNull1(secretViewActive);
      final result = _flat.GuiTextInputBox(
        bounds,
        String$.ValueOrNull(title),
        String$.ValueOrNull(message),
        textPtr,
        textSize.toInt(),
        String$.ValueOrNull(btnText),
        btnActivePtr,
        secretViewActivePtr,
      );
      return (
        .fromValue(result),
        textPtr.toDartString(),
        btnActivePtr.value,
        secretViewActive == null ? null : secretViewActivePtr.value,
      );
    },
  );

  /// Color Picker control, includes Color bar controls
  (GuiResult result, Color color) GuiColorPicker(
    Rectangle bounds,
    Color? color,
  ) => debugRun(
    () => 'GuiColorPicker($bounds, $color)',
    () {
      final valuePtr = Color$.Ref1(color);
      final result = _flat.GuiColorPicker(
        bounds,
        .nullptr(), // `text` is not used at all
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Color Panel control
  (GuiResult result, Color color) GuiColorPanel(
    Rectangle bounds,
    Color color,
  ) => debugRun(
    () => 'GuiColorPanel($bounds, $color)',
    () {
      final valuePtr = Color$.Ref1(color);
      final result = _flat.GuiColorPanel(
        bounds,
        .nullptr(), // `text` is not used at all
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Color Bar Alpha control
  (GuiResult result, double alpha) GuiColorBarAlpha(
    Rectangle bounds,
    num alpha,
  ) => debugRun(
    () => 'GuiColorBarAlpha($bounds, $alpha)',
    () {
      final valuePtr = Float$.Ref1(alpha.toDouble());
      final result = _flat.GuiColorBarAlpha(
        bounds,
        .nullptr(), // `text` is not used at all
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Color Bar Hue control
  (GuiResult result, double value) GuiColorBarHue(
    Rectangle bounds,
    num value,
  ) => debugRun(
    () => 'GuiColorBarHue($bounds, $value)',
    () {
      final valuePtr = Float$.Ref1(value.toDouble());
      final result = _flat.GuiColorBarHue(
        bounds,
        .nullptr(), // `text` is not used at all
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Color Picker control, using Hue-Saturation-Value color data, includes Color bar controls
  (GuiResult result, Vector3 hsv) GuiColorPickerHSV(
    Rectangle bounds,
    [Vector3? colorHsv]
  ) => debugRun(
    () => 'GuiColorPickerHSV($bounds, $colorHsv)',
    () {
      final valuePtr = Vector3$.Ref1(colorHsv);
      final result = _flat.GuiColorPickerHSV(
        bounds,
        .nullptr(), // `text` is not used at all
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Color Panel control, using Hue-Saturation-Value color data
  (GuiResult result, Vector3 hsv) GuiColorPanelHSV(
    Rectangle bounds,
    [Vector3? colorHsv]
  ) => debugRun(
    () => 'GuiColorPanelHSV($bounds, $colorHsv)',
    () {
      final valuePtr = Vector3$.Ref1(colorHsv);
      final result = _flat.GuiColorPanelHSV(
        bounds,
        .nullptr(), // `text` is not used at all
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );
}
