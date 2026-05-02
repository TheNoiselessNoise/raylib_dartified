// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_rotate.c
// Run it: dart run textures_image_rotate.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_image_rotate");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final image45 = rl.CoreD.LoadImage("../resources/raylib_logo.png");
  final image90 = rl.CoreD.LoadImage("../resources/raylib_logo.png");
  final imageNeg90 = rl.CoreD.LoadImage("../resources/raylib_logo.png");

  rl.CoreD.ImageRotate(image45, 45);
  rl.CoreD.ImageRotate(image90, 90);
  rl.CoreD.ImageRotate(imageNeg90, -90);

  final textures = [
    rl.CoreD.LoadTextureFromImage(image45),
    rl.CoreD.LoadTextureFromImage(image90),
    rl.CoreD.LoadTextureFromImage(imageNeg90),
  ];

  int currentTexture = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (
      rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT) ||
      rl.CoreD.IsKeyPressed(.KEY_RIGHT)
    ) {
      currentTexture = (currentTexture + 1)%textures.length;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawTexture(
        textures[currentTexture],
        screenWidth/2 - textures[currentTexture].width/2,
        screenHeight/2 - textures[currentTexture].height/2,
        .WHITE
      );

      rl.CoreD.DrawText(
        "Press LEFT MOUSE BUTTON to rotate the image clockwise",
        250, 420, 10, .DARKGRAY
      );

    rl.CoreD.EndDrawing();
  }

  textures.forEach(rl.CoreD.UnloadTexture);

  rl.CloseWindowAndDispose();
}