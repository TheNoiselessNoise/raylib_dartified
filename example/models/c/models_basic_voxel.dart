// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_basic_voxel.c
// Run it: dart run models_basic_voxel.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int WORLD_SIZE = 8;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_basic_voxel".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(-2, 0, -2);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cubeMesh = GenMeshCube(1, 1, 1);
  final cubeModel = LoadModelFromMesh(cubeMesh);
  cubeModel.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].color = BEIGE;

  final List<List<List<bool>>> voxels = .generate(WORLD_SIZE, (_) {
    return .generate(WORLD_SIZE, (_) => .filled(WORLD_SIZE, true));
  });

  final screenCenter = Vector2$.At('screenCenter')
    .set(screenWidth/2, screenHeight/2);
  final voxelBB = BoundingBox$.At('voxelBB');
  final modelPosition = Vector3$.At('modelPosition');

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      final ray = GetScreenToWorldRay(screenCenter.ref, camera.ref);

      // NOTE: not in original source, i am removing the closest voxel
      double? closestDistance;
      int? removeX, removeY, removeZ;

      for (int x = 0; x < WORLD_SIZE; x++) {
        for (int y = 0; y < WORLD_SIZE; y++) {
          for (int z = 0; z < WORLD_SIZE; z++) {
            if (!voxels[x][y][z]) continue;

            voxelBB.ref.min.set(x - 0.5, y - 0.5, z - 0.5);
            voxelBB.ref.max.set(x + 0.5, y + 0.5, z + 0.5);

            RayCollisionC collision = GetRayCollisionBox(ray, voxelBB.ref);
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

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawGrid(10, 1.0);

        for (int x = 0; x < WORLD_SIZE; x++) {
          for (int y = 0; y < WORLD_SIZE; y++) {
            for (int z = 0; z < WORLD_SIZE; z++) {
              if (!voxels[x][y][z]) continue;

              modelPosition.set(x, y, z);

              DrawModel(cubeModel, modelPosition.ref, 1.0, BEIGE);
              DrawCubeWires(modelPosition.ref, 1.0, 1.0, 1.0, BLACK);
            }
          }
        }

      EndMode3D();

      DrawText(
        "Left-click a voxel to remove it!".toC,
        10, 10, 20, DARKGRAY
      );
      DrawText(
        "WASD to move, mouse to look around".toC,
        10, 35, 10, GRAY
      );

    EndDrawing();
  }

  UnloadModel(cubeModel);
  
  CloseWindowAndDispose();
}