// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_ring_drawing.c
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Vector2 center;
double innerRadius = 80.0;
double outerRadius = 190.0;
double startAngle = 0.0;
double endAngle = 360.0;
double segments = 0.0;
bool drawRing = true;
bool drawRingLines = false;
bool drawCircleLines = false;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shapes_ring_drawing");
    SetTargetFPS(60);
    
    center = .vec2((GetScreenWidth() - 300)/2.0, GetScreenHeight()/2.0);
  },
  loop: (_) async {
    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawLine(
        500, 0,
        500, GetScreenHeight(),
        Fade(.LIGHTGRAY, 0.6)
      );
      
      DrawRectangle(
        500, 0,
        GetScreenWidth() - 500, GetScreenHeight(),
        Fade(.LIGHTGRAY, 0.3)
      );

      if (drawRing) DrawRing(
        center, innerRadius, outerRadius,
        startAngle, endAngle, segments,
        Fade(.MAROON, 0.3)
      );

      if (drawRingLines) DrawRingLines(
        center, innerRadius, outerRadius,
        startAngle, endAngle, segments,
        Fade(.BLACK, 0.4)
      );

      if (drawCircleLines) DrawCircleSectorLines(
        center, outerRadius,
        startAngle, endAngle, segments,
        Fade(.BLACK, 0.4)
      );

      {
        final (_, newValue) = GuiSliderBar(
          .rect(600, 40, 120, 20),
          "StartAngle",
          startAngle.f2,
          startAngle, -450, 450
        );
        startAngle = newValue;
      }

      {
        final (_, newValue) = GuiSliderBar(
          .rect(600, 70, 120, 20),
          "EndAngle",
          endAngle.f2,
          endAngle, -450, 450
        );
        endAngle = newValue;
      }

      {
        final (_, newValue) = GuiSliderBar(
          .rect(600, 140, 120, 20),
          "InnerRadius",
          innerRadius.f2,
          innerRadius, 0, 100
        );
        innerRadius = newValue;
      }
      
      {
        final (_, newValue) = GuiSliderBar(
          .rect(600, 170, 120, 20),
          "OuterRadius",
          outerRadius.f2,
          outerRadius, 0, 200
        );
        outerRadius = newValue;
      }

      {
        final (_, newValue) = GuiSliderBar(
          .rect(600, 240, 120, 20),
          "Segments",
          segments.f2,
          segments, 0, 100
        );
        segments = newValue;
      }

      {
        final (_, newValue) = GuiCheckBox(
          .rect(600, 320, 20, 20),
          "Draw Ring",
          drawRing
        );
        drawRing = newValue;
      }

      {
        final (_, newValue) = GuiCheckBox(
          .rect(600, 350, 20, 20),
          "Draw RingLines",
          drawRingLines
        );
        drawRingLines = newValue;
      }

      {
        final (_, newValue) = GuiCheckBox(
          .rect(600, 380, 20, 20),
          "Draw CircleLines",
          drawCircleLines
        );
        drawCircleLines = newValue;
      }

      int minSegments = ((endAngle - startAngle)/90).ceil();
      DrawText(
        "MODE: ${segments >= minSegments ? "MANUAL" : "AUTO"}",
        600, 270, 10, (segments >= minSegments) ? .MAROON : .DARKGRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);