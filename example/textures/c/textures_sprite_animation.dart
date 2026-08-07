// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_animation.c
// Run it: dart run textures_sprite_animation.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_FRAME_SPEED = 15;
const int MIN_FRAME_SPEED = 1;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_sprite_animation".toC);
  SetTargetFPS(60);

  final scarfy = LoadTexture("../resources/scarfy.png".toC);

  final position = Vector2$.At('position').set(350.0, 280.0);
  final frameRec = Rectangle$.At('frameRec').set(0.0, 0.0, scarfy.width/6, scarfy.height);
  int currentFrame = 0;

  int framesCounter = 0;
  int framesSpeed = 8;

  while (!WindowShouldClose())
  {
    framesCounter++;

    if (framesCounter >= (60/framesSpeed))
    {
      framesCounter = 0;
      currentFrame++;

      if (currentFrame > 5) currentFrame = 0;

      frameRec.ref.x = currentFrame*scarfy.width/6;
    }

    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) framesSpeed++;
    else if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) framesSpeed--;

    if (framesSpeed > MAX_FRAME_SPEED) framesSpeed = MAX_FRAME_SPEED;
    else if (framesSpeed < MIN_FRAME_SPEED) framesSpeed = MIN_FRAME_SPEED;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTexture(scarfy, 15, 40, WHITE);
      DrawRectangleLines(15, 40, scarfy.width, scarfy.height, LIME);
      DrawRectangleLines(
        15 + frameRec.ref.x.toInt(),
        40 + frameRec.ref.y.toInt(),
        frameRec.ref.width.toInt(),
        frameRec.ref.height.toInt(),
        RED
      );

      DrawText(
        "FRAME SPEED: ".toC,
        165, 210, 10, DARKGRAY
      );
      
      DrawText(
        "$framesSpeed FPS".toC,
        575, 210, 10, DARKGRAY
      );
      
      DrawText(
        "PRESS RIGHT/LEFT KEYS to CHANGE SPEED!".toC,
        290, 240, 10, DARKGRAY
      );

      for (int i = 0; i < MAX_FRAME_SPEED; i++)
      {
        if (i < framesSpeed) {
          DrawRectangle(250 + 21*i, 205, 20, 20, RED);
        }
        DrawRectangleLines(250 + 21*i, 205, 20, 20, MAROON);
      }

      DrawTextureRec(scarfy, frameRec.ref, position.ref, WHITE);

      DrawText(
        "(c) Scarfy sprite by Eiden Marsal".toC,
        screenWidth - 200, screenHeight - 20, 10, GRAY
      );

    EndDrawing();
  }

  UnloadTexture(scarfy);

  CloseWindowAndDispose();
}