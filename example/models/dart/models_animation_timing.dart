// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_animation_timing.c
// Run it: dart run models_animation_timing.dart
// WARNING: expects resources from the raylib source

// WARNING: This example uses CPU skinning.
// It requires raylib to be built with `SUPPORT_GPU_SKINNING=0` (the raylib default).
// If your raylib build has SUPPORT_GPU_SKINNING=1, the model will render frozen in
// bind pose with no errors.
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_animation_timing");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(6, 6, 6),
    target: .vec3(0, 2, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = LoadModel("../resources/models/gltf/robot.glb");

  final anims = LoadModelAnimations("../resources/models/gltf/robot.glb");

  int animIndex = 10;
  double animCurrentFrame = 0.0;
  double animFrameSpeed = 0.5;
  bool animPause = false;

  final animNames = anims.map((a) => a.name);

  bool dropdownEditMode = false;
  double animFrameProgress = 0;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    if (IsKeyPressed(.KEY_P)) animPause = !animPause;

    final anim = anims[animIndex];

    if (!animPause)
    {
      animCurrentFrame += animFrameSpeed;
      if (animCurrentFrame >= anim.keyframeCount) animCurrentFrame = 0.0;
      UpdateModelAnimation(model, anim, animCurrentFrame);
    }

    animFrameProgress = animCurrentFrame;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawModel(model, .zero(), 1.0, .WHITE);

        DrawGrid(10, 1.0);

      EndMode3D();

      GuiSetStyle(.DROPDOWNBOX, GuiDropdownBoxProperty.DROPDOWN_ITEMS_SPACING, 1);

      {
        final (result, active) = GuiDropdownBox(
          .rect(10, 10, 140, 24),
          animNames.join(';'),
          animIndex,
          dropdownEditMode
        );
        animIndex = active;
        if (result != 0) dropdownEditMode = !dropdownEditMode;
      }

      {
        final (result, value) = GuiSlider(
          .rect(260, 10, 500, 24),
          "FRAME SPEED: ",
          animFrameSpeed.f1,
          animFrameSpeed,
          0.1,
          2.0
        );
        if (result != 0) animFrameSpeed = value;
      }

      GuiLabel(
        .rect(10, GetScreenHeight() - 64.0, GetScreenWidth() - 20.0, 24),
        "CURRENT FRAME: ${animFrameProgress.f2} / ${anim.keyframeCount}"
      );

      {
        final (result, value) = GuiProgressBar(
          .rect(10, GetScreenHeight() - 40.0, GetScreenWidth() - 20.0, 24),
          null,
          null,
          animFrameProgress,
          0.0,
          anim.keyframeCount,
        );
        if (result != 0) animFrameProgress = value;
      }

      for (int i = 0; i < anim.keyframeCount; i++) {
        DrawRectangle(
          (10 + (((GetScreenWidth() - 20)/anim.keyframeCount)*i)).toInt(),
          GetScreenHeight() - 40, 1, 24,
          .BLUE
        );
      }

    EndDrawing();
  }

  UnloadModelAnimations(anims);
  UnloadModel(model);
  
  CloseWindowAndDispose();
}