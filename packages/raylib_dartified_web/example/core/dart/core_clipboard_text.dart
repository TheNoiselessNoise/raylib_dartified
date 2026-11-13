// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_clipboard_text.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "core_clipboard_text");
  SetTargetFPS(60);

  final sampleTexts = [
    "Hello from raylib!",
    "The quick brown fox jumps over the lazy dog",
    "Clipboard operations are useful!",
    "raylib is a simple and easy-to-use library",
    "Copy and paste me!"
  ];

  String input = sampleTexts[0];
  String clipboardText = input;

  bool textBoxEditMode = false;

  bool btnCutPressed = false;
  bool btnCopyPressed = false;
  bool btnPastePressed = false;
  bool btnClearPressed = false;
  bool btnRandomPressed = false;

  GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SIZE, 20);
  GuiSetIconScale(2);

  void doCut() {
    SetClipboardText(input);
    clipboardText = GetClipboardText();
    input = '';
  }

  void doCopy() {
    SetClipboardText(input);
    clipboardText = GetClipboardText();
  }

  void doPaste() {
    clipboardText = GetClipboardText();
    input = clipboardText;
  }

  void doClear() => input = '';

  void doRandom() {
    input = sampleTexts[GetRandomValue(0, sampleTexts.length - 1)];
  }

  rl.setMainLoop(() {
    if (btnCutPressed) doCut();
    if (btnCopyPressed) doCopy();
    if (btnPastePressed) doPaste();
    if (btnClearPressed) doClear();
    if (btnRandomPressed) doRandom();

    if (
      IsKeyDown(.KEY_LEFT_CONTROL) ||
      IsKeyDown(.KEY_RIGHT_CONTROL)
    ) {
      if (IsKeyPressed(.KEY_X))
      {
        SetClipboardText(input);
        input = '';
      }

      if (IsKeyPressed(.KEY_C))
        SetClipboardText(input);

      if (IsKeyPressed(.KEY_V))
        doPaste();
    }

    BeginDrawing();

    ClearBackground(.RAYWHITE);

    GuiLabel(
      .rect(50, 20, 700, 36),
      "Use the BUTTONS or KEY SHORTCUTS:",
    );

    DrawText(
      "[CTRL+X] - CUT | [CTRL+C] COPY | [CTRL+V] | PASTE",
      50, 60, 20, .MAROON,
    );

    {
      final (result, newValue) = GuiTextBox(
        .rect(50, 120, 652, 40),
        input,
        256,
        textBoxEditMode
      );
      input = newValue;
      if (result != .RESULT_NONE) textBoxEditMode = !textBoxEditMode;
    }

    btnRandomPressed = GuiButton(
      .rect(50 + 652 + 8, 120, 40, 40),
      "#77#",
    ) != .RESULT_NONE;

    btnCutPressed = GuiButton(
      .rect(50, 180, 158, 40),
      "#17#CUT",
    ) != .RESULT_NONE;
    
    btnCopyPressed = GuiButton(
      .rect(50 + 165, 180, 158, 40),
      "#16#COPY",
    ) != .RESULT_NONE;
    
    btnPastePressed = GuiButton(
      .rect(50 + 165*2, 180, 158, 40),
      "#18#PASTE",
    ) != .RESULT_NONE;
    
    btnClearPressed = GuiButton(
      .rect(50 + 165*3, 180, 158, 40),
      "#143#CLEAR",
    ) != .RESULT_NONE;

    GuiSetState(.STATE_DISABLED);
    GuiLabel(
      .rect(50, 260, 700, 40),
      "Clipboard current text data:",
    );
    GuiSetStyle(.TEXTBOX, GuiTextBoxProperty.TEXT_READONLY, 1);
    GuiTextBox(
      .rect(50, 300, 700, 40),
      clipboardText, 256, false
    );
    GuiSetStyle(.TEXTBOX, GuiTextBoxProperty.TEXT_READONLY, 0);
    GuiLabel(
      .rect(50, 360, 700, 40),
      "Try copying text from other applications and pasting here!",
    );
    GuiSetState(.STATE_NORMAL);

    EndDrawing();
  });
});