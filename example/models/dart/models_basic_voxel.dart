// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_basic_voxel.c
// Run it: dart run models_basic_voxel.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int WORLD_SIZE = 8;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_basic_voxel");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
    position: .vec3(-2, 0, -2),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final cubeMesh = GenMeshCube(1, 1, 1);
  final cubeModel = LoadModelFromMesh(cubeMesh);
  cubeModel.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].color = .BEIGE;

  final List<List<List<bool>>> voxels = .generate(WORLD_SIZE, (_) {
    return .generate(WORLD_SIZE, (_) => .filled(WORLD_SIZE, true));
  });

  final Vector2D screenCenter = .vec2(screenWidth/2, screenHeight/2);
  final BoundingBoxD voxelBB = .zero();
  final Vector3D modelPosition = .zero();

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_FIRST_PERSON);

    if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
      final ray = GetScreenToWorldRay(screenCenter, camera);

      // NOTE: not in original source, i am removing the closest voxel
      double? closestDistance;
      int? removeX, removeY, removeZ;

      for (int x = 0; x < WORLD_SIZE; x++) {
        for (int y = 0; y < WORLD_SIZE; y++) {
          for (int z = 0; z < WORLD_SIZE; z++) {
            if (!voxels[x][y][z]) continue;

            voxelBB.min.set(x - 0.5, y - 0.5, z - 0.5);
            voxelBB.max.set(x + 0.5, y + 0.5, z + 0.5);

            final collision = GetRayCollisionBox(ray, voxelBB);
            if (collision.hit && (closestDistance == null || collision.distance < closestDistance)) {
              closestDistance = collision.distance;
              removeX = x;
              removeY = y;
              removeZ = z;
            }
          }
        }
      }

      if (removeX != null) {
        voxels[removeX][removeY!][removeZ!] = false;
      }
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawGrid(10, 1.0);

        for (int x = 0; x < WORLD_SIZE; x++) {
          for (int y = 0; y < WORLD_SIZE; y++) {
            for (int z = 0; z < WORLD_SIZE; z++) {
              if (!voxels[x][y][z]) continue;

              modelPosition.set(x, y, z);

              DrawModel(cubeModel, modelPosition, 1.0, .BEIGE);
              DrawCubeWires(modelPosition, 1.0, 1.0, 1.0, .BLACK);
            }
          }
        }

      EndMode3D();

      DrawText(
        "Left-click a voxel to remove it!",
        10, 10, 20, .DARKGRAY
      );
      DrawText(
        "WASD to move, mouse to look around",
        10, 35, 10, .GRAY
      );

    EndDrawing();
  }

  UnloadModel(cubeModel);
  
  CloseWindowAndDispose();
}