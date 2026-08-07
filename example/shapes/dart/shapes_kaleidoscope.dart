// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_kaleidoscope.c
// Run it: dart run shapes_kaleidoscope.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_DRAW_LINES = 8192;

class Line {
  Vector2D start = .zero();
  Vector2D end = .zero();
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_kaleidoscope");
  SetTargetFPS(60);

  late List<Line> lines;
  void initLines() => lines = .generate(MAX_DRAW_LINES, (_) => .new());
  initLines();

  int symmetry = 6;
  double angle = 360.0/symmetry;
  double thickness = 3.0;
  final RectangleD resetButtonRec = .rect(screenWidth - 55.0, 5.0, 50, 25);
  final RectangleD backButtonRec = .rect(screenWidth - 55.0, screenHeight - 30.0, 25, 25);
  final RectangleD nextButtonRec = .rect(screenWidth - 30.0, screenHeight - 30.0, 25, 25);
  Vector2D mousePos = .zero();
  Vector2D prevMousePos = .zero();
  final Vector2D scaleVector = .vec2(1.0, -1.0);
  final Vector2D offset = .vec2(screenWidth/2.0, screenHeight/2.0);

  final camera = Camera2DD(
    target: .vec2(0, 0),
    offset: offset,
    rotation: 0.0,
    zoom: 1.0,
  );

  int currentLineCounter = 0;
  int totalLineCounter = 0;
  bool resetButtonClicked = false;
  bool backButtonClicked = false;
  bool nextButtonClicked = false;

  while (!WindowShouldClose())
  {
    prevMousePos = mousePos;
    mousePos = GetMousePosition();

    var lineStart = mousePos.sub(offset);
    var lineEnd = prevMousePos.sub(offset);

    if (
      IsMouseButtonDown(.MOUSE_BUTTON_LEFT)
      && (CheckCollisionPointRec(mousePos, resetButtonRec) == false)
      && (CheckCollisionPointRec(mousePos, backButtonRec) == false)
      && (CheckCollisionPointRec(mousePos, nextButtonRec) == false)
    )
    {
      for (int s = 0; (s < symmetry) && (totalLineCounter < (MAX_DRAW_LINES - 1)); s++)
      {
        lineStart = lineStart.rotate(angle*rl.DEG2RAD);
        lineEnd = lineEnd.rotate(angle*rl.DEG2RAD);

        lines[totalLineCounter].start = lineStart;
        lines[totalLineCounter].end = lineEnd;

        lines[totalLineCounter + 1].start = lineStart.mul(scaleVector);
        lines[totalLineCounter + 1].end = lineEnd.mul(scaleVector);

        totalLineCounter += 2;
        currentLineCounter = totalLineCounter;
      }
    }

    if (resetButtonClicked)
    {
      initLines();
      currentLineCounter = 0;
      totalLineCounter = 0;
    }

    if (backButtonClicked && (currentLineCounter > 0))
    {
      currentLineCounter -= 1;
    }

    if (nextButtonClicked && (currentLineCounter < MAX_DRAW_LINES) && ((currentLineCounter + 1) <= totalLineCounter))
    {
      currentLineCounter += 1;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);
      BeginMode2D(camera);

        for (int s = 0; s < symmetry; s++)
        {
          for (int i = 0; i < currentLineCounter; i += 2)
          {
            DrawLineEx(lines[i].start, lines[i].end, thickness, .BLACK);
            DrawLineEx(lines[i + 1].start, lines[i + 1].end, thickness, .BLACK);
          }
        }

      EndMode2D();

      if ((currentLineCounter - 1) < 0) GuiDisable();

      backButtonClicked = GuiButton(backButtonRec, "<") > 0;
      GuiEnable();

      if ((currentLineCounter + 1) > totalLineCounter) GuiDisable();

      nextButtonClicked = GuiButton(nextButtonRec, ">") > 0;
      GuiEnable();
      resetButtonClicked = GuiButton(resetButtonRec, "Reset") > 0;

      DrawText("LINES: $currentLineCounter/$MAX_DRAW_LINES", 10, screenHeight - 30, 20, .MAROON);
      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}