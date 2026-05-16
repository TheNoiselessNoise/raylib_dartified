// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_input_box.c
// Run it: dart run text_input_box.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_INPUT_CHARS = 9;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "text_input_box".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  String name = '';

  final textBox = rl.Temp.Rectangle$.At('textBox').set(screenWidth/2.0 - 100, 180, 225, 50);
  bool mouseOnText = false;

  int framesCounter = 0;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.CheckCollisionPointRec(rl.Core.GetMousePosition(), textBox.ref))
      mouseOnText = true;
    else
      mouseOnText = false;

    if (mouseOnText)
    {
      rl.Core.SetMouseCursor(MouseCursor.MOUSE_CURSOR_IBEAM.value);

      int key = rl.Core.GetCharPressed();

      while (key > 0)
      {
        if ((key >= 32) && (key <= 125) && (name.length < MAX_INPUT_CHARS))
        {
          name += String.fromCharCode(key);
        }

        key = rl.Core.GetCharPressed();
      }

      if (rl.Core.IsKeyPressed(KeyboardKey.KEY_BACKSPACE.value) && name.isNotEmpty)
      {
        name = name.substring(0, name.length - 1);
      }
    }
    else rl.Core.SetMouseCursor(MouseCursor.MOUSE_CURSOR_DEFAULT.value);

    if (mouseOnText) framesCounter++;
    else framesCounter = 0;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawText(
        "PLACE MOUSE OVER INPUT BOX!".toC,
        240, 140, 20, rl.Color.GRAY
      );

      rl.Core.DrawRectangleRec(textBox.ref, rl.Color.LIGHTGRAY);
      rl.Core.DrawRectangleLines(
        textBox.ref.x.toInt(), textBox.ref.y.toInt(),
        textBox.ref.width.toInt(), textBox.ref.height.toInt(),
        mouseOnText ? rl.Color.RED : rl.Color.DARKGRAY
      );

      rl.Core.DrawText(
        name.toC,
        (textBox.ref.x + 5).toInt(), (textBox.ref.y + 8).toInt(), 40, rl.Color.MAROON
      );

      rl.Core.DrawText(
        "INPUT CHARS: ${name.length}/$MAX_INPUT_CHARS".toC,
        315, 250, 20, rl.Color.DARKGRAY
      );

      if (mouseOnText)
      {
        if (name.length < MAX_INPUT_CHARS)
        {
          if (((framesCounter/20)%2) == 0) rl.Core.DrawText(
            "_".toC,
            (textBox.ref.x + 8 + rl.Core.MeasureText(name.toC, 40)).toInt(), (textBox.ref.y + 12).toInt(), 40, rl.Color.MAROON
          );
        }
        else rl.Core.DrawText(
          "Press BACKSPACE to delete chars...".toC,
          230, 300, 20, rl.Color.GRAY
        );
      }

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}