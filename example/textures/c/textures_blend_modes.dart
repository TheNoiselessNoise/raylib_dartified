// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_blend_modes.c
// Run it: dart run textures_blend_modes.dart
// WARNING: expects resources from the raylib source
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_blend_modes".toC);
  SetTargetFPS(60);

  final bgImage = LoadImage("../resources/cyberpunk_street_background.png".toC);
  final bgTexture = LoadTextureFromImage(bgImage);

  final fgImage = LoadImage("../resources/cyberpunk_street_foreground.png".toC);
  final fgTexture = LoadTextureFromImage(fgImage);
  
  UnloadImage(bgImage);
  UnloadImage(fgImage);

  int blendCountMax = 5;
  BlendMode blendMode = .BLEND_ALPHA;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value))
    {
      if (blendMode.value >= (blendCountMax - 1)) blendMode = .BLEND_ALPHA;
      else blendMode = .fromValue(blendMode.value + 1);
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTexture(
        bgTexture,
        (screenWidth/2 - bgTexture.width/2).toInt(),
        (screenHeight/2 - bgTexture.height/2).toInt(),
        WHITE
      );

      // Apply the blend mode and then draw the foreground texture
      BeginBlendMode(blendMode.value);
        DrawTexture(
          fgTexture,
          (screenWidth/2 - fgTexture.width/2).toInt(),
          (screenHeight/2 - fgTexture.height/2).toInt(),
          WHITE
        );
      EndBlendMode();

      DrawText(
        "Press SPACE to change blend modes.".toC,
        310, 350, 10, GRAY
      );

      DrawText(
        "Current: ${blendMode.name}".toC,
        (screenWidth / 2 - 60).toInt(), 370, 10, GRAY
      );

      DrawText(
        "(c) Cyberpunk Street Environment by Luis Zuno (@ansimuz)".toC,
        screenWidth - 330, screenHeight - 20, 10, GRAY
      );

    EndDrawing();
  }

  UnloadTexture(fgTexture);
  UnloadTexture(bgTexture);

  CloseWindowAndDispose();
}