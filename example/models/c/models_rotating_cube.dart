// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_rotating_cube.c
// Run it: dart run models_rotating_cube.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_rotating_cube".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(0.0, 3.0, 3.0);
  camera.ref.target.set(0.0, 0.0, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = LoadModelFromMesh(GenMeshCube(1.0, 1.0, 1.0));
  final img = LoadImage("../resources/cubicmap_atlas.png".toC);
  final crop = ImageFromImage(img, Rectangle$.val.$1.set(0, img.height/2.0, img.width/2.0, img.height/2.0));
  final texture = LoadTextureFromImage(crop);
  UnloadImage(img);
  UnloadImage(crop);

  model.materials[0].maps[MATERIAL_MAP_DIFFUSE.value].texture = texture;

  double rotation = 0.0;

  while (!WindowShouldClose())
  {
    rotation += 1.0;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawModelEx(
          model,
          Vector3$.val.$1.set(0.0, 0.0, 0.0),
          Vector3$.val.$2.set(0.5, 1.0, 0.0),
          rotation,
          Vector3$.val.$3.set(1.0, 1.0, 1.0),
          WHITE
        );

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadModel(model);

  CloseWindowAndDispose();
}