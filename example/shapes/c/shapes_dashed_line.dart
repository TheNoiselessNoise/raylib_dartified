// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_dashed_line.c
// Run it: dart run shapes_dashed_line.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_dashed_line".toC);
  SetTargetFPS(60);
  
  // Line Properties
  final lineStartPosition = Vector2$.At('lineStartPosition').set(20.0, 50.0);
  final lineEndPosition = Vector2$.At('lineEndPosition').set(780.0, 400.0);
  double dashLength = 25.0;
  double blankLength = 15.0;

  // Color selection
  List<ColorC> lineColors = [
    RED, ORANGE, GOLD, GREEN,
    BLUE, VIOLET, PINK, BLACK
  ];
  int colorIndex = 0;

  while (!WindowShouldClose())
  {
    lineEndPosition.ref = GetMousePosition();

    if (IsKeyDown(KeyboardKey.KEY_UP.value)) dashLength += 1.0;
    if (IsKeyDown(KeyboardKey.KEY_DOWN.value) && dashLength > 1.0) dashLength -= 1.0;

    if (IsKeyDown(KeyboardKey.KEY_RIGHT.value)) blankLength += 1.0;
    if (IsKeyDown(KeyboardKey.KEY_LEFT.value) && blankLength > 1.0) blankLength -= 1.0;

    if (IsKeyPressed(KeyboardKey.KEY_C.value)) colorIndex = (colorIndex + 1)%(lineColors.length);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawLineDashed(lineStartPosition.ref, lineEndPosition.ref, dashLength.toInt(), blankLength.toInt(), lineColors[colorIndex]);

      DrawRectangle(5, 5, 265, 95, Fade(SKYBLUE, 0.5));
      DrawRectangleLines(5, 5, 265, 95, BLUE);

      DrawText("CONTROLS:".toC, 15, 15, 10, BLACK);
      DrawText("UP/DOWN: Change Dash Length".toC, 15, 35, 10, BLACK);
      DrawText("LEFT/RIGHT: Change Space Length".toC, 15, 55, 10, BLACK);
      DrawText("C: Cycle Color".toC, 15, 75, 10, BLACK);

      DrawText("Dash: ${dashLength.f0} | Space: ${blankLength.f0}".toC, 15, 115, 10, DARKGRAY);

      DrawFPS(screenWidth - 80, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}