part of '../../../raylib_dartified.dart';

class RaylibGuiFlat extends RaylibGuiFlatModule<Raylib> {

  RaylibGuiFlat(super.rl);

  RaylibGui get _ffi => rl.module();

  @override
  void GuiEnable() => _ffi.GuiEnable();

  @override
  void GuiDisable() => _ffi.GuiDisable();

  @override
  void GuiLock() => _ffi.GuiLock();

  @override
  void GuiUnlock() => _ffi.GuiUnlock();

  @override
  bool GuiIsLocked() => _ffi.GuiIsLocked();

  @override
  void GuiSetAlpha(
    double alpha,
  ) => _ffi.GuiSetAlpha(
    alpha,
  );

  @override
  void GuiSetState(
    int state,
  ) => _ffi.GuiSetState(
    state,
  );

  @override
  int GuiGetState() => _ffi.GuiGetState();

  @override
  void GuiSetFont(
    FontD font,
  ) => _ffi.GuiSetFont(
    $.Font$.Ref1(font).asNativePointer<FontC>().ref,
  );

  @override
  FontD GuiGetFont() => $.Font$.RefCaptureCached(
    RaylibCaptureIds.GuiGetFont,
    (p) => _ffi.GuiGetFont().toDart(p.asNativePointer()),
  );

  @override
  void GuiSetStyle(
    int control,
    int property,
    int value,
  ) => _ffi.GuiSetStyle(
    control,
    property,
    value,
  );

  @override
  int GuiGetStyle(
    int control,
    int property,
  ) => _ffi.GuiGetStyle(
    control,
    property,
  );

  @override
  void GuiLoadStyle(
    MemoryPointer<RChar> fileName,
  ) => _ffi.GuiLoadStyle(
    fileName.asNativePointer(),
  );

  @override
  void GuiLoadStyleFromMemory(
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
  ) => _ffi.GuiLoadStyleFromMemory(
    fileData.asNativePointer(),
    dataSize,
  );

  @override
  void GuiLoadStyleDefault() => _ffi.GuiLoadStyleDefault();

  @override
  void GuiEnableTooltip() => _ffi.GuiEnableTooltip();

  @override
  void GuiDisableTooltip() => _ffi.GuiDisableTooltip();

  @override
  void GuiSetTooltip(
    MemoryPointer<RChar> tooltip,
  ) => _ffi.GuiSetTooltip(
    tooltip.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> GuiIconText(
    int iconId,
    MemoryPointer<RChar> text,
  ) => _ffi.GuiIconText(
    iconId,
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  void GuiSetIconScale(
    int scale,
  ) => _ffi.GuiSetIconScale(
    scale,
  );

  @override
  NativeMemoryPointer<RUnsignedInt> GuiGetIcons() => _ffi.GuiGetIcons().asMemoryPointer();

  @override
  NativeMemoryPointer<RPointer<RChar>> GuiLoadIcons(
    MemoryPointer<RChar> fileName,
    bool loadIconsName,
  ) => _ffi.GuiLoadIcons(
    fileName.asNativePointer(),
    loadIconsName,
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RPointer<RChar>> GuiLoadIconsFromMemory(
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
    bool loadIconsName,
  ) => _ffi.GuiLoadIconsFromMemory(
    fileData.asNativePointer(),
    dataSize,
    loadIconsName,
  ).asMemoryPointer();

  @override
  void GuiDrawIcon(
    int iconId,
    int posX,
    int posY,
    int pixelSize,
    ColorD color,
  ) => _ffi.GuiDrawIcon(
    iconId,
    posX,
    posY,
    pixelSize,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  int GuiGetTextWidth(
    MemoryPointer<RChar> text,
  ) => _ffi.GuiGetTextWidth(
    text.asNativePointer(),
  );

  @override
  int GuiWindowBox(
    RectangleD bounds,
    MemoryPointer<RChar> title,
  ) => _ffi.GuiWindowBox(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    title.asNativePointer(),
  );

  @override
  int GuiGroupBox(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => _ffi.GuiGroupBox(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiLine(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => _ffi.GuiLine(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiPanel(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => _ffi.GuiPanel(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiScrollPanel(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    RectangleD content,
    StructPointer<Vector2D> scroll,
    StructPointer<RectangleD> view,
  ) => _ffi.GuiScrollPanel(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    $.Rectangle$.Ref2(content).asNativePointer<RectangleC>().ref,
    scroll.asNativePointer(),
    view.asNativePointer(),
  );

  @override
  int GuiLabel(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => _ffi.GuiLabel(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiButton(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => _ffi.GuiButton(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiLabelButton(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => _ffi.GuiLabelButton(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiToggle(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RBool> active,
  ) => _ffi.GuiToggle(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    active.asNativePointer(),
  );

  @override
  int GuiToggleGroup(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> active,
  ) => _ffi.GuiToggleGroup(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    active.asNativePointer(),
  );

  @override
  int GuiToggleSlider(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> active,
  ) => _ffi.GuiToggleSlider(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    active.asNativePointer(),
  );

  @override
  int GuiCheckBox(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RBool> checked,
  ) => _ffi.GuiCheckBox(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    checked.asNativePointer(),
  );

  @override
  int GuiComboBox(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> active,
  ) => _ffi.GuiComboBox(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    active.asNativePointer(),
  );

  @override
  int GuiDropdownBox(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> active,
    bool editMode,
  ) => _ffi.GuiDropdownBox(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    active.asNativePointer(),
    editMode,
  );

  @override
  int GuiSpinner(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> value,
    int minValue,
    int maxValue,
    bool editMode,
  ) => _ffi.GuiSpinner(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    value.asNativePointer(),
    minValue,
    maxValue,
    editMode,
  );

  @override
  int GuiValueBox(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> value,
    int minValue,
    int maxValue,
    bool editMode,
  ) => _ffi.GuiValueBox(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    value.asNativePointer(),
    minValue,
    maxValue,
    editMode,
  );

  @override
  int GuiValueBoxFloat(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> textValue,
    MemoryPointer<RFloat> value,
    bool editMode,
  ) => _ffi.GuiValueBoxFloat(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    textValue.asNativePointer(),
    value.asNativePointer(),
    editMode,
  );

  @override
  int GuiTextBox(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    int textSize,
    bool editMode,
  ) => _ffi.GuiTextBox(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    textSize,
    editMode,
  );

  @override
  int GuiSlider(
    RectangleD bounds,
    MemoryPointer<RChar> textLeft,
    MemoryPointer<RChar> textRight,
    MemoryPointer<RFloat> value,
    double minValue,
    double maxValue,
  ) => _ffi.GuiSlider(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    textLeft.asNativePointer(),
    textRight.asNativePointer(),
    value.asNativePointer(),
    minValue,
    maxValue,
  );

  @override
  int GuiSliderBar(
    RectangleD bounds,
    MemoryPointer<RChar> textLeft,
    MemoryPointer<RChar> textRight,
    MemoryPointer<RFloat> value,
    double minValue,
    double maxValue,
  ) => _ffi.GuiSliderBar(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    textLeft.asNativePointer(),
    textRight.asNativePointer(),
    value.asNativePointer(),
    minValue,
    maxValue,
  );

  @override
  int GuiProgressBar(
    RectangleD bounds,
    MemoryPointer<RChar> textLeft,
    MemoryPointer<RChar> textRight,
    MemoryPointer<RFloat> value,
    double minValue,
    double maxValue,
  ) => _ffi.GuiProgressBar(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    textLeft.asNativePointer(),
    textRight.asNativePointer(),
    value.asNativePointer(),
    minValue,
    maxValue,
  );

  @override
  int GuiStatusBar(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => _ffi.GuiStatusBar(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiDummyRec(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => _ffi.GuiDummyRec(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiGrid(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    double spacing,
    int subdivs,
    StructPointer<Vector2D> mouseCell,
  ) => _ffi.GuiGrid(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    spacing,
    subdivs,
    mouseCell.asNativePointer(),
  );

  @override
  int GuiListView(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> scrollIndex,
    MemoryPointer<RInt> active,
  ) => _ffi.GuiListView(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    scrollIndex.asNativePointer(),
    active.asNativePointer(),
  );

  @override
  int GuiListViewEx(
    RectangleD bounds,
    MemoryPointer<RPointer<RChar>> text,
    int count,
    MemoryPointer<RInt> scrollIndex,
    MemoryPointer<RInt> active,
    MemoryPointer<RInt> focus,
  ) => _ffi.GuiListViewEx(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    count,
    scrollIndex.asNativePointer(),
    active.asNativePointer(),
    focus.asNativePointer(),
  );

  @override
  int GuiTabBar(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> hscroll,
    MemoryPointer<RInt> active,
  ) => _ffi.GuiTabBar(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    hscroll.asNativePointer(),
    active.asNativePointer(),
  );

  @override
  int GuiTabBarEx(
    RectangleD bounds,
    MemoryPointer<RPointer<RChar>> text,
    int count,
    MemoryPointer<RInt> hscroll,
    MemoryPointer<RInt> active,
    MemoryPointer<RInt> focus,
  ) => _ffi.GuiTabBarEx(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    count,
    hscroll.asNativePointer(),
    active.asNativePointer(),
    focus.asNativePointer(),
  );

  @override
  int GuiMessageBox(
    RectangleD bounds,
    MemoryPointer<RChar> title,
    MemoryPointer<RChar> message,
    MemoryPointer<RChar> btnText,
    MemoryPointer<RInt> btnActive,
  ) => _ffi.GuiMessageBox(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    title.asNativePointer(),
    message.asNativePointer(),
    btnText.asNativePointer(),
    btnActive.asNativePointer(),
  );

  @override
  int GuiTextInputBox(
    RectangleD bounds,
    MemoryPointer<RChar> title,
    MemoryPointer<RChar> message,
    MemoryPointer<RChar> text,
    int textSize,
    MemoryPointer<RChar> btnText,
    MemoryPointer<RInt> btnActive,
    MemoryPointer<RBool> secretViewActive,
  ) => _ffi.GuiTextInputBox(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    title.asNativePointer(),
    message.asNativePointer(),
    text.asNativePointer(),
    textSize,
    btnText.asNativePointer(),
    btnActive.asNativePointer(),
    secretViewActive.asNativePointer(),
  );

  @override
  int GuiColorPicker(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    StructPointer<ColorD> color,
  ) => _ffi.GuiColorPicker(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    color.asNativePointer(),
  );

  @override
  int GuiColorPanel(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    StructPointer<ColorD> color,
  ) => _ffi.GuiColorPanel(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    color.asNativePointer(),
  );

  @override
  int GuiColorBarAlpha(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RFloat> alpha,
  ) => _ffi.GuiColorBarAlpha(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    alpha.asNativePointer(),
  );

  @override
  int GuiColorBarHue(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RFloat> value,
  ) => _ffi.GuiColorBarHue(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    value.asNativePointer(),
  );

  @override
  int GuiColorPickerHSV(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    StructPointer<Vector3D> colorHsv,
  ) => _ffi.GuiColorPickerHSV(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    colorHsv.asNativePointer(),
  );

  @override
  int GuiColorPanelHSV(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    StructPointer<Vector3D> colorHsv,
  ) => _ffi.GuiColorPanelHSV(
    $.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    colorHsv.asNativePointer(),
  );
}
