// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_basic_voxel.c
// Run it: dart run models_basic_voxel.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int WORLD_SIZE = 8;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_basic_voxel");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = Camera3DD(
    position: .vec3(-2, 0, -2),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final cubeMesh = rl.CoreD.GenMeshCube(1, 1, 1);
  final cubeModel = rl.CoreD.LoadModelFromMesh(cubeMesh);
  cubeModel.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].color = .BEIGE;

  final List<List<List<bool>>> voxels = .generate(WORLD_SIZE, (_) {
    return .generate(WORLD_SIZE, (_) => .filled(WORLD_SIZE, true));
  });

  final Vector2D screenCenter = .vec2(screenWidth/2, screenHeight/2);
  final BoundingBoxD voxelBB = .zero();
  final Vector3D modelPosition = .zero();

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_FIRST_PERSON);

    if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
      final ray = rl.CoreD.GetScreenToWorldRay(screenCenter, camera);

      // NOTE: not in original source, i am removing the closest voxel
      double? closestDistance;
      int? removeX, removeY, removeZ;

      for (int x = 0; x < WORLD_SIZE; x++) {
        for (int y = 0; y < WORLD_SIZE; y++) {
          for (int z = 0; z < WORLD_SIZE; z++) {
            if (!voxels[x][y][z]) continue;

            voxelBB.min.set(x - 0.5, y - 0.5, z - 0.5);
            voxelBB.max.set(x + 0.5, y + 0.5, z + 0.5);

            final collision = rl.CoreD.GetRayCollisionBox(ray, voxelBB);
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

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawGrid(10, 1.0);

        for (int x = 0; x < WORLD_SIZE; x++) {
          for (int y = 0; y < WORLD_SIZE; y++) {
            for (int z = 0; z < WORLD_SIZE; z++) {
              if (!voxels[x][y][z]) continue;

              modelPosition.set(x, y, z);

              rl.CoreD.DrawModel(cubeModel, modelPosition, 1.0, .BEIGE);
              rl.CoreD.DrawCubeWires(modelPosition, 1.0, 1.0, 1.0, .BLACK);
            }
          }
        }

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Left-click a voxel to remove it!",
        10, 10, 20, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "WASD to move, mouse to look around",
        10, 35, 10, .GRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadModel(cubeModel);
  
  rl.CloseWindowAndDispose();
}