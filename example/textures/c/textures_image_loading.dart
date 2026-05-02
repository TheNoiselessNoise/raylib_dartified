// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_loading.c
// Run it: dart run textures_image_loading.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_image_loading".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final image = rl.Core.LoadImage("../resources/raylib_logo.png".toC);
  final texture = rl.Core.LoadTextureFromImage(image);
  rl.Core.UnloadImage(image);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.DrawTexture(
        texture,
        (screenWidth/2 - texture.width/2).toInt(),
        (screenHeight/2 - texture.height/2).toInt(),
        rl.C.WHITE
      );

      rl.Core.DrawText(
        "this IS a texture loaded from an image!".toC,
        300, 370, 10, rl.C.GRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texture);

  rl.CloseWindowAndDispose();
}