// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rlgl_triangle.c
// Run it: dart run shapes_rlgl_triangle.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_rlgl_triangle");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final startingPositions = <Vector2D>[
    .vec2(400, 150),
    .vec2(300, 300),
    .vec2(500, 300),
  ];

  final trianglePositions = [
    startingPositions[0].clone(),
    startingPositions[1].clone(),
    startingPositions[2].clone(),
  ];

  int triangleIndex = -1;
  bool linesMode = false;
  double handleRadius = 8;

  while (!rl.CoreD.WindowShouldClose())
  {
    final mousePos = rl.CoreD.GetMousePosition();

    if (rl.CoreD.IsKeyPressed(.KEY_SPACE)) {
      linesMode = !linesMode;
    }

    for (int i = 0; i < 3; i++) {
      if (
        rl.CoreD.CheckCollisionPointCircle(mousePos, trianglePositions[i], handleRadius) &&
        rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT)
      ) {
        triangleIndex = i;
        break;
      }
    }

    if (triangleIndex != -1) {
      final mouseDelta = rl.CoreD.GetMouseDelta();
      trianglePositions[triangleIndex].x += mouseDelta.x;
      trianglePositions[triangleIndex].y += mouseDelta.y;
    }

    if (rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) {
      triangleIndex = -1;
    }

    if (rl.CoreD.IsKeyPressed(.KEY_LEFT)) {
      rl.RlglD.rlEnableBackfaceCulling();
    }
    if (rl.CoreD.IsKeyPressed(.KEY_RIGHT)) {
      rl.RlglD.rlDisableBackfaceCulling();
    }

    if (rl.CoreD.IsKeyPressed(.KEY_R)) {
      trianglePositions[0] = startingPositions[0].clone();
      trianglePositions[1] = startingPositions[1].clone();
      trianglePositions[2] = startingPositions[2].clone();
      rl.RlglD.rlEnableBackfaceCulling();
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      if (linesMode) {
        rl.RlglD.rlBegin(.RL_LINES);
          rl.RlglD.rlColor4ub(255, 0, 0, 255);

          rl.RlglD.rlVertex2f(trianglePositions[0].x, trianglePositions[0].y);
          rl.RlglD.rlColor4ub(0, 255, 0, 255);
          rl.RlglD.rlVertex2f(trianglePositions[1].x, trianglePositions[1].y);

          rl.RlglD.rlColor4ub(0, 255, 0, 255);
          rl.RlglD.rlVertex2f(trianglePositions[1].x, trianglePositions[1].y);
          rl.RlglD.rlColor4ub(0, 0, 255, 255);
          rl.RlglD.rlVertex2f(trianglePositions[2].x, trianglePositions[2].y);

          rl.RlglD.rlColor4ub(0, 0, 255, 255);
          rl.RlglD.rlVertex2f(trianglePositions[2].x, trianglePositions[2].y);
          rl.RlglD.rlColor4ub(255, 0, 0, 255);
          rl.RlglD.rlVertex2f(trianglePositions[0].x, trianglePositions[0].y);
        rl.RlglD.rlEnd();
      } else {
        rl.RlglD.rlBegin(.RL_TRIANGLES);
          rl.RlglD.rlColor4ub(255, 0, 0, 255);

          rl.RlglD.rlVertex2f(trianglePositions[0].x, trianglePositions[0].y);
          rl.RlglD.rlColor4ub(0, 255, 0, 255);
          rl.RlglD.rlVertex2f(trianglePositions[1].x, trianglePositions[1].y);
          rl.RlglD.rlColor4ub(0, 0, 255, 255);
          rl.RlglD.rlVertex2f(trianglePositions[2].x, trianglePositions[2].y);
        rl.RlglD.rlEnd();
      }

      for (int i = 0; i < 3; i++) {
        if (rl.CoreD.CheckCollisionPointCircle(mousePos, trianglePositions[i], handleRadius)) {
          rl.CoreD.DrawCircleV(
            trianglePositions[i],
            handleRadius,
            rl.CoreD.ColorAlpha(.DARKGRAY, 0.5)
          );
        }

        if (i == triangleIndex) {
          rl.CoreD.DrawCircleV(trianglePositions[i], handleRadius, .DARKGRAY);
        }

        rl.CoreD.DrawCircleLinesV(trianglePositions[i], handleRadius, .BLACK);
      }

      rl.CoreD.DrawText(
        "SPACE: Toggle lines mode",
        10, 10, 20, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "LEFT-RIGHT: Toggle backface culling",
        10, 40, 20, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "MOUSE: Click and drag vertex points",
        10, 70, 20, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "R: Reset triangle to start positions",
        10, 100, 20, .DARKGRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}