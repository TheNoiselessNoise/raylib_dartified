// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_heightmap_rendering.c
// Run it: dart run models_heightmap_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_heightmap_rendering".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(18, 21, 18);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final image = LoadImage("../resources/heightmap.png".toC);
  final texture = LoadTextureFromImage(image);

  final meshSize = Vector3$.val.$1.set(16, 8, 16);
  final mesh = GenMeshHeightmap(image, meshSize);
  final model = LoadModelFromMesh(mesh);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final mapPosition = Vector3$.val.$2.set(-8, 0, -8);
  
  UnloadImage(image);

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawModel(model, mapPosition, 1.0, RED);
        DrawGrid(20, 1.0);

      EndMode3D();

      DrawTexture(texture, screenWidth - texture.width - 20, 20, WHITE);
      DrawRectangleLines(screenWidth - texture.width - 20, 20, texture.width, texture.height, GREEN);

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadModel(model);
  
  CloseWindowAndDispose();
}