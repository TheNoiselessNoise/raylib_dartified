// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_mode.c
// Run it: dart run core_3d_camera_mode.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_3d_camera_mode".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(0, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cubePosition = Vector3$.$1.set(0, 0, 0);
  // OR:
  // final cubePosition = Vector3$.At('cubePosition').set(0, 0, 0);

  while (!WindowShouldClose()) {
    BeginDrawing();
      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawCube(cubePosition, 2.0, 2.0, 2.0, RED);
        DrawCubeWires(cubePosition, 2.0, 2.0, 2.0, MAROON);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "Welcome to the third dimension!".toC,
        10, 40, 20, DARKGRAY
      );

      DrawFPS(10, 10);
    EndDrawing();
  }

  CloseWindowAndDispose();
}