// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_draw_rectangle_rounded.c
// Run it: dart run shapes_draw_rectangle_rounded.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_draw_rectangle_rounded");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  double roundness = 0.2;
  double width = 200.0;
  double height = 100.0;
  double segments = 0.0;
  double lineThick = 1.0;

  bool drawRect = false;
  bool drawRoundedRect = true;
  bool drawRoundedLines = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    final w = rl.CoreD.GetScreenWidth(), h = rl.CoreD.GetScreenHeight();

    final RectangleD rec = .rect(
      (w - width - 250)/2, (h - height)/2.0,
      width, height
    );

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawLine(560, 0, 560, h, rl.CoreD.Fade(.LIGHTGRAY, 0.6));
      rl.CoreD.DrawRectangle(560, 0, w - 500, h, rl.CoreD.Fade(.LIGHTGRAY, 0.3));

      if (drawRect) rl.CoreD.DrawRectangleRec(
        rec,
        rl.CoreD.Fade(.GOLD, 0.6)
      );
      
      if (drawRoundedRect) rl.CoreD.DrawRectangleRounded(
        rec,
        roundness,
        segments,
        rl.CoreD.Fade(.MAROON, 0.2)
      );
      
      if (drawRoundedLines) rl.CoreD.DrawRectangleRoundedLinesEx(
        rec,
        roundness,
        segments,
        lineThick,
        rl.CoreD.Fade(.MAROON, 0.4)
      );

      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(640, 40, 105, 20),
          "Width", width.f2,
          width, 0, w - 300,
        );
        width = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(640, 70, 105, 20),
          "Height", height.f2,
          height, 0, h - 50,
        );
        height = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(640, 140, 105, 20),
          "Roundness", roundness.f2,
          roundness, 0.0, 1.0,
        );
        roundness = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(640, 170, 105, 20),
          "Thickness", lineThick.f2,
          lineThick, 0, 20,
        );
        lineThick = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(640, 240, 105, 20),
          "Segments", segments.f2,
          segments, 0, 60,
        );
        segments = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiCheckBox(
          .rect(640, 320, 20, 20),
          "DrawRoundedRect", drawRoundedRect,
        );
        drawRoundedRect = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiCheckBox(
          .rect(640, 350, 20, 20),
          "DrawRoundedLines", drawRoundedLines,
        );
        drawRoundedLines = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiCheckBox(
          .rect(640, 380, 20, 20),
          "DrawRect", drawRect,
        );
        drawRect = newValue;
      }

      rl.CoreD.DrawText(
        "MODE: ${(segments >= 4) ? "MANUAL" : "AUTO"}",
        640, 280, 10, (segments >= 4) ? .MAROON : .DARKGRAY
      );

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}