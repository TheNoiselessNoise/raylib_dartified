// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_world_screen.c
// Run it: dart run core_world_screen.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(10, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cubePosition = Vector3$.At('cubePosition');
  final cubeScreenPosition = Vector2$.At('cubeScreenPosition');
  final worldPosition = Vector3$.At('worldPosition');

  InitWindow(screenWidth, screenHeight, "core_world_screen".toC);
  DisableCursor();
  SetTargetFPS(60);

  final enemyString = String$.ValueAt('enemy', 'Enemy: 100/100');

  while (!WindowShouldClose()) {
    UpdateCamera(camera, CameraMode.CAMERA_THIRD_PERSON.value);

    worldPosition.set(
      cubePosition.ref.x,
      cubePosition.ref.y + 2.5,
      cubePosition.ref.z,
    );

    cubeScreenPosition.ref = GetWorldToScreen(worldPosition.ref, camera.ref);

    BeginDrawing();

    ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);
        DrawCube(cubePosition.ref, 2, 2, 2, RED);
        DrawCubeWires(cubePosition.ref, 2, 2, 2, MAROON);

        DrawGrid(10, 1);
      EndMode3D();

      int cubeX = cubeScreenPosition.ref.x.toInt();
      int cubeY = cubeScreenPosition.ref.y.toInt();

      DrawText(
        enemyString,
        cubeX - MeasureText(enemyString, 20) ~/ 2,
        cubeY,
        20,
        BLACK,
      );

      DrawText(
        "Cube position in screen space coordinates: [$cubeX, $cubeY]".toC,
        10, 10, 20, LIME,
      );

      DrawText(
        "Text 2d should be always on top of the cube".toC,
        10, 40, 20, GRAY,
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}