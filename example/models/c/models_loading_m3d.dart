// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_m3d.c
// Run it: dart run models_loading_m3d.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_loading_m3d".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(1.5, 1.5, 1.5);
  camera.ref.target.set(0, 0.4, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final position = rl.Temp.Vector3$.At('position');

  final modelFileName = "../resources/models/m3d/cesium_man.m3d";
  bool drawMesh = true;
  bool drawSkeleton = true;
  bool animPlaying = false;

  final model = rl.Core.LoadModel(modelFileName.toC);

  final animsCount = rl.Temp.Int$.At('animsCount');
  int animFrameCounter = 0, animId = 0;
  final anims = rl.Core.LoadModelAnimations(modelFileName.toC, animsCount);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    if (animsCount.value.toBool())
    {
      if (rl.Core.IsKeyDown(KeyboardKey.KEY_SPACE.value) || rl.Core.IsKeyPressed(KeyboardKey.KEY_N.value))
      {
        animFrameCounter++;

        if (animFrameCounter >= anims[animId].frameCount) animFrameCounter = 0;

        rl.Core.UpdateModelAnimation(model, anims[animId], animFrameCounter);
        animPlaying = true;
      }

      if (rl.Core.IsKeyPressed(KeyboardKey.KEY_C.value))
      {
        animFrameCounter = 0;
        animId++;

        if (animId >= animsCount.value) animId = 0;
        rl.Core.UpdateModelAnimation(model, anims[animId], 0);
        animPlaying = true;
      }
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_B.value)) drawSkeleton = !drawSkeleton;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_M.value)) drawMesh = !drawMesh;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        if (drawMesh) rl.Core.DrawModel(model, position.ref, 1.0, rl.Color.WHITE);

        if (drawSkeleton)
        {
          for (int i = 0; i < model.boneCount - 1; i++)
          {
            if (!animPlaying || !animsCount.value.toBool())
            {
              rl.Core.DrawCube(model.bindPose[i].translation, 0.04, 0.04, 0.04, rl.Color.RED);

              if (model.bones[i].parent >= 0)
              {
                rl.Core.DrawLine3D(
                  model.bindPose[i].translation,
                  model.bindPose[model.bones[i].parent].translation,
                  rl.Color.RED
                );
              }
            }
            else
            {
              rl.Core.DrawCube(anims[animId].framePoses[animFrameCounter][i].translation, 0.05, 0.05, 0.05, rl.Color.RED);

              if (anims[animId].bones[i].parent >= 0)
              {
                rl.Core.DrawLine3D(
                  anims[animId].framePoses[animFrameCounter][i].translation,
                  anims[animId].framePoses[animFrameCounter][anims[animId].bones[i].parent].translation,
                  rl.Color.RED
                );
              }
            }
          }
        }

        rl.Core.DrawGrid(10, 1.0);

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "PRESS SPACE to PLAY MODEL ANIMATION".toC,
        10, rl.Core.GetScreenHeight() - 80, 10, rl.Color.MAROON
      );
      rl.Core.DrawText(
        "PRESS N to STEP ONE ANIMATION FRAME".toC,
        10, rl.Core.GetScreenHeight() - 60, 10, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "PRESS C to CYCLE THROUGH ANIMATIONS".toC,
        10, rl.Core.GetScreenHeight() - 40, 10, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "PRESS M to toggle MESH, B to toggle SKELETON DRAWING".toC,
        10, rl.Core.GetScreenHeight() - 20, 10, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "(c) CesiumMan model by KhronosGroup".toC,
        rl.Core.GetScreenWidth() - 210, rl.Core.GetScreenHeight() - 20, 10, rl.Color.GRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadModelAnimations(anims, animsCount.value);
  rl.Core.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}