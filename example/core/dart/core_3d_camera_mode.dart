// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_mode.c
// Run it: dart run core_3d_camera_mode.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_3d_camera_mode");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(0, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final Vector3D cubePosition = .vec3(0, 0, 0);

  while (!WindowShouldClose()) {
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
  }

  CloseWindowAndDispose();
}