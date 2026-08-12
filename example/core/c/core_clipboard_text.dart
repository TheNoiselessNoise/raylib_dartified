// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_clipboard_text.c
// Run it: dart run core_clipboard_text.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_clipboard_text".toC);
  SetTargetFPS(60);

  final sampleTexts = [
    "Hello from raylib!",
    "The quick brown fox jumps over the lazy dog",
    "Clipboard operations are useful!",
    "raylib is a simple and easy-to-use library",
    "Copy and paste me!"
  ];

  Pointer<Char> input = String$.ValueAtUnique(sampleTexts[0], bufferSize: 255);
  Pointer<Char> clipboardText = String$.ValueAtUnique(sampleTexts[0], bufferSize: 255);

  bool textBoxEditMode = false;

  bool btnCutPressed = false;
  bool btnCopyPressed = false;
  bool btnPastePressed = false;
  bool btnClearPressed = false;
  bool btnRandomPressed = false;

  GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SIZE.value, 20);
  GuiSetIconScale(2);

  void doCut() {
    SetClipboardText(input);
    clipboardText = GetClipboardText();
    input[0] = 0;
  }

  void doCopy() {
    SetClipboardText(input);
    clipboardText = GetClipboardText();
  }

  void doPaste() {
    clipboardText = GetClipboardText();
    if (clipboardText.address != 0) {
      strcpy(input.cast(), clipboardText.cast());
    }
  }

  void doClear() => input[0] = 0;

  void doRandom() {
    strcpy(input.cast(), sampleTexts[GetRandomValue(0, sampleTexts.length - 1)].toC.cast());
  }

  while (!WindowShouldClose()) {
    if (btnCutPressed) doCut();
    if (btnCopyPressed) doCopy();
    if (btnPastePressed) doPaste();
    if (btnClearPressed) doClear();
    if (btnRandomPressed) doRandom();

    if (
      IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL.value) ||
      IsKeyDown(KeyboardKey.KEY_RIGHT_CONTROL.value)
    ) {
      if (IsKeyPressed(KeyboardKey.KEY_X.value))
      {
        SetClipboardText(input);
        input[0] = 0;
      }

      if (IsKeyPressed(KeyboardKey.KEY_C.value))
        SetClipboardText(input);

      if (IsKeyPressed(KeyboardKey.KEY_V.value))
        doPaste();
    }

    BeginDrawing();

    ClearBackground(RAYWHITE);

    GuiLabel(
      Rectangle$.val.$1.set(50, 20, 700, 36),
      "Use the BUTTONS or KEY SHORTCUTS:".toC,
    );

    DrawText(
      "[CTRL+X] - CUT | [CTRL+C] COPY | [CTRL+V] | PASTE".toC,
      50, 60, 20, MAROON,
    );

    if (GuiTextBox(
      Rectangle$.val.$1.set(50, 120, 652, 40),
      input,
      256,
      textBoxEditMode
    ).toBool()) textBoxEditMode = !textBoxEditMode;

    btnRandomPressed = GuiButton(
      Rectangle$.val.$1.set(50 + 652 + 8, 120, 40, 40),
      "#77#".toC,
    ).toBool();

    btnCutPressed = GuiButton(
      Rectangle$.val.$1.set(50, 180, 158, 40),
      "#17#CUT".toC,
    ).toBool();
    
    btnCopyPressed = GuiButton(
      Rectangle$.val.$1.set(50 + 165, 180, 158, 40),
      "#16#COPY".toC,
    ).toBool();
    
    btnPastePressed = GuiButton(
      Rectangle$.val.$1.set(50 + 165*2, 180, 158, 40),
      "#18#PASTE".toC,
    ).toBool();
    
    btnClearPressed = GuiButton(
      Rectangle$.val.$1.set(50 + 165*3, 180, 158, 40),
      "#143#CLEAR".toC,
    ).toBool();

    GuiSetState(GuiState.STATE_DISABLED.value);
    GuiLabel(
      Rectangle$.val.$1.set(50, 260, 700, 40),
      "Clipboard current text data:".toC,
    );
    GuiSetStyle(GuiControl.TEXTBOX.value, GuiTextBoxProperty.TEXT_READONLY.value, 1);
    GuiTextBox(
      Rectangle$.val.$1.set(50, 300, 700, 40),
      clipboardText, 256, false
    );
    GuiSetStyle(GuiControl.TEXTBOX.value, GuiTextBoxProperty.TEXT_READONLY.value, 0);
    GuiLabel(
      Rectangle$.val.$1.set(50, 360, 700, 40),
      "Try copying text from other applications and pasting here!".toC,
    );
    GuiSetState(GuiState.STATE_NORMAL.value);

    EndDrawing();
  }

  CloseWindowAndDispose();
}