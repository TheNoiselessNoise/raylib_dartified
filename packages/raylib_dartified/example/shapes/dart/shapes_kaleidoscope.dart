// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_kaleidoscope.c
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_DRAW_LINES = 8192;

final class Line {
  Vector2 start = .zero();
  Vector2 end = .zero();
}

late List<Line> lines;
void initLines() => lines = .generate(MAX_DRAW_LINES, (_) => .new());

int symmetry = 6;
double angle = 360.0/symmetry;
double thickness = 3.0;
late Rectangle resetButtonRec;
late Rectangle backButtonRec;
late Rectangle nextButtonRec;
late Vector2 mousePos;
late Vector2 prevMousePos;
late Vector2 scaleVector;
late Vector2 offset;
late Camera2D camera;
int currentLineCounter = 0;
int totalLineCounter = 0;
bool resetButtonClicked = false;
bool backButtonClicked = false;
bool nextButtonClicked = false;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shapes_kaleidoscope");
    SetTargetFPS(60);

    initLines();

    resetButtonRec = .rect(screenWidth - 55.0, 5.0, 50, 25);
    backButtonRec = .rect(screenWidth - 55.0, screenHeight - 30.0, 25, 25);
    nextButtonRec = .rect(screenWidth - 30.0, screenHeight - 30.0, 25, 25);
    mousePos = .zero();
    prevMousePos = .zero();
    scaleVector = .vec2(1.0, -1.0);
    offset = .vec2(screenWidth/2.0, screenHeight/2.0);

    camera = .new(
      target: .vec2(0, 0),
      offset: offset,
      rotation: 0.0,
      zoom: 1.0,
    );
  },
  loop: (_) async {
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
        lineStart = lineStart.rotate(angle*DEG2RAD);
        lineEnd = lineEnd.rotate(angle*DEG2RAD);

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

      backButtonClicked = GuiButton(backButtonRec, "<") > .RESULT_NONE;
      GuiEnable();

      if ((currentLineCounter + 1) > totalLineCounter) GuiDisable();

      nextButtonClicked = GuiButton(nextButtonRec, ">") > .RESULT_NONE;
      GuiEnable();
      resetButtonClicked = GuiButton(resetButtonRec, "Reset") > .RESULT_NONE;

      DrawText("LINES: $currentLineCounter/$MAX_DRAW_LINES", 10, screenHeight - 30, 20, .MAROON);
      DrawFPS(10, 10);

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);