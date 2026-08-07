// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_ring_drawing.c
// Run it: dart run shapes_ring_drawing.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_ring_drawing".toC);
  SetTargetFPS(60);

  final center = Vector2$.At('center').set(
    (GetScreenWidth() - 300)/2.0, GetScreenHeight()/2.0
  );

  final innerRadius = Float32$.Value(80.0, 'innerRadius');
  final outerRadius = Float32$.Value(190.0, 'outerRadius');

  final startAngle = Float32$.Value(0.0, 'startAngle');
  final endAngle = Float32$.Value(360.0, 'endAngle');
  final segments = Float32$.Value(0.0, 'segments');

  final drawRing = Bool$.Value(true, 'drawRing');
  final drawRingLines = Bool$.Value(false, 'drawRingLines');
  final drawCircleLines = Bool$.Value(false, 'drawCircleLines');

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawLine(
        500, 0,
        500, GetScreenHeight(),
        Fade(LIGHTGRAY, 0.6)
      );
      
      DrawRectangle(
        500, 0,
        GetScreenWidth() - 500, GetScreenHeight(),
        Fade(LIGHTGRAY, 0.3)
      );

      if (drawRing.value) DrawRing(
        center.ref, innerRadius.value, outerRadius.value,
        startAngle.value, endAngle.value, segments.value.toInt(),
        Fade(MAROON, 0.3)
      );

      if (drawRingLines.value) DrawRingLines(
        center.ref, innerRadius.value, outerRadius.value,
        startAngle.value, endAngle.value, segments.value.toInt(),
        Fade(BLACK, 0.4)
      );

      if (drawCircleLines.value) DrawCircleSectorLines(
        center.ref, outerRadius.value,
        startAngle.value, endAngle.value, segments.value.toInt(),
        Fade(BLACK, 0.4)
      );

      GuiSliderBar(
        Rectangle$.$1.set(600, 40, 120, 20),
        "StartAngle".toC,
        startAngle.value.f2.toC,
        startAngle, -450, 450
      );

      GuiSliderBar(
        Rectangle$.$1.set(600, 70, 120, 20),
        "EndAngle".toC,
        endAngle.value.f2.toC,
        endAngle, -450, 450
      );

      GuiSliderBar(
        Rectangle$.$1.set(600, 140, 120, 20),
        "InnerRadius".toC,
        innerRadius.value.f2.toC,
        innerRadius, 0, 100
      );
      
      GuiSliderBar(
        Rectangle$.$1.set(600, 170, 120, 20),
        "OuterRadius".toC,
        outerRadius.value.f2.toC,
        outerRadius, 0, 200
      );

      GuiSliderBar(
        Rectangle$.$1.set(600, 240, 120, 20),
        "Segments".toC,
        segments.value.f2.toC,
        segments, 0, 100
      );

      GuiCheckBox(
        Rectangle$.$1.set(600, 320, 20, 20),
        "Draw Ring".toC,
        drawRing
      );

      GuiCheckBox(
        Rectangle$.$1.set(600, 350, 20, 20),
        "Draw RingLines".toC,
        drawRingLines
      );

      GuiCheckBox(
        Rectangle$.$1.set(600, 380, 20, 20),
        "Draw CircleLines".toC,
        drawCircleLines
      );

      int minSegments = ((endAngle.value - startAngle.value)/90).ceil();
      DrawText(
        "MODE: ${segments.value >= minSegments ? "MANUAL" : "AUTO"}".toC,
        600, 270, 10, (segments.value >= minSegments) ? MAROON : DARKGRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}