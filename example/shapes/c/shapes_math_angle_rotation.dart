// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_math_angle_rotation.c
// Run it: dart run shapes_math_angle_rotation.dart
import '../../base_c.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_math_angle_rotation".toC);
  SetTargetFPS(60);

  final center = Vector2$.val.$1.set(screenWidth/2.0, screenHeight/2.0);
  const double lineLength = 150.0;

  List<int> angles = [ 0, 30, 60, 90 ];
  double totalAngle = 0.0;

  while (!WindowShouldClose())
  {
    totalAngle += 1.0;
    if (totalAngle >= 360.0) totalAngle -= 360.0;

    BeginDrawing();
      ClearBackground(WHITE);

      DrawText("Fixed angles + rotating line".toC, 10, 10, 20, LIGHTGRAY);

      for (int i = 0; i < angles.length; i++)
      {
        final rad = angles[i]*rl.DEG2RAD;
        final end = Vector2$.val.$2.set(
          center.x + math.cos(rad)*lineLength,
          center.y + math.sin(rad)*lineLength
        );

        final col = switch (i) {
          0 => GREEN,
          1 => ORANGE,
          2 => BLUE,
          3 => MAGENTA,
          _ => WHITE,
        };

        DrawLineEx(center, end, 5.0, col);

        final textPos = Vector2$.val.$3.set(
          center.x + math.cos(rad)*(lineLength + 20),
          center.y + math.sin(rad)*(lineLength + 20)
        );
        DrawText("${angles[i]}°".toC, textPos.x.toInt(), textPos.y.toInt(), 20, col);
      }

      final animRad = totalAngle*rl.DEG2RAD;
      final animEnd = Vector2$.val.$2.set(
        center.x + math.cos(animRad)*lineLength,
        center.y + math.sin(animRad)*lineLength
      );

      final animCol = ColorFromHSV(totalAngle%360.0, 0.8, 0.9);
      DrawLineEx(center, animEnd, 5.0, animCol);

    EndDrawing();
  }

  CloseWindowAndDispose();
}