// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_animation_timing.c
// Run it: dart run models_animation_timing.dart
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

  InitWindow(screenWidth, screenHeight, "models_animation_timing".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(6, 6, 6);
  camera.ref.target.set(0, 2, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = LoadModel("../resources/models/gltf/robot.glb".toC);
  final position = Vector3$.val.At('position');

  final animCount = Int$.val.At('animCount');
  final anims = LoadModelAnimations("../resources/models/gltf/robot.glb".toC, animCount);

  final animIndex = Int$.val.Value(10, 'animIndex');
  double animCurrentFrame = 0.0;
  final animFrameSpeed = Float32$.val.Value(0.5, 'animFrameSpeed');
  bool animPause = false;

  final List<String> animNames = .generate(animCount.value, (i) => anims[i].nameString);

  bool dropdownEditMode = false;
  final animFrameProgress = Float32$.val.At('animFrameProgress');

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (IsKeyPressed(KeyboardKey.KEY_P.value)) animPause = !animPause;

    if (!animPause && (animIndex.value < animCount.value))
    {
      animCurrentFrame += animFrameSpeed.value;
      if (animCurrentFrame >= anims[animIndex.value].keyframeCount) animCurrentFrame = 0.0;
      UpdateModelAnimation(model, anims[animIndex.value], animCurrentFrame);
    }

    animFrameProgress.value = animCurrentFrame;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawModel(model, position.ref, 1.0, WHITE);

        DrawGrid(10, 1.0);

      EndMode3D();

      GuiSetStyle(
        GuiControl.DROPDOWNBOX.value,
        GuiDropdownBoxProperty.DROPDOWN_ITEMS_SPACING.value,
        1
      );

      if (GuiDropdownBox(
        Rectangle$.val.$1.set(10, 10, 140, 24),
        animNames.join(';').toC,
        animIndex,
        dropdownEditMode
      ) != 0) dropdownEditMode = !dropdownEditMode;

      GuiSlider(
        Rectangle$.val.$1.set(260, 10, 500, 24),
        "FRAME SPEED: ".toC,
        animFrameSpeed.value.f1.toC,
        animFrameSpeed,
        0.1,
        2.0
      );

      GuiLabel(
        Rectangle$.val.$1.set(10, GetScreenHeight() - 64.0, GetScreenWidth() - 20.0, 24),
        "CURRENT FRAME: ${animFrameProgress.value.f2} / ${anims[animIndex.value].keyframeCount}".toC
      );

      GuiProgressBar(
        Rectangle$.val.$1.set(10, GetScreenHeight() - 40.0, GetScreenWidth() - 20.0, 24),
        nullptr,
        nullptr,
        animFrameProgress,
        0.0,
        anims[animIndex.value].keyframeCount.toDouble(),
      );

      for (int i = 0; i < anims[animIndex.value].keyframeCount; i++) {
        DrawRectangle(
          (10 + (((GetScreenWidth() - 20)/anims[animIndex.value].keyframeCount)*i)).toInt(),
          GetScreenHeight() - 40, 1, 24,
          BLUE
        );
      }

    EndDrawing();
  }

  UnloadModelAnimations(anims, animCount.value);
  UnloadModel(model);
  
  CloseWindowAndDispose();
}