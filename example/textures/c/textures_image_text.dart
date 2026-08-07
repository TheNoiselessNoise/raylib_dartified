// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_text.c
// Run it: dart run textures_image_text.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_image_text".toC);
  SetTargetFPS(60);

  final parrots = Image$.At('parrots');
  parrots.ref = LoadImage("../resources/parrots.png".toC);

  final font = LoadFontEx("../resources/KAISG.ttf".toC, 64, nullptr, 0);

  ImageDrawTextEx(
    parrots,
    font,
    "[Parrots font drawing]".toC,
    Vector2$.$1.set(20.0, 20.0),
    font.baseSize.toDouble(),
    0.0,
    RED
  );

  final texture = LoadTextureFromImage(parrots.ref);
  UnloadImage(parrots.ref);

  final position = Vector2$.At('position').set(
    screenWidth/2 - texture.width/2,
    screenHeight/2 - texture.height/2 - 20
  );

  bool showFont = false;

  while (!WindowShouldClose())
  {
    showFont = IsKeyDown(KeyboardKey.KEY_SPACE.value);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (!showFont)
      {
        DrawTextureV(texture, position.ref, WHITE);

        DrawTextEx(
          font,
          "[Parrots font drawing]".toC,
          Vector2$.$1.set(position.ref.x + 20, position.ref.y + 20 + 280),
          font.baseSize.toDouble(),
          0.0,
          WHITE
        );
      }
      else DrawTexture(
        font.texture,
        (screenWidth/2 - font.texture.width/2).toInt(),
        50,
        BLACK
      );

      DrawText(
        "PRESS SPACE to SHOW FONT ATLAS USED".toC,
        290, 420, 10, DARKGRAY
      );

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadFont(font);

  CloseWindowAndDispose();
}