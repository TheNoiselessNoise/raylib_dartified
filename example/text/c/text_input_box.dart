// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_input_box.c
// Run it: dart run text_input_box.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_INPUT_CHARS = 9;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_input_box".toC);
  SetTargetFPS(60);

  String name = '';

  final textBox = Rectangle$.val.At('textBox').set(screenWidth/2.0 - 100, 180, 225, 50);
  bool mouseOnText = false;

  int framesCounter = 0;

  while (!WindowShouldClose())
  {
    if (CheckCollisionPointRec(GetMousePosition(), textBox.ref))
      mouseOnText = true;
    else
      mouseOnText = false;

    if (mouseOnText)
    {
      SetMouseCursor(MouseCursor.MOUSE_CURSOR_IBEAM.value);

      int key = GetCharPressed();

      while (key > 0)
      {
        if ((key >= 32) && (key <= 125) && (name.length < MAX_INPUT_CHARS))
        {
          name += String.fromCharCode(key);
        }

        key = GetCharPressed();
      }

      if (IsKeyPressed(KeyboardKey.KEY_BACKSPACE.value) && name.isNotEmpty)
      {
        name = name.substring(0, name.length - 1);
      }
    }
    else SetMouseCursor(MouseCursor.MOUSE_CURSOR_DEFAULT.value);

    if (mouseOnText) framesCounter++;
    else framesCounter = 0;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText(
        "PLACE MOUSE OVER INPUT BOX!".toC,
        240, 140, 20, GRAY
      );

      DrawRectangleRec(textBox.ref, LIGHTGRAY);
      DrawRectangleLines(
        textBox.ref.x.toInt(), textBox.ref.y.toInt(),
        textBox.ref.width.toInt(), textBox.ref.height.toInt(),
        mouseOnText ? RED : DARKGRAY
      );

      DrawText(
        name.toC,
        (textBox.ref.x + 5).toInt(), (textBox.ref.y + 8).toInt(), 40, MAROON
      );

      DrawText(
        "INPUT CHARS: ${name.length}/$MAX_INPUT_CHARS".toC,
        315, 250, 20, DARKGRAY
      );

      if (mouseOnText)
      {
        if (name.length < MAX_INPUT_CHARS)
        {
          if (((framesCounter/20)%2) == 0) DrawText(
            "_".toC,
            (textBox.ref.x + 8 + MeasureText(name.toC, 40)).toInt(), (textBox.ref.y + 12).toInt(), 40, MAROON
          );
        }
        else DrawText(
          "Press BACKSPACE to delete chars...".toC,
          230, 300, 20, GRAY
        );
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}