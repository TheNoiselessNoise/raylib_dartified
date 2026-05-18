// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_gif_player.c
// Run it: dart run textures_gif_player.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_FRAME_DELAY = 20;
const int MIN_FRAME_DELAY = 1;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_gif_player".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final animFrames = rl.Temp.Int$.At('animFrames');
  final imScarfyAnim = rl.Core.LoadImageAnim("../resources/scarfy_run.gif".toC, animFrames);
  final texScarfyAnim = rl.Core.LoadTextureFromImage(imScarfyAnim);

  int nextFrameDataOffset = 0;

  int currentAnimFrame = 0;
  int frameDelay = 8;
  int frameCounter = 0;

  while (!rl.Core.WindowShouldClose())
  {
    frameCounter++;
    if (frameCounter >= frameDelay)
    {
      currentAnimFrame++;
      if (currentAnimFrame >= animFrames.value) currentAnimFrame = 0;

      nextFrameDataOffset = imScarfyAnim.width*imScarfyAnim.height*4*currentAnimFrame;

      rl.Core.UpdateTexture(
        texScarfyAnim,
        (imScarfyAnim.data.cast<UnsignedChar>() + nextFrameDataOffset).cast(),
      );

      frameCounter = 0;
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) frameDelay++;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value)) frameDelay--;

    if (frameDelay > MAX_FRAME_DELAY) frameDelay = MAX_FRAME_DELAY;
    else if (frameDelay < MIN_FRAME_DELAY) frameDelay = MIN_FRAME_DELAY;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawText(
        "TOTAL GIF FRAMES: ${animFrames.value}".toC,
        50, 30, 20, rl.Color.LIGHTGRAY
      );
      rl.Core.DrawText(
        "CURRENT FRAME: $currentAnimFrame".toC,
        50, 60, 20, rl.Color.GRAY
      );
      rl.Core.DrawText(
        "CURRENT FRAME IMAGE.DATA OFFSET: $nextFrameDataOffset".toC,
        50, 90, 20, rl.Color.GRAY
      );

      rl.Core.DrawText(
        "FRAMES DELAY: ".toC,
        100, 305, 10, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "$frameDelay frames".toC,
        620, 305, 10, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "PRESS RIGHT/LEFT KEYS to CHANGE SPEED!".toC,
        290, 350, 10, rl.Color.DARKGRAY
      );

      for (int i = 0; i < MAX_FRAME_DELAY; i++)
      {
        if (i < frameDelay) rl.Core.DrawRectangle(190 + 21*i, 300, 20, 20, rl.Color.RED);
        rl.Core.DrawRectangleLines(190 + 21*i, 300, 20, 20, rl.Color.MAROON);
      }

      rl.Core.DrawTexture(
        texScarfyAnim,
        (rl.Core.GetScreenWidth()/2 - texScarfyAnim.width/2).toInt(),
        140,
        rl.Color.WHITE
      );

      rl.Core.DrawText(
        "(c) Scarfy sprite by Eiden Marsal".toC,
        screenWidth - 200, screenHeight - 20, 10, rl.Color.GRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texScarfyAnim);
  rl.Core.UnloadImage(imScarfyAnim);

  rl.CloseWindowAndDispose();
}