// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rounded_rectangle_drawing.c
// Run it: dart run shapes_rounded_rectangle_drawing.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_rounded_rectangle_drawing");
  SetTargetFPS(60);

  double roundness = 0.2;
  double width = 200.0;
  double height = 100.0;
  double segments = 0.0;
  double lineThick = 1.0;

  bool drawRect = false;
  bool drawRoundedRect = true;
  bool drawRoundedLines = false;

  while (!WindowShouldClose())
  {
    final w = GetScreenWidth(), h = GetScreenHeight();

    final RectangleD rec = .rect(
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

      (_, width) = GuiSliderBar(
        .rect(640, 40, 105, 20),
        "Width", width.f2,
        width, 0, w - 300,
      );

      (_, height) = GuiSliderBar(
        .rect(640, 70, 105, 20),
        "Height", height.f2,
        height, 0, h - 50,
      );

      (_, roundness) = GuiSliderBar(
        .rect(640, 140, 105, 20),
        "Roundness", roundness.f2,
        roundness, 0.0, 1.0,
      );

      (_, lineThick) = GuiSliderBar(
        .rect(640, 170, 105, 20),
        "Thickness", lineThick.f2,
        lineThick, 0, 20,
      );

      (_, segments) = GuiSliderBar(
        .rect(640, 240, 105, 20),
        "Segments", segments.f2,
        segments, 0, 60,
      );

      (_, drawRoundedRect) = GuiCheckBox(
        .rect(640, 320, 20, 20),
        "DrawRoundedRect", drawRoundedRect,
      );

      (_, drawRoundedLines) = GuiCheckBox(
        .rect(640, 350, 20, 20),
        "DrawRoundedLines", drawRoundedLines,
      );

      (_, drawRect) = GuiCheckBox(
        .rect(640, 380, 20, 20),
        "DrawRect", drawRect,
      );

      DrawText(
        "MODE: ${(segments >= 4) ? "MANUAL" : "AUTO"}",
        640, 280, 10, (segments >= 4) ? .MAROON : .DARKGRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}