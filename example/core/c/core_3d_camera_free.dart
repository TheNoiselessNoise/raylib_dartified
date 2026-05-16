// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_free.c
// Run it: dart run core_3d_camera_free.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_3d_camera_free'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(10, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cubePosition = rl.Temp.Vector3$.At('cubePosition');

  while (!rl.Core.WindowShouldClose()) {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_FREE.value);

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_Z.value))
      camera.ref.target.set(0, 0, 0);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawCube(cubePosition.ref, 2.0, 2.0, 2.0, rl.Color.RED);
        rl.Core.DrawCubeWires(cubePosition.ref, 2.0, 2.0, 2.0, rl.Color.MAROON);

        rl.Core.DrawGrid(10, 1.0);

      rl.Core.EndMode3D();

      rl.Core.DrawRectangle(10, 10, 320, 93, rl.Core.Fade(rl.Color.SKYBLUE, 0.5));
      rl.Core.DrawRectangleLines(10, 10, 320, 93, rl.Color.BLUE);

      rl.Core.DrawText(
        "Free camera default controls:".toC,
        20, 20, 10, rl.Color.BLACK
      );
      rl.Core.DrawText(
        "- Mouse Wheel to Zoom in-out".toC,
        40, 40, 10, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "- Mouse Wheel Pressed to Pan".toC,
        40, 60, 10, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "- Z to zoom to (0, 0, 0)".toC,
        40, 80, 10, rl.Color.DARKGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}