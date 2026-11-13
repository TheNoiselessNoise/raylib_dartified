// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_gif_player.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_FRAME_DELAY = 20;
const int MIN_FRAME_DELAY = 1;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "textures_gif_player");
  SetTargetFPS(60);

  final imScarfyAnim = LoadImageAnim("../resources/scarfy_run.gif");
  final texScarfyAnim = LoadTextureFromImage(imScarfyAnim);

  int nextFrameDataOffset = 0;

  int currentAnimFrame = 0;
  int frameDelay = 8;
  int frameCounter = 0;

  rl.setMainLoop(() {
    frameCounter++;
    if (frameCounter >= frameDelay)
    {
      currentAnimFrame++;
      if (currentAnimFrame >= imScarfyAnim.frameCount) currentAnimFrame = 0;

      final frameSize = imScarfyAnim.frameSize;
      nextFrameDataOffset = frameSize * currentAnimFrame;

      UpdateTexture(
        texScarfyAnim,
        .fromList(imScarfyAnim.dataView.sublist(nextFrameDataOffset, nextFrameDataOffset + frameSize)),
      );

      frameCounter = 0;
    }

    if (IsKeyPressed(.KEY_RIGHT)) frameDelay++;
    else if (IsKeyPressed(.KEY_LEFT)) frameDelay--;

    if (frameDelay > MAX_FRAME_DELAY) frameDelay = MAX_FRAME_DELAY;
    else if (frameDelay < MIN_FRAME_DELAY) frameDelay = MIN_FRAME_DELAY;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText(
        "TOTAL GIF FRAMES: ${imScarfyAnim.frameCount}",
        50, 30, 20, .LIGHTGRAY
      );
      DrawText(
        "CURRENT FRAME: $currentAnimFrame",
        50, 60, 20, .GRAY
      );
      DrawText(
        "CURRENT FRAME IMAGE.DATA OFFSET: $nextFrameDataOffset",
        50, 90, 20, .GRAY
      );

      DrawText(
        "FRAMES DELAY: ",
        100, 305, 10, .DARKGRAY
      );
      DrawText(
        "$frameDelay frames",
        620, 305, 10, .DARKGRAY
      );
      DrawText(
        "PRESS RIGHT/LEFT KEYS to CHANGE SPEED!",
        290, 350, 10, .DARKGRAY
      );

      for (int i = 0; i < MAX_FRAME_DELAY; i++)
      {
        if (i < frameDelay) DrawRectangle(190 + 21*i, 300, 20, 20, .RED);
        DrawRectangleLines(190 + 21*i, 300, 20, 20, .MAROON);
      }

      DrawTexture(
        texScarfyAnim,
        GetScreenWidth()/2 - texScarfyAnim.width/2,
        140,
        .WHITE
      );

      DrawText(
        "(c) Scarfy sprite by Eiden Marsal",
        screenWidth - 200, screenHeight - 20, 10, .GRAY
      );

    EndDrawing();
  });
});