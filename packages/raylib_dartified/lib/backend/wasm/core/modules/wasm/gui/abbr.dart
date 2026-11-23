import 'package:raylib_dartified/backend/wasm/abbr/wasm.dart';

RaylibGui get _module => Raylib.instance.module();

/// See [RaylibGui.GuiEnable].
XF0<void> get GuiEnable => _module.GuiEnable;
/// See [RaylibGui.GuiDisable].
XF0<void> get GuiDisable => _module.GuiDisable;
/// See [RaylibGui.GuiLock].
XF0<void> get GuiLock => _module.GuiLock;
/// See [RaylibGui.GuiUnlock].
XF0<void> get GuiUnlock => _module.GuiUnlock;
/// See [RaylibGui.GuiIsLocked].
XF0<bool> get GuiIsLocked => _module.GuiIsLocked;
/// See [RaylibGui.GuiSetAlpha].
XF1<void> get GuiSetAlpha => _module.GuiSetAlpha;
/// See [RaylibGui.GuiSetState].
XF1<void> get GuiSetState => _module.GuiSetState;
/// See [RaylibGui.GuiGetState].
XF0<int> get GuiGetState => _module.GuiGetState;
/// See [RaylibGui.GuiSetFont].
XF1<void> get GuiSetFont => _module.GuiSetFont;
/// See [RaylibGui.GuiGetFont].
XF1<void> get GuiGetFont => _module.GuiGetFont;
/// See [RaylibGui.GuiSetStyle].
XF3<void> get GuiSetStyle => _module.GuiSetStyle;
/// See [RaylibGui.GuiGetStyle].
XF2<int> get GuiGetStyle => _module.GuiGetStyle;
/// See [RaylibGui.GuiLoadStyle].
XF1<void> get GuiLoadStyle => _module.GuiLoadStyle;
/// See [RaylibGui.GuiLoadStyleFromMemory].
XF2<void> get GuiLoadStyleFromMemory => _module.GuiLoadStyleFromMemory;
/// See [RaylibGui.GuiLoadStyleDefault].
XF0<void> get GuiLoadStyleDefault => _module.GuiLoadStyleDefault;
/// See [RaylibGui.GuiEnableTooltip].
XF0<void> get GuiEnableTooltip => _module.GuiEnableTooltip;
/// See [RaylibGui.GuiDisableTooltip].
XF0<void> get GuiDisableTooltip => _module.GuiDisableTooltip;
/// See [RaylibGui.GuiSetTooltip].
XF1<void> get GuiSetTooltip => _module.GuiSetTooltip;
/// See [RaylibGui.GuiIconText].
XF2<XWasmPtr<XChar>> get GuiIconText => _module.GuiIconText;
/// See [RaylibGui.GuiSetIconScale].
XF1<void> get GuiSetIconScale => _module.GuiSetIconScale;
/// See [RaylibGui.GuiGetIcons].
XF0<XWasmPtr<XUnsignedInt>> get GuiGetIcons => _module.GuiGetIcons;
/// See [RaylibGui.GuiLoadIcons].
XF2<XWasmPtr<XPtrType<XChar>>> get GuiLoadIcons => _module.GuiLoadIcons;
/// See [RaylibGui.GuiLoadIconsFromMemory].
XF3<XWasmPtr<XPtrType<XChar>>> get GuiLoadIconsFromMemory => _module.GuiLoadIconsFromMemory;
/// See [RaylibGui.GuiDrawIcon].
XF5<void> get GuiDrawIcon => _module.GuiDrawIcon;
/// See [RaylibGui.GuiGetTextWidth].
XF1<int> get GuiGetTextWidth => _module.GuiGetTextWidth;
/// See [RaylibGui.GuiWindowBox].
XF2<int> get GuiWindowBox => _module.GuiWindowBox;
/// See [RaylibGui.GuiGroupBox].
XF2<int> get GuiGroupBox => _module.GuiGroupBox;
/// See [RaylibGui.GuiLine].
XF2<int> get GuiLine => _module.GuiLine;
/// See [RaylibGui.GuiPanel].
XF2<int> get GuiPanel => _module.GuiPanel;
/// See [RaylibGui.GuiScrollPanel].
XF5<int> get GuiScrollPanel => _module.GuiScrollPanel;
/// See [RaylibGui.GuiLabel].
XF2<int> get GuiLabel => _module.GuiLabel;
/// See [RaylibGui.GuiButton].
XF2<int> get GuiButton => _module.GuiButton;
/// See [RaylibGui.GuiLabelButton].
XF2<int> get GuiLabelButton => _module.GuiLabelButton;
/// See [RaylibGui.GuiToggle].
XF3<int> get GuiToggle => _module.GuiToggle;
/// See [RaylibGui.GuiToggleGroup].
XF3<int> get GuiToggleGroup => _module.GuiToggleGroup;
/// See [RaylibGui.GuiToggleSlider].
XF3<int> get GuiToggleSlider => _module.GuiToggleSlider;
/// See [RaylibGui.GuiCheckBox].
XF3<int> get GuiCheckBox => _module.GuiCheckBox;
/// See [RaylibGui.GuiComboBox].
XF3<int> get GuiComboBox => _module.GuiComboBox;
/// See [RaylibGui.GuiDropdownBox].
XF4<int> get GuiDropdownBox => _module.GuiDropdownBox;
/// See [RaylibGui.GuiSpinner].
XF6<int> get GuiSpinner => _module.GuiSpinner;
/// See [RaylibGui.GuiValueBox].
XF6<int> get GuiValueBox => _module.GuiValueBox;
/// See [RaylibGui.GuiValueBoxFloat].
XF5<int> get GuiValueBoxFloat => _module.GuiValueBoxFloat;
/// See [RaylibGui.GuiTextBox].
XF4<int> get GuiTextBox => _module.GuiTextBox;
/// See [RaylibGui.GuiSlider].
XF6<int> get GuiSlider => _module.GuiSlider;
/// See [RaylibGui.GuiSliderBar].
XF6<int> get GuiSliderBar => _module.GuiSliderBar;
/// See [RaylibGui.GuiProgressBar].
XF6<int> get GuiProgressBar => _module.GuiProgressBar;
/// See [RaylibGui.GuiStatusBar].
XF2<int> get GuiStatusBar => _module.GuiStatusBar;
/// See [RaylibGui.GuiDummyRec].
XF2<int> get GuiDummyRec => _module.GuiDummyRec;
/// See [RaylibGui.GuiGrid].
XF5<int> get GuiGrid => _module.GuiGrid;
/// See [RaylibGui.GuiListView].
XF4<int> get GuiListView => _module.GuiListView;
/// See [RaylibGui.GuiListViewEx].
XF6<int> get GuiListViewEx => _module.GuiListViewEx;
/// See [RaylibGui.GuiTabBar].
XF4<int> get GuiTabBar => _module.GuiTabBar;
/// See [RaylibGui.GuiTabBarEx].
XF6<int> get GuiTabBarEx => _module.GuiTabBarEx;
/// See [RaylibGui.GuiMessageBox].
XF5<int> get GuiMessageBox => _module.GuiMessageBox;
/// See [RaylibGui.GuiTextInputBox].
XF8<int> get GuiTextInputBox => _module.GuiTextInputBox;
/// See [RaylibGui.GuiColorPicker].
XF3<int> get GuiColorPicker => _module.GuiColorPicker;
/// See [RaylibGui.GuiColorPanel].
XF3<int> get GuiColorPanel => _module.GuiColorPanel;
/// See [RaylibGui.GuiColorBarAlpha].
XF3<int> get GuiColorBarAlpha => _module.GuiColorBarAlpha;
/// See [RaylibGui.GuiColorBarHue].
XF3<int> get GuiColorBarHue => _module.GuiColorBarHue;
/// See [RaylibGui.GuiColorPickerHSV].
XF3<int> get GuiColorPickerHSV => _module.GuiColorPickerHSV;
/// See [RaylibGui.GuiColorPanelHSV].
XF3<int> get GuiColorPanelHSV => _module.GuiColorPanelHSV;