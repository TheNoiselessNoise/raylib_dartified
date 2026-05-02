// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_draw_ring.c
// Run it: dart run shapes_draw_ring.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_draw_ring".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final center = rl.Temp.Vector2$.At('center').set(
    (rl.Core.GetScreenWidth() - 300)/2.0, rl.Core.GetScreenHeight()/2.0
  );

  final innerRadius = rl.Temp.Float$.Value(80.0, 'innerRadius');
  final outerRadius = rl.Temp.Float$.Value(190.0, 'outerRadius');

  final startAngle = rl.Temp.Float$.Value(0.0, 'startAngle');
  final endAngle = rl.Temp.Float$.Value(360.0, 'endAngle');
  final segments = rl.Temp.Float$.Value(0.0, 'segments');

  final drawRing = rl.Temp.Bool$.Value(true, 'drawRing');
  final drawRingLines = rl.Temp.Bool$.Value(false, 'drawRingLines');
  final drawCircleLines = rl.Temp.Bool$.Value(false, 'drawCircleLines');

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.DrawLine(
        500, 0,
        500, rl.Core.GetScreenHeight(),
        rl.Core.Fade(rl.C.LIGHTGRAY, 0.6)
      );
      
      rl.Core.DrawRectangle(
        500, 0,
        rl.Core.GetScreenWidth() - 500, rl.Core.GetScreenHeight(),
        rl.Core.Fade(rl.C.LIGHTGRAY, 0.3)
      );

      if (drawRing.value) rl.Core.DrawRing(
        center.ref, innerRadius.value, outerRadius.value,
        startAngle.value, endAngle.value, segments.value.toInt(),
        rl.Core.Fade(rl.C.MAROON, 0.3)
      );

      if (drawRingLines.value) rl.Core.DrawRingLines(
        center.ref, innerRadius.value, outerRadius.value,
        startAngle.value, endAngle.value, segments.value.toInt(),
        rl.Core.Fade(rl.C.BLACK, 0.4)
      );

      if (drawCircleLines.value) rl.Core.DrawCircleSectorLines(
        center.ref, outerRadius.value,
        startAngle.value, endAngle.value, segments.value.toInt(),
        rl.Core.Fade(rl.C.BLACK, 0.4)
      );

      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(600, 40, 120, 20),
        "StartAngle".toC,
        startAngle.value.f2.toC,
        startAngle, -450, 450
      );

      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(600, 70, 120, 20),
        "EndAngle".toC,
        endAngle.value.f2.toC,
        endAngle, -450, 450
      );

      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(600, 140, 120, 20),
        "InnerRadius".toC,
        innerRadius.value.f2.toC,
        innerRadius, 0, 100
      );
      
      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(600, 170, 120, 20),
        "OuterRadius".toC,
        outerRadius.value.f2.toC,
        outerRadius, 0, 200
      );

      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(600, 240, 120, 20),
        "Segments".toC,
        segments.value.f2.toC,
        segments, 0, 100
      );

      rl.Gui.GuiCheckBox(
        rl.Temp.rect1(600, 320, 20, 20),
        "Draw Ring".toC,
        drawRing
      );

      rl.Gui.GuiCheckBox(
        rl.Temp.rect1(600, 350, 20, 20),
        "Draw RingLines".toC,
        drawRingLines
      );

      rl.Gui.GuiCheckBox(
        rl.Temp.rect1(600, 380, 20, 20),
        "Draw CircleLines".toC,
        drawCircleLines
      );

      int minSegments = ((endAngle.value - startAngle.value)/90).ceil();
      rl.Core.DrawText(
        "MODE: ${segments.value >= minSegments ? "MANUAL" : "AUTO"}".toC,
        600, 270, 10, (segments.value >= minSegments) ? rl.C.MAROON : rl.C.DARKGRAY
      );

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}