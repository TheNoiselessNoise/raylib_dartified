// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rounded_rectangle_drawing.c
// Run it: dart run shapes_rounded_rectangle_drawing.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_rounded_rectangle_drawing".toC);
  SetTargetFPS(60);

  final roundness = Float32$.Value(0.2, 'roundness');
  final width = Float32$.Value(200.0, 'width');
  final height = Float32$.Value(100.0, 'height');
  final segments = Float32$.Value(0.0, 'segments');
  final lineThick = Float32$.Value(1.0, 'lineThick');

  final drawRect = Bool$.Value(false, 'drawRect');
  final drawRoundedRect = Bool$.Value(true, 'drawRoundedRect');
  final drawRoundedLines = Bool$.Value(false, 'drawRoundedLines');

  while (!WindowShouldClose())
  {
    final w = GetScreenWidth(), h = GetScreenHeight();

    final rec = Rectangle$.At('rec').set(
      (w - width.value - 250)/2, (h - height.value)/2.0,
      width.value, height.value
    );

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawLine(560, 0, 560, h, Fade(LIGHTGRAY, 0.6));
      DrawRectangle(560, 0, w - 500, h, Fade(LIGHTGRAY, 0.3));

      if (drawRect.value) DrawRectangleRec(
        rec.ref,
        Fade(GOLD, 0.6)
      );
      
      if (drawRoundedRect.value) DrawRectangleRounded(
        rec.ref,
        roundness.value,
        segments.value.toInt(),
        Fade(MAROON, 0.2)
      );
      
      if (drawRoundedLines.value) DrawRectangleRoundedLinesEx(
        rec.ref,
        roundness.value,
        segments.value.toInt(),
        lineThick.value,
        Fade(MAROON, 0.4)
      );

      GuiSliderBar(
        Rectangle$.$1.set(640, 40, 105, 20),
        "Width".toC,
        width.value.f2.toC,
        width, 0, w - 300,
      );

      GuiSliderBar(
        Rectangle$.$1.set(640, 70, 105, 20),
        "Height".toC,
        height.value.f2.toC,
        height, 0, h - 50,
      );

      GuiSliderBar(
        Rectangle$.$1.set(640, 140, 105, 20),
        "Roundness".toC,
        roundness.value.f2.toC,
        roundness, 0.0, 1.0,
      );

      GuiSliderBar(
        Rectangle$.$1.set(640, 170, 105, 20),
        "Thickness".toC,
        lineThick.value.f2.toC,
        lineThick, 0, 20,
      );

      GuiSliderBar(
        Rectangle$.$1.set(640, 240, 105, 20),
        "Segments".toC,
        segments.value.f2.toC,
        segments, 0, 60,
      );


      GuiCheckBox(
        Rectangle$.$1.set(640, 320, 20, 20),
        "DrawRoundedRect".toC,
        drawRoundedRect,
      );

      GuiCheckBox(
        Rectangle$.$1.set(640, 350, 20, 20),
        "DrawRoundedLines".toC,
        drawRoundedLines,
      );

      GuiCheckBox(
        Rectangle$.$1.set(640, 380, 20, 20),
        "DrawRect".toC,
        drawRect,
      );

      DrawText(
        "MODE: ${(segments.value >= 4) ? "MANUAL" : "AUTO"}".toC,
        640, 280, 10, (segments.value >= 4) ? MAROON : DARKGRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}