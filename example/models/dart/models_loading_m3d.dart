// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_m3d.c
// Run it: dart run models_loading_m3d.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_loading_m3d");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = Camera3DD(
    position: .vec3(1.5, 1.5, 1.5),
    target: .vec3(0, 0.4, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final Vector3D position = .zero();

  final modelFileName = "../resources/models/m3d/cesium_man.m3d";
  bool drawMesh = true;
  bool drawSkeleton = true;
  bool animPlaying = false;

  final model = rl.CoreD.LoadModel(modelFileName);

  int animFrameCounter = 0, animId = 0;
  final anims = rl.CoreD.LoadModelAnimations(modelFileName);

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_FIRST_PERSON);

    if (anims.isNotEmpty)
    {
      if (rl.CoreD.IsKeyDown(.KEY_SPACE) || rl.CoreD.IsKeyPressed(.KEY_N))
      {
        animFrameCounter++;

        if (animFrameCounter >= anims[animId].frameCount) animFrameCounter = 0;

        rl.CoreD.UpdateModelAnimation(model, anims[animId], animFrameCounter);
        animPlaying = true;
      }

      if (rl.CoreD.IsKeyPressed(.KEY_C))
      {
        animFrameCounter = 0;
        animId++;

        if (animId >= anims.length) animId = 0;
        rl.CoreD.UpdateModelAnimation(model, anims[animId], 0);
        animPlaying = true;
      }
    }

    if (rl.CoreD.IsKeyPressed(.KEY_B)) drawSkeleton = !drawSkeleton;

    if (rl.CoreD.IsKeyPressed(.KEY_M)) drawMesh = !drawMesh;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        if (drawMesh) rl.CoreD.DrawModel(model, position, 1.0, .WHITE);

        if (drawSkeleton)
        {
          for (int i = 0; i < model.boneCount - 1; i++)
          {
            if (!animPlaying || anims.isEmpty)
            {
              rl.CoreD.DrawCube(model.bindPose[i].translation, 0.04, 0.04, 0.04, .RED);

              if (model.bones[i].parent >= 0)
              {
                rl.CoreD.DrawLine3D(
                  model.bindPose[i].translation,
                  model.bindPose[model.bones[i].parent].translation,
                  .RED
                );
              }
            }
            else
            {
              rl.CoreD.DrawCube(anims[animId].framePoses[animFrameCounter][i].translation, 0.05, 0.05, 0.05, .RED);

              if (anims[animId].bones[i].parent >= 0)
              {
                rl.CoreD.DrawLine3D(
                  anims[animId].framePoses[animFrameCounter][i].translation,
                  anims[animId].framePoses[animFrameCounter][anims[animId].bones[i].parent].translation,
                  .RED
                );
              }
            }
          }
        }

        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "PRESS SPACE to PLAY MODEL ANIMATION",
        10, rl.CoreD.GetScreenHeight() - 80, 10, .MAROON
      );
      rl.CoreD.DrawText(
        "PRESS N to STEP ONE ANIMATION FRAME",
        10, rl.CoreD.GetScreenHeight() - 60, 10, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "PRESS C to CYCLE THROUGH ANIMATIONS",
        10, rl.CoreD.GetScreenHeight() - 40, 10, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "PRESS M to toggle MESH, B to toggle SKELETON DRAWING",
        10, rl.CoreD.GetScreenHeight() - 20, 10, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "(c) CesiumMan model by KhronosGroup",
        rl.CoreD.GetScreenWidth() - 210, rl.CoreD.GetScreenHeight() - 20, 10, .GRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadModelAnimations(anims);
  rl.CoreD.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}