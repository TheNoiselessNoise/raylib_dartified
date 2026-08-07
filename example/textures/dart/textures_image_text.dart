// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_text.c
// Run it: dart run textures_image_text.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_image_text");
  SetTargetFPS(60);

  final parrots = LoadImage("../resources/parrots.png");

  final font = LoadFontEx("../resources/KAISG.ttf", 64);

  ImageDrawTextEx(
    parrots,
    font,
    "[Parrots font drawing]",
    .vec2(20.0, 20.0),
    font.baseSize,
    0.0,
    .RED
  );

  final texture = LoadTextureFromImage(parrots);
  UnloadImage(parrots);

  final Vector2D position = .vec2(
    screenWidth/2 - texture.width/2,
    screenHeight/2 - texture.height/2 - 20
  );

  bool showFont = false;

  while (!WindowShouldClose())
  {
    showFont = IsKeyDown(.KEY_SPACE);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      if (!showFont)
      {
        DrawTextureV(texture, position, .WHITE);

        DrawTextEx(
          font,
          "[Parrots font drawing]",
          .vec2(position.x + 20, position.y + 20 + 280),
          font.baseSize,
          0.0,
          .WHITE
        );
      }
      else DrawTexture(
        font.texture,
        screenWidth/2 - font.texture.width/2,
        50,
        .BLACK
      );

      DrawText(
        "PRESS SPACE to SHOW FONT ATLAS USED",
        290, 420, 10, .DARKGRAY
      );

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadFont(font);

  CloseWindowAndDispose();
}