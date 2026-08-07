// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_free.c
// Run it: dart run core_3d_camera_free.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_3d_camera_free");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
    position: .vec3(10, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );
  
  final Vector3D cubePosition = .zero();

  while (!WindowShouldClose()) {
    UpdateCamera(camera, .CAMERA_FREE);

    if (IsKeyPressed(.KEY_Z))
      camera.target.set(0, 0, 0);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawCube(cubePosition, 2.0, 2.0, 2.0, .RED);
        DrawCubeWires(cubePosition, 2.0, 2.0, 2.0, .MAROON);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawRectangle(10, 10, 320, 93, Fade(.SKYBLUE, 0.5));
      DrawRectangleLines(10, 10, 320, 93, .BLUE);

      DrawText(
        "Free camera default controls:",
        20, 20, 10, .BLACK
      );
      DrawText(
        "- Mouse Wheel to Zoom in-out",
        40, 40, 10, .DARKGRAY
      );
      DrawText(
        "- Mouse Wheel Pressed to Pan",
        40, 60, 10, .DARKGRAY
      );
      DrawText(
        "- Z to zoom to (0, 0, 0)",
        40, 80, 10, .DARKGRAY
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}