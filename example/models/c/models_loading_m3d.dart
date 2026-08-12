// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_m3d.c
// Run it: dart run models_loading_m3d.dart
// WARNING: expects resources from the raylib source

// WARNING: This example uses CPU skinning.
// It requires raylib to be built with `SUPPORT_GPU_SKINNING=0` (the raylib default).
// If your raylib build has SUPPORT_GPU_SKINNING=1, the model will render frozen in
// bind pose with no errors.
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_loading_m3d".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(1.5, 1.5, 1.5);
  camera.ref.target.set(0, 0.4, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final position = Vector3$.val.At('position');

  final modelFileName = "../resources/models/m3d/cesium_man.m3d";
  bool drawMesh = true;
  bool drawSkeleton = true;
  bool animPlaying = false;

  final model = LoadModel(modelFileName.toC);

  final animsCount = Int$.val.At('animsCount');
  int animFrameCounter = 0, animId = 0;
  final anims = LoadModelAnimations(modelFileName.toC, animsCount);

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    if (animsCount.value.toBool())
    {
      if (IsKeyDown(KeyboardKey.KEY_SPACE.value) || IsKeyPressed(KeyboardKey.KEY_N.value))
      {
        animFrameCounter++;

        if (animFrameCounter >= anims[animId].keyframeCount) animFrameCounter = 0;

        UpdateModelAnimation(model, anims[animId], animFrameCounter.toDouble());
        animPlaying = true;
      }

      if (IsKeyPressed(KeyboardKey.KEY_C.value))
      {
        animFrameCounter = 0;
        animId++;

        if (animId >= animsCount.value) animId = 0;
        UpdateModelAnimation(model, anims[animId], 0);
        animPlaying = true;
      }
    }

    if (IsKeyPressed(KeyboardKey.KEY_B.value)) drawSkeleton = !drawSkeleton;

    if (IsKeyPressed(KeyboardKey.KEY_M.value)) drawMesh = !drawMesh;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        if (drawMesh) DrawModel(model, position.ref, 1.0, WHITE);

        if (drawSkeleton)
        {
          for (int i = 0; i < model.skeleton.boneCount - 1; i++)
          {
            if (!animPlaying || !animsCount.value.toBool())
            {
              DrawCube(model.skeleton.bindPose[i].translation, 0.04, 0.04, 0.04, RED);

              if (model.skeleton.bones[i].parent >= 0)
              {
                DrawLine3D(
                  model.skeleton.bindPose[i].translation,
                  model.skeleton.bindPose[model.skeleton.bones[i].parent].translation,
                  RED
                );
              }
            }
            else
            {
              DrawCube(anims[animId].keyframePoses[animFrameCounter][i].translation, 0.05, 0.05, 0.05, RED);

              if (model.skeleton.bones[i].parent >= 0)
              {
                DrawLine3D(
                  anims[animId].keyframePoses[animFrameCounter][i].translation,
                  anims[animId].keyframePoses[animFrameCounter][model.skeleton.bones[i].parent].translation,
                  RED
                );
              }
            }
          }
        }

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "PRESS SPACE to PLAY MODEL ANIMATION".toC,
        10, GetScreenHeight() - 80, 10, MAROON
      );
      DrawText(
        "PRESS N to STEP ONE ANIMATION FRAME".toC,
        10, GetScreenHeight() - 60, 10, DARKGRAY
      );
      DrawText(
        "PRESS C to CYCLE THROUGH ANIMATIONS".toC,
        10, GetScreenHeight() - 40, 10, DARKGRAY
      );
      DrawText(
        "PRESS M to toggle MESH, B to toggle SKELETON DRAWING".toC,
        10, GetScreenHeight() - 20, 10, DARKGRAY
      );
      DrawText(
        "(c) CesiumMan model by KhronosGroup".toC,
        GetScreenWidth() - 210, GetScreenHeight() - 20, 10, GRAY
      );

    EndDrawing();
  }

  UnloadModelAnimations(anims, animsCount.value);
  UnloadModel(model);
  
  CloseWindowAndDispose();
}