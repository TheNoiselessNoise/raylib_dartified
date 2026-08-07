// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_cubicmap_rendering.c
// Run it: dart run models_cubicmap_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_cubicmap_rendering".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(16, 14, 16);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final image = LoadImage("../resources/cubicmap.png".toC);
  final cubicmap = LoadTextureFromImage(image);

  final mesh = GenMeshCubicmap(image, Vector3$.$1.set(1.0, 1.0, 1.0));
  final model = LoadModelFromMesh(mesh);

  final texture = LoadTexture("../resources/cubicmap_atlas.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final mapPosition = Vector3$.At('mapPosition').set(-16.0, 0.0, -8.0);

  UnloadImage(image);

  bool pause = false;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_P.value)) pause = !pause;

    if (!pause) UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawModel(model, mapPosition.ref, 1.0, WHITE);

      EndMode3D();

      DrawTextureEx(cubicmap, Vector2$.$1.set(screenWidth - cubicmap.width*4.0 - 20, 20.0), 0.0, 4.0, WHITE);
      DrawRectangleLines(screenWidth - cubicmap.width*4 - 20, 20, cubicmap.width*4, cubicmap.height*4, GREEN);

      DrawText("cubicmap image used to".toC, 658, 90, 10, GRAY);
      DrawText("generate map 3d model".toC, 658, 104, 10, GRAY);

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(cubicmap);
  UnloadTexture(texture);
  UnloadModel(model);
  
  CloseWindowAndDispose();
}