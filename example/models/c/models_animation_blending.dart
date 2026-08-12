// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_animation_blending.c
// Run it: dart run models_animation_blending.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_animation_blending".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(6.0, 6.0, 6.0);
  camera.ref.target.set(0.0, 2.0, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = Model$.val.RawValueUnique(LoadModel("../resources/models/gltf/robot.glb".toC));
  final position = Vector3$.val.$new.set(0.0, 0.0, 0.0);

  // Load skinning shader
  // WARNING: It requires SUPPORT_GPU_SKINNING enabled on raylib (disabled by default)
  // final skinningShader = LoadShader(
  //   "../resources/shaders/glsl$GLSL_VERSION/skinning.vs".toC,
  //   "../resources/shaders/glsl$GLSL_VERSION/skinning.fs".toC
  // );

  // Assign skinning shader to all materials shaders
  // for (int i = 0; i < model.ref.materialCount; i++) model.ref.materials[i].shader = skinningShader;

  final animCount = Int$.val.$newPtr;
  final anims = LoadModelAnimations("../resources/models/gltf/robot.glb".toC, animCount);

  int currentAnimPlaying = 0;
  int nextAnimToPlay = 1;
  bool animTransition = false;

  final animIndex0 = Int$.val.ValueUnique(10);
  final animCurrentFrame0 = Float32$.val.ValueUnique(0.0);
  final animFrameSpeed0 = Float32$.val.ValueUnique(0.5);
  final animIndex1 = Int$.val.ValueUnique(6);
  double animCurrentFrame1 = 0.0;
  final animFrameSpeed1 = Float32$.val.ValueUnique(0.5);

  double animBlendFactor = 0.0;

  double animBlendTime = 2.0;
  double animBlendTimeCounter = 0.0;

  bool animPause = false;

  List<String> animNames = [];
  for (int i = 0; i < animCount.value; i++) animNames.add(anims[i].nameString);

  bool dropdownEditMode0 = false;
  bool dropdownEditMode1 = false;
  final animFrameProgress0 = Float32$.val.ValueUnique(0.0);
  final animFrameProgress1 = Float32$.val.ValueUnique(0.0);
  final animBlendProgress = Float32$.val.ValueUnique(0.0);

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (IsKeyPressed(KeyboardKey.KEY_P.value)) animPause = !animPause;

    if (!animPause)
    {
      if (IsKeyPressed(KeyboardKey.KEY_SPACE.value) && !animTransition)
      {
        if (currentAnimPlaying == 0)
        {
          nextAnimToPlay = 1;
          animCurrentFrame1 = 0.0;
        }
        else
        {
          nextAnimToPlay = 0;
          animCurrentFrame0.value = 0.0;
        }

        animTransition = true;
        animBlendTimeCounter = 0.0;
        animBlendFactor = 0.0;
      }

      if (animTransition)
      {
        animCurrentFrame0.value += animFrameSpeed0.value;
        if (animCurrentFrame0.value >= anims[animIndex0.value].keyframeCount) animCurrentFrame0.value = 0.0;
        animCurrentFrame1 += animFrameSpeed1.value;
        if (animCurrentFrame1 >= anims[animIndex1.value].keyframeCount) animCurrentFrame1 = 0.0;

        animBlendFactor = animBlendTimeCounter/animBlendTime;
        animBlendTimeCounter += GetFrameTime();
        animBlendProgress.value = animBlendFactor;

        if (nextAnimToPlay == 1)
        {
          UpdateModelAnimationEx(
            model.ref, anims[animIndex0.value], animCurrentFrame0.value,
            anims[animIndex1.value], animCurrentFrame1, animBlendFactor
          );
        }
        else
        {
          UpdateModelAnimationEx(
            model.ref, anims[animIndex1.value], animCurrentFrame1,
            anims[animIndex0.value], animCurrentFrame0.value, animBlendFactor
          );
        }

        if (animBlendFactor > 1.0)
        {
          if (currentAnimPlaying == 0) animCurrentFrame0.value = 0.0;
          else if (currentAnimPlaying == 1) animCurrentFrame1 = 0.0;
          currentAnimPlaying = nextAnimToPlay;

          animBlendFactor = 0.0;
          animTransition = false;
          animBlendTimeCounter = 0.0;
        }
      }
      else
      {
        if (currentAnimPlaying == 0)
        {
          animCurrentFrame0.value += animFrameSpeed0.value;
          if (animCurrentFrame0.value >= anims[animIndex0.value].keyframeCount) animCurrentFrame0.value = 0.0;
          UpdateModelAnimation(model.ref, anims[animIndex0.value], animCurrentFrame0.value);
          // UpdateModelAnimationEx(model.ref, anims[animIndex0.value], animCurrentFrame0.value,
          //    anims[animIndex1.value], animCurrentFrame1, 0.0);
        }
        else if (currentAnimPlaying == 1)
        {
          animCurrentFrame1 += animFrameSpeed1.value;
          if (animCurrentFrame1 >= anims[animIndex1.value].keyframeCount) animCurrentFrame1 = 0.0;
          UpdateModelAnimation(model.ref, anims[animIndex1.value], animCurrentFrame1);
          // UpdateModelAnimationEx(model.ref, anims[animIndex0.value], animCurrentFrame0.value,
          //    anims[animIndex1.value], animCurrentFrame1, 1.0);
        }
      }
    }

    animFrameProgress0.value = animCurrentFrame0.value;
    animFrameProgress1.value = animCurrentFrame1;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawModel(model.ref, position, 1.0, WHITE);

        DrawGrid(10, 1.0);

      EndMode3D();

      if (animTransition) DrawText("ANIM TRANSITION BLENDING!".toC, 170, 50, 30, BLUE);

      if (dropdownEditMode0) GuiDisable();
      GuiSlider(
        Rectangle$.val.$1.set(10, 38, 160, 12),
        nullptr, animFrameSpeed0.value.f1.toC,
        animFrameSpeed0, 0.1, 2.0
      );
      GuiEnable();
      if (dropdownEditMode1) GuiDisable();
      GuiSlider(
        Rectangle$.val.$1.set(GetScreenWidth() - 170.0, 38, 160, 12),
        "${animFrameSpeed1.value.f1}x".toC, nullptr,
        animFrameSpeed1, 0.1, 2.0
      );
      GuiEnable();

      GuiSetStyle(GuiControl.DROPDOWNBOX.value, GuiDropdownBoxProperty.DROPDOWN_ITEMS_SPACING.value, 1);
      if (GuiDropdownBox(
        Rectangle$.val.$1.set(10, 10, 160, 24),
        animNames.join(';').toC,
        animIndex0, dropdownEditMode0
      ).toBool()) dropdownEditMode0 = !dropdownEditMode0;

      if (nextAnimToPlay == 1) GuiSetStyle(GuiControl.PROGRESSBAR.value, GuiProgressBarProperty.PROGRESS_SIDE.value, 0);
      else GuiSetStyle(GuiControl.PROGRESSBAR.value, GuiProgressBarProperty.PROGRESS_SIDE.value, 1);
      GuiProgressBar(
        Rectangle$.val.$1.set(180, 14, 440, 16),
        nullptr, nullptr,
        animBlendProgress, 0.0, 1.0
      );
      GuiSetStyle(GuiControl.PROGRESSBAR.value, GuiProgressBarProperty.PROGRESS_SIDE.value, 0);

      if (GuiDropdownBox(
        Rectangle$.val.$1.set(GetScreenWidth() - 170.0, 10, 160, 24),
        animNames.join(';').toC,
        animIndex1, dropdownEditMode1
      ).toBool()) dropdownEditMode1 = !dropdownEditMode1;

      GuiProgressBar(
        Rectangle$.val.$1.set(60, GetScreenHeight() - 60.0, GetScreenWidth() - 180.0, 20),
        "ANIM 0".toC, "FRAME: ${animFrameProgress0.value.f2} / ${anims[animIndex0.value].keyframeCount}".toC,
        animFrameProgress0, 0.0, anims[animIndex0.value].keyframeCount.toDouble()
      );
      for (int i = 0; i < anims[animIndex0.value].keyframeCount; i++)
        DrawRectangle(
          60 + (((GetScreenWidth() - 180)/anims[animIndex0.value].keyframeCount)*i).toInt(),
          GetScreenHeight() - 60, 1, 20, BLUE
        );

      GuiProgressBar(
        Rectangle$.val.$1.set(60, GetScreenHeight() - 30.0, GetScreenWidth() - 180.0, 20),
        "ANIM 1".toC, "FRAME: ${animFrameProgress1.value.f2} / ${anims[animIndex1.value].keyframeCount}".toC,
        animFrameProgress1, 0.0, anims[animIndex1.value].keyframeCount.toDouble()
      );
      for (int i = 0; i < anims[animIndex1.value].keyframeCount; i++)
        DrawRectangle(
          60 + (((GetScreenWidth() - 180)/anims[animIndex1.value].keyframeCount)*i).toInt(),
          GetScreenHeight() - 30, 1, 20, BLUE
        );

    EndDrawing();
  }

  UnloadModelAnimations(anims, animCount.value);
  UnloadModel(model.ref);
  // UnloadShader(skinningShader);
  
  CloseWindowAndDispose();
}