// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_kaleidoscope.c
// Run it: dart run shapes_kaleidoscope.dart
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_DRAW_LINES = 8192;

final class Line extends Struct {
  external Vector2C start;
  external Vector2C end;
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_kaleidoscope".toC);
  SetTargetFPS(60);

  final lines = calloc<Line>(MAX_DRAW_LINES);

  int symmetry = 6;
  double angle = 360.0/symmetry;
  double thickness = 3.0;
  final resetButtonRec = Rectangle$.AtUnique().set(screenWidth - 55.0, 5.0, 50, 25);
  final backButtonRec = Rectangle$.AtUnique().set(screenWidth - 55.0, screenHeight - 30.0, 25, 25);
  final nextButtonRec = Rectangle$.AtUnique().set(screenWidth - 30.0, screenHeight - 30.0, 25, 25);
  final mousePos = Vector2$.AtUnique();
  final prevMousePos = Vector2$.AtUnique();
  final scaleVector = Vector2$.AtUnique().set(1.0, -1.0);
  final offset = Vector2$.AtUnique().set(screenWidth/2.0, screenHeight/2.0);

  final camera = Camera2D$.AtUnique();
  camera.ref.target.set(0, 0);
  camera.ref.offset = offset.ref;
  camera.ref.rotation = 0.0;
  camera.ref.zoom = 1.0;

  int currentLineCounter = 0;
  int totalLineCounter = 0;
  bool resetButtonClicked = false;
  bool backButtonClicked = false;
  bool nextButtonClicked = false;

  while (!WindowShouldClose())
  {
    prevMousePos.ref = mousePos.ref;
    mousePos.ref = GetMousePosition();

    var lineStart = mousePos.toD().sub(offset.toD());
    var lineEnd = prevMousePos.toD().sub(offset.toD());

    if (
      IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)
      && (CheckCollisionPointRec(mousePos.ref, resetButtonRec.ref) == false)
      && (CheckCollisionPointRec(mousePos.ref, backButtonRec.ref) == false)
      && (CheckCollisionPointRec(mousePos.ref, nextButtonRec.ref) == false)
    )
    {
      for (int s = 0; (s < symmetry) && (totalLineCounter < (MAX_DRAW_LINES - 1)); s++)
      {
        lineStart = lineStart.rotate(angle*rl.DEG2RAD);
        lineEnd = lineEnd.rotate(angle*rl.DEG2RAD);

        lines[totalLineCounter].start.setD(lineStart);
        lines[totalLineCounter].end.setD(lineEnd);

        lines[totalLineCounter + 1].start.setD(lineStart.mul(scaleVector.toD()));
        lines[totalLineCounter + 1].end.setD(lineEnd.mul(scaleVector.toD()));

        totalLineCounter += 2;
        currentLineCounter = totalLineCounter;
      }
    }

    if (resetButtonClicked)
    {
      memset(lines.cast(), 0, sizeOf<Line>() * MAX_DRAW_LINES);
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

      ClearBackground(RAYWHITE);
      BeginMode2D(camera.ref);

        for (int s = 0; s < symmetry; s++)
        {
          for (int i = 0; i < currentLineCounter; i += 2)
          {
            DrawLineEx(lines[i].start, lines[i].end, thickness, BLACK);
            DrawLineEx(lines[i + 1].start, lines[i + 1].end, thickness, BLACK);
          }
        }

      EndMode2D();

      if ((currentLineCounter - 1) < 0) GuiDisable();

      backButtonClicked = GuiButton(backButtonRec.ref, "<".toC) > 0;
      GuiEnable();

      if ((currentLineCounter + 1) > totalLineCounter) GuiDisable();

      nextButtonClicked = GuiButton(nextButtonRec.ref, ">".toC) > 0;
      GuiEnable();
      resetButtonClicked = GuiButton(resetButtonRec.ref, "Reset".toC) > 0;

      DrawText("LINES: $currentLineCounter/$MAX_DRAW_LINES".toC, 10, screenHeight - 30, 20, MAROON);
      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}