// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_drawing.c
// Run it: dart run textures_image_drawing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_image_drawing".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final cat = rl.Temp.Image$.At('cat');
  cat.ref = rl.Core.LoadImage("../resources/cat.png".toC);
  rl.Core.ImageCrop(cat, rl.Temp.rect1(100, 10, 280, 380));
  rl.Core.ImageFlipHorizontal(cat);
  rl.Core.ImageResize(cat, 150, 200);

  final parrots = rl.Temp.Image$.At('parrots');
  parrots.ref = rl.Core.LoadImage("../resources/parrots.png".toC);

  rl.Core.ImageDraw(
    parrots, cat.ref,
    rl.Temp.rect1(0, 0, cat.ref.width, cat.ref.height),
    rl.Temp.rect2(30, 40, cat.ref.width*1.5, cat.ref.height*1.5),
    rl.C.WHITE
  );

  rl.Core.ImageCrop(
    parrots,
    rl.Temp.rect1(0, 50, parrots.ref.width, parrots.ref.height - 100),
  );

  rl.Core.ImageDrawPixel(parrots, 10, 10, rl.C.RAYWHITE);
  rl.Core.ImageDrawCircleLines(parrots, 10, 10, 5, rl.C.RAYWHITE);
  rl.Core.ImageDrawRectangle(parrots, 5, 20, 10, 10, rl.C.RAYWHITE);

  rl.Core.UnloadImage(cat.ref);

  final font = rl.Core.LoadFont("../resources/custom_jupiter_crash.png".toC);

  rl.Core.ImageDrawTextEx(
    parrots, font,
    "PARROTS & CAT".toC,
    rl.Temp.vec21(300, 230),
    font.baseSize.toDouble(),
    -2,
    rl.C.WHITE
  );

  rl.Core.UnloadFont(font);

  final texture = rl.Core.LoadTextureFromImage(parrots.ref);
  rl.Core.UnloadImage(parrots.ref);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      int x = (screenWidth/2 - texture.width/2).toInt();
      int y = (screenHeight/2 - texture.height/2 - 40).toInt();

      rl.Core.DrawTexture(texture, x, y, rl.C.WHITE);
      rl.Core.DrawRectangleLines(x, y, texture.width, texture.height, rl.C.DARKGRAY);

      rl.Core.DrawText(
        "We are drawing only one texture from various images composed!".toC,
        240, 350, 10, rl.C.DARKGRAY
      );
      rl.Core.DrawText(
        "Source images have been cropped, scaled, flipped and copied one over the other.".toC,
        190, 370, 10, rl.C.DARKGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texture);

  rl.CloseWindowAndDispose();
}