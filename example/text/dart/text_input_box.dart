// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_input_box.c
// Run it: dart run text_input_box.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_INPUT_CHARS = 9;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_input_box");
  SetTargetFPS(60);

  String name = '';

  final RectangleD textBox = .rect(screenWidth/2.0 - 100, 180, 225, 50);
  bool mouseOnText = false;

  int framesCounter = 0;

  while (!WindowShouldClose())
  {
    if (CheckCollisionPointRec(GetMousePosition(), textBox))
      mouseOnText = true;
    else
      mouseOnText = false;

    if (mouseOnText)
    {
      SetMouseCursor(.MOUSE_CURSOR_IBEAM);

      int key = GetCharPressed();

      while (key > 0)
      {
        if ((key >= 32) && (key <= 125) && (name.length < MAX_INPUT_CHARS))
        {
          name += String.fromCharCode(key);
        }

        key = GetCharPressed();
      }

      if (IsKeyPressed(.KEY_BACKSPACE) && name.isNotEmpty)
      {
        name = name.substring(0, name.length - 1);
      }
    }
    else SetMouseCursor(.MOUSE_CURSOR_DEFAULT);

    if (mouseOnText) framesCounter++;
    else framesCounter = 0;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText(
        "PLACE MOUSE OVER INPUT BOX!",
        240, 140, 20, .GRAY
      );

      DrawRectangleRec(textBox, .LIGHTGRAY);
      DrawRectangleLines(
        textBox.x, textBox.y,
        textBox.width, textBox.height,
        mouseOnText ? .RED : .DARKGRAY
      );

      DrawText(
        name,
        textBox.x + 5, textBox.y + 8, 40, .MAROON
      );

      DrawText(
        "INPUT CHARS: ${name.length}/$MAX_INPUT_CHARS",
        315, 250, 20, .DARKGRAY
      );

      if (mouseOnText)
      {
        if (name.length < MAX_INPUT_CHARS)
        {
          if (((framesCounter/20)%2) == 0) DrawText(
            "_",
            textBox.x + 8 + MeasureText(name, 40), textBox.y + 12, 40, .MAROON
          );
        }
        else DrawText(
          "Press BACKSPACE to delete chars...",
          230, 300, 20, .GRAY
        );
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}