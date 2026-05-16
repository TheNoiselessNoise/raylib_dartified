// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_basic_shapes.c
// Run it: dart run shapes_basic_shapes.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_basic_shapes".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  double rotation = 0.0;

  final v1 = rl.Temp.Vector2$.At('v1');
  final v2 = rl.Temp.Vector2$.At('v2');
  final v3 = rl.Temp.Vector2$.At('v3');

  while (!rl.Core.WindowShouldClose())
  {
    rotation += 0.2;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawText(
        "some basic shapes available on raylib".toC,
        20, 20, 20, rl.Color.DARKGRAY
      );

      rl.Core.DrawCircle((screenWidth/5).toInt(), 120, 35, rl.Color.DARKBLUE);
      rl.Core.DrawCircleGradient((screenWidth/5).toInt(), 220, 60, rl.Color.GREEN, rl.Color.SKYBLUE);
      rl.Core.DrawCircleLines((screenWidth/5).toInt(), 340, 80, rl.Color.DARKBLUE);

      rl.Core.DrawRectangle((screenWidth/4 * 2 - 60).toInt(), 100, 120, 60, rl.Color.RED);
      rl.Core.DrawRectangleGradientH((screenWidth/4 * 2 - 90).toInt(), 170, 180, 130, rl.Color.MAROON, rl.Color.GOLD);
      rl.Core.DrawRectangleLines((screenWidth/4 * 2 - 40).toInt(), 320, 80, 60, rl.Color.ORANGE);

      rl.Core.DrawTriangle(
        v1.set(screenWidth/4.0 * 3.0, 80.0).ref,
        v2.set(screenWidth/4.0 * 3.0 - 60.0, 150.0).ref,
        v3.set(screenWidth/4.0 * 3.0 + 60.0, 150.0).ref,
        rl.Color.VIOLET
      );

      rl.Core.DrawTriangleLines(
        v1.set(screenWidth/4.0 * 3.0, 160.0).ref,
        v2.set(screenWidth/4.0 * 3.0 - 20.0, 230.0).ref,
        v3.set(screenWidth/4.0 * 3.0 + 20.0, 230.0).ref,
        rl.Color.DARKBLUE
      );

      rl.Core.DrawPoly(v1.set(screenWidth/4.0 * 3, 330).ref, 6, 80, rotation, rl.Color.BROWN);
      rl.Core.DrawPolyLines(v1.set(screenWidth/4.0 * 3, 330).ref, 6, 90, rotation, rl.Color.BROWN);
      rl.Core.DrawPolyLinesEx(v1.set(screenWidth/4.0 * 3, 330).ref, 6, 85, rotation, 6, rl.Color.BEIGE);

      rl.Core.DrawLine(18, 42, screenWidth - 18, 42, rl.Color.BLACK);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}