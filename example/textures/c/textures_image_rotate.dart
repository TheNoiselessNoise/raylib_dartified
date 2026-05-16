// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_rotate.c
// Run it: dart run textures_image_rotate.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_image_rotate".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final image45 = rl.Temp.Image$.At('image45');
  image45.ref = rl.Core.LoadImage("../resources/raylib_logo.png".toC);
  final image90 = rl.Temp.Image$.At('image90');
  image90.ref = rl.Core.LoadImage("../resources/raylib_logo.png".toC);
  final imageNeg90 = rl.Temp.Image$.At('imageNeg90');
  imageNeg90.ref = rl.Core.LoadImage("../resources/raylib_logo.png".toC);

  rl.Core.ImageRotate(image45, 45);
  rl.Core.ImageRotate(image90, 90);
  rl.Core.ImageRotate(imageNeg90, -90);

  final textures = [
    rl.Core.LoadTextureFromImage(image45.ref),
    rl.Core.LoadTextureFromImage(image90.ref),
    rl.Core.LoadTextureFromImage(imageNeg90.ref),
  ];

  int currentTexture = 0;

  while (!rl.Core.WindowShouldClose())
  {
    if (
      rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value) ||
      rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)
    ) {
      currentTexture = (currentTexture + 1)%textures.length;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawTexture(
        textures[currentTexture],
        (screenWidth/2 - textures[currentTexture].width/2).toInt(),
        (screenHeight/2 - textures[currentTexture].height/2).toInt(),
        rl.Color.WHITE
      );

      rl.Core.DrawText(
        "Press LEFT MOUSE BUTTON to rotate the image clockwise".toC,
        250, 420, 10, rl.Color.DARKGRAY
      );

    rl.Core.EndDrawing();
  }

  textures.forEach(rl.Core.UnloadTexture);

  rl.CloseWindowAndDispose();
}