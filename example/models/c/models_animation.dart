// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_animation.c
// Run it: dart run models_animation.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int WORLD_SIZE = 8;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_animation".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(10, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = rl.Core.LoadModel("../resources/models/iqm/guy.iqm".toC);
  final texture = rl.Core.LoadTexture("../resources/models/iqm/guytex.png".toC);
  rl.Core.SetMaterialTexture(model.materials + 0, rl.MATERIAL_MAP_DIFFUSE.value, texture);

  final position = rl.Temp.Vector3$.At('position').set(0.0, 0.0, 0.0);

  final animsCount = rl.Temp.Int$.At('animsCount');
  final anims = rl.Core.LoadModelAnimations("../resources/models/iqm/guyanim.iqm".toC, animsCount);
  int animFrameCounter = 0;

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_SPACE.value))
    {
      animFrameCounter++;
      rl.Core.UpdateModelAnimation(model, anims[0], animFrameCounter);
      if (animFrameCounter >= anims[0].frameCount) animFrameCounter = 0;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawModelEx(
          model,
          position.ref,
          rl.Temp.vec31(1.0, 0.0, 0.0),
          -90.0,
          rl.Temp.vec32(1.0, 1.0, 1.0),
          rl.Color.WHITE
        );

        for (int i = 0; i < model.boneCount; i++)
        {
          rl.Core.DrawCube(anims[0].framePoses[animFrameCounter][i].translation, 0.2, 0.2, 0.2, rl.Color.RED);
        }

        rl.Core.DrawGrid(10, 1.0);

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "PRESS SPACE to PLAY MODEL ANIMATION".toC,
        10, 10, 20, rl.Color.MAROON
      );
      rl.Core.DrawText(
        "(c) Guy IQM 3D model by @culacant".toC,
        screenWidth - 200, screenHeight - 20, 10, rl.Color.GRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texture);
  rl.Core.UnloadModelAnimations(anims, animsCount.value);
  rl.Core.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}