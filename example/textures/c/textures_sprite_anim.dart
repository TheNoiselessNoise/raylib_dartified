// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_anim.c
// Run it: dart run textures_sprite_anim.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_FRAME_SPEED = 15;
const int MIN_FRAME_SPEED = 1;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_sprite_anim".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final scarfy = rl.Core.LoadTexture("../resources/scarfy.png".toC);

  final position = rl.Temp.Vector2$.At('position').set(350.0, 280.0);
  final frameRec = rl.Temp.Rectangle$.At('frameRec').set(0.0, 0.0, scarfy.width/6, scarfy.height);
  int currentFrame = 0;

  int framesCounter = 0;
  int framesSpeed = 8;

  while (!rl.Core.WindowShouldClose())
  {
    framesCounter++;

    if (framesCounter >= (60/framesSpeed))
    {
      framesCounter = 0;
      currentFrame++;

      if (currentFrame > 5) currentFrame = 0;

      frameRec.ref.x = currentFrame*scarfy.width/6;
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) framesSpeed++;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value)) framesSpeed--;

    if (framesSpeed > MAX_FRAME_SPEED) framesSpeed = MAX_FRAME_SPEED;
    else if (framesSpeed < MIN_FRAME_SPEED) framesSpeed = MIN_FRAME_SPEED;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawTexture(scarfy, 15, 40, rl.Color.WHITE);
      rl.Core.DrawRectangleLines(15, 40, scarfy.width, scarfy.height, rl.Color.LIME);
      rl.Core.DrawRectangleLines(
        15 + frameRec.ref.x.toInt(),
        40 + frameRec.ref.y.toInt(),
        frameRec.ref.width.toInt(),
        frameRec.ref.height.toInt(),
        rl.Color.RED
      );

      rl.Core.DrawText(
        "FRAME SPEED: ".toC,
        165, 210, 10, rl.Color.DARKGRAY
      );
      
      rl.Core.DrawText(
        "$framesSpeed FPS".toC,
        575, 210, 10, rl.Color.DARKGRAY
      );
      
      rl.Core.DrawText(
        "PRESS RIGHT/LEFT KEYS to CHANGE SPEED!".toC,
        290, 240, 10, rl.Color.DARKGRAY
      );

      for (int i = 0; i < MAX_FRAME_SPEED; i++)
      {
        if (i < framesSpeed) {
          rl.Core.DrawRectangle(250 + 21*i, 205, 20, 20, rl.Color.RED);
        }
        rl.Core.DrawRectangleLines(250 + 21*i, 205, 20, 20, rl.Color.MAROON);
      }

      rl.Core.DrawTextureRec(scarfy, frameRec.ref, position.ref, rl.Color.WHITE);

      rl.Core.DrawText(
        "(c) Scarfy sprite by Eiden Marsal".toC,
        screenWidth - 200, screenHeight - 20, 10, rl.Color.GRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(scarfy);

  rl.CloseWindowAndDispose();
}