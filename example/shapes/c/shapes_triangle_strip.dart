// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_triangle_strip.c
// Run it: dart run shapes_triangle_strip.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_triangle_strip".toC);
  SetTargetFPS(60);

  final points = Vector2$.AtUnique(count: 122);
  final center = Vector2$.AtUnique().set((screenWidth/2.0) - 125.0, screenHeight/2.0);
  final segments = Float32$.ValueUnique(6.0);
  double insideRadius = 100.0;
  double outsideRadius = 150.0;
  final outline = Bool$.ValueUnique(true);

  while (!WindowShouldClose())
  {
    final pointCount = segments.value.toInt();
    final angleStep = (360.0/pointCount)*rl.DEG2RAD;

    for (int i = 0, i2 = 0; i < pointCount; i++, i2 += 2)
    {
      final angle1 = i*angleStep;
      points[i2].set(center.ref.x + math.cos(angle1)*insideRadius, center.ref.y + math.sin(angle1)*insideRadius);
      final angle2 = angle1 + angleStep/2.0;
      points[i2 + 1].set(center.ref.x + math.cos(angle2)*outsideRadius, center.ref.y + math.sin(angle2)*outsideRadius);
    }

    points[pointCount*2] = points[0];
    points[pointCount*2 + 1] = points[1];

    BeginDrawing();

      ClearBackground(RAYWHITE);

      for (int i = 0; i < pointCount; i++)
      {
        final a = points[i * 2];
        final b = points[i * 2 + 1];
        final c = points[i * 2 + 2];
        final d = points[i * 2 + 3];

        final angle1 = i * angleStep;
        DrawTriangle(c, b, a, ColorFromHSV(angle1 * rl.RAD2DEG, 1.0, 1.0));
        DrawTriangle(d, b, c, ColorFromHSV((angle1 + angleStep / 2) * rl.RAD2DEG, 1.0, 1.0));

        if (outline.value)
        {
          DrawTriangleLines(a, b, c, BLACK);
          DrawTriangleLines(c, b, d, BLACK);
        }
      }

      DrawLine(580, 0, 580, GetScreenHeight(), Color$.$1.set(218, 218, 218, 255));
      DrawRectangle(580, 0, GetScreenWidth(), GetScreenHeight(), Color$.$1.set(232, 232, 232, 255));

      GuiSliderBar(Rectangle$.$1.set(640, 40, 120, 20), "Segments".toC, segments.value.f0.toC, segments, 6.0, 60.0);
      GuiCheckBox(Rectangle$.$1.set(640, 70, 20, 20), "Outline".toC, outline);

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}