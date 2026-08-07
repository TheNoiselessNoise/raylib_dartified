// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_basic_shapes.c
// Run it: dart run shapes_basic_shapes.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_basic_shapes".toC);
  SetTargetFPS(60);

  double rotation = 0.0;

  final v1 = Vector2$.At('v1');
  final v2 = Vector2$.At('v2');
  final v3 = Vector2$.At('v3');

  while (!WindowShouldClose())
  {
    rotation += 0.2;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText(
        "some basic shapes available on raylib".toC,
        20, 20, 20, DARKGRAY
      );

      DrawCircle((screenWidth/5).toInt(), 120, 35, DARKBLUE);
      DrawCircleGradient(v1.set(screenWidth/5, 220).ref, 60, GREEN, SKYBLUE);
      DrawCircleLines((screenWidth/5).toInt(), 340, 80, DARKBLUE);

      DrawRectangle((screenWidth/4 * 2 - 60).toInt(), 100, 120, 60, RED);
      DrawRectangleGradientH((screenWidth/4 * 2 - 90).toInt(), 170, 180, 130, MAROON, GOLD);
      DrawRectangleLines((screenWidth/4 * 2 - 40).toInt(), 320, 80, 60, ORANGE);

      DrawTriangle(
        v1.set(screenWidth/4.0 * 3.0, 80.0).ref,
        v2.set(screenWidth/4.0 * 3.0 - 60.0, 150.0).ref,
        v3.set(screenWidth/4.0 * 3.0 + 60.0, 150.0).ref,
        VIOLET
      );

      DrawTriangleLines(
        v1.set(screenWidth/4.0 * 3.0, 160.0).ref,
        v2.set(screenWidth/4.0 * 3.0 - 20.0, 230.0).ref,
        v3.set(screenWidth/4.0 * 3.0 + 20.0, 230.0).ref,
        DARKBLUE
      );

      DrawPoly(v1.set(screenWidth/4.0 * 3, 330).ref, 6, 80, rotation, BROWN);
      DrawPolyLines(v1.set(screenWidth/4.0 * 3, 330).ref, 6, 90, rotation, BROWN);
      DrawPolyLinesEx(v1.set(screenWidth/4.0 * 3, 330).ref, 6, 85, rotation, 6, BEIGE);

      DrawLine(18, 42, screenWidth - 18, 42, BLACK);

    EndDrawing();
  }

  CloseWindowAndDispose();
}