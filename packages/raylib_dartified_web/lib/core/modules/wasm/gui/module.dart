part of '../../../raylib_dartified_web.dart';

class RaylibGui extends RaylibModuleWasm with RaylibGuiModuleExtras<Raylib> {
  /// Enable gui controls (global state)
  late final XF0<void> GuiEnable;
  /// Disable gui controls (global state)
  late final XF0<void> GuiDisable;
  /// Lock gui controls (global state)
  late final XF0<void> GuiLock;
  /// Unlock gui controls (global state)
  late final XF0<void> GuiUnlock;
  /// Check if gui is locked (global state)
  late final XF0<bool> GuiIsLocked;
  /// Set gui controls alpha (global state), alpha goes from 0.0 to 1.0
  late final XF1<void> GuiSetAlpha;
  /// Set gui state (global state)
  late final XF1<void> GuiSetState;
  /// Get gui state (global state)
  late final XF0<int> GuiGetState;
  /// Set gui custom font (global state)
  late final XF1<void> GuiSetFont;
  /// Get gui custom font (global state)
  late final XF1<void> GuiGetFont;
  /// Set one style property
  late final XF3<void> GuiSetStyle;
  /// Get one style property
  late final XF2<int> GuiGetStyle;
  /// Load style file over global style variable (.rgs)
  late final XF1<void> GuiLoadStyle;
  /// Load style from memory (binary only)
  late final XF2<void> GuiLoadStyleFromMemory;
  /// Load style default over global style
  late final XF0<void> GuiLoadStyleDefault;
  /// Enable gui tooltips (global state)
  late final XF0<void> GuiEnableTooltip;
  /// Disable gui tooltips (global state)
  late final XF0<void> GuiDisableTooltip;
  /// Set tooltip string
  late final XF1<void> GuiSetTooltip;
  /// Get text with icon id prepended (if supported)
  late final XF2<XWasmPtr<XChar>> GuiIconText;
  /// Set default icon drawing size
  late final XF1<void> GuiSetIconScale;
  /// Get raygui icons data
  late final XF0<XWasmPtr<XUnsignedInt>> GuiGetIcons;
  /// Load raygui icons file (.rgi) into internal icons data
  late final XF2<XWasmPtr<XRawPtr<XChar>>> GuiLoadIcons;
  /// Load raygui icons file (.rgi) from memory into internal icons data
  late final XF3<XWasmPtr<XRawPtr<XChar>>> GuiLoadIconsFromMemory;
  /// Draw icon using pixel size at specified position
  late final XF5<void> GuiDrawIcon;
  /// Get text width considering gui style and icon size (if required)
  late final XF1<int> GuiGetTextWidth;
  /// Window Box control, shows a window that can be closed
  late final XF2<int> GuiWindowBox;
  /// Group Box control with text name
  late final XF2<int> GuiGroupBox;
  /// Line separator control, could contain text
  late final XF2<int> GuiLine;
  /// Panel control, useful to group controls
  late final XF2<int> GuiPanel;
  /// Scroll Panel control
  late final XF5<int> GuiScrollPanel;
  /// Label control
  late final XF2<int> GuiLabel;
  /// Button control, returns true when clicked
  late final XF2<int> GuiButton;
  /// Label button control, returns true when clicked
  late final XF2<int> GuiLabelButton;
  /// Toggle Button control
  late final XF3<int> GuiToggle;
  /// Toggle Group control
  late final XF3<int> GuiToggleGroup;
  /// Toggle Slider control
  late final XF3<int> GuiToggleSlider;
  /// Check Box control, returns true when active
  late final XF3<int> GuiCheckBox;
  /// Combo Box control
  late final XF3<int> GuiComboBox;
  /// Dropdown Box control
  late final XF4<int> GuiDropdownBox;
  /// Spinner control
  late final XF6<int> GuiSpinner;
  /// Value Box control, updates input text with numbers
  late final XF6<int> GuiValueBox;
  /// Value box control for float values
  late final XF5<int> GuiValueBoxFloat;
  /// Text Box control, updates input text
  late final XF4<int> GuiTextBox;
  /// Slider control
  late final XF6<int> GuiSlider;
  /// Slider Bar control
  late final XF6<int> GuiSliderBar;
  /// Progress Bar control
  late final XF6<int> GuiProgressBar;
  /// Status Bar control, shows info text
  late final XF2<int> GuiStatusBar;
  /// Dummy control for placeholders
  late final XF2<int> GuiDummyRec;
  /// Grid control
  late final XF5<int> GuiGrid;
  /// List View control
  late final XF4<int> GuiListView;
  /// List View control, using text entries list and returning focus entry
  late final XF6<int> GuiListViewEx;
  /// Tab Bar control
  late final XF4<int> GuiTabBar;
  /// Tab Bar control, using text entries list and returning focus entry
  late final XF6<int> GuiTabBarEx;
  /// Message Box control, displays a message
  late final XF5<int> GuiMessageBox;
  /// Text Input Box control, ask for text, supports secret
  late final XF8<int> GuiTextInputBox;
  /// Color Picker control, includes Color bar controls
  late final XF3<int> GuiColorPicker;
  /// Color Panel control
  late final XF3<int> GuiColorPanel;
  /// Color Bar Alpha control
  late final XF3<int> GuiColorBarAlpha;
  /// Color Bar Hue control
  late final XF3<int> GuiColorBarHue;
  /// Color Picker control, using Hue-Saturation-Value color data, includes Color bar controls
  late final XF3<int> GuiColorPickerHSV;
  /// Color Panel control, using Hue-Saturation-Value color data
  late final XF3<int> GuiColorPanelHSV;

  RaylibGui(super.rl) {
    GuiEnable              = dwrap0('GuiEnable');
    GuiDisable             = dwrap0('GuiDisable');
    GuiLock                = dwrap0('GuiLock');
    GuiUnlock              = dwrap0('GuiUnlock');
    GuiIsLocked            = dwrap0('GuiIsLocked');
    GuiSetAlpha            = dwrap1('GuiSetAlpha');
    GuiSetState            = dwrap1('GuiSetState');
    GuiGetState            = dwrap0('GuiGetState');
    GuiSetFont             = dwrap1('GuiSetFont');
    GuiGetFont             = swrap0('GuiGetFont');
    GuiSetStyle            = dwrap3('GuiSetStyle');
    GuiGetStyle            = dwrap2('GuiGetStyle');
    GuiLoadStyle           = dwrap1('GuiLoadStyle');
    GuiLoadStyleFromMemory = dwrap2('GuiLoadStyleFromMemory');
    GuiLoadStyleDefault    = dwrap0('GuiLoadStyleDefault');
    GuiEnableTooltip       = dwrap0('GuiEnableTooltip');
    GuiDisableTooltip      = dwrap0('GuiDisableTooltip');
    GuiSetTooltip          = dwrap1('GuiSetTooltip');
    GuiIconText            = pwrap2('GuiIconText');
    GuiSetIconScale        = dwrap1('GuiSetIconScale');
    GuiGetIcons            = pwrap0('GuiGetIcons');
    GuiLoadIcons           = pwrap2('GuiLoadIcons');
    GuiLoadIconsFromMemory = pwrap3('GuiLoadIconsFromMemory');
    GuiDrawIcon            = dwrap5('GuiDrawIcon');
    GuiGetTextWidth        = dwrap1('GuiGetTextWidth');
    GuiWindowBox           = dwrap2('GuiWindowBox');
    GuiGroupBox            = dwrap2('GuiGroupBox');
    GuiLine                = dwrap2('GuiLine');
    GuiPanel               = dwrap2('GuiPanel');
    GuiScrollPanel         = dwrap5('GuiScrollPanel');
    GuiLabel               = dwrap2('GuiLabel');
    GuiButton              = dwrap2('GuiButton');
    GuiLabelButton         = dwrap2('GuiLabelButton');
    GuiToggle              = dwrap3('GuiToggle');
    GuiToggleGroup         = dwrap3('GuiToggleGroup');
    GuiToggleSlider        = dwrap3('GuiToggleSlider');
    GuiCheckBox            = dwrap3('GuiCheckBox');
    GuiComboBox            = dwrap3('GuiComboBox');
    GuiDropdownBox         = dwrap4('GuiDropdownBox');
    GuiSpinner             = dwrap6('GuiSpinner');
    GuiValueBox            = dwrap6('GuiValueBox');
    GuiValueBoxFloat       = dwrap5('GuiValueBoxFloat');
    GuiTextBox             = dwrap4('GuiTextBox');
    GuiSlider              = dwrap6('GuiSlider');
    GuiSliderBar           = dwrap6('GuiSliderBar');
    GuiProgressBar         = dwrap6('GuiProgressBar');
    GuiStatusBar           = dwrap2('GuiStatusBar');
    GuiDummyRec            = dwrap2('GuiDummyRec');
    GuiGrid                = dwrap5('GuiGrid');
    GuiListView            = dwrap4('GuiListView');
    GuiListViewEx          = dwrap6('GuiListViewEx');
    GuiTabBar              = dwrap4('GuiTabBar');
    GuiTabBarEx            = dwrap6('GuiTabBarEx');
    GuiMessageBox          = dwrap5('GuiMessageBox');
    GuiTextInputBox        = dwrap8('GuiTextInputBox');
    GuiColorPicker         = dwrap3('GuiColorPicker');
    GuiColorPanel          = dwrap3('GuiColorPanel');
    GuiColorBarAlpha       = dwrap3('GuiColorBarAlpha');
    GuiColorBarHue         = dwrap3('GuiColorBarHue');
    GuiColorPickerHSV      = dwrap3('GuiColorPickerHSV');
    GuiColorPanelHSV       = dwrap3('GuiColorPanelHSV');
  }
}