// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_iqm.c
// Run it: dart run models_loading_iqm.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_loading_iqm".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(10.0, 10.0, 10.0);
  camera.ref.target.set(0.0, 4.0, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = LoadModel("../resources/models/iqm/guy.iqm".toC);
  final texture = LoadTexture("../resources/models/iqm/guytex.png".toC);
  SetMaterialTexture(Material$.RawValueUnique(model.materials[0]), MATERIAL_MAP_DIFFUSE.value, texture);
  final position = Vector3$.$new;

  final animCount = Int$.$newPtr;
  final anims = LoadModelAnimations("../resources/models/iqm/guyanim.iqm".toC, animCount);

  int animIndex = 0;
  double animCurrentFrame = 0.0;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    animCurrentFrame += 1.0;
    UpdateModelAnimation(model, anims[animIndex], animCurrentFrame);
    if (animCurrentFrame >= anims[animIndex].keyframeCount) animCurrentFrame = 0;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawModelEx(
          model,
          position,
          Vector3$.$1.set(1.0, 0.0, 0.0),
          -90.0,
          Vector3$.$2.set(1.0, 1.0, 1.0),
          WHITE
        );

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText("Current animation: ${anims[animIndex].nameString}".toC, 10, 10, 20, MAROON);
      DrawText("(c) Guy IQM 3D model by @culacant".toC, screenWidth - 200, screenHeight - 20, 10, GRAY);

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadModelAnimations(anims, animCount.value);
  UnloadModel(model);

  CloseWindowAndDispose();
}