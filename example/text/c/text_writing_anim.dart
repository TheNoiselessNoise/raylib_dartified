// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_writing_anim.c
// Run it: dart run text_writing_anim.dart
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_INPUT_CHARS = 9;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "text_writing_anim".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  String message = "This sample illustrates a text writing\nanimation effect! Check it out! ;)";

  int framesCounter = 0;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_SPACE.value)) framesCounter += 8;
    else framesCounter++;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ENTER.value)) framesCounter = 0;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      int length = math.min((framesCounter/10).toInt(), message.length);

      rl.Core.DrawText(
        message.substring(0, length).toC,
        210, 160, 20, rl.C.MAROON
      );

      rl.Core.DrawText(
        "PRESS [ENTER] to RESTART!".toC,
        240, 260, 20, rl.C.LIGHTGRAY
      );
      
      rl.Core.DrawText(
        "HOLD [SPACE] to SPEED UP!".toC,
        239, 300, 20, rl.C.LIGHTGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}