// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_logo_raylib.c
// Run it: dart run textures_logo_raylib.dart
// WARNING: expects resources from the raylib source
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_logo_raylib".toC);
  SetTargetFPS(60);

  final texture = LoadTexture("../resources/raylib_logo.png".toC);

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTexture(
        texture,
        (screenWidth/2 - texture.width/2).toInt(),
        (screenHeight/2 - texture.height/2).toInt(),
        WHITE
      );

      DrawText(
        "this IS a texture!".toC,
        360, 370, 10, GRAY
      );

    EndDrawing();
  }

  UnloadTexture(texture);

  CloseWindowAndDispose();
}