// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_iqm.c
// Run it: dart run models_loading_iqm.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_loading_iqm");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(10.0, 10.0, 10.0),
    target: .vec3(0.0, 4.0, 0.0),
    up: .vec3(0.0, 1.0, 0.0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = LoadModel("../resources/models/iqm/guy.iqm");
  final texture = LoadTexture("../resources/models/iqm/guytex.png");
  SetMaterialTexture(model.materials[0], MATERIAL_MAP_DIFFUSE, texture);
  final Vector3D position = .zero();

  final anims = LoadModelAnimations("../resources/models/iqm/guyanim.iqm");

  int animIndex = 0;
  double animCurrentFrame = 0.0;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    animCurrentFrame += 1.0;
    UpdateModelAnimation(model, anims[animIndex], animCurrentFrame);
    if (animCurrentFrame >= anims[animIndex].keyframeCount) animCurrentFrame = 0;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera);

        DrawModelEx(
          model,
          position,
          .vec3(1.0, 0.0, 0.0),
          -90.0,
          .vec3(1.0, 1.0, 1.0),
          WHITE
        );

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText("Current animation: ${anims[animIndex].name}", 10, 10, 20, MAROON);
      DrawText("(c) Guy IQM 3D model by @culacant", screenWidth - 200, screenHeight - 20, 10, GRAY);

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadModelAnimations(anims);
  UnloadModel(model);

  CloseWindowAndDispose();
}