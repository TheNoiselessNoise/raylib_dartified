// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_animation.c
// Run it: dart run models_animation.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int WORLD_SIZE = 8;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_animation");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = Camera3DD(
    position: .vec3(10, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = rl.CoreD.LoadModel("../resources/models/iqm/guy.iqm");
  final texture = rl.CoreD.LoadTexture("../resources/models/iqm/guytex.png");
  rl.CoreD.SetMaterialTexture(model.materials[0], rl.MATERIAL_MAP_DIFFUSE, texture);

  final Vector3D position = .zero();

  final anims = rl.CoreD.LoadModelAnimations("../resources/models/iqm/guyanim.iqm");
  int animFrameCounter = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_FIRST_PERSON);

    if (rl.CoreD.IsKeyDown(.KEY_SPACE))
    {
      animFrameCounter++;
      rl.CoreD.UpdateModelAnimation(model, anims[0], animFrameCounter);
      if (animFrameCounter >= anims[0].frameCount) animFrameCounter = 0;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawModelEx(
          model,
          position,
          .vec3(1.0, 0.0, 0.0),
          -90.0,
          .vec3(1.0, 1.0, 1.0),
          .WHITE
        );

        for (int i = 0; i < model.boneCount; i++)
        {
          rl.CoreD.DrawCube(anims[0].framePoses[animFrameCounter][i].translation, 0.2, 0.2, 0.2, .RED);
        }

        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "PRESS SPACE to PLAY MODEL ANIMATION",
        10, 10, 20, .MAROON
      );
      rl.CoreD.DrawText(
        "(c) Guy IQM 3D model by @culacant",
        screenWidth - 200, screenHeight - 20, 10, .GRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadModelAnimations(anims);
  rl.CoreD.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}