// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_mode.c
// Run it: dart run core_3d_camera_mode.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_3d_camera_mode');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(0, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final Vector3D cubePosition = .vec3(0, 0, 0);

  while (!rl.CoreD.WindowShouldClose()) {
    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawCube(cubePosition, 2.0, 2.0, 2.0, .RED);
        rl.CoreD.DrawCubeWires(cubePosition, 2.0, 2.0, 2.0, .MAROON);

        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Welcome to the third dimension!",
        10, 40, 20, .DARKGRAY
      );

      rl.CoreD.DrawFPS(10, 10);
    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}