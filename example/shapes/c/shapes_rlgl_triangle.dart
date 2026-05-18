// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rlgl_triangle.c
// Run it: dart run shapes_rlgl_triangle.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_rlgl_triangle".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final startingPositions = rl.Temp.Vector2$.At('startingPositions', 3);
  startingPositions[0].set(400, 150);
  startingPositions[1].set(300, 300);
  startingPositions[2].set(500, 300);

  final trianglePositions = rl.Temp.Vector2$.At('trianglePositions', 3);
  trianglePositions[0].setC(startingPositions[0]);
  trianglePositions[1].setC(startingPositions[1]);
  trianglePositions[2].setC(startingPositions[2]);

  int triangleIndex = -1;
  bool linesMode = false;
  double handleRadius = 8;

  while (!rl.Core.WindowShouldClose())
  {
    final mousePos = rl.Core.GetMousePosition();

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value)) {
      linesMode = !linesMode;
    }

    for (int i = 0; i < 3; i++) {
      if (
        rl.Core.CheckCollisionPointCircle(mousePos, trianglePositions[i], handleRadius) &&
        rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)
      ) {
        triangleIndex = i;
        break;
      }
    }

    if (triangleIndex != -1) {
      final mouseDelta = rl.Core.GetMouseDelta();
      trianglePositions[triangleIndex].x += mouseDelta.x;
      trianglePositions[triangleIndex].y += mouseDelta.y;
    }

    if (rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      triangleIndex = -1;
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value)) {
      rl.Rlgl.rlEnableBackfaceCulling();
    }
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) {
      rl.Rlgl.rlDisableBackfaceCulling();
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_R.value)) {
      trianglePositions[0].setC(startingPositions[0]);
      trianglePositions[1].setC(startingPositions[1]);
      trianglePositions[2].setC(startingPositions[2]);
      rl.Rlgl.rlEnableBackfaceCulling();
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      if (linesMode) {
        rl.Rlgl.rlBegin(RlDrawMode.RL_LINES.value);
          rl.Rlgl.rlColor4ub(255, 0, 0, 255);

          rl.Rlgl.rlVertex2f(trianglePositions[0].x, trianglePositions[0].y);
          rl.Rlgl.rlColor4ub(0, 255, 0, 255);
          rl.Rlgl.rlVertex2f(trianglePositions[1].x, trianglePositions[1].y);

          rl.Rlgl.rlColor4ub(0, 255, 0, 255);
          rl.Rlgl.rlVertex2f(trianglePositions[1].x, trianglePositions[1].y);
          rl.Rlgl.rlColor4ub(0, 0, 255, 255);
          rl.Rlgl.rlVertex2f(trianglePositions[2].x, trianglePositions[2].y);

          rl.Rlgl.rlColor4ub(0, 0, 255, 255);
          rl.Rlgl.rlVertex2f(trianglePositions[2].x, trianglePositions[2].y);
          rl.Rlgl.rlColor4ub(255, 0, 0, 255);
          rl.Rlgl.rlVertex2f(trianglePositions[0].x, trianglePositions[0].y);
        rl.Rlgl.rlEnd();
      } else {
        rl.Rlgl.rlBegin(RlDrawMode.RL_TRIANGLES.value);
          rl.Rlgl.rlColor4ub(255, 0, 0, 255);

          rl.Rlgl.rlVertex2f(trianglePositions[0].x, trianglePositions[0].y);
          rl.Rlgl.rlColor4ub(0, 255, 0, 255);
          rl.Rlgl.rlVertex2f(trianglePositions[1].x, trianglePositions[1].y);
          rl.Rlgl.rlColor4ub(0, 0, 255, 255);
          rl.Rlgl.rlVertex2f(trianglePositions[2].x, trianglePositions[2].y);
        rl.Rlgl.rlEnd();
      }

      for (int i = 0; i < 3; i++) {
        if (rl.Core.CheckCollisionPointCircle(mousePos, trianglePositions[i], handleRadius)) {
          rl.Core.DrawCircleV(
            trianglePositions[i],
            handleRadius,
            rl.Core.ColorAlpha(rl.Color.DARKGRAY, 0.5)
          );
        }

        if (i == triangleIndex) {
          rl.Core.DrawCircleV(trianglePositions[i], handleRadius, rl.Color.DARKGRAY);
        }

        rl.Core.DrawCircleLinesV(trianglePositions[i], handleRadius, rl.Color.BLACK);
      }

      rl.Core.DrawText(
        "SPACE: Toggle lines mode".toC,
        10, 10, 20, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "LEFT-RIGHT: Toggle backface culling".toC,
        10, 40, 20, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "MOUSE: Click and drag vertex points".toC,
        10, 70, 20, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "R: Reset triangle to start positions".toC,
        10, 100, 20, rl.Color.DARKGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}