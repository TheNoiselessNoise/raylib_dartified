// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rlgl_triangle.c
// Run it: dart run shapes_rlgl_triangle.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shapes_rlgl_triangle");
  SetTargetFPS(60);

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

  while (!WindowShouldClose())
  {
    final mousePos = GetMousePosition();

    if (IsKeyPressed(.KEY_SPACE)) {
      linesMode = !linesMode;
    }

    for (int i = 0; i < 3; i++) {
      if (
        CheckCollisionPointCircle(mousePos, trianglePositions[i], handleRadius) &&
        IsMouseButtonDown(.MOUSE_BUTTON_LEFT)
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

    if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) {
      triangleIndex = -1;
    }

    if (IsKeyPressed(.KEY_LEFT)) {
      rlEnableBackfaceCulling();
    }
    if (IsKeyPressed(.KEY_RIGHT)) {
      rlDisableBackfaceCulling();
    }

    if (IsKeyPressed(.KEY_R)) {
      trianglePositions[0] = startingPositions[0].clone();
      trianglePositions[1] = startingPositions[1].clone();
      trianglePositions[2] = startingPositions[2].clone();
      rlEnableBackfaceCulling();
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      if (linesMode) {
        rlBegin(.RL_LINES);
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
        rlBegin(.RL_TRIANGLES);
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
            ColorAlpha(.DARKGRAY, 0.5)
          );
        }

        if (i == triangleIndex) {
          DrawCircleV(trianglePositions[i], handleRadius, .DARKGRAY);
        }

        DrawCircleLinesV(trianglePositions[i], handleRadius, .BLACK);
      }

      DrawText(
        "SPACE: Toggle lines mode",
        10, 10, 20, .DARKGRAY
      );
      DrawText(
        "LEFT-RIGHT: Toggle backface culling",
        10, 40, 20, .DARKGRAY
      );
      DrawText(
        "MOUSE: Click and drag vertex points",
        10, 70, 20, .DARKGRAY
      );
      DrawText(
        "R: Reset triangle to start positions",
        10, 100, 20, .DARKGRAY
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}