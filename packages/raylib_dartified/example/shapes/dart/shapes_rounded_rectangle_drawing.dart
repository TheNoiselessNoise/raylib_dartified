// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rounded_rectangle_drawing.c
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

double roundness = 0.2;
double width = 200.0;
double height = 100.0;
double segments = 0.0;
double lineThick = 1.0;
bool drawRect = false;
bool drawRoundedRect = true;
bool drawRoundedLines = false;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shapes_rounded_rectangle_drawing");
    SetTargetFPS(60);
  },
  loop: (_) async {
    final w = GetScreenWidth(), h = GetScreenHeight();

    final Rectangle rec = .rect(
      (w - width - 250)/2, (h - height)/2.0,
      width, height
    );

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawLine(560, 0, 560, h, Fade(.LIGHTGRAY, 0.6));
      DrawRectangle(560, 0, w - 500, h, Fade(.LIGHTGRAY, 0.3));

      if (drawRect) DrawRectangleRec(
        rec,
        Fade(.GOLD, 0.6)
      );
      
      if (drawRoundedRect) DrawRectangleRounded(
        rec,
        roundness,
        segments,
        Fade(.MAROON, 0.2)
      );
      
      if (drawRoundedLines) DrawRectangleRoundedLinesEx(
        rec,
        roundness,
        segments,
        lineThick,
        Fade(.MAROON, 0.4)
      );

      {
        final (_, newValue) = GuiSliderBar(
          .rect(640, 40, 105, 20),
          "Width", width.f2,
          width, 0, w - 300,
        );
        width = newValue;
      }

      {
        final (_, newValue) = GuiSliderBar(
          .rect(640, 70, 105, 20),
          "Height", height.f2,
          height, 0, h - 50,
        );
        height = newValue;
      }

      {
        final (_, newValue) = GuiSliderBar(
          .rect(640, 140, 105, 20),
          "Roundness", roundness.f2,
          roundness, 0.0, 1.0,
        );
        roundness = newValue;
      }

      {
        final (_, newValue) = GuiSliderBar(
          .rect(640, 170, 105, 20),
          "Thickness", lineThick.f2,
          lineThick, 0, 20,
        );
        lineThick = newValue;
      }

      {
        final (_, newValue) = GuiSliderBar(
          .rect(640, 240, 105, 20),
          "Segments", segments.f2,
          segments, 0, 60,
        );
        segments = newValue;
      }

      {
        final (_, newValue) = GuiCheckBox(
          .rect(640, 320, 20, 20),
          "DrawRoundedRect", drawRoundedRect,
        );
        drawRoundedRect = newValue;
      }

      {
        final (_, newValue) = GuiCheckBox(
          .rect(640, 350, 20, 20),
          "DrawRoundedLines", drawRoundedLines,
        );
        drawRoundedLines = newValue;
      }

      {
        final (_, newValue) = GuiCheckBox(
          .rect(640, 380, 20, 20),
          "DrawRect", drawRect,
        );
        drawRect = newValue;
      }

      DrawText(
        "MODE: ${(segments >= 4) ? "MANUAL" : "AUTO"}",
        640, 280, 10, (segments >= 4) ? .MAROON : .DARKGRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);