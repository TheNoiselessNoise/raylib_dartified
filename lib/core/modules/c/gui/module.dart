part of '../../../raylib_dartified.dart';

class RaylibGui extends RaylibModule<Raylib> with RaylibGuiModuleExtras<Raylib> {
  RaylibGui(super.rl);

  void GuiEnable() {
    return _GuiEnable();
  }

  late final _GuiEnablePtr = rl.guiLookup<NativeFunction<Void Function()>>(
    'GuiEnable',
  );
  late final _GuiEnable = _GuiEnablePtr.asFunction<void Function()>();

  void GuiDisable() {
    return _GuiDisable();
  }

  late final _GuiDisablePtr = rl.guiLookup<NativeFunction<Void Function()>>(
    'GuiDisable',
  );
  late final _GuiDisable = _GuiDisablePtr.asFunction<void Function()>();

  void GuiLock() {
    return _GuiLock();
  }

  late final _GuiLockPtr = rl.guiLookup<NativeFunction<Void Function()>>(
    'GuiLock',
  );
  late final _GuiLock = _GuiLockPtr.asFunction<void Function()>();

  void GuiUnlock() {
    return _GuiUnlock();
  }

  late final _GuiUnlockPtr = rl.guiLookup<NativeFunction<Void Function()>>(
    'GuiUnlock',
  );
  late final _GuiUnlock = _GuiUnlockPtr.asFunction<void Function()>();

  bool GuiIsLocked() {
    return _GuiIsLocked();
  }

  late final _GuiIsLockedPtr = rl.guiLookup<NativeFunction<Bool Function()>>(
    'GuiIsLocked',
  );
  late final _GuiIsLocked = _GuiIsLockedPtr.asFunction<bool Function()>();

  void GuiSetAlpha(double alpha) {
    return _GuiSetAlpha(alpha);
  }

  late final _GuiSetAlphaPtr = rl
      .guiLookup<NativeFunction<Void Function(Float)>>('GuiSetAlpha');
  late final _GuiSetAlpha = _GuiSetAlphaPtr.asFunction<void Function(double)>();

  void GuiSetState(int state) {
    return _GuiSetState(state);
  }

  late final _GuiSetStatePtr = rl.guiLookup<NativeFunction<Void Function(Int)>>(
    'GuiSetState',
  );
  late final _GuiSetState = _GuiSetStatePtr.asFunction<void Function(int)>();

  int GuiGetState() {
    return _GuiGetState();
  }

  late final _GuiGetStatePtr = rl.guiLookup<NativeFunction<Int Function()>>(
    'GuiGetState',
  );
  late final _GuiGetState = _GuiGetStatePtr.asFunction<int Function()>();

  void GuiSetFont(FontC font) {
    return _GuiSetFont(font);
  }

  late final _GuiSetFontPtr = rl.guiLookup<NativeFunction<Void Function(FontC)>>(
    'GuiSetFont',
  );
  late final _GuiSetFont = _GuiSetFontPtr.asFunction<void Function(FontC)>();

  FontC GuiGetFont() {
    return _GuiGetFont();
  }

  late final _GuiGetFontPtr = rl.guiLookup<NativeFunction<FontC Function()>>(
    'GuiGetFont',
  );
  late final _GuiGetFont = _GuiGetFontPtr.asFunction<FontC Function()>();

  void GuiSetStyle(int control, int property, int value) {
    return _GuiSetStyle(control, property, value);
  }

  late final _GuiSetStylePtr = rl
      .guiLookup<NativeFunction<Void Function(Int, Int, Int)>>('GuiSetStyle');
  late final _GuiSetStyle =
      _GuiSetStylePtr.asFunction<void Function(int, int, int)>();

  int GuiGetStyle(int control, int property) {
    return _GuiGetStyle(control, property);
  }

  late final _GuiGetStylePtr = rl
      .guiLookup<NativeFunction<Int Function(Int, Int)>>('GuiGetStyle');
  late final _GuiGetStyle =
      _GuiGetStylePtr.asFunction<int Function(int, int)>();

  void GuiLoadStyle(Pointer<Char> fileName) {
    return _GuiLoadStyle(fileName);
  }

  late final _GuiLoadStylePtr = rl
      .guiLookup<NativeFunction<Void Function(Pointer<Char>)>>('GuiLoadStyle');
  late final _GuiLoadStyle =
      _GuiLoadStylePtr.asFunction<void Function(Pointer<Char>)>();

  void GuiLoadStyleDefault() {
    return _GuiLoadStyleDefault();
  }

  late final _GuiLoadStyleDefaultPtr = rl
      .guiLookup<NativeFunction<Void Function()>>('GuiLoadStyleDefault');
  late final _GuiLoadStyleDefault =
      _GuiLoadStyleDefaultPtr.asFunction<void Function()>();

  void GuiEnableTooltip() {
    return _GuiEnableTooltip();
  }

  late final _GuiEnableTooltipPtr = rl
      .guiLookup<NativeFunction<Void Function()>>('GuiEnableTooltip');
  late final _GuiEnableTooltip =
      _GuiEnableTooltipPtr.asFunction<void Function()>();

  void GuiDisableTooltip() {
    return _GuiDisableTooltip();
  }

  late final _GuiDisableTooltipPtr = rl
      .guiLookup<NativeFunction<Void Function()>>('GuiDisableTooltip');
  late final _GuiDisableTooltip =
      _GuiDisableTooltipPtr.asFunction<void Function()>();

  void GuiSetTooltip(Pointer<Char> tooltip) {
    return _GuiSetTooltip(tooltip);
  }

  late final _GuiSetTooltipPtr = rl
      .guiLookup<NativeFunction<Void Function(Pointer<Char>)>>('GuiSetTooltip');
  late final _GuiSetTooltip =
      _GuiSetTooltipPtr.asFunction<void Function(Pointer<Char>)>();

  Pointer<Char> GuiIconText(int iconId, Pointer<Char> text) {
    return _GuiIconText(iconId, text);
  }

  late final _GuiIconTextPtr = rl
      .guiLookup<NativeFunction<Pointer<Char> Function(Int, Pointer<Char>)>>(
        'GuiIconText',
      );
  late final _GuiIconText =
      _GuiIconTextPtr.asFunction<Pointer<Char> Function(int, Pointer<Char>)>();

  void GuiSetIconScale(int scale) {
    return _GuiSetIconScale(scale);
  }

  late final _GuiSetIconScalePtr = rl
      .guiLookup<NativeFunction<Void Function(Int)>>('GuiSetIconScale');
  late final _GuiSetIconScale =
      _GuiSetIconScalePtr.asFunction<void Function(int)>();

  Pointer<UnsignedInt> GuiGetIcons() {
    return _GuiGetIcons();
  }

  late final _GuiGetIconsPtr = rl
      .guiLookup<NativeFunction<Pointer<UnsignedInt> Function()>>(
        'GuiGetIcons',
      );
  late final _GuiGetIcons =
      _GuiGetIconsPtr.asFunction<Pointer<UnsignedInt> Function()>();

  Pointer<Pointer<Char>> GuiLoadIcons(
    Pointer<Char> fileName,
    bool loadIconsName,
  ) {
    return _GuiLoadIcons(fileName, loadIconsName);
  }

  late final _GuiLoadIconsPtr = rl
      .guiLookup<
        NativeFunction<Pointer<Pointer<Char>> Function(Pointer<Char>, Bool)>
      >('GuiLoadIcons');
  late final _GuiLoadIcons =
      _GuiLoadIconsPtr.asFunction<
        Pointer<Pointer<Char>> Function(Pointer<Char>, bool)
      >();

  void GuiDrawIcon(
    int iconId,
    int posX,
    int posY,
    int pixelSize,
    ColorC color,
  ) {
    return _GuiDrawIcon(iconId, posX, posY, pixelSize, color);
  }

  late final _GuiDrawIconPtr = rl
      .guiLookup<NativeFunction<Void Function(Int, Int, Int, Int, ColorC)>>(
        'GuiDrawIcon',
      );
  late final _GuiDrawIcon =
      _GuiDrawIconPtr.asFunction<void Function(int, int, int, int, ColorC)>();

  int GuiGetTextWidth(Pointer<Char> text) {
    return _GuiGetTextWidth(text);
  }

  late final _GuiGetTextWidthPtr = rl
      .guiLookup<NativeFunction<Int Function(Pointer<Char>)>>(
        'GuiGetTextWidth',
      );
  late final _GuiGetTextWidth =
      _GuiGetTextWidthPtr.asFunction<int Function(Pointer<Char>)>();

  int GuiWindowBox(RectangleC bounds, Pointer<Char> title) {
    return _GuiWindowBox(bounds, title);
  }

  late final _GuiWindowBoxPtr = rl
      .guiLookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>(
        'GuiWindowBox',
      );
  late final _GuiWindowBox =
      _GuiWindowBoxPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  int GuiGroupBox(RectangleC bounds, Pointer<Char> text) {
    return _GuiGroupBox(bounds, text);
  }

  late final _GuiGroupBoxPtr = rl
      .guiLookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>(
        'GuiGroupBox',
      );
  late final _GuiGroupBox =
      _GuiGroupBoxPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  int GuiLine(RectangleC bounds, Pointer<Char> text) {
    return _GuiLine(bounds, text);
  }

  late final _GuiLinePtr = rl
      .guiLookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>(
        'GuiLine',
      );
  late final _GuiLine =
      _GuiLinePtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  int GuiPanel(RectangleC bounds, Pointer<Char> text) {
    return _GuiPanel(bounds, text);
  }

  late final _GuiPanelPtr = rl
      .guiLookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>(
        'GuiPanel',
      );
  late final _GuiPanel =
      _GuiPanelPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  int GuiTabBar(
    RectangleC bounds,
    Pointer<Pointer<Char>> text,
    int count,
    Pointer<Int> active,
  ) {
    return _GuiTabBar(bounds, text, count, active);
  }

  late final _GuiTabBarPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(RectangleC, Pointer<Pointer<Char>>, Int, Pointer<Int>)
        >
      >('GuiTabBar');
  late final _GuiTabBar =
      _GuiTabBarPtr.asFunction<
        int Function(RectangleC, Pointer<Pointer<Char>>, int, Pointer<Int>)
      >();

  int GuiScrollPanel(
    RectangleC bounds,
    Pointer<Char> text,
    RectangleC content,
    Pointer<Vector2C> scroll,
    Pointer<RectangleC> view,
  ) {
    return _GuiScrollPanel(bounds, text, content, scroll, view);
  }

  late final _GuiScrollPanelPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(
            RectangleC,
            Pointer<Char>,
            RectangleC,
            Pointer<Vector2C>,
            Pointer<RectangleC>,
          )
        >
      >('GuiScrollPanel');
  late final _GuiScrollPanel =
      _GuiScrollPanelPtr.asFunction<
        int Function(
          RectangleC,
          Pointer<Char>,
          RectangleC,
          Pointer<Vector2C>,
          Pointer<RectangleC>,
        )
      >();

  int GuiLabel(RectangleC bounds, Pointer<Char> text) {
    return _GuiLabel(bounds, text);
  }

  late final _GuiLabelPtr = rl
      .guiLookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>(
        'GuiLabel',
      );
  late final _GuiLabel =
      _GuiLabelPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  int GuiButton(RectangleC bounds, Pointer<Char> text) {
    return _GuiButton(bounds, text);
  }

  late final _GuiButtonPtr = rl
      .guiLookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>(
        'GuiButton',
      );
  late final _GuiButton =
      _GuiButtonPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  int GuiLabelButton(RectangleC bounds, Pointer<Char> text) {
    return _GuiLabelButton(bounds, text);
  }

  late final _GuiLabelButtonPtr = rl
      .guiLookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>(
        'GuiLabelButton',
      );
  late final _GuiLabelButton =
      _GuiLabelButtonPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  int GuiToggle(RectangleC bounds, Pointer<Char> text, Pointer<Bool> active) {
    return _GuiToggle(bounds, text, active);
  }

  late final _GuiTogglePtr = rl
      .guiLookup<
        NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Bool>)>
      >('GuiToggle');
  late final _GuiToggle =
      _GuiTogglePtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Bool>)
      >();

  int GuiToggleGroup(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<Int> active,
  ) {
    return _GuiToggleGroup(bounds, text, active);
  }

  late final _GuiToggleGroupPtr = rl
      .guiLookup<
        NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Int>)>
      >('GuiToggleGroup');
  late final _GuiToggleGroup =
      _GuiToggleGroupPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Int>)
      >();

  int GuiToggleSlider(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<Int> active,
  ) {
    return _GuiToggleSlider(bounds, text, active);
  }

  late final _GuiToggleSliderPtr = rl
      .guiLookup<
        NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Int>)>
      >('GuiToggleSlider');
  late final _GuiToggleSlider =
      _GuiToggleSliderPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Int>)
      >();

  int GuiCheckBox(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<Bool> checked,
  ) {
    return _GuiCheckBox(bounds, text, checked);
  }

  late final _GuiCheckBoxPtr = rl
      .guiLookup<
        NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Bool>)>
      >('GuiCheckBox');
  late final _GuiCheckBox =
      _GuiCheckBoxPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Bool>)
      >();

  int GuiComboBox(RectangleC bounds, Pointer<Char> text, Pointer<Int> active) {
    return _GuiComboBox(bounds, text, active);
  }

  late final _GuiComboBoxPtr = rl
      .guiLookup<
        NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Int>)>
      >('GuiComboBox');
  late final _GuiComboBox =
      _GuiComboBoxPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Int>)
      >();

  int GuiDropdownBox(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<Int> active,
    bool editMode,
  ) {
    return _GuiDropdownBox(bounds, text, active, editMode);
  }

  late final _GuiDropdownBoxPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(RectangleC, Pointer<Char>, Pointer<Int>, Bool)
        >
      >('GuiDropdownBox');
  late final _GuiDropdownBox =
      _GuiDropdownBoxPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Int>, bool)
      >();

  int GuiSpinner(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<Int> value,
    int minValue,
    int maxValue,
    bool editMode,
  ) {
    return _GuiSpinner(bounds, text, value, minValue, maxValue, editMode);
  }

  late final _GuiSpinnerPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(RectangleC, Pointer<Char>, Pointer<Int>, Int, Int, Bool)
        >
      >('GuiSpinner');
  late final _GuiSpinner =
      _GuiSpinnerPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Int>, int, int, bool)
      >();

  int GuiValueBox(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<Int> value,
    int minValue,
    int maxValue,
    bool editMode,
  ) {
    return _GuiValueBox(bounds, text, value, minValue, maxValue, editMode);
  }

  late final _GuiValueBoxPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(RectangleC, Pointer<Char>, Pointer<Int>, Int, Int, Bool)
        >
      >('GuiValueBox');
  late final _GuiValueBox =
      _GuiValueBoxPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Int>, int, int, bool)
      >();

  int GuiValueBoxFloat(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<Char> textValue,
    Pointer<Float> value,
    bool editMode,
  ) {
    return _GuiValueBoxFloat(bounds, text, textValue, value, editMode);
  }

  late final _GuiValueBoxFloatPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(
            RectangleC,
            Pointer<Char>,
            Pointer<Char>,
            Pointer<Float>,
            Bool,
          )
        >
      >('GuiValueBoxFloat');
  late final _GuiValueBoxFloat =
      _GuiValueBoxFloatPtr.asFunction<
        int Function(
          RectangleC,
          Pointer<Char>,
          Pointer<Char>,
          Pointer<Float>,
          bool,
        )
      >();

  int GuiTextBox(
    RectangleC bounds,
    Pointer<Char> text,
    int textSize,
    bool editMode,
  ) {
    return _GuiTextBox(bounds, text, textSize, editMode);
  }

  late final _GuiTextBoxPtr = rl
      .guiLookup<
        NativeFunction<Int Function(RectangleC, Pointer<Char>, Int, Bool)>
      >('GuiTextBox');
  late final _GuiTextBox =
      _GuiTextBoxPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, int, bool)
      >();

  int GuiSlider(
    RectangleC bounds,
    Pointer<Char> textLeft,
    Pointer<Char> textRight,
    Pointer<Float> value,
    double minValue,
    double maxValue,
  ) {
    return _GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue);
  }

  late final _GuiSliderPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(
            RectangleC,
            Pointer<Char>,
            Pointer<Char>,
            Pointer<Float>,
            Float,
            Float,
          )
        >
      >('GuiSlider');
  late final _GuiSlider =
      _GuiSliderPtr.asFunction<
        int Function(
          RectangleC,
          Pointer<Char>,
          Pointer<Char>,
          Pointer<Float>,
          double,
          double,
        )
      >();

  int GuiSliderBar(
    RectangleC bounds,
    Pointer<Char> textLeft,
    Pointer<Char> textRight,
    Pointer<Float> value,
    double minValue,
    double maxValue,
  ) {
    return _GuiSliderBar(
      bounds,
      textLeft,
      textRight,
      value,
      minValue,
      maxValue,
    );
  }

  late final _GuiSliderBarPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(
            RectangleC,
            Pointer<Char>,
            Pointer<Char>,
            Pointer<Float>,
            Float,
            Float,
          )
        >
      >('GuiSliderBar');
  late final _GuiSliderBar =
      _GuiSliderBarPtr.asFunction<
        int Function(
          RectangleC,
          Pointer<Char>,
          Pointer<Char>,
          Pointer<Float>,
          double,
          double,
        )
      >();

  int GuiProgressBar(
    RectangleC bounds,
    Pointer<Char> textLeft,
    Pointer<Char> textRight,
    Pointer<Float> value,
    double minValue,
    double maxValue,
  ) {
    return _GuiProgressBar(
      bounds,
      textLeft,
      textRight,
      value,
      minValue,
      maxValue,
    );
  }

  late final _GuiProgressBarPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(
            RectangleC,
            Pointer<Char>,
            Pointer<Char>,
            Pointer<Float>,
            Float,
            Float,
          )
        >
      >('GuiProgressBar');
  late final _GuiProgressBar =
      _GuiProgressBarPtr.asFunction<
        int Function(
          RectangleC,
          Pointer<Char>,
          Pointer<Char>,
          Pointer<Float>,
          double,
          double,
        )
      >();

  int GuiStatusBar(RectangleC bounds, Pointer<Char> text) {
    return _GuiStatusBar(bounds, text);
  }

  late final _GuiStatusBarPtr = rl
      .guiLookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>(
        'GuiStatusBar',
      );
  late final _GuiStatusBar =
      _GuiStatusBarPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  int GuiDummyRec(RectangleC bounds, Pointer<Char> text) {
    return _GuiDummyRec(bounds, text);
  }

  late final _GuiDummyRecPtr = rl
      .guiLookup<NativeFunction<Int Function(RectangleC, Pointer<Char>)>>(
        'GuiDummyRec',
      );
  late final _GuiDummyRec =
      _GuiDummyRecPtr.asFunction<int Function(RectangleC, Pointer<Char>)>();

  int GuiGrid(
    RectangleC bounds,
    Pointer<Char> text,
    double spacing,
    int subdivs,
    Pointer<Vector2C> mouseCell,
  ) {
    return _GuiGrid(bounds, text, spacing, subdivs, mouseCell);
  }

  late final _GuiGridPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(RectangleC, Pointer<Char>, Float, Int, Pointer<Vector2C>)
        >
      >('GuiGrid');
  late final _GuiGrid =
      _GuiGridPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, double, int, Pointer<Vector2C>)
      >();

  int GuiListView(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<Int> scrollIndex,
    Pointer<Int> active,
  ) {
    return _GuiListView(bounds, text, scrollIndex, active);
  }

  late final _GuiListViewPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(RectangleC, Pointer<Char>, Pointer<Int>, Pointer<Int>)
        >
      >('GuiListView');
  late final _GuiListView =
      _GuiListViewPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Int>, Pointer<Int>)
      >();

  int GuiListViewEx(
    RectangleC bounds,
    Pointer<Pointer<Char>> text,
    int count,
    Pointer<Int> scrollIndex,
    Pointer<Int> active,
    Pointer<Int> focus,
  ) {
    return _GuiListViewEx(bounds, text, count, scrollIndex, active, focus);
  }

  late final _GuiListViewExPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(
            RectangleC,
            Pointer<Pointer<Char>>,
            Int,
            Pointer<Int>,
            Pointer<Int>,
            Pointer<Int>,
          )
        >
      >('GuiListViewEx');
  late final _GuiListViewEx =
      _GuiListViewExPtr.asFunction<
        int Function(
          RectangleC,
          Pointer<Pointer<Char>>,
          int,
          Pointer<Int>,
          Pointer<Int>,
          Pointer<Int>,
        )
      >();

  int GuiMessageBox(
    RectangleC bounds,
    Pointer<Char> title,
    Pointer<Char> message,
    Pointer<Char> buttons,
  ) {
    return _GuiMessageBox(bounds, title, message, buttons);
  }

  late final _GuiMessageBoxPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Char>)
        >
      >('GuiMessageBox');
  late final _GuiMessageBox =
      _GuiMessageBoxPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Char>, Pointer<Char>)
      >();

  int GuiTextInputBox(
    RectangleC bounds,
    Pointer<Char> title,
    Pointer<Char> message,
    Pointer<Char> buttons,
    Pointer<Char> text,
    int textMaxSize,
    Pointer<Bool> secretViewActive,
  ) {
    return _GuiTextInputBox(
      bounds,
      title,
      message,
      buttons,
      text,
      textMaxSize,
      secretViewActive,
    );
  }

  late final _GuiTextInputBoxPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(
            RectangleC,
            Pointer<Char>,
            Pointer<Char>,
            Pointer<Char>,
            Pointer<Char>,
            Int,
            Pointer<Bool>,
          )
        >
      >('GuiTextInputBox');
  late final _GuiTextInputBox =
      _GuiTextInputBoxPtr.asFunction<
        int Function(
          RectangleC,
          Pointer<Char>,
          Pointer<Char>,
          Pointer<Char>,
          Pointer<Char>,
          int,
          Pointer<Bool>,
        )
      >();

  int GuiColorPicker(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<ColorC> color,
  ) {
    return _GuiColorPicker(bounds, text, color);
  }

  late final _GuiColorPickerPtr = rl
      .guiLookup<
        NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<ColorC>)>
      >('GuiColorPicker');
  late final _GuiColorPicker =
      _GuiColorPickerPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<ColorC>)
      >();

  int GuiColorPanel(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<ColorC> color,
  ) {
    return _GuiColorPanel(bounds, text, color);
  }

  late final _GuiColorPanelPtr = rl
      .guiLookup<
        NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<ColorC>)>
      >('GuiColorPanel');
  late final _GuiColorPanel =
      _GuiColorPanelPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<ColorC>)
      >();

  int GuiColorBarAlpha(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<Float> alpha,
  ) {
    return _GuiColorBarAlpha(bounds, text, alpha);
  }

  late final _GuiColorBarAlphaPtr = rl
      .guiLookup<
        NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Float>)>
      >('GuiColorBarAlpha');
  late final _GuiColorBarAlpha =
      _GuiColorBarAlphaPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Float>)
      >();

  int GuiColorBarHue(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<Float> value,
  ) {
    return _GuiColorBarHue(bounds, text, value);
  }

  late final _GuiColorBarHuePtr = rl
      .guiLookup<
        NativeFunction<Int Function(RectangleC, Pointer<Char>, Pointer<Float>)>
      >('GuiColorBarHue');
  late final _GuiColorBarHue =
      _GuiColorBarHuePtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Float>)
      >();

  int GuiColorPickerHSV(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<Vector3C> colorHsv,
  ) {
    return _GuiColorPickerHSV(bounds, text, colorHsv);
  }

  late final _GuiColorPickerHSVPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(RectangleC, Pointer<Char>, Pointer<Vector3C>)
        >
      >('GuiColorPickerHSV');
  late final _GuiColorPickerHSV =
      _GuiColorPickerHSVPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Vector3C>)
      >();

  int GuiColorPanelHSV(
    RectangleC bounds,
    Pointer<Char> text,
    Pointer<Vector3C> colorHsv,
  ) {
    return _GuiColorPanelHSV(bounds, text, colorHsv);
  }

  late final _GuiColorPanelHSVPtr = rl
      .guiLookup<
        NativeFunction<
          Int Function(RectangleC, Pointer<Char>, Pointer<Vector3C>)
        >
      >('GuiColorPanelHSV');
  late final _GuiColorPanelHSV =
      _GuiColorPanelHSVPtr.asFunction<
        int Function(RectangleC, Pointer<Char>, Pointer<Vector3C>)
      >();
}
