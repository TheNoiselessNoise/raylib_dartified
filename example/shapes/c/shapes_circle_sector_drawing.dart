// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_circle_sector_drawing.c
// Run it: dart run shapes_circle_sector_drawing.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_circle_sector_drawing".toC);
  SetTargetFPS(60);
  
  final center = Vector2$.AtUnique().set(
    (GetScreenWidth() - 300)/2.0,
    GetScreenHeight()/2.0
  );

  final outerRadius = Float32$.Value(180.0, 'outerRadius');
  final startAngle = Float32$.Value(0.0, 'startAngle');
  final endAngle = Float32$.Value(180.0, 'endAngle');
  final segments = Float32$.Value(10.0, 'segments');
  double minSegments = 4;

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawLine(500, 0, 500, GetScreenHeight(), Fade(LIGHTGRAY, 0.6));
      DrawRectangle(500, 0, GetScreenWidth() - 500, GetScreenHeight(), Fade(LIGHTGRAY, 0.3));

      DrawCircleSector(center.ref, outerRadius.value, startAngle.value, endAngle.value, segments.value.toInt(), Fade(MAROON, 0.3));
      DrawCircleSectorLines(center.ref, outerRadius.value, startAngle.value, endAngle.value, segments.value.toInt(), Fade(MAROON, 0.6));

      GuiSliderBar(Rectangle$.$1.set(600, 40, 120, 20), "StartAngle".toC, startAngle.value.f2.toC, startAngle, 0, 720);
      GuiSliderBar(Rectangle$.$1.set(600, 70, 120, 20), "EndAngle".toC, endAngle.value.f2.toC, endAngle, 0, 720);

      GuiSliderBar(Rectangle$.$1.set(600, 140, 120, 20), "Radius".toC, outerRadius.value.f2.toC, outerRadius, 0, 200);
      GuiSliderBar(Rectangle$.$1.set(600, 170, 120, 20), "Segments".toC, segments.value.f2.toC, segments, 0, 100);

      minSegments = ((endAngle.value - startAngle.value)/90).ceilToDouble();
      DrawText(
        "MODE: ${(segments.value >= minSegments)? "MANUAL" : "AUTO"}".toC,
        600, 200, 10, (segments.value >= minSegments)? MAROON : DARKGRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}