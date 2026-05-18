// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_to_image.c
// Run it: dart run textures_to_image.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_to_image".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  var image = rl.Core.LoadImage("../resources/raylib_logo.png".toC);
  var texture = rl.Core.LoadTextureFromImage(image);
  rl.Core.UnloadImage(image);

  image = rl.Core.LoadImageFromTexture(texture);
  rl.Core.UnloadTexture(texture);

  texture = rl.Core.LoadTextureFromImage(image);
  rl.Core.UnloadImage(image);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawTexture(
        texture,
        (screenWidth/2 - texture.width/2).toInt(),
        (screenHeight/2 - texture.height/2).toInt(),
        rl.Color.WHITE
      );

      rl.Core.DrawText(
        "this IS a texture loaded from an image!".toC,
        300, 370, 10, rl.Color.GRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texture);

  rl.CloseWindowAndDispose();
}