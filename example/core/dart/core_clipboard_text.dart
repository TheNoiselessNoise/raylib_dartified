// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_clipboard_text.c
// Run it: dart run core_clipboard_text.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_clipboard_text');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

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

  rl.GuiD.GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SIZE, 20);
  rl.GuiD.GuiSetIconScale(2);

  void doCut() {
    rl.CoreD.SetClipboardText(input);
    clipboardText = rl.CoreD.GetClipboardText();
    input = '';
  }

  void doCopy() {
    rl.CoreD.SetClipboardText(input);
    clipboardText = rl.CoreD.GetClipboardText();
  }

  void doPaste() {
    clipboardText = rl.CoreD.GetClipboardText();
    input = clipboardText;
  }

  void doClear() => input = '';

  void doRandom() {
    input = sampleTexts[rl.CoreD.GetRandomValue(0, sampleTexts.length - 1)];
  }

  while (!rl.CoreD.WindowShouldClose()) {
    if (btnCutPressed) doCut();
    if (btnCopyPressed) doCopy();
    if (btnPastePressed) doPaste();
    if (btnClearPressed) doClear();
    if (btnRandomPressed) doRandom();

    if (
      rl.CoreD.IsKeyDown(.KEY_LEFT_CONTROL) ||
      rl.CoreD.IsKeyDown(.KEY_RIGHT_CONTROL)
    ) {
      if (rl.CoreD.IsKeyPressed(.KEY_X))
      {
        rl.CoreD.SetClipboardText(input);
        input = '';
      }

      if (rl.CoreD.IsKeyPressed(.KEY_C))
        rl.CoreD.SetClipboardText(input);

      if (rl.CoreD.IsKeyPressed(.KEY_V))
        doPaste();
    }

    rl.CoreD.BeginDrawing();

    rl.CoreD.ClearBackground(.RAYWHITE);

    rl.GuiD.GuiLabel(
      .rect(50, 20, 700, 36),
      "Use the BUTTONS or KEY SHORTCUTS:",
    );

    rl.CoreD.DrawText(
      "[CTRL+X] - CUT | [CTRL+C] COPY | [CTRL+V] | PASTE",
      50, 60, 20, .MAROON,
    );

    {
      final (result, newValue) = rl.GuiD.GuiTextBox(
        .rect(50, 120, 652, 40),
        input,
        256,
        textBoxEditMode
      );
      if (result != 0) textBoxEditMode = !textBoxEditMode;
    }

    btnRandomPressed = rl.GuiD.GuiButton(
      .rect(50 + 652 + 8, 120, 40, 40),
      "#77#",
    ) != 0;

    btnCutPressed = rl.GuiD.GuiButton(
      .rect(50, 180, 158, 40),
      "#17#CUT",
    ) != 0;
    
    btnCopyPressed = rl.GuiD.GuiButton(
      .rect(50 + 165, 180, 158, 40),
      "#16#COPY",
    ) != 0;
    
    btnPastePressed = rl.GuiD.GuiButton(
      .rect(50 + 165*2, 180, 158, 40),
      "#18#PASTE",
    ) != 0;
    
    btnClearPressed = rl.GuiD.GuiButton(
      .rect(50 + 165*3, 180, 158, 40),
      "#143#CLEAR",
    ) != 0;

    rl.GuiD.GuiSetState(.STATE_DISABLED);
    rl.GuiD.GuiLabel(
      .rect(50, 260, 700, 40),
      "Clipboard current text data:",
    );
    rl.GuiD.GuiSetStyle(.TEXTBOX, GuiTextBoxProperty.TEXT_READONLY, 1);
    rl.GuiD.GuiTextBox(
      .rect(50, 300, 700, 40),
      clipboardText, 256, false
    );
    rl.GuiD.GuiSetStyle(.TEXTBOX, GuiTextBoxProperty.TEXT_READONLY, 0);
    rl.GuiD.GuiLabel(
      .rect(50, 360, 700, 40),
      "Try copying text from other applications and pasting here!",
    );
    rl.GuiD.GuiSetState(.STATE_NORMAL);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}