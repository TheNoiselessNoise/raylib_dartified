// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_mode.c
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

final Vector3 cubePosition = .vec3(0, 0, 0);
final Camera3D camera = .new(
  position: .vec3(0, 10, 10),
  target: .vec3(0, 0, 0),
  up: .vec3(0, 1, 0),
  fovy: 45,
  projection: .CAMERA_PERSPECTIVE,
);

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "core_3d_camera_mode");
    SetTargetFPS(60);
  },
  loop: (_) async {
    BeginDrawing();
      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawCube(cubePosition, 2.0, 2.0, 2.0, .RED);
        DrawCubeWires(cubePosition, 2.0, 2.0, 2.0, .MAROON);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "Welcome to the third dimension!",
        10, 40, 20, .DARKGRAY
      );

      DrawFPS(10, 10);
    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);