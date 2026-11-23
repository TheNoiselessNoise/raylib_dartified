// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_loading.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Texture texture;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "textures_image_loading");
    SetTargetFPS(60);

    final image = LoadImage("../resources/raylib_logo.png");
    texture = LoadTextureFromImage(image);
    UnloadImage(image);
  },
  loop: (_) async {
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
  },
  close: (_) {
    UnloadTexture(texture);
    CloseWindow();
  },
);