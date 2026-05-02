// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_logo_raylib.c
// Run it: dart run shapes_logo_raylib.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_logo_raylib");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawRectangle(screenWidth/2 - 128, screenHeight/2 - 128, 256, 256, .BLACK);
      rl.CoreD.DrawRectangle(screenWidth/2 - 112, screenHeight/2 - 112, 224, 224, .RAYWHITE);
      rl.CoreD.DrawText("raylib", screenWidth/2 - 44, screenHeight/2 + 48, 50, .BLACK);

      rl.CoreD.DrawText("this is NOT a texture!", 350, 370, 10, .GRAY);

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}