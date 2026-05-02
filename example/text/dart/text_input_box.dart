// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_input_box.c
// Run it: dart run text_input_box.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_INPUT_CHARS = 9;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "text_input_box");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  String name = '';

  final RectangleD textBox = .rect(screenWidth/2.0 - 100, 180, 225, 50);
  bool mouseOnText = false;

  int framesCounter = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.CheckCollisionPointRec(rl.CoreD.GetMousePosition(), textBox))
      mouseOnText = true;
    else
      mouseOnText = false;

    if (mouseOnText)
    {
      rl.CoreD.SetMouseCursor(.MOUSE_CURSOR_IBEAM);

      int key = rl.CoreD.GetCharPressed();

      while (key > 0)
      {
        if ((key >= 32) && (key <= 125) && (name.length < MAX_INPUT_CHARS))
        {
          name += String.fromCharCode(key);
        }

        key = rl.CoreD.GetCharPressed();
      }

      if (rl.CoreD.IsKeyPressed(.KEY_BACKSPACE) && name.isNotEmpty)
      {
        name = name.substring(0, name.length - 1);
      }
    }
    else rl.CoreD.SetMouseCursor(.MOUSE_CURSOR_DEFAULT);

    if (mouseOnText) framesCounter++;
    else framesCounter = 0;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText(
        "PLACE MOUSE OVER INPUT BOX!",
        240, 140, 20, .GRAY
      );

      rl.CoreD.DrawRectangleRec(textBox, .LIGHTGRAY);
      rl.CoreD.DrawRectangleLines(
        textBox.x, textBox.y,
        textBox.width, textBox.height,
        mouseOnText ? .RED : .DARKGRAY
      );

      rl.CoreD.DrawText(
        name,
        textBox.x + 5, textBox.y + 8, 40, .MAROON
      );

      rl.CoreD.DrawText(
        "INPUT CHARS: ${name.length}/$MAX_INPUT_CHARS",
        315, 250, 20, .DARKGRAY
      );

      if (mouseOnText)
      {
        if (name.length < MAX_INPUT_CHARS)
        {
          if (((framesCounter/20)%2) == 0) rl.CoreD.DrawText(
            "_",
            textBox.x + 8 + rl.CoreD.MeasureText(name, 40), textBox.y + 12, 40, .MAROON
          );
        }
        else rl.CoreD.DrawText(
          "Press BACKSPACE to delete chars...",
          230, 300, 20, .GRAY
        );
      }

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}