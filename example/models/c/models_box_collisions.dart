// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_box_collisions.c
// Run it: dart run models_box_collisions.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_box_collisions".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(0, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final playerPosition = rl.Temp.Vector3$.At('playerPosition').set(0, 1, 2);
  final playerSize = rl.Temp.Vector3$.At('playerSize').set(1, 2, 1);
  ColorC playerColor = rl.C.GREEN;

  final enemyBoxPos = rl.Temp.Vector3$.At('enemyBoxPos').set(-4, 1, 0);
  final enemyBoxSize = rl.Temp.Vector3$.At('enemyBoxSize').set(2, 2, 2);

  final enemySpherePos = rl.Temp.Vector3$.At('enemySpherePos').set(4, 0, 0);
  double enemySphereSize = 1.5;

  final playerBBox = rl.Temp.BoundingBox$.At('playerBBox');
  final enemyBBox = rl.Temp.BoundingBox$.At('enemyBBox');

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT.value)) playerPosition.ref.x += 0.2;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT.value)) playerPosition.ref.x -= 0.2;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_DOWN.value)) playerPosition.ref.z += 0.2;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_UP.value)) playerPosition.ref.z -= 0.2;

    bool collision = false;

    // Check collisions player vs enemy-box
    playerBBox.ref.min.set(
      playerPosition.ref.x - playerSize.ref.x/2,
      playerPosition.ref.y - playerSize.ref.y/2,
      playerPosition.ref.z - playerSize.ref.z/2
    );

    playerBBox.ref.max.set(
      playerPosition.ref.x + playerSize.ref.x/2,
      playerPosition.ref.y + playerSize.ref.y/2,
      playerPosition.ref.z + playerSize.ref.z/2
    );

    enemyBBox.ref.min.set(
      enemyBoxPos.ref.x - enemyBoxSize.ref.x/2,
      enemyBoxPos.ref.y - enemyBoxSize.ref.y/2,
      enemyBoxPos.ref.z - enemyBoxSize.ref.z/2
    );

    enemyBBox.ref.max.set(
      enemyBoxPos.ref.x + enemyBoxSize.ref.x/2,
      enemyBoxPos.ref.y + enemyBoxSize.ref.y/2,
      enemyBoxPos.ref.z + enemyBoxSize.ref.z/2
    );

    if (rl.Core.CheckCollisionBoxes(playerBBox.ref, enemyBBox.ref)) collision = true;

    // Check collisions player vs enemy-sphere
    if (rl.Core.CheckCollisionBoxSphere(playerBBox.ref, enemySpherePos.ref, enemySphereSize)) collision = true;

    if (collision) playerColor = rl.C.RED;
    else playerColor = rl.C.GREEN;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawCube(enemyBoxPos.ref, enemyBoxSize.ref.x, enemyBoxSize.ref.y, enemyBoxSize.ref.z, rl.C.GRAY);
        rl.Core.DrawCubeWires(enemyBoxPos.ref, enemyBoxSize.ref.x, enemyBoxSize.ref.y, enemyBoxSize.ref.z, rl.C.DARKGRAY);

        rl.Core.DrawSphere(enemySpherePos.ref, enemySphereSize, rl.C.GRAY);
        rl.Core.DrawSphereWires(enemySpherePos.ref, enemySphereSize, 16, 16, rl.C.DARKGRAY);

        rl.Core.DrawCubeV(playerPosition.ref, playerSize.ref, playerColor);

        rl.Core.DrawGrid(10, 1.0);

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Move player with arrow keys to collide".toC,
        220, 40, 20, rl.C.GRAY
      );

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}