part of '../../../raylib_dartified_web.dart';

final class RaylibGuiFlatWeb extends RaylibGuiFlat<Raylib> {

  RaylibGuiFlatWeb(super.rl);

  RaylibGui get _wasm => rl.module();

  @override
  void GuiEnable() => _wasm.GuiEnable();

  @override
  void GuiDisable() => _wasm.GuiDisable();

  @override
  void GuiLock() => _wasm.GuiLock();

  @override
  void GuiUnlock() => _wasm.GuiUnlock();

  @override
  bool GuiIsLocked() => _wasm.GuiIsLocked();

  @override
  void GuiSetAlpha(
    double alpha,
  ) => _wasm.GuiSetAlpha(
    alpha.toJS,
  );

  @override
  void GuiSetState(
    int state,
  ) => _wasm.GuiSetState(
    state.toJS,
  );

  @override
  int GuiGetState() => _wasm.GuiGetState();

  @override
  void GuiSetFont(
    Font font,
  ) => _wasm.GuiSetFont(
    Font$.Ref1(font).toJS,
  );

  @override
  Font GuiGetFont() => Font$.RefCached(
    RaylibCaptureIds.GuiGetFont,
    (p) => _wasm.GuiGetFont(
      p.toJS,
    ),
  );

  @override
  void GuiSetStyle(
    int control,
    int property,
    int value,
  ) => _wasm.GuiSetStyle(
    control.toJS,
    property.toJS,
    value.toJS,
  );

  @override
  int GuiGetStyle(
    int control,
    int property,
  ) => _wasm.GuiGetStyle(
    control.toJS,
    property.toJS,
  );

  @override
  void GuiLoadStyle(
    XPtr<XChar> fileName,
  ) => _wasm.GuiLoadStyle(
    fileName.toJS,
  );

  @override
  void GuiLoadStyleFromMemory(
    XPtr<XUnsignedChar> fileData,
    int dataSize,
  ) => _wasm.GuiLoadStyleFromMemory(
    fileData.toJS,
    dataSize.toJS,
  );

  @override
  void GuiLoadStyleDefault() => _wasm.GuiLoadStyleDefault();

  @override
  void GuiEnableTooltip() => _wasm.GuiEnableTooltip();

  @override
  void GuiDisableTooltip() => _wasm.GuiDisableTooltip();

  @override
  void GuiSetTooltip(
    XPtr<XChar> tooltip,
  ) => _wasm.GuiSetTooltip(
    tooltip.toJS,
  );

  @override
  XWasmPtr<XChar> GuiIconText(
    int iconId,
    XPtr<XChar> text,
  ) => _wasm.GuiIconText(
    iconId.toJS,
    text.toJS,
  );

  @override
  void GuiSetIconScale(
    int scale,
  ) => _wasm.GuiSetIconScale(
    scale.toJS,
  );

  @override
  XWasmPtr<XUnsignedInt> GuiGetIcons() => _wasm.GuiGetIcons();

  @override
  XWasmPtr<XPtrType<XChar>> GuiLoadIcons(
    XPtr<XChar> fileName,
    bool loadIconsName,
  ) => _wasm.GuiLoadIcons(
    fileName.toJS,
    loadIconsName.toJS,
  );

  @override
  XWasmPtr<XPtrType<XChar>> GuiLoadIconsFromMemory(
    XPtr<XUnsignedChar> fileData,
    int dataSize,
    bool loadIconsName,
  ) => _wasm.GuiLoadIconsFromMemory(
    fileData.toJS,
    dataSize.toJS,
    loadIconsName.toJS,
  );

  @override
  void GuiDrawIcon(
    int iconId,
    int posX,
    int posY,
    int pixelSize,
    Color color,
  ) => _wasm.GuiDrawIcon(
    iconId.toJS,
    posX.toJS,
    posY.toJS,
    pixelSize.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  int GuiGetTextWidth(
    XPtr<XChar> text,
  ) => _wasm.GuiGetTextWidth(
    text.toJS,
  );

  @override
  int GuiWindowBox(
    Rectangle bounds,
    XPtr<XChar> title,
  ) => _wasm.GuiWindowBox(
    Rectangle$.Ref1(bounds).toJS,
    title.toJS,
  );

  @override
  int GuiGroupBox(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _wasm.GuiGroupBox(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
  );

  @override
  int GuiLine(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _wasm.GuiLine(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
  );

  @override
  int GuiPanel(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _wasm.GuiPanel(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
  );

  @override
  int GuiScrollPanel(
    Rectangle bounds,
    XPtr<XChar> text,
    Rectangle content,
    XStructPtr<Vector2> scroll,
    XStructPtr<Rectangle> view,
  ) => _wasm.GuiScrollPanel(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    Rectangle$.Ref2(content).toJS,
    scroll.toJS,
    view.toJS,
  );

  @override
  int GuiLabel(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _wasm.GuiLabel(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
  );

  @override
  int GuiButton(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _wasm.GuiButton(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
  );

  @override
  int GuiLabelButton(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _wasm.GuiLabelButton(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
  );

  @override
  int GuiToggle(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XBool> active,
  ) => _wasm.GuiToggle(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    active.toJS,
  );

  @override
  int GuiToggleGroup(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> active,
  ) => _wasm.GuiToggleGroup(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    active.toJS,
  );

  @override
  int GuiToggleSlider(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> active,
  ) => _wasm.GuiToggleSlider(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    active.toJS,
  );

  @override
  int GuiCheckBox(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XBool> checked,
  ) => _wasm.GuiCheckBox(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    checked.toJS,
  );

  @override
  int GuiComboBox(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> active,
  ) => _wasm.GuiComboBox(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    active.toJS,
  );

  @override
  int GuiDropdownBox(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> active,
    bool editMode,
  ) => _wasm.GuiDropdownBox(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    active.toJS,
    editMode.toJS,
  );

  @override
  int GuiSpinner(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> value,
    int minValue,
    int maxValue,
    bool editMode,
  ) => _wasm.GuiSpinner(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    value.toJS,
    minValue.toJS,
    maxValue.toJS,
    editMode.toJS,
  );

  @override
  int GuiValueBox(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> value,
    int minValue,
    int maxValue,
    bool editMode,
  ) => _wasm.GuiValueBox(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    value.toJS,
    minValue.toJS,
    maxValue.toJS,
    editMode.toJS,
  );

  @override
  int GuiValueBoxFloat(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XChar> textValue,
    XPtr<XFloat> value,
    bool editMode,
  ) => _wasm.GuiValueBoxFloat(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    textValue.toJS,
    value.toJS,
    editMode.toJS,
  );

  @override
  int GuiTextBox(
    Rectangle bounds,
    XPtr<XChar> text,
    int textSize,
    bool editMode,
  ) => _wasm.GuiTextBox(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    textSize.toJS,
    editMode.toJS,
  );

  @override
  int GuiSlider(
    Rectangle bounds,
    XPtr<XChar> textLeft,
    XPtr<XChar> textRight,
    XPtr<XFloat> value,
    double minValue,
    double maxValue,
  ) => _wasm.GuiSlider(
    Rectangle$.Ref1(bounds).toJS,
    textLeft.toJS,
    textRight.toJS,
    value.toJS,
    minValue.toJS,
    maxValue.toJS,
  );

  @override
  int GuiSliderBar(
    Rectangle bounds,
    XPtr<XChar> textLeft,
    XPtr<XChar> textRight,
    XPtr<XFloat> value,
    double minValue,
    double maxValue,
  ) => _wasm.GuiSliderBar(
    Rectangle$.Ref1(bounds).toJS,
    textLeft.toJS,
    textRight.toJS,
    value.toJS,
    minValue.toJS,
    maxValue.toJS,
  );

  @override
  int GuiProgressBar(
    Rectangle bounds,
    XPtr<XChar> textLeft,
    XPtr<XChar> textRight,
    XPtr<XFloat> value,
    double minValue,
    double maxValue,
  ) => _wasm.GuiProgressBar(
    Rectangle$.Ref1(bounds).toJS,
    textLeft.toJS,
    textRight.toJS,
    value.toJS,
    minValue.toJS,
    maxValue.toJS,
  );

  @override
  int GuiStatusBar(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _wasm.GuiStatusBar(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
  );

  @override
  int GuiDummyRec(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _wasm.GuiDummyRec(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
  );

  @override
  int GuiGrid(
    Rectangle bounds,
    XPtr<XChar> text,
    double spacing,
    int subdivs,
    XStructPtr<Vector2> mouseCell,
  ) => _wasm.GuiGrid(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    spacing.toJS,
    subdivs.toJS,
    mouseCell.toJS,
  );

  @override
  int GuiListView(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> scrollIndex,
    XPtr<XInt> active,
  ) => _wasm.GuiListView(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    scrollIndex.toJS,
    active.toJS,
  );

  @override
  int GuiListViewEx(
    Rectangle bounds,
    XPtr<XPtrType<XChar>> text,
    int count,
    XPtr<XInt> scrollIndex,
    XPtr<XInt> active,
    XPtr<XInt> focus,
  ) => _wasm.GuiListViewEx(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    count.toJS,
    scrollIndex.toJS,
    active.toJS,
    focus.toJS,
  );

  @override
  int GuiTabBar(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> hscroll,
    XPtr<XInt> active,
  ) => _wasm.GuiTabBar(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    hscroll.toJS,
    active.toJS,
  );

  @override
  int GuiTabBarEx(
    Rectangle bounds,
    XPtr<XPtrType<XChar>> text,
    int count,
    XPtr<XInt> hscroll,
    XPtr<XInt> active,
    XPtr<XInt> focus,
  ) => _wasm.GuiTabBarEx(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    count.toJS,
    hscroll.toJS,
    active.toJS,
    focus.toJS,
  );

  @override
  int GuiMessageBox(
    Rectangle bounds,
    XPtr<XChar> title,
    XPtr<XChar> message,
    XPtr<XChar> btnText,
    XPtr<XInt> btnActive,
  ) => _wasm.GuiMessageBox(
    Rectangle$.Ref1(bounds).toJS,
    title.toJS,
    message.toJS,
    btnText.toJS,
    btnActive.toJS,
  );

  @override
  int GuiTextInputBox(
    Rectangle bounds,
    XPtr<XChar> title,
    XPtr<XChar> message,
    XPtr<XChar> text,
    int textSize,
    XPtr<XChar> btnText,
    XPtr<XInt> btnActive,
    XPtr<XBool> secretViewActive,
  ) => _wasm.GuiTextInputBox(
    Rectangle$.Ref1(bounds).toJS,
    title.toJS,
    message.toJS,
    text.toJS,
    textSize.toJS,
    btnText.toJS,
    btnActive.toJS,
    secretViewActive.toJS,
  );

  @override
  int GuiColorPicker(
    Rectangle bounds,
    XPtr<XChar> text,
    XStructPtr<Color> color,
  ) => _wasm.GuiColorPicker(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    color.toJS,
  );

  @override
  int GuiColorPanel(
    Rectangle bounds,
    XPtr<XChar> text,
    XStructPtr<Color> color,
  ) => _wasm.GuiColorPanel(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    color.toJS,
  );

  @override
  int GuiColorBarAlpha(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XFloat> alpha,
  ) => _wasm.GuiColorBarAlpha(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    alpha.toJS,
  );

  @override
  int GuiColorBarHue(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XFloat> value,
  ) => _wasm.GuiColorBarHue(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    value.toJS,
  );

  @override
  int GuiColorPickerHSV(
    Rectangle bounds,
    XPtr<XChar> text,
    XStructPtr<Vector3> colorHsv,
  ) => _wasm.GuiColorPickerHSV(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    colorHsv.toJS,
  );

  @override
  int GuiColorPanelHSV(
    Rectangle bounds,
    XPtr<XChar> text,
    XStructPtr<Vector3> colorHsv,
  ) => _wasm.GuiColorPanelHSV(
    Rectangle$.Ref1(bounds).toJS,
    text.toJS,
    colorHsv.toJS,
  );
}