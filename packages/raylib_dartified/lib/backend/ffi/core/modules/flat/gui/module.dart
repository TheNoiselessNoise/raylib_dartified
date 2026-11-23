part of '../../../backend.dart';

final class RaylibGuiFlatNative extends RaylibGuiFlat {

  RaylibGuiFlatNative(super.pkg);

  RaylibGui get _ffi => pkg.module();

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
    Font font,
  ) => _ffi.GuiSetFont(
    Font$.Ref1(font).asNative<FontC>().ref,
  );

  @override
  Font GuiGetFont() => Font$.RefCached(
    RaylibCaptureIds.GuiGetFont,
    (p) => _ffi.GuiGetFont().toDart(p.asNative()),
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
    XPtr<XChar> fileName,
  ) => _ffi.GuiLoadStyle(
    fileName.asNative(),
  );

  @override
  void GuiLoadStyleFromMemory(
    XPtr<XUnsignedChar> fileData,
    int dataSize,
  ) => _ffi.GuiLoadStyleFromMemory(
    fileData.asNative(),
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
    XPtr<XChar> tooltip,
  ) => _ffi.GuiSetTooltip(
    tooltip.asNative(),
  );

  @override
  XNativePtr<XChar> GuiIconText(
    int iconId,
    XPtr<XChar> text,
  ) => _ffi.GuiIconText(
    iconId,
    text.asNative(),
  ).asXPtr();

  @override
  void GuiSetIconScale(
    int scale,
  ) => _ffi.GuiSetIconScale(
    scale,
  );

  @override
  XNativePtr<XUnsignedInt> GuiGetIcons() => _ffi.GuiGetIcons().asXPtr();

  @override
  XNativePtr<XPtrType<XChar>> GuiLoadIcons(
    XPtr<XChar> fileName,
    bool loadIconsName,
  ) => _ffi.GuiLoadIcons(
    fileName.asNative(),
    loadIconsName,
  ).asXPtr();

  @override
  XNativePtr<XPtrType<XChar>> GuiLoadIconsFromMemory(
    XPtr<XUnsignedChar> fileData,
    int dataSize,
    bool loadIconsName,
  ) => _ffi.GuiLoadIconsFromMemory(
    fileData.asNative(),
    dataSize,
    loadIconsName,
  ).asXPtr();

  @override
  void GuiDrawIcon(
    int iconId,
    int posX,
    int posY,
    int pixelSize,
    Color color,
  ) => _ffi.GuiDrawIcon(
    iconId,
    posX,
    posY,
    pixelSize,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  int GuiGetTextWidth(
    XPtr<XChar> text,
  ) => _ffi.GuiGetTextWidth(
    text.asNative(),
  );

  @override
  int GuiWindowBox(
    Rectangle bounds,
    XPtr<XChar> title,
  ) => _ffi.GuiWindowBox(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    title.asNative(),
  );

  @override
  int GuiGroupBox(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _ffi.GuiGroupBox(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
  );

  @override
  int GuiLine(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _ffi.GuiLine(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
  );

  @override
  int GuiPanel(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _ffi.GuiPanel(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
  );

  @override
  int GuiScrollPanel(
    Rectangle bounds,
    XPtr<XChar> text,
    Rectangle content,
    XStructPtr<Vector2> scroll,
    XStructPtr<Rectangle> view,
  ) => _ffi.GuiScrollPanel(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    Rectangle$.Ref2(content).asNative<RectangleC>().ref,
    scroll.asNative(),
    view.asNative(),
  );

  @override
  int GuiLabel(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _ffi.GuiLabel(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
  );

  @override
  int GuiButton(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _ffi.GuiButton(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
  );

  @override
  int GuiLabelButton(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _ffi.GuiLabelButton(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
  );

  @override
  int GuiToggle(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XBool> active,
  ) => _ffi.GuiToggle(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    active.asNative(),
  );

  @override
  int GuiToggleGroup(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> active,
  ) => _ffi.GuiToggleGroup(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    active.asNative(),
  );

  @override
  int GuiToggleSlider(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> active,
  ) => _ffi.GuiToggleSlider(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    active.asNative(),
  );

  @override
  int GuiCheckBox(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XBool> checked,
  ) => _ffi.GuiCheckBox(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    checked.asNative(),
  );

  @override
  int GuiComboBox(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> active,
  ) => _ffi.GuiComboBox(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    active.asNative(),
  );

  @override
  int GuiDropdownBox(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> active,
    bool editMode,
  ) => _ffi.GuiDropdownBox(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    active.asNative(),
    editMode,
  );

  @override
  int GuiSpinner(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> value,
    int minValue,
    int maxValue,
    bool editMode,
  ) => _ffi.GuiSpinner(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    value.asNative(),
    minValue,
    maxValue,
    editMode,
  );

  @override
  int GuiValueBox(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> value,
    int minValue,
    int maxValue,
    bool editMode,
  ) => _ffi.GuiValueBox(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    value.asNative(),
    minValue,
    maxValue,
    editMode,
  );

  @override
  int GuiValueBoxFloat(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XChar> textValue,
    XPtr<XFloat> value,
    bool editMode,
  ) => _ffi.GuiValueBoxFloat(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    textValue.asNative(),
    value.asNative(),
    editMode,
  );

  @override
  int GuiTextBox(
    Rectangle bounds,
    XPtr<XChar> text,
    int textSize,
    bool editMode,
  ) => _ffi.GuiTextBox(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    textSize,
    editMode,
  );

  @override
  int GuiSlider(
    Rectangle bounds,
    XPtr<XChar> textLeft,
    XPtr<XChar> textRight,
    XPtr<XFloat> value,
    double minValue,
    double maxValue,
  ) => _ffi.GuiSlider(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    textLeft.asNative(),
    textRight.asNative(),
    value.asNative(),
    minValue,
    maxValue,
  );

  @override
  int GuiSliderBar(
    Rectangle bounds,
    XPtr<XChar> textLeft,
    XPtr<XChar> textRight,
    XPtr<XFloat> value,
    double minValue,
    double maxValue,
  ) => _ffi.GuiSliderBar(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    textLeft.asNative(),
    textRight.asNative(),
    value.asNative(),
    minValue,
    maxValue,
  );

  @override
  int GuiProgressBar(
    Rectangle bounds,
    XPtr<XChar> textLeft,
    XPtr<XChar> textRight,
    XPtr<XFloat> value,
    double minValue,
    double maxValue,
  ) => _ffi.GuiProgressBar(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    textLeft.asNative(),
    textRight.asNative(),
    value.asNative(),
    minValue,
    maxValue,
  );

  @override
  int GuiStatusBar(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _ffi.GuiStatusBar(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
  );

  @override
  int GuiDummyRec(
    Rectangle bounds,
    XPtr<XChar> text,
  ) => _ffi.GuiDummyRec(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
  );

  @override
  int GuiGrid(
    Rectangle bounds,
    XPtr<XChar> text,
    double spacing,
    int subdivs,
    XStructPtr<Vector2> mouseCell,
  ) => _ffi.GuiGrid(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    spacing,
    subdivs,
    mouseCell.asNative(),
  );

  @override
  int GuiListView(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> scrollIndex,
    XPtr<XInt> active,
  ) => _ffi.GuiListView(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    scrollIndex.asNative(),
    active.asNative(),
  );

  @override
  int GuiListViewEx(
    Rectangle bounds,
    XPtr<XPtrType<XChar>> text,
    int count,
    XPtr<XInt> scrollIndex,
    XPtr<XInt> active,
    XPtr<XInt> focus,
  ) => _ffi.GuiListViewEx(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    count,
    scrollIndex.asNative(),
    active.asNative(),
    focus.asNative(),
  );

  @override
  int GuiTabBar(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XInt> hscroll,
    XPtr<XInt> active,
  ) => _ffi.GuiTabBar(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    hscroll.asNative(),
    active.asNative(),
  );

  @override
  int GuiTabBarEx(
    Rectangle bounds,
    XPtr<XPtrType<XChar>> text,
    int count,
    XPtr<XInt> hscroll,
    XPtr<XInt> active,
    XPtr<XInt> focus,
  ) => _ffi.GuiTabBarEx(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    count,
    hscroll.asNative(),
    active.asNative(),
    focus.asNative(),
  );

  @override
  int GuiMessageBox(
    Rectangle bounds,
    XPtr<XChar> title,
    XPtr<XChar> message,
    XPtr<XChar> btnText,
    XPtr<XInt> btnActive,
  ) => _ffi.GuiMessageBox(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    title.asNative(),
    message.asNative(),
    btnText.asNative(),
    btnActive.asNative(),
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
  ) => _ffi.GuiTextInputBox(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    title.asNative(),
    message.asNative(),
    text.asNative(),
    textSize,
    btnText.asNative(),
    btnActive.asNative(),
    secretViewActive.asNative(),
  );

  @override
  int GuiColorPicker(
    Rectangle bounds,
    XPtr<XChar> text,
    XStructPtr<Color> color,
  ) => _ffi.GuiColorPicker(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    color.asNative(),
  );

  @override
  int GuiColorPanel(
    Rectangle bounds,
    XPtr<XChar> text,
    XStructPtr<Color> color,
  ) => _ffi.GuiColorPanel(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    color.asNative(),
  );

  @override
  int GuiColorBarAlpha(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XFloat> alpha,
  ) => _ffi.GuiColorBarAlpha(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    alpha.asNative(),
  );

  @override
  int GuiColorBarHue(
    Rectangle bounds,
    XPtr<XChar> text,
    XPtr<XFloat> value,
  ) => _ffi.GuiColorBarHue(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    value.asNative(),
  );

  @override
  int GuiColorPickerHSV(
    Rectangle bounds,
    XPtr<XChar> text,
    XStructPtr<Vector3> colorHsv,
  ) => _ffi.GuiColorPickerHSV(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    colorHsv.asNative(),
  );

  @override
  int GuiColorPanelHSV(
    Rectangle bounds,
    XPtr<XChar> text,
    XStructPtr<Vector3> colorHsv,
  ) => _ffi.GuiColorPanelHSV(
    Rectangle$.Ref1(bounds).asNative<RectangleC>().ref,
    text.asNative(),
    colorHsv.asNative(),
  );
}
