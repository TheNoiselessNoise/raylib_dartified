// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_writing_anim.c
// Run it: dart run text_writing_anim.dart
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_INPUT_CHARS = 9;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_writing_anim".toC);
  SetTargetFPS(60);

  String message = "This sample illustrates a text writing\nanimation effect! Check it out! ;)";

  int framesCounter = 0;

  while (!WindowShouldClose())
  {
    if (IsKeyDown(KeyboardKey.KEY_SPACE.value)) framesCounter += 8;
    else framesCounter++;

    if (IsKeyPressed(KeyboardKey.KEY_ENTER.value)) framesCounter = 0;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      int length = math.min((framesCounter/10).toInt(), message.length);

      DrawText(
        message.substring(0, length).toC,
        210, 160, 20, MAROON
      );

      DrawText(
        "PRESS [ENTER] to RESTART!".toC,
        240, 260, 20, LIGHTGRAY
      );
      
      DrawText(
        "HOLD [SPACE] to SPEED UP!".toC,
        239, 300, 20, LIGHTGRAY
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}