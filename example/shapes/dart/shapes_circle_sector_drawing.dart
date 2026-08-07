// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_circle_sector_drawing.c
// Run it: dart run shapes_circle_sector_drawing.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_circle_sector_drawing");
  SetTargetFPS(60);
  
  final Vector2D center = .vec2(
    (GetScreenWidth() - 300)/2.0,
    GetScreenHeight()/2.0
  );

  double outerRadius = 180.0;
  double startAngle = 0.0;
  double endAngle = 180.0;
  double segments = 10.0;
  double minSegments = 4;

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawLine(500, 0, 500, GetScreenHeight(), Fade(.LIGHTGRAY, 0.6));
      DrawRectangle(500, 0, GetScreenWidth() - 500, GetScreenHeight(), Fade(.LIGHTGRAY, 0.3));

      DrawCircleSector(center, outerRadius, startAngle, endAngle, segments.toInt(), Fade(.MAROON, 0.3));
      DrawCircleSectorLines(center, outerRadius, startAngle, endAngle, segments.toInt(), Fade(.MAROON, 0.6));

      {
        final (_, newValue) = GuiSliderBar(.rect(600, 40, 120, 20), "StartAngle", startAngle.f2, startAngle, 0, 720);
        startAngle = newValue;
      }
      {
        final (_, newValue) = GuiSliderBar(.rect(600, 70, 120, 20), "EndAngle", endAngle.f2, endAngle, 0, 720);
        endAngle = newValue;
      }
      {
        final (_, newValue) = GuiSliderBar(.rect(600, 140, 120, 20), "Radius", outerRadius.f2, outerRadius, 0, 200);
        outerRadius = newValue;
      }
      {
        final (_, newValue) = GuiSliderBar(.rect(600, 170, 120, 20), "Segments", segments.f2, segments, 0, 100);
        segments = newValue;
      }

      minSegments = ((endAngle - startAngle)/90).ceilToDouble();
      DrawText(
        "MODE: ${(segments >= minSegments)? "MANUAL" : "AUTO"}",
        600, 200, 10, (segments >= minSegments)? .MAROON : .DARKGRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}