// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_drawing.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "textures_image_drawing");
  SetTargetFPS(60);

  final cat = LoadImage("../resources/cat.png");
  ImageCrop(cat, .rect(100, 10, 280, 380));
  ImageFlipHorizontal(cat);
  ImageResize(cat, 150, 200);

  final parrots = LoadImage("../resources/parrots.png");

  ImageDraw(
    parrots, cat,
    .rect(0, 0, cat.width, cat.height),
    .rect(30, 40, cat.width*1.5, cat.height*1.5),
    .WHITE
  );

  ImageCrop(
    parrots,
    .rect(0, 50, parrots.width, parrots.height - 100)
  );

  ImageDrawPixel(parrots, 10, 10, .RAYWHITE);
  ImageDrawCircleLines(parrots, 10, 10, 5, .RAYWHITE);
  ImageDrawRectangle(parrots, 5, 20, 10, 10, .RAYWHITE);

  UnloadImage(cat);

  final font = LoadFont("../resources/custom_jupiter_crash.png");

  ImageDrawTextEx(
    parrots, font,
    "PARROTS & CAT",
    .vec2(300, 230),
    font.baseSize,
    -2,
    .WHITE
  );

  UnloadFont(font);

  final texture = LoadTextureFromImage(parrots);
  UnloadImage(parrots);

  rl.setMainLoop(() {
    BeginDrawing();

      ClearBackground(.RAYWHITE);

      int x = screenWidth~/2 - texture.width~/2;
      int y = screenHeight~/2 - texture.height~/2 - 40;

      DrawTexture(texture, x, y, .WHITE);
      DrawRectangleLines(x, y, texture.width, texture.height, .DARKGRAY);

      DrawText(
        "We are drawing only one texture from various images composed!",
        240, 350, 10, .DARKGRAY
      );
      DrawText(
        "Source images have been cropped, scaled, flipped and copied one over the other.",
        190, 370, 10, .DARKGRAY
      );

    EndDrawing();
  });
});