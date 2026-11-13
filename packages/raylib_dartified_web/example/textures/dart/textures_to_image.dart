// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_to_image.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "textures_to_image");
  SetTargetFPS(60);

  var image = LoadImage("../resources/raylib_logo.png");
  var texture = LoadTextureFromImage(image);
  UnloadImage(image);

  image = LoadImageFromTexture(texture);
  UnloadTexture(texture);

  texture = LoadTextureFromImage(image);
  UnloadImage(image);

  rl.setMainLoop(() {
    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTexture(
        texture,
        screenWidth/2 - texture.width/2,
        screenHeight/2 - texture.height/2,
        .WHITE
      );

      DrawText(
        "this IS a texture loaded from an image!",
        300, 370, 10, .GRAY
      );

    EndDrawing();
  });
});