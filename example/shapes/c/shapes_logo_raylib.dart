// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_logo_raylib.c
// Run it: dart run shapes_logo_raylib.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_logo_raylib".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawRectangle((screenWidth/2 - 128).toInt(), (screenHeight/2 - 128).toInt(), 256, 256, rl.Color.BLACK);
      rl.Core.DrawRectangle((screenWidth/2 - 112).toInt(), (screenHeight/2 - 112).toInt(), 224, 224, rl.Color.RAYWHITE);
      rl.Core.DrawText("raylib".toC, (screenWidth/2 - 44).toInt(), (screenHeight/2 + 48).toInt(), 50, rl.Color.BLACK);

      rl.Core.DrawText("this is NOT a texture!".toC, 350, 370, 10, rl.Color.GRAY);

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}