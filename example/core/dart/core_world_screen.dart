// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_world_screen.c
// Run it: dart run core_world_screen.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

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

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_world_screen');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.DisableCursor();
  rl.CoreD.SetTargetFPS(60);

  while (!rl.CoreD.WindowShouldClose()) {
    rl.CoreD.UpdateCamera(camera, .CAMERA_THIRD_PERSON);

    worldPosition.set(
      cubePosition.x,
      cubePosition.y + 2.5,
      cubePosition.z,
    );

    cubeScreenPosition = rl.CoreD.GetWorldToScreen(worldPosition, camera);

    rl.CoreD.BeginDrawing();

    rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);
        rl.CoreD.DrawCube(cubePosition, 2, 2, 2, .RED);
        rl.CoreD.DrawCubeWires(cubePosition, 2, 2, 2, .MAROON);

        rl.CoreD.DrawGrid(10, 1);
      rl.CoreD.EndMode3D();

      int cubeX = cubeScreenPosition.x.toInt();
      int cubeY = cubeScreenPosition.y.toInt();

      final enemyString = 'Enemy: 100/100';
      rl.CoreD.DrawText(
        enemyString,
        cubeX - rl.CoreD.MeasureText(enemyString, 20) ~/ 2,
        cubeY,
        20,
        .BLACK,
      );


      rl.CoreD.DrawText(
        "Cube position in screen space coordinates: [$cubeX, $cubeY]",
        10, 10, 20, .LIME,
      );

      rl.CoreD.DrawText(
        "Text 2d should be always on top of the cube",
        10, 40, 20, .GRAY,
      );

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}