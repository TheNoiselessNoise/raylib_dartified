// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_rotate.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "textures_image_rotate");
  SetTargetFPS(60);

  final image45 = LoadImage("../resources/raylib_logo.png");
  final image90 = LoadImage("../resources/raylib_logo.png");
  final imageNeg90 = LoadImage("../resources/raylib_logo.png");

  ImageRotate(image45, 45);
  ImageRotate(image90, 90);
  ImageRotate(imageNeg90, -90);

  final textures = [
    LoadTextureFromImage(image45),
    LoadTextureFromImage(image90),
    LoadTextureFromImage(imageNeg90),
  ];

  int currentTexture = 0;

  rl.setMainLoop(() {
    if (
      IsMouseButtonPressed(.MOUSE_BUTTON_LEFT) ||
      IsKeyPressed(.KEY_RIGHT)
    ) {
      currentTexture = (currentTexture + 1)%textures.length;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTexture(
        textures[currentTexture],
        screenWidth/2 - textures[currentTexture].width/2,
        screenHeight/2 - textures[currentTexture].height/2,
        .WHITE
      );

      DrawText(
        "Press LEFT MOUSE BUTTON to rotate the image clockwise",
        250, 420, 10, .DARKGRAY
      );

    EndDrawing();
  });
});