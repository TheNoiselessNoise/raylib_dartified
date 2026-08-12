// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rlgl_triangle.c
// Run it: dart run shapes_rlgl_triangle.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shapes_rlgl_triangle".toC);
  SetTargetFPS(60);

  final startingPositions = Vector2$.val.At('startingPositions', 3);
  startingPositions[0].set(400, 150);
  startingPositions[1].set(300, 300);
  startingPositions[2].set(500, 300);

  final trianglePositions = Vector2$.val.At('trianglePositions', 3);
  trianglePositions[0].setC(startingPositions[0]);
  trianglePositions[1].setC(startingPositions[1]);
  trianglePositions[2].setC(startingPositions[2]);

  int triangleIndex = -1;
  bool linesMode = false;
  double handleRadius = 8;

  while (!WindowShouldClose())
  {
    final mousePos = GetMousePosition();

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) {
      linesMode = !linesMode;
    }

    for (int i = 0; i < 3; i++) {
      if (
        CheckCollisionPointCircle(mousePos, trianglePositions[i], handleRadius) &&
        IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)
      ) {
        triangleIndex = i;
        break;
      }
    }

    if (triangleIndex != -1) {
      final mouseDelta = GetMouseDelta();
      trianglePositions[triangleIndex].x += mouseDelta.x;
      trianglePositions[triangleIndex].y += mouseDelta.y;
    }

    if (IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      triangleIndex = -1;
    }

    if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) {
      rlEnableBackfaceCulling();
    }
    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) {
      rlDisableBackfaceCulling();
    }

    if (IsKeyPressed(KeyboardKey.KEY_R.value)) {
      trianglePositions[0].setC(startingPositions[0]);
      trianglePositions[1].setC(startingPositions[1]);
      trianglePositions[2].setC(startingPositions[2]);
      rlEnableBackfaceCulling();
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (linesMode) {
        rlBegin(RlDrawMode.RL_LINES.value);
          rlColor4ub(255, 0, 0, 255);

          rlVertex2f(trianglePositions[0].x, trianglePositions[0].y);
          rlColor4ub(0, 255, 0, 255);
          rlVertex2f(trianglePositions[1].x, trianglePositions[1].y);

          rlColor4ub(0, 255, 0, 255);
          rlVertex2f(trianglePositions[1].x, trianglePositions[1].y);
          rlColor4ub(0, 0, 255, 255);
          rlVertex2f(trianglePositions[2].x, trianglePositions[2].y);

          rlColor4ub(0, 0, 255, 255);
          rlVertex2f(trianglePositions[2].x, trianglePositions[2].y);
          rlColor4ub(255, 0, 0, 255);
          rlVertex2f(trianglePositions[0].x, trianglePositions[0].y);
        rlEnd();
      } else {
        rlBegin(RlDrawMode.RL_TRIANGLES.value);
          rlColor4ub(255, 0, 0, 255);

          rlVertex2f(trianglePositions[0].x, trianglePositions[0].y);
          rlColor4ub(0, 255, 0, 255);
          rlVertex2f(trianglePositions[1].x, trianglePositions[1].y);
          rlColor4ub(0, 0, 255, 255);
          rlVertex2f(trianglePositions[2].x, trianglePositions[2].y);
        rlEnd();
      }

      for (int i = 0; i < 3; i++) {
        if (CheckCollisionPointCircle(mousePos, trianglePositions[i], handleRadius)) {
          DrawCircleV(
            trianglePositions[i],
            handleRadius,
            ColorAlpha(DARKGRAY, 0.5)
          );
        }

        if (i == triangleIndex) {
          DrawCircleV(trianglePositions[i], handleRadius, DARKGRAY);
        }

        DrawCircleLinesV(trianglePositions[i], handleRadius, BLACK);
      }

      DrawText(
        "SPACE: Toggle lines mode".toC,
        10, 10, 20, DARKGRAY
      );
      DrawText(
        "LEFT-RIGHT: Toggle backface culling".toC,
        10, 40, 20, DARKGRAY
      );
      DrawText(
        "MOUSE: Click and drag vertex points".toC,
        10, 70, 20, DARKGRAY
      );
      DrawText(
        "R: Reset triangle to start positions".toC,
        10, 100, 20, DARKGRAY
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}