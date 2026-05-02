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

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_blend_modes");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final bgImage = rl.CoreD.LoadImage("../resources/cyberpunk_street_background.png");
  final bgTexture = rl.CoreD.LoadTextureFromImage(bgImage);

  final fgImage = rl.CoreD.LoadImage("../resources/cyberpunk_street_foreground.png");
  final fgTexture = rl.CoreD.LoadTextureFromImage(fgImage);
  
  rl.CoreD.UnloadImage(bgImage);
  rl.CoreD.UnloadImage(fgImage);

  int blendCountMax = 5;
  BlendMode blendMode = .BLEND_ALPHA;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyPressed(.KEY_SPACE))
    {
      if (blendMode.value >= (blendCountMax - 1)) blendMode = .BLEND_ALPHA;
      else blendMode = BlendMode.fromValue(blendMode.value + 1);
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawTexture(
        bgTexture,
        screenWidth/2 - bgTexture.width/2,
        screenHeight/2 - bgTexture.height/2,
        .WHITE
      );

      rl.CoreD.BeginBlendMode(blendMode);
        rl.CoreD.DrawTexture(
          fgTexture,
          screenWidth/2 - fgTexture.width/2,
          screenHeight/2 - fgTexture.height/2,
          .WHITE
        );
      rl.CoreD.EndBlendMode();

      rl.CoreD.DrawText(
        "Press SPACE to change blend modes.",
        310, 350, 10, .GRAY
      );

      rl.CoreD.DrawText(
        "Current: ${blendMode.name}",
        screenWidth / 2 - 60, 370, 10, .GRAY
      );

      rl.CoreD.DrawText(
        "(c) Cyberpunk Street Environment by Luis Zuno (@ansimuz)",
        screenWidth - 330, screenHeight - 20, 10, .GRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(fgTexture);
  rl.CoreD.UnloadTexture(bgTexture);

  rl.CloseWindowAndDispose();
}