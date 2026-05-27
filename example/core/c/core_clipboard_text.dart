// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_clipboard_text.c
// Run it: dart run core_clipboard_text.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_clipboard_text'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final sampleTexts = [
    "Hello from raylib!",
    "The quick brown fox jumps over the lazy dog",
    "Clipboard operations are useful!",
    "raylib is a simple and easy-to-use library",
    "Copy and paste me!"
  ];

  String input = sampleTexts[0];
  Pointer<Char> clipboardText = rl.Temp.String$.ValueAt('clipboardText', input);

  bool textBoxEditMode = false;

  bool btnCutPressed = false;
  bool btnCopyPressed = false;
  bool btnPastePressed = false;
  bool btnClearPressed = false;
  bool btnRandomPressed = false;

  rl.Gui.GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SIZE.value, 20);
  rl.Gui.GuiSetIconScale(2);

  void doCut() {
    rl.Core.SetClipboardText(input.toC);
    clipboardText = rl.Core.GetClipboardText();
    input = '';
  }

  void doCopy() {
    rl.Core.SetClipboardText(input.toC);
    clipboardText = rl.Core.GetClipboardText();
  }

  void doPaste() {
    clipboardText = rl.Core.GetClipboardText();
    if (clipboardText.address != 0) {
      input = clipboardText.toD;
    }
  }

  void doClear() => input = '';

  void doRandom() {
    input = sampleTexts[rl.Core.GetRandomValue(0, sampleTexts.length - 1)];
  }

  while (!rl.Core.WindowShouldClose()) {
    if (btnCutPressed) doCut();
    if (btnCopyPressed) doCopy();
    if (btnPastePressed) doPaste();
    if (btnClearPressed) doClear();
    if (btnRandomPressed) doRandom();

    if (
      rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL.value) ||
      rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT_CONTROL.value)
    ) {
      if (rl.Core.IsKeyPressed(KeyboardKey.KEY_X.value))
      {
        rl.Core.SetClipboardText(input.toC);
        input = '';
      }

      if (rl.Core.IsKeyPressed(KeyboardKey.KEY_C.value))
        rl.Core.SetClipboardText(input.toC);

      if (rl.Core.IsKeyPressed(KeyboardKey.KEY_V.value))
        doPaste();
    }

    rl.Core.BeginDrawing();

    rl.Core.ClearBackground(rl.Color.RAYWHITE);

    rl.Gui.GuiLabel(
      rl.Temp.rect1(50, 20, 700, 36),
      "Use the BUTTONS or KEY SHORTCUTS:".toC,
    );

    rl.Core.DrawText(
      "[CTRL+X] - CUT | [CTRL+C] COPY | [CTRL+V] | PASTE".toC,
      50, 60, 20, rl.Color.MAROON,
    );

    if (rl.Gui.GuiTextBox(
      rl.Temp.rect1(50, 120, 652, 40),
      input.toC,
      256,
      textBoxEditMode
    ).toBool()) textBoxEditMode = !textBoxEditMode;

    btnRandomPressed = rl.Gui.GuiButton(
      rl.Temp.rect1(50 + 652 + 8, 120, 40, 40),
      "#77#".toC,
    ).toBool();

    btnCutPressed = rl.Gui.GuiButton(
      rl.Temp.rect1(50, 180, 158, 40),
      "#17#CUT".toC,
    ).toBool();
    
    btnCopyPressed = rl.Gui.GuiButton(
      rl.Temp.rect1(50 + 165, 180, 158, 40),
      "#16#COPY".toC,
    ).toBool();
    
    btnPastePressed = rl.Gui.GuiButton(
      rl.Temp.rect1(50 + 165*2, 180, 158, 40),
      "#18#PASTE".toC,
    ).toBool();
    
    btnClearPressed = rl.Gui.GuiButton(
      rl.Temp.rect1(50 + 165*3, 180, 158, 40),
      "#143#CLEAR".toC,
    ).toBool();

    rl.Gui.GuiSetState(GuiState.STATE_DISABLED.value);
    rl.Gui.GuiLabel(
      rl.Temp.rect1(50, 260, 700, 40),
      "Clipboard current text data:".toC,
    );
    rl.Gui.GuiSetStyle(GuiControl.TEXTBOX.value, GuiTextBoxProperty.TEXT_READONLY.value, 1);
    rl.Gui.GuiTextBox(
      rl.Temp.rect1(50, 300, 700, 40),
      clipboardText, 256, false
    );
    rl.Gui.GuiSetStyle(GuiControl.TEXTBOX.value, GuiTextBoxProperty.TEXT_READONLY.value, 0);
    rl.Gui.GuiLabel(
      rl.Temp.rect1(50, 360, 700, 40),
      "Try copying text from other applications and pasting here!".toC,
    );
    rl.Gui.GuiSetState(GuiState.STATE_NORMAL.value);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}