// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_free.c
// Run it: dart run core_3d_camera_free.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_3d_camera_free');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = Camera3DD(
    position: .vec3(10, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );
  
  final Vector3D cubePosition = .zero();

  while (!rl.CoreD.WindowShouldClose()) {
    rl.CoreD.UpdateCamera(camera, .CAMERA_FREE);

    if (rl.CoreD.IsKeyPressed(.KEY_Z))
      camera.target.set(0, 0, 0);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawCube(cubePosition, 2.0, 2.0, 2.0, .RED);
        rl.CoreD.DrawCubeWires(cubePosition, 2.0, 2.0, 2.0, .MAROON);

        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawRectangle(10, 10, 320, 93, rl.CoreD.Fade(.SKYBLUE, 0.5));
      rl.CoreD.DrawRectangleLines(10, 10, 320, 93, .BLUE);

      rl.CoreD.DrawText(
        "Free camera default controls:",
        20, 20, 10, .BLACK
      );
      rl.CoreD.DrawText(
        "- Mouse Wheel to Zoom in-out",
        40, 40, 10, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "- Mouse Wheel Pressed to Pan",
        40, 60, 10, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "- Z to zoom to (0, 0, 0)",
        40, 80, 10, .DARKGRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}