// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_logo_raylib.c
// Run it: dart run shapes_logo_raylib.dart
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_logo_raylib".toC);
  SetTargetFPS(60);

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawRectangle((screenWidth/2 - 128).toInt(), (screenHeight/2 - 128).toInt(), 256, 256, BLACK);
      DrawRectangle((screenWidth/2 - 112).toInt(), (screenHeight/2 - 112).toInt(), 224, 224, RAYWHITE);
      DrawText("raylib".toC, (screenWidth/2 - 44).toInt(), (screenHeight/2 + 48).toInt(), 50, BLACK);

      DrawText("this is NOT a texture!".toC, 350, 370, 10, GRAY);

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}