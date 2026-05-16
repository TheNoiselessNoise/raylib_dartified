// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_blend_modes.c
// Run it: dart run textures_blend_modes.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_blend_modes".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final bgImage = rl.Core.LoadImage("../resources/cyberpunk_street_background.png".toC);
  final bgTexture = rl.Core.LoadTextureFromImage(bgImage);

  final fgImage = rl.Core.LoadImage("../resources/cyberpunk_street_foreground.png".toC);
  final fgTexture = rl.Core.LoadTextureFromImage(fgImage);
  
  rl.Core.UnloadImage(bgImage);
  rl.Core.UnloadImage(fgImage);

  int blendCountMax = 5;
  BlendMode blendMode = .BLEND_ALPHA;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value))
    {
      if (blendMode.value >= (blendCountMax - 1)) blendMode = .BLEND_ALPHA;
      else blendMode = .fromValue(blendMode.value + 1);
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawTexture(
        bgTexture,
        (screenWidth/2 - bgTexture.width/2).toInt(),
        (screenHeight/2 - bgTexture.height/2).toInt(),
        rl.Color.WHITE
      );

      // Apply the blend mode and then draw the foreground texture
      rl.Core.BeginBlendMode(blendMode.value);
        rl.Core.DrawTexture(
          fgTexture,
          (screenWidth/2 - fgTexture.width/2).toInt(),
          (screenHeight/2 - fgTexture.height/2).toInt(),
          rl.Color.WHITE
        );
      rl.Core.EndBlendMode();

      rl.Core.DrawText(
        "Press SPACE to change blend modes.".toC,
        310, 350, 10, rl.Color.GRAY
      );

      rl.Core.DrawText(
        "Current: ${blendMode.name}".toC,
        (screenWidth / 2 - 60).toInt(), 370, 10, rl.Color.GRAY
      );

      rl.Core.DrawText(
        "(c) Cyberpunk Street Environment by Luis Zuno (@ansimuz)".toC,
        screenWidth - 330, screenHeight - 20, 10, rl.Color.GRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(fgTexture);
  rl.Core.UnloadTexture(bgTexture);

  rl.CloseWindowAndDispose();
}