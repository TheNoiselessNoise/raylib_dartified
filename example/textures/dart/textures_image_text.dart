// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_text.c
// Run it: dart run textures_image_text.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_image_text");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final parrots = rl.CoreD.LoadImage("../resources/parrots.png");

  final font = rl.CoreD.LoadFontEx("../resources/KAISG.ttf", 64);

  rl.CoreD.ImageDrawTextEx(
    parrots,
    font,
    "[Parrots font drawing]",
    .vec2(20.0, 20.0),
    font.baseSize,
    0.0,
    .RED
  );

  final texture = rl.CoreD.LoadTextureFromImage(parrots);
  rl.CoreD.UnloadImage(parrots);

  final Vector2D position = .vec2(
    screenWidth/2 - texture.width/2,
    screenHeight/2 - texture.height/2 - 20
  );

  bool showFont = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    showFont = rl.CoreD.IsKeyDown(.KEY_SPACE);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      if (!showFont)
      {
        rl.CoreD.DrawTextureV(texture, position, .WHITE);

        rl.CoreD.DrawTextEx(
          font,
          "[Parrots font drawing]",
          .vec2(position.x + 20, position.y + 20 + 280),
          font.baseSize,
          0.0,
          .WHITE
        );
      }
      else rl.CoreD.DrawTexture(
        font.texture,
        screenWidth/2 - font.texture.width/2,
        50,
        .BLACK
      );

      rl.CoreD.DrawText(
        "PRESS SPACE to SHOW FONT ATLAS USED",
        290, 420, 10, .DARKGRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadFont(font);

  rl.CloseWindowAndDispose();
}