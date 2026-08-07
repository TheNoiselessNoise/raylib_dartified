// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_world_screen.c
// Run it: dart run core_world_screen.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  final camera = Camera3DD(
    position: .vec3(10, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  Vector3D cubePosition = .zero();
  Vector2D cubeScreenPosition = .zero();
  Vector3D worldPosition = .zero();

  InitWindow(screenWidth, screenHeight, "core_world_screen");
  DisableCursor();
  SetTargetFPS(60);

  while (!WindowShouldClose()) {
    UpdateCamera(camera, .CAMERA_THIRD_PERSON);

    worldPosition.set(
      cubePosition.x,
      cubePosition.y + 2.5,
      cubePosition.z,
    );

    cubeScreenPosition = GetWorldToScreen(worldPosition, camera);

    BeginDrawing();

    ClearBackground(.RAYWHITE);

      BeginMode3D(camera);
        DrawCube(cubePosition, 2, 2, 2, .RED);
        DrawCubeWires(cubePosition, 2, 2, 2, .MAROON);

        DrawGrid(10, 1);
      EndMode3D();

      int cubeX = cubeScreenPosition.x.toInt();
      int cubeY = cubeScreenPosition.y.toInt();

      final enemyString = 'Enemy: 100/100';
      DrawText(
        enemyString,
        cubeX - MeasureText(enemyString, 20) ~/ 2,
        cubeY,
        20,
        .BLACK,
      );


      DrawText(
        "Cube position in screen space coordinates: [$cubeX, $cubeY]",
        10, 10, 20, .LIME,
      );

      DrawText(
        "Text 2d should be always on top of the cube",
        10, 40, 20, .GRAY,
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}