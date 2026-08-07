// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_gif_player.c
// Run it: dart run textures_gif_player.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_FRAME_DELAY = 20;
const int MIN_FRAME_DELAY = 1;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_gif_player".toC);
  SetTargetFPS(60);

  final animFrames = Int$.At('animFrames');
  final imScarfyAnim = LoadImageAnim("../resources/scarfy_run.gif".toC, animFrames);
  final texScarfyAnim = LoadTextureFromImage(imScarfyAnim);

  int nextFrameDataOffset = 0;

  int currentAnimFrame = 0;
  int frameDelay = 8;
  int frameCounter = 0;

  while (!WindowShouldClose())
  {
    frameCounter++;
    if (frameCounter >= frameDelay)
    {
      currentAnimFrame++;
      if (currentAnimFrame >= animFrames.value) currentAnimFrame = 0;

      nextFrameDataOffset = imScarfyAnim.width*imScarfyAnim.height*4*currentAnimFrame;

      UpdateTexture(
        texScarfyAnim,
        (imScarfyAnim.data.cast<UnsignedChar>() + nextFrameDataOffset).cast(),
      );

      frameCounter = 0;
    }

    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) frameDelay++;
    else if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) frameDelay--;

    if (frameDelay > MAX_FRAME_DELAY) frameDelay = MAX_FRAME_DELAY;
    else if (frameDelay < MIN_FRAME_DELAY) frameDelay = MIN_FRAME_DELAY;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText(
        "TOTAL GIF FRAMES: ${animFrames.value}".toC,
        50, 30, 20, LIGHTGRAY
      );
      DrawText(
        "CURRENT FRAME: $currentAnimFrame".toC,
        50, 60, 20, GRAY
      );
      DrawText(
        "CURRENT FRAME IMAGE.DATA OFFSET: $nextFrameDataOffset".toC,
        50, 90, 20, GRAY
      );

      DrawText(
        "FRAMES DELAY: ".toC,
        100, 305, 10, DARKGRAY
      );
      DrawText(
        "$frameDelay frames".toC,
        620, 305, 10, DARKGRAY
      );
      DrawText(
        "PRESS RIGHT/LEFT KEYS to CHANGE SPEED!".toC,
        290, 350, 10, DARKGRAY
      );

      for (int i = 0; i < MAX_FRAME_DELAY; i++)
      {
        if (i < frameDelay) DrawRectangle(190 + 21*i, 300, 20, 20, RED);
        DrawRectangleLines(190 + 21*i, 300, 20, 20, MAROON);
      }

      DrawTexture(
        texScarfyAnim,
        (GetScreenWidth()/2 - texScarfyAnim.width/2).toInt(),
        140,
        WHITE
      );

      DrawText(
        "(c) Scarfy sprite by Eiden Marsal".toC,
        screenWidth - 200, screenHeight - 20, 10, GRAY
      );

    EndDrawing();
  }

  UnloadTexture(texScarfyAnim);
  UnloadImage(imScarfyAnim);

  CloseWindowAndDispose();
}