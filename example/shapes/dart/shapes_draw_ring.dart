// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_draw_ring.c
// Run it: dart run shapes_draw_ring.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_draw_ring");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final Vector2D center = .vec2(
    (rl.CoreD.GetScreenWidth() - 300)/2.0, rl.CoreD.GetScreenHeight()/2.0
  );

  double innerRadius = 80.0;
  double outerRadius = 190.0;

  double startAngle = 0.0;
  double endAngle = 360.0;
  double segments = 0.0;

  bool drawRing = true;
  bool drawRingLines = false;
  bool drawCircleLines = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawLine(
        500, 0,
        500, rl.CoreD.GetScreenHeight(),
        rl.CoreD.Fade(.LIGHTGRAY, 0.6)
      );
      
      rl.CoreD.DrawRectangle(
        500, 0,
        rl.CoreD.GetScreenWidth() - 500, rl.CoreD.GetScreenHeight(),
        rl.CoreD.Fade(.LIGHTGRAY, 0.3)
      );

      if (drawRing) rl.CoreD.DrawRing(
        center, innerRadius, outerRadius,
        startAngle, endAngle, segments,
        rl.CoreD.Fade(.MAROON, 0.3)
      );

      if (drawRingLines) rl.CoreD.DrawRingLines(
        center, innerRadius, outerRadius,
        startAngle, endAngle, segments,
        rl.CoreD.Fade(.BLACK, 0.4)
      );

      if (drawCircleLines) rl.CoreD.DrawCircleSectorLines(
        center, outerRadius,
        startAngle, endAngle, segments,
        rl.CoreD.Fade(.BLACK, 0.4)
      );

      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(600, 40, 120, 20),
          "StartAngle",
          startAngle.f2,
          startAngle, -450, 450
        );
        startAngle = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(600, 70, 120, 20),
          "EndAngle",
          endAngle.f2,
          endAngle, -450, 450
        );
        endAngle = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(600, 140, 120, 20),
          "InnerRadius",
          innerRadius.f2,
          innerRadius, 0, 100
        );
        innerRadius = newValue;
      }
      
      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(600, 170, 120, 20),
          "OuterRadius",
          outerRadius.f2,
          outerRadius, 0, 200
        );
        outerRadius = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(600, 240, 120, 20),
          "Segments",
          segments.f2,
          segments, 0, 100
        );
        segments = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiCheckBox(
          .rect(600, 320, 20, 20),
          "Draw Ring",
          drawRing
        );
        drawRing = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiCheckBox(
          .rect(600, 350, 20, 20),
          "Draw RingLines",
          drawRingLines
        );
        drawRingLines = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiCheckBox(
          .rect(600, 380, 20, 20),
          "Draw CircleLines",
          drawCircleLines
        );
        drawCircleLines = newValue;
      }

      int minSegments = ((endAngle - startAngle)/90).ceil();
      rl.CoreD.DrawText(
        "MODE: ${segments >= minSegments ? "MANUAL" : "AUTO"}",
        600, 270, 10, (segments >= minSegments) ? .MAROON : .DARKGRAY
      );

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}