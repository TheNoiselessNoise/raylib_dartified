part of '../../../raylib_dartified.dart';

class RaylibGuiFlat extends RaylibGuiFlatModule<Raylib> {

  RaylibGuiFlat(super.rl);

  @override
  void GuiEnable() => rl.Gui.GuiEnable();

  @override
  void GuiDisable() => rl.Gui.GuiDisable();

  @override
  void GuiLock() => rl.Gui.GuiLock();

  @override
  void GuiUnlock() => rl.Gui.GuiUnlock();

  @override
  bool GuiIsLocked() => rl.Gui.GuiIsLocked();

  @override
  void GuiSetAlpha(
    double alpha,
  ) => rl.Gui.GuiSetAlpha(
    alpha,
  );

  @override
  void GuiSetState(
    int state,
  ) => rl.Gui.GuiSetState(
    state,
  );

  @override
  int GuiGetState() => rl.Gui.GuiGetState();

  @override
  void GuiSetFont(
    FontD font,
  ) => rl.Gui.GuiSetFont(
    rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
  );

  @override
  FontD GuiGetFont() => rl.Temp.Font$.RefCaptureCached(
    RaylibCaptureIds.GuiGetFont,
    (p) => rl.Gui.GuiGetFont().toDart(p.asNativePointer()),
  );

  @override
  void GuiSetStyle(
    int control,
    int property,
    int value,
  ) => rl.Gui.GuiSetStyle(
    control,
    property,
    value,
  );

  @override
  int GuiGetStyle(
    int control,
    int property,
  ) => rl.Gui.GuiGetStyle(
    control,
    property,
  );

  @override
  void GuiLoadStyle(
    MemoryPointer<RChar> fileName,
  ) => rl.Gui.GuiLoadStyle(
    fileName.asNativePointer(),
  );

  @override
  void GuiLoadStyleFromMemory(
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
  ) => rl.Gui.GuiLoadStyleFromMemory(
    fileData.asNativePointer(),
    dataSize,
  );

  @override
  void GuiLoadStyleDefault() => rl.Gui.GuiLoadStyleDefault();

  @override
  void GuiEnableTooltip() => rl.Gui.GuiEnableTooltip();

  @override
  void GuiDisableTooltip() => rl.Gui.GuiDisableTooltip();

  @override
  void GuiSetTooltip(
    MemoryPointer<RChar> tooltip,
  ) => rl.Gui.GuiSetTooltip(
    tooltip.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> GuiIconText(
    int iconId,
    MemoryPointer<RChar> text,
  ) => rl.Gui.GuiIconText(
    iconId,
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  void GuiSetIconScale(
    int scale,
  ) => rl.Gui.GuiSetIconScale(
    scale,
  );

  @override
  NativeMemoryPointer<RUnsignedInt> GuiGetIcons() => rl.Gui.GuiGetIcons().asMemoryPointer();

  @override
  NativeMemoryPointer<RPointer<RChar>> GuiLoadIcons(
    MemoryPointer<RChar> fileName,
    bool loadIconsName,
  ) => rl.Gui.GuiLoadIcons(
    fileName.asNativePointer(),
    loadIconsName,
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RPointer<RChar>> GuiLoadIconsFromMemory(
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
    bool loadIconsName,
  ) => rl.Gui.GuiLoadIconsFromMemory(
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
  ) => rl.Gui.GuiDrawIcon(
    iconId,
    posX,
    posY,
    pixelSize,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  int GuiGetTextWidth(
    MemoryPointer<RChar> text,
  ) => rl.Gui.GuiGetTextWidth(
    text.asNativePointer(),
  );

  @override
  int GuiWindowBox(
    RectangleD bounds,
    MemoryPointer<RChar> title,
  ) => rl.Gui.GuiWindowBox(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    title.asNativePointer(),
  );

  @override
  int GuiGroupBox(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => rl.Gui.GuiGroupBox(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiLine(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => rl.Gui.GuiLine(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiPanel(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => rl.Gui.GuiPanel(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiScrollPanel(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    RectangleD content,
    StructPointer<Vector2D> scroll,
    StructPointer<RectangleD> view,
  ) => rl.Gui.GuiScrollPanel(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    rl.Temp.Rectangle$.Ref2(content).asNativePointer<RectangleC>().ref,
    scroll.asNativePointer(),
    view.asNativePointer(),
  );

  @override
  int GuiLabel(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => rl.Gui.GuiLabel(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiButton(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => rl.Gui.GuiButton(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiLabelButton(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => rl.Gui.GuiLabelButton(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiToggle(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RBool> active,
  ) => rl.Gui.GuiToggle(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    active.asNativePointer(),
  );

  @override
  int GuiToggleGroup(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> active,
  ) => rl.Gui.GuiToggleGroup(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    active.asNativePointer(),
  );

  @override
  int GuiToggleSlider(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> active,
  ) => rl.Gui.GuiToggleSlider(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    active.asNativePointer(),
  );

  @override
  int GuiCheckBox(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RBool> checked,
  ) => rl.Gui.GuiCheckBox(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    checked.asNativePointer(),
  );

  @override
  int GuiComboBox(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> active,
  ) => rl.Gui.GuiComboBox(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    active.asNativePointer(),
  );

  @override
  int GuiDropdownBox(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> active,
    bool editMode,
  ) => rl.Gui.GuiDropdownBox(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiSpinner(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiValueBox(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiValueBoxFloat(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiTextBox(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiSlider(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiSliderBar(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiProgressBar(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiStatusBar(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiDummyRec(
    RectangleD bounds,
    MemoryPointer<RChar> text,
  ) => rl.Gui.GuiDummyRec(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
  );

  @override
  int GuiGrid(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    double spacing,
    int subdivs,
    StructPointer<Vector2D> mouseCell,
  ) => rl.Gui.GuiGrid(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiListView(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiListViewEx(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiTabBar(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiTabBarEx(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiMessageBox(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiTextInputBox(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
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
  ) => rl.Gui.GuiColorPicker(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    color.asNativePointer(),
  );

  @override
  int GuiColorPanel(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    StructPointer<ColorD> color,
  ) => rl.Gui.GuiColorPanel(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    color.asNativePointer(),
  );

  @override
  int GuiColorBarAlpha(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RFloat> alpha,
  ) => rl.Gui.GuiColorBarAlpha(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    alpha.asNativePointer(),
  );

  @override
  int GuiColorBarHue(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    MemoryPointer<RFloat> value,
  ) => rl.Gui.GuiColorBarHue(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    value.asNativePointer(),
  );

  @override
  int GuiColorPickerHSV(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    StructPointer<Vector3D> colorHsv,
  ) => rl.Gui.GuiColorPickerHSV(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    colorHsv.asNativePointer(),
  );

  @override
  int GuiColorPanelHSV(
    RectangleD bounds,
    MemoryPointer<RChar> text,
    StructPointer<Vector3D> colorHsv,
  ) => rl.Gui.GuiColorPanelHSV(
    rl.Temp.Rectangle$.Ref1(bounds).asNativePointer<RectangleC>().ref,
    text.asNativePointer(),
    colorHsv.asNativePointer(),
  );
}
