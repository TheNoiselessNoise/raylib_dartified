// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_text.c
// Run it: dart run textures_image_text.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_image_text".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final parrots = rl.Temp.Image$.At('parrots');
  parrots.ref = rl.Core.LoadImage("../resources/parrots.png".toC);

  final font = rl.Core.LoadFontEx("../resources/KAISG.ttf".toC, 64, nullptr, 0);

  rl.Core.ImageDrawTextEx(
    parrots,
    font,
    "[Parrots font drawing]".toC,
    rl.Temp.vec21(20.0, 20.0),
    font.baseSize.toDouble(),
    0.0,
    rl.Color.RED
  );

  final texture = rl.Core.LoadTextureFromImage(parrots.ref);
  rl.Core.UnloadImage(parrots.ref);

  final position = rl.Temp.Vector2$.At('position').set(
    screenWidth/2 - texture.width/2,
    screenHeight/2 - texture.height/2 - 20
  );

  bool showFont = false;

  while (!rl.Core.WindowShouldClose())
  {
    showFont = rl.Core.IsKeyDown(KeyboardKey.KEY_SPACE.value);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      if (!showFont)
      {
        rl.Core.DrawTextureV(texture, position.ref, rl.Color.WHITE);

        rl.Core.DrawTextEx(
          font,
          "[Parrots font drawing]".toC,
          rl.Temp.vec21(position.ref.x + 20, position.ref.y + 20 + 280),
          font.baseSize.toDouble(),
          0.0,
          rl.Color.WHITE
        );
      }
      else rl.Core.DrawTexture(
        font.texture,
        (screenWidth/2 - font.texture.width/2).toInt(),
        50,
        rl.Color.BLACK
      );

      rl.Core.DrawText(
        "PRESS SPACE to SHOW FONT ATLAS USED".toC,
        290, 420, 10, rl.Color.DARKGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texture);
  rl.Core.UnloadFont(font);

  rl.CloseWindowAndDispose();
}