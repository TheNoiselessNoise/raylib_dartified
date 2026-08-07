// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_triangle_strip.c
// Run it: dart run shapes_triangle_strip.dart
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_triangle_strip");
  SetTargetFPS(60);

  final List<Vector2D> points = .generate(122, (_) => .zero());
  final Vector2D center = .vec2((screenWidth/2.0) - 125.0, screenHeight/2.0);
  double segments = 6.0;
  double insideRadius = 100.0;
  double outsideRadius = 150.0;
  bool outline = true;

  while (!WindowShouldClose())
  {
    final pointCount = segments.toInt();
    final angleStep = (360.0/pointCount)*rl.DEG2RAD;

    for (int i = 0, i2 = 0; i < pointCount; i++, i2 += 2)
    {
      final angle1 = i*angleStep;
      points[i2].set(center.x + math.cos(angle1)*insideRadius, center.y + math.sin(angle1)*insideRadius);
      final angle2 = angle1 + angleStep/2.0;
      points[i2 + 1].set(center.x + math.cos(angle2)*outsideRadius, center.y + math.sin(angle2)*outsideRadius);
    }

    points[pointCount*2] = points[0].copy();
    points[pointCount*2 + 1] = points[1].copy();

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      for (int i = 0; i < pointCount; i++)
      {
        final a = points[i * 2];
        final b = points[i * 2 + 1];
        final c = points[i * 2 + 2];
        final d = points[i * 2 + 3];

        final angle1 = i * angleStep;
        DrawTriangle(c, b, a, ColorFromHSV(angle1 * rl.RAD2DEG, 1.0, 1.0));
        DrawTriangle(d, b, c, ColorFromHSV((angle1 + angleStep / 2) * rl.RAD2DEG, 1.0, 1.0));

        if (outline)
        {
          DrawTriangleLines(a, b, c, .BLACK);
          DrawTriangleLines(c, b, d, .BLACK);
        }
      }

      DrawLine(580, 0, 580, GetScreenHeight(), .color(218, 218, 218, 255));
      DrawRectangle(580, 0, GetScreenWidth(), GetScreenHeight(), .color(232, 232, 232, 255));

      (_, segments) = GuiSliderBar(.rect(640, 40, 120, 20), "Segments", segments.f0, segments, 6.0, 60.0);
      (_, outline) = GuiCheckBox(.rect(640, 70, 20, 20), "Outline", outline);

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}