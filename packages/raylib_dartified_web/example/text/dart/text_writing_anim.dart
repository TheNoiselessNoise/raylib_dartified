// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_writing_anim.c
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_INPUT_CHARS = 9;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "text_writing_anim");
  SetTargetFPS(60);

  String message = "This sample illustrates a text writing\nanimation effect! Check it out! ;)";

  int framesCounter = 0;

  rl.setMainLoop(() {
    if (IsKeyDown(.KEY_SPACE)) framesCounter += 8;
    else framesCounter++;

    if (IsKeyPressed(.KEY_ENTER)) framesCounter = 0;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      int length = math.min((framesCounter/10).toInt(), message.length);

      DrawText(
        message.substring(0, length),
        210, 160, 20, .MAROON
      );

      DrawText(
        "PRESS [ENTER] to RESTART!",
        240, 260, 20, .LIGHTGRAY
      );
      
      DrawText(
        "HOLD [SPACE] to SPEED UP!",
        239, 300, 20, .LIGHTGRAY
      );

    EndDrawing();
  });
});