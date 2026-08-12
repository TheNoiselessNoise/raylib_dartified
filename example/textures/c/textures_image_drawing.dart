// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_drawing.c
// Run it: dart run textures_image_drawing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_image_drawing".toC);
  SetTargetFPS(60);

  final cat = Image$.val.At('cat');
  cat.ref = LoadImage("../resources/cat.png".toC);
  ImageCrop(cat, Rectangle$.val.$1.set(100, 10, 280, 380));
  ImageFlipHorizontal(cat);
  ImageResize(cat, 150, 200);

  final parrots = Image$.val.At('parrots');
  parrots.ref = LoadImage("../resources/parrots.png".toC);

  ImageDraw(
    parrots, cat.ref,
    Rectangle$.val.$1.set(0, 0, cat.ref.width, cat.ref.height),
    Rectangle$.val.$2.set(30, 40, cat.ref.width*1.5, cat.ref.height*1.5),
    WHITE
  );

  ImageCrop(
    parrots,
    Rectangle$.val.$1.set(0, 50, parrots.ref.width, parrots.ref.height - 100),
  );

  ImageDrawPixel(parrots, 10, 10, RAYWHITE);
  ImageDrawCircleLines(parrots, 10, 10, 5, RAYWHITE);
  ImageDrawRectangle(parrots, 5, 20, 10, 10, RAYWHITE);

  UnloadImage(cat.ref);

  final font = LoadFont("../resources/custom_jupiter_crash.png".toC);

  ImageDrawTextEx(
    parrots, font,
    "PARROTS & CAT".toC,
    Vector2$.val.$1.set(300, 230),
    font.baseSize.toDouble(),
    -2,
    WHITE
  );

  UnloadFont(font);

  final texture = LoadTextureFromImage(parrots.ref);
  UnloadImage(parrots.ref);

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(RAYWHITE);

      int x = (screenWidth/2 - texture.width/2).toInt();
      int y = (screenHeight/2 - texture.height/2 - 40).toInt();

      DrawTexture(texture, x, y, WHITE);
      DrawRectangleLines(x, y, texture.width, texture.height, DARKGRAY);

      DrawText(
        "We are drawing only one texture from various images composed!".toC,
        240, 350, 10, DARKGRAY
      );
      DrawText(
        "Source images have been cropped, scaled, flipped and copied one over the other.".toC,
        190, 370, 10, DARKGRAY
      );

    EndDrawing();
  }

  UnloadTexture(texture);

  CloseWindowAndDispose();
}