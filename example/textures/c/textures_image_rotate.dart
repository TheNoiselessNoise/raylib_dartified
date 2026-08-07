// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_rotate.c
// Run it: dart run textures_image_rotate.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_image_rotate".toC);
  SetTargetFPS(60);

  final image45 = Image$.At('image45');
  image45.ref = LoadImage("../resources/raylib_logo.png".toC);
  final image90 = Image$.At('image90');
  image90.ref = LoadImage("../resources/raylib_logo.png".toC);
  final imageNeg90 = Image$.At('imageNeg90');
  imageNeg90.ref = LoadImage("../resources/raylib_logo.png".toC);

  ImageRotate(image45, 45);
  ImageRotate(image90, 90);
  ImageRotate(imageNeg90, -90);

  final textures = [
    LoadTextureFromImage(image45.ref),
    LoadTextureFromImage(image90.ref),
    LoadTextureFromImage(imageNeg90.ref),
  ];

  int currentTexture = 0;

  while (!WindowShouldClose())
  {
    if (
      IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value) ||
      IsKeyPressed(KeyboardKey.KEY_RIGHT.value)
    ) {
      currentTexture = (currentTexture + 1)%textures.length;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTexture(
        textures[currentTexture],
        (screenWidth/2 - textures[currentTexture].width/2).toInt(),
        (screenHeight/2 - textures[currentTexture].height/2).toInt(),
        WHITE
      );

      DrawText(
        "Press LEFT MOUSE BUTTON to rotate the image clockwise".toC,
        250, 420, 10, DARKGRAY
      );

    EndDrawing();
  }

  textures.forEach(UnloadTexture);

  CloseWindowAndDispose();
}