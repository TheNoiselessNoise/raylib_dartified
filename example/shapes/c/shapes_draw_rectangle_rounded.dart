// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_draw_rectangle_rounded.c
// Run it: dart run shapes_draw_rectangle_rounded.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_draw_rectangle_rounded".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final roundness = rl.Temp.Float$.Value(0.2, 'roundness');
  final width = rl.Temp.Float$.Value(200.0, 'width');
  final height = rl.Temp.Float$.Value(100.0, 'height');
  final segments = rl.Temp.Float$.Value(0.0, 'segments');
  final lineThick = rl.Temp.Float$.Value(1.0, 'lineThick');

  final drawRect = rl.Temp.Bool$.Value(false, 'drawRect');
  final drawRoundedRect = rl.Temp.Bool$.Value(true, 'drawRoundedRect');
  final drawRoundedLines = rl.Temp.Bool$.Value(false, 'drawRoundedLines');

  while (!rl.Core.WindowShouldClose())
  {
    final w = rl.Core.GetScreenWidth(), h = rl.Core.GetScreenHeight();

    final rec = rl.Temp.Rectangle$.At('rec').set(
      (w - width.value - 250)/2, (h - height.value)/2.0,
      width.value, height.value
    );

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.DrawLine(560, 0, 560, h, rl.Core.Fade(rl.C.LIGHTGRAY, 0.6));
      rl.Core.DrawRectangle(560, 0, w - 500, h, rl.Core.Fade(rl.C.LIGHTGRAY, 0.3));

      if (drawRect.value) rl.Core.DrawRectangleRec(
        rec.ref,
        rl.Core.Fade(rl.C.GOLD, 0.6)
      );
      
      if (drawRoundedRect.value) rl.Core.DrawRectangleRounded(
        rec.ref,
        roundness.value,
        segments.value.toInt(),
        rl.Core.Fade(rl.C.MAROON, 0.2)
      );
      
      if (drawRoundedLines.value) rl.Core.DrawRectangleRoundedLinesEx(
        rec.ref,
        roundness.value,
        segments.value.toInt(),
        lineThick.value,
        rl.Core.Fade(rl.C.MAROON, 0.4)
      );

      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(640, 40, 105, 20),
        "Width".toC,
        width.value.f2.toC,
        width, 0, w - 300,
      );

      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(640, 70, 105, 20),
        "Height".toC,
        height.value.f2.toC,
        height, 0, h - 50,
      );

      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(640, 140, 105, 20),
        "Roundness".toC,
        roundness.value.f2.toC,
        roundness, 0.0, 1.0,
      );

      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(640, 170, 105, 20),
        "Thickness".toC,
        lineThick.value.f2.toC,
        lineThick, 0, 20,
      );

      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(640, 240, 105, 20),
        "Segments".toC,
        segments.value.f2.toC,
        segments, 0, 60,
      );


      rl.Gui.GuiCheckBox(
        rl.Temp.rect1(640, 320, 20, 20),
        "DrawRoundedRect".toC,
        drawRoundedRect,
      );

      rl.Gui.GuiCheckBox(
        rl.Temp.rect1(640, 350, 20, 20),
        "DrawRoundedLines".toC,
        drawRoundedLines,
      );

      rl.Gui.GuiCheckBox(
        rl.Temp.rect1(640, 380, 20, 20),
        "DrawRect".toC,
        drawRect,
      );

      rl.Core.DrawText(
        "MODE: ${(segments.value >= 4) ? "MANUAL" : "AUTO"}".toC,
        640, 280, 10, (segments.value >= 4) ? rl.C.MAROON : rl.C.DARKGRAY
      );

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}