// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_box_collisions.c
// Run it: dart run models_box_collisions.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_box_collisions");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = CameraD(
    position: .vec3(0, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final Vector3D playerPosition = .vec3(0, 1, 2);
  final Vector3D playerSize = .vec3(1, 2, 1);
  ColorD playerColor = .GREEN;

  final Vector3D enemyBoxPos = .vec3(-4, 1, 0);
  final Vector3D enemyBoxSize = .vec3(2, 2, 2);

  final Vector3D enemySpherePos = .vec3(4, 0, 0);
  double enemySphereSize = 1.5;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyDown(.KEY_RIGHT)) playerPosition.x += 0.2;
    else if (rl.CoreD.IsKeyDown(.KEY_LEFT)) playerPosition.x -= 0.2;
    else if (rl.CoreD.IsKeyDown(.KEY_DOWN)) playerPosition.z += 0.2;
    else if (rl.CoreD.IsKeyDown(.KEY_UP)) playerPosition.z -= 0.2;

    bool collision = false;

    // Check collisions player vs enemy-box
    final playerBBox = BoundingBoxD(
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

    final enemyBBox = BoundingBoxD(
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

    if (rl.CoreD.CheckCollisionBoxes(playerBBox, enemyBBox)) collision = true;

    // Check collisions player vs enemy-sphere
    if (rl.CoreD.CheckCollisionBoxSphere(playerBBox, enemySpherePos, enemySphereSize)) collision = true;

    if (collision) playerColor = .RED;
    else playerColor = .GREEN;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawCube(enemyBoxPos, enemyBoxSize.x, enemyBoxSize.y, enemyBoxSize.z, .GRAY);
        rl.CoreD.DrawCubeWires(enemyBoxPos, enemyBoxSize.x, enemyBoxSize.y, enemyBoxSize.z, .DARKGRAY);

        rl.CoreD.DrawSphere(enemySpherePos, enemySphereSize, .GRAY);
        rl.CoreD.DrawSphereWires(enemySpherePos, enemySphereSize, 16, 16, .DARKGRAY);

        rl.CoreD.DrawCubeV(playerPosition, playerSize, playerColor);

        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Move player with arrow keys to collide",
        220, 40, 20, .GRAY
      );

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}