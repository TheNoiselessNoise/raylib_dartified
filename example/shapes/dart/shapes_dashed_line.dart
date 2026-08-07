// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_dashed_line.c
// Run it: dart run shapes_dashed_line.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_dashed_line");
  SetTargetFPS(60);
  
  // Line Properties
  Vector2D lineStartPosition = .vec2(20.0, 50.0);
  Vector2D lineEndPosition = .vec2(780.0, 400.0);
  double dashLength = 25.0;
  double blankLength = 15.0;

  // Color selection
  List<ColorD> lineColors = [
    .RED, .ORANGE, .GOLD, .GREEN,
    .BLUE, .VIOLET, .PINK, .BLACK
  ];
  int colorIndex = 0;

  while (!WindowShouldClose())
  {
    lineEndPosition = GetMousePosition();

    if (IsKeyDown(.KEY_UP)) dashLength += 1.0;
    if (IsKeyDown(.KEY_DOWN) && dashLength > 1.0) dashLength -= 1.0;

    if (IsKeyDown(.KEY_RIGHT)) blankLength += 1.0;
    if (IsKeyDown(.KEY_LEFT) && blankLength > 1.0) blankLength -= 1.0;

    if (IsKeyPressed(.KEY_C)) colorIndex = (colorIndex + 1)%(lineColors.length);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawLineDashed(lineStartPosition, lineEndPosition, dashLength, blankLength, lineColors[colorIndex]);

      DrawRectangle(5, 5, 265, 95, Fade(.SKYBLUE, 0.5));
      DrawRectangleLines(5, 5, 265, 95, .BLUE);

      DrawText("CONTROLS:", 15, 15, 10, .BLACK);
      DrawText("UP/DOWN: Change Dash Length", 15, 35, 10, .BLACK);
      DrawText("LEFT/RIGHT: Change Space Length", 15, 55, 10, .BLACK);
      DrawText("C: Cycle Color", 15, 75, 10, .BLACK);

      DrawText("Dash: ${dashLength.f0} | Space: ${blankLength.f0}", 15, 115, 10, .DARKGRAY);

      DrawFPS(screenWidth - 80, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}