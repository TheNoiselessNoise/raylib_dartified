// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_world_screen.c
// Run it: dart run core_world_screen.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(10, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cubePosition = rl.Temp.Vector3$.At('cubePosition');
  final cubeScreenPosition = rl.Temp.Vector2$.At('cubeScreenPosition');
  final worldPosition = rl.Temp.Vector3$.At('worldPosition');

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_world_screen'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.DisableCursor();
  rl.Core.SetTargetFPS(60);

  final enemyString = rl.Temp.strAt('enemy', 'Enemy: 100/100');

  while (!rl.Core.WindowShouldClose()) {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_THIRD_PERSON.value);

    worldPosition.set(
      cubePosition.ref.x,
      cubePosition.ref.y + 2.5,
      cubePosition.ref.z,
    );

    cubeScreenPosition.ref = rl.Core.GetWorldToScreen(worldPosition.ref, camera.ref);

    rl.Core.BeginDrawing();

    rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);
        rl.Core.DrawCube(cubePosition.ref, 2, 2, 2, rl.Color.RED);
        rl.Core.DrawCubeWires(cubePosition.ref, 2, 2, 2, rl.Color.MAROON);

        rl.Core.DrawGrid(10, 1);
      rl.Core.EndMode3D();

      int cubeX = cubeScreenPosition.ref.x.toInt();
      int cubeY = cubeScreenPosition.ref.y.toInt();

      rl.Core.DrawText(
        enemyString,
        cubeX - rl.Core.MeasureText(enemyString, 20) ~/ 2,
        cubeY,
        20,
        rl.Color.BLACK,
      );

      rl.Core.DrawText(
        "Cube position in screen space coordinates: [$cubeX, $cubeY]".toC,
        10, 10, 20, rl.Color.LIME,
      );

      rl.Core.DrawText(
        "Text 2d should be always on top of the cube".toC,
        10, 40, 20, rl.Color.GRAY,
      );

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}