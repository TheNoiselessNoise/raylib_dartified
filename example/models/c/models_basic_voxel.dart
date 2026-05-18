// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_basic_voxel.c
// Run it: dart run models_basic_voxel.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int WORLD_SIZE = 8;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "models_basic_voxel".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(-2, 0, -2);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cubeMesh = rl.Core.GenMeshCube(1, 1, 1);
  final cubeModel = rl.Core.LoadModelFromMesh(cubeMesh);
  cubeModel.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].color = rl.Color.BEIGE;

  final List<List<List<bool>>> voxels = .generate(WORLD_SIZE, (_) {
    return .generate(WORLD_SIZE, (_) => .filled(WORLD_SIZE, true));
  });

  final screenCenter = rl.Temp.Vector2$.At('screenCenter')
    .set(screenWidth/2, screenHeight/2);
  final voxelBB = rl.Temp.BoundingBox$.At('voxelBB');
  final modelPosition = rl.Temp.Vector3$.At('modelPosition');

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      final ray = rl.Core.GetScreenToWorldRay(screenCenter.ref, camera.ref);

      // NOTE: not in original source, i am removing the closest voxel
      double? closestDistance;
      int? removeX, removeY, removeZ;

      for (int x = 0; x < WORLD_SIZE; x++) {
        for (int y = 0; y < WORLD_SIZE; y++) {
          for (int z = 0; z < WORLD_SIZE; z++) {
            if (!voxels[x][y][z]) continue;

            voxelBB.ref.min.set(x - 0.5, y - 0.5, z - 0.5);
            voxelBB.ref.max.set(x + 0.5, y + 0.5, z + 0.5);

            RayCollisionC collision = rl.Core.GetRayCollisionBox(ray, voxelBB.ref);
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

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawGrid(10, 1.0);

        for (int x = 0; x < WORLD_SIZE; x++) {
          for (int y = 0; y < WORLD_SIZE; y++) {
            for (int z = 0; z < WORLD_SIZE; z++) {
              if (!voxels[x][y][z]) continue;

              modelPosition.set(x.toDouble(), y.toDouble(), z.toDouble());

              rl.Core.DrawModel(cubeModel, modelPosition.ref, 1.0, rl.Color.BEIGE);
              rl.Core.DrawCubeWires(modelPosition.ref, 1.0, 1.0, 1.0, rl.Color.BLACK);
            }
          }
        }

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Left-click a voxel to remove it!".toC,
        10, 10, 20, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "WASD to move, mouse to look around".toC,
        10, 35, 10, rl.Color.GRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadModel(cubeModel);
  
  rl.CloseWindowAndDispose();
}