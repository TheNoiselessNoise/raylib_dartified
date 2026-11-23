// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_blend_modes.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Texture bgTexture;
late Texture fgTexture;
int blendCountMax = 5;
BlendMode blendMode = .BLEND_ALPHA;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "textures_blend_modes");
    SetTargetFPS(60);

    final bgImage = LoadImage("../resources/cyberpunk_street_background.png");
    bgTexture = LoadTextureFromImage(bgImage);
    UnloadImage(bgImage);

    final fgImage = LoadImage("../resources/cyberpunk_street_foreground.png");
    fgTexture = LoadTextureFromImage(fgImage);
    UnloadImage(fgImage);
  },
  loop: (_) async {
    if (IsKeyPressed(.KEY_SPACE))
    {
      if (blendMode.value >= (blendCountMax - 1)) blendMode = .BLEND_ALPHA;
      else blendMode = .fromValue(blendMode.value + 1);
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTexture(
        bgTexture,
        screenWidth/2 - bgTexture.width/2,
        screenHeight/2 - bgTexture.height/2,
        .WHITE
      );

      BeginBlendMode(blendMode);
        DrawTexture(
          fgTexture,
          screenWidth/2 - fgTexture.width/2,
          screenHeight/2 - fgTexture.height/2,
          .WHITE
        );
      EndBlendMode();

      DrawText(
        "Press SPACE to change blend modes.",
        310, 350, 10, .GRAY
      );

      DrawText(
        "Current: ${blendMode.name}",
        screenWidth / 2 - 60, 370, 10, .GRAY
      );

      DrawText(
        "(c) Cyberpunk Street Environment by Luis Zuno (@ansimuz)",
        screenWidth - 330, screenHeight - 20, 10, .GRAY
      );

    EndDrawing();
  },
  close: (_) {
    UnloadTexture(fgTexture);
    UnloadTexture(bgTexture);
    CloseWindow();
  },
);