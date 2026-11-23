// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_m3d.c
// WARNING: expects resources from the raylib source

// WARNING: This example uses CPU skinning.
// It requires raylib to be built with `SUPPORT_GPU_SKINNING=0` (the raylib default).
// If your raylib build has SUPPORT_GPU_SKINNING=1, the model will render frozen in
// bind pose with no errors.
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Camera3D camera;
late Vector3 position;
final modelFileName = "../resources/models/m3d/cesium_man.m3d";
bool drawMesh = true;
bool drawSkeleton = true;
bool animPlaying = false;
late Model model;
int animFrameCounter = 0;
int animId = 0;
late List<ModelAnimation> anims;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "models_loading_m3d");
    SetTargetFPS(60);
    DisableCursor();

    camera = .new(
      position: .vec3(1.5, 1.5, 1.5),
      target: .vec3(0, 0.4, 0),
      up: .vec3(0, 1, 0),
      fovy: 45,
      projection: .CAMERA_PERSPECTIVE,
    );

    position = .zero();
    model = LoadModel(modelFileName);
    anims = LoadModelAnimations(modelFileName);
  },
  loop: (_) async {
    UpdateCamera(camera, .CAMERA_FIRST_PERSON);

    if (anims.isNotEmpty)
    {
      if (IsKeyDown(.KEY_SPACE) || IsKeyPressed(.KEY_N))
      {
        animFrameCounter++;

        if (animFrameCounter >= anims[animId].keyframeCount) animFrameCounter = 0;

        UpdateModelAnimation(model, anims[animId], animFrameCounter);
        animPlaying = true;
      }

      if (IsKeyPressed(.KEY_C))
      {
        animFrameCounter = 0;
        animId++;

        if (animId >= anims.length) animId = 0;
        UpdateModelAnimation(model, anims[animId], 0);
        animPlaying = true;
      }
    }

    if (IsKeyPressed(.KEY_B)) drawSkeleton = !drawSkeleton;

    if (IsKeyPressed(.KEY_M)) drawMesh = !drawMesh;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        if (drawMesh) DrawModel(model, position, 1.0, .WHITE);

        if (drawSkeleton)
        {
          for (int i = 0; i < model.skeleton.boneCount - 1; i++)
          {
            if (!animPlaying || anims.isEmpty)
            {
              DrawCube(model.skeleton.bindPose[i].translation, 0.04, 0.04, 0.04, .RED);

              if (model.skeleton.bones[i].parent >= 0)
              {
                DrawLine3D(
                  model.skeleton.bindPose[i].translation,
                  model.skeleton.bindPose[model.skeleton.bones[i].parent].translation,
                  .RED
                );
              }
            }
            else
            {
              DrawCube(anims[animId].keyframePoses[animFrameCounter][i].translation, 0.05, 0.05, 0.05, .RED);

              if (model.skeleton.bones[i].parent >= 0)
              {
                DrawLine3D(
                  anims[animId].keyframePoses[animFrameCounter][i].translation,
                  anims[animId].keyframePoses[animFrameCounter][model.skeleton.bones[i].parent].translation,
                  .RED
                );
              }
            }
          }
        }

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "PRESS SPACE to PLAY MODEL ANIMATION",
        10, GetScreenHeight() - 80, 10, .MAROON
      );
      DrawText(
        "PRESS N to STEP ONE ANIMATION FRAME",
        10, GetScreenHeight() - 60, 10, .DARKGRAY
      );
      DrawText(
        "PRESS C to CYCLE THROUGH ANIMATIONS",
        10, GetScreenHeight() - 40, 10, .DARKGRAY
      );
      DrawText(
        "PRESS M to toggle MESH, B to toggle SKELETON DRAWING",
        10, GetScreenHeight() - 20, 10, .DARKGRAY
      );
      DrawText(
        "(c) CesiumMan model by KhronosGroup",
        GetScreenWidth() - 210, GetScreenHeight() - 20, 10, .GRAY
      );

    EndDrawing();
  },
  close: (_) {
    UnloadModelAnimations(anims);
    UnloadModel(model);
    CloseWindow();
  },
);