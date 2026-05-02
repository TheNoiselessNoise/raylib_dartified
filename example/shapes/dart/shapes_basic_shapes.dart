// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_basic_shapes.c
// Run it: dart run shapes_basic_shapes.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_basic_shapes");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  double rotation = 0.0;

  while (!rl.CoreD.WindowShouldClose())
  {
    rotation += 0.2;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText(
        "some basic shapes available on raylib",
        20, 20, 20, .DARKGRAY
      );

      rl.CoreD.DrawCircle((screenWidth/5).toInt(), 120, 35, .DARKBLUE);
      rl.CoreD.DrawCircleGradient((screenWidth/5).toInt(), 220, 60, .GREEN, .SKYBLUE);
      rl.CoreD.DrawCircleLines((screenWidth/5).toInt(), 340, 80, .DARKBLUE);

      rl.CoreD.DrawRectangle((screenWidth/4 * 2 - 60).toInt(), 100, 120, 60, .RED);
      rl.CoreD.DrawRectangleGradientH((screenWidth/4 * 2 - 90).toInt(), 170, 180, 130, .MAROON, .GOLD);
      rl.CoreD.DrawRectangleLines((screenWidth/4 * 2 - 40).toInt(), 320, 80, 60, .ORANGE);

      rl.CoreD.DrawTriangle(
        .vec2(screenWidth/4.0 * 3.0, 80.0),
        .vec2(screenWidth/4.0 * 3.0 - 60.0, 150.0),
        .vec2(screenWidth/4.0 * 3.0 + 60.0, 150.0),
        .VIOLET
      );

      rl.CoreD.DrawTriangleLines(
        .vec2(screenWidth/4.0 * 3.0, 160.0),
        .vec2(screenWidth/4.0 * 3.0 - 20.0, 230.0),
        .vec2(screenWidth/4.0 * 3.0 + 20.0, 230.0),
        .DARKBLUE
      );

      rl.CoreD.DrawPoly(.vec2(screenWidth/4.0 * 3, 330), 6, 80, rotation, .BROWN);
      rl.CoreD.DrawPolyLines(.vec2(screenWidth/4.0 * 3, 330), 6, 90, rotation, .BROWN);
      rl.CoreD.DrawPolyLinesEx(.vec2(screenWidth/4.0 * 3, 330), 6, 85, rotation, 6, .BEIGE);

      rl.CoreD.DrawLine(18, 42, screenWidth - 18, 42, .BLACK);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}