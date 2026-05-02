// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_mode.c
// Run it: dart run core_3d_camera_mode.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_3d_camera_mode'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(0, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cubePosition = rl.Temp.vec31(0, 0, 0);
  // OR:
  // final cubePosition = rl.Temp.Vector3$.At('cubePosition').set(0, 0, 0);

  while (!rl.Core.WindowShouldClose()) {
    rl.Core.BeginDrawing();
      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawCube(cubePosition, 2.0, 2.0, 2.0, rl.C.RED);
        rl.Core.DrawCubeWires(cubePosition, 2.0, 2.0, 2.0, rl.C.MAROON);

        rl.Core.DrawGrid(10, 1.0);

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Welcome to the third dimension!".toC,
        10, 40, 20, rl.C.DARKGRAY
      );

      rl.Core.DrawFPS(10, 10);
    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}