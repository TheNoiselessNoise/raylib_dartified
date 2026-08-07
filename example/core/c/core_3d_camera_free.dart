// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_free.c
// Run it: dart run core_3d_camera_free.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_3d_camera_free".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(10, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cubePosition = Vector3$.At('cubePosition');

  while (!WindowShouldClose()) {
    UpdateCamera(camera, CameraMode.CAMERA_FREE.value);

    if (IsKeyPressed(KeyboardKey.KEY_Z.value))
      camera.ref.target.set(0, 0, 0);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawCube(cubePosition.ref, 2.0, 2.0, 2.0, RED);
        DrawCubeWires(cubePosition.ref, 2.0, 2.0, 2.0, MAROON);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawRectangle(10, 10, 320, 93, Fade(SKYBLUE, 0.5));
      DrawRectangleLines(10, 10, 320, 93, BLUE);

      DrawText(
        "Free camera default controls:".toC,
        20, 20, 10, BLACK
      );
      DrawText(
        "- Mouse Wheel to Zoom in-out".toC,
        40, 40, 10, DARKGRAY
      );
      DrawText(
        "- Mouse Wheel Pressed to Pan".toC,
        40, 60, 10, DARKGRAY
      );
      DrawText(
        "- Z to zoom to (0, 0, 0)".toC,
        40, 80, 10, DARKGRAY
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}