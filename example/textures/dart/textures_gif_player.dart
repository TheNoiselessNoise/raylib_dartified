// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_gif_player.c
// Run it: dart run textures_gif_player.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_FRAME_DELAY = 20;
const int MIN_FRAME_DELAY = 1;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_gif_player");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final imScarfyAnim = rl.CoreD.LoadImageAnim("../resources/scarfy_run.gif");
  final texScarfyAnim = rl.CoreD.LoadTextureFromImage(imScarfyAnim);

  int nextFrameDataOffset = 0;

  int currentAnimFrame = 0;
  int frameDelay = 8;
  int frameCounter = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    frameCounter++;
    if (frameCounter >= frameDelay)
    {
      currentAnimFrame++;
      if (currentAnimFrame >= imScarfyAnim.frameCount) currentAnimFrame = 0;

      final frameSize = imScarfyAnim.frameSize;
      final nextFrameDataOffset = frameSize * currentAnimFrame;

      rl.CoreD.UpdateTexture(
        texScarfyAnim,
        imScarfyAnim.data.sublist(nextFrameDataOffset, nextFrameDataOffset + frameSize),
      );

      frameCounter = 0;
    }

    if (rl.CoreD.IsKeyPressed(.KEY_RIGHT)) frameDelay++;
    else if (rl.CoreD.IsKeyPressed(.KEY_LEFT)) frameDelay--;

    if (frameDelay > MAX_FRAME_DELAY) frameDelay = MAX_FRAME_DELAY;
    else if (frameDelay < MIN_FRAME_DELAY) frameDelay = MIN_FRAME_DELAY;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText(
        "TOTAL GIF FRAMES: ${imScarfyAnim.frameCount}",
        50, 30, 20, .LIGHTGRAY
      );
      rl.CoreD.DrawText(
        "CURRENT FRAME: $currentAnimFrame",
        50, 60, 20, .GRAY
      );
      rl.CoreD.DrawText(
        "CURRENT FRAME IMAGE.DATA OFFSET: $nextFrameDataOffset",
        50, 90, 20, .GRAY
      );

      rl.CoreD.DrawText(
        "FRAMES DELAY: ",
        100, 305, 10, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "$frameDelay frames",
        620, 305, 10, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "PRESS RIGHT/LEFT KEYS to CHANGE SPEED!",
        290, 350, 10, .DARKGRAY
      );

      for (int i = 0; i < MAX_FRAME_DELAY; i++)
      {
        if (i < frameDelay) rl.CoreD.DrawRectangle(190 + 21*i, 300, 20, 20, .RED);
        rl.CoreD.DrawRectangleLines(190 + 21*i, 300, 20, 20, .MAROON);
      }

      rl.CoreD.DrawTexture(
        texScarfyAnim,
        rl.CoreD.GetScreenWidth()/2 - texScarfyAnim.width/2,
        140,
        .WHITE
      );

      rl.CoreD.DrawText(
        "(c) Scarfy sprite by Eiden Marsal",
        screenWidth - 200, screenHeight - 20, 10, .GRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texScarfyAnim);
  rl.CoreD.UnloadImage(imScarfyAnim);

  rl.CloseWindowAndDispose();
}