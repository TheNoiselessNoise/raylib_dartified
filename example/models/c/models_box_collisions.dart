// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_box_collisions.c
// Run it: dart run models_box_collisions.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_box_collisions".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(0, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final playerPosition = Vector3$.val.At('playerPosition').set(0, 1, 2);
  final playerSize = Vector3$.val.At('playerSize').set(1, 2, 1);
  ColorC playerColor = GREEN;

  final enemyBoxPos = Vector3$.val.At('enemyBoxPos').set(-4, 1, 0);
  final enemyBoxSize = Vector3$.val.At('enemyBoxSize').set(2, 2, 2);

  final enemySpherePos = Vector3$.val.At('enemySpherePos').set(4, 0, 0);
  double enemySphereSize = 1.5;

  final playerBBox = BoundingBox$.val.At('playerBBox');
  final enemyBBox = BoundingBox$.val.At('enemyBBox');

  while (!WindowShouldClose())
  {
    if (IsKeyDown(KeyboardKey.KEY_RIGHT.value)) playerPosition.ref.x += 0.2;
    else if (IsKeyDown(KeyboardKey.KEY_LEFT.value)) playerPosition.ref.x -= 0.2;
    else if (IsKeyDown(KeyboardKey.KEY_DOWN.value)) playerPosition.ref.z += 0.2;
    else if (IsKeyDown(KeyboardKey.KEY_UP.value)) playerPosition.ref.z -= 0.2;

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

    if (CheckCollisionBoxes(playerBBox.ref, enemyBBox.ref)) collision = true;

    if (CheckCollisionBoxSphere(playerBBox.ref, enemySpherePos.ref, enemySphereSize)) collision = true;

    if (collision) playerColor = RED;
    else playerColor = GREEN;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawCube(enemyBoxPos.ref, enemyBoxSize.ref.x, enemyBoxSize.ref.y, enemyBoxSize.ref.z, GRAY);
        DrawCubeWires(enemyBoxPos.ref, enemyBoxSize.ref.x, enemyBoxSize.ref.y, enemyBoxSize.ref.z, DARKGRAY);

        DrawSphere(enemySpherePos.ref, enemySphereSize, GRAY);
        DrawSphereWires(enemySpherePos.ref, enemySphereSize, 16, 16, DARKGRAY);

        DrawCubeV(playerPosition.ref, playerSize.ref, playerColor);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "Move player with arrow keys to collide".toC,
        220, 40, 20, GRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}