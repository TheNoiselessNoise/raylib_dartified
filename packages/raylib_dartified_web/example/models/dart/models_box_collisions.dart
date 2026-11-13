// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_box_collisions.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "models_box_collisions");
  SetTargetFPS(60);

  final camera = Camera3D(
    position: .vec3(0, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final Vector3 playerPosition = .vec3(0, 1, 2);
  final Vector3 playerSize = .vec3(1, 2, 1);
  Color playerColor = .GREEN;

  final Vector3 enemyBoxPos = .vec3(-4, 1, 0);
  final Vector3 enemyBoxSize = .vec3(2, 2, 2);

  final Vector3 enemySpherePos = .vec3(4, 0, 0);
  double enemySphereSize = 1.5;

  rl.setMainLoop(() {
    if (IsKeyDown(.KEY_RIGHT)) playerPosition.x += 0.2;
    else if (IsKeyDown(.KEY_LEFT)) playerPosition.x -= 0.2;
    else if (IsKeyDown(.KEY_DOWN)) playerPosition.z += 0.2;
    else if (IsKeyDown(.KEY_UP)) playerPosition.z -= 0.2;

    bool collision = false;

    // Check collisions player vs enemy-box
    final playerBBox = BoundingBox(
      min: .vec3(
        playerPosition.x - playerSize.x/2,
        playerPosition.y - playerSize.y/2,
        playerPosition.z - playerSize.z/2
      ),
      max: .vec3(
        playerPosition.x + playerSize.x/2,
        playerPosition.y + playerSize.y/2,
        playerPosition.z + playerSize.z/2
      ),
    );

    final enemyBBox = BoundingBox(
      min: .vec3(
        enemyBoxPos.x - enemyBoxSize.x/2,
        enemyBoxPos.y - enemyBoxSize.y/2,
        enemyBoxPos.z - enemyBoxSize.z/2
      ),
      max: .vec3(
        enemyBoxPos.x + enemyBoxSize.x/2,
        enemyBoxPos.y + enemyBoxSize.y/2,
        enemyBoxPos.z + enemyBoxSize.z/2
      ),
    );

    if (CheckCollisionBoxes(playerBBox, enemyBBox)) collision = true;

    if (CheckCollisionBoxSphere(playerBBox, enemySpherePos, enemySphereSize)) collision = true;

    if (collision) playerColor = .RED;
    else playerColor = .GREEN;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawCube(enemyBoxPos, enemyBoxSize.x, enemyBoxSize.y, enemyBoxSize.z, .GRAY);
        DrawCubeWires(enemyBoxPos, enemyBoxSize.x, enemyBoxSize.y, enemyBoxSize.z, .DARKGRAY);

        DrawSphere(enemySpherePos, enemySphereSize, .GRAY);
        DrawSphereWires(enemySpherePos, enemySphereSize, 16, 16, .DARKGRAY);

        DrawCubeV(playerPosition, playerSize, playerColor);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "Move player with arrow keys to collide",
        220, 40, 20, .GRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  });
});