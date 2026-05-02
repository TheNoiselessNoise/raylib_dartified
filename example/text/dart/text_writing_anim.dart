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

  rl.CoreD.InitWindow(screenWidth, screenHeight, "text_writing_anim");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  String message = "This sample illustrates a text writing\nanimation effect! Check it out! ;)";

  int framesCounter = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyDown(.KEY_SPACE)) framesCounter += 8;
    else framesCounter++;

    if (rl.CoreD.IsKeyPressed(.KEY_ENTER)) framesCounter = 0;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      int length = math.min((framesCounter/10).toInt(), message.length);

      rl.CoreD.DrawText(
        message.substring(0, length),
        210, 160, 20, .MAROON
      );

      rl.CoreD.DrawText(
        "PRESS [ENTER] to RESTART!",
        240, 260, 20, .LIGHTGRAY
      );
      
      rl.CoreD.DrawText(
        "HOLD [SPACE] to SPEED UP!",
        239, 300, 20, .LIGHTGRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}