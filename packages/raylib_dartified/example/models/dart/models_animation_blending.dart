// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_animation_blending.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Camera3D camera;
late Model model;
late Vector3 position;
late Shader skinningShader;
late List<ModelAnimation> anims;

int currentAnimPlaying = 0;
int nextAnimToPlay = 1;
bool animTransition = false;
int animIndex0 = 10;
double animCurrentFrame0 = 0.0;
double animFrameSpeed0 = 0.5;
int animIndex1 = 6;
double animCurrentFrame1 = 0.0;
double animFrameSpeed1 = 0.5;
double animBlendFactor = 0.0;
double animBlendTime = 2.0;
double animBlendTimeCounter = 0.0;
bool animPause = false;
List<String> animNames = anims.map((a) => a.name).toList();
bool dropdownEditMode0 = false;
bool dropdownEditMode1 = false;
double animFrameProgress0 = 0.0;
double animFrameProgress1 = 0.0;
double animBlendProgress = 0.0;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "models_animation_blending");
    SetTargetFPS(60);

    camera = .new(
      position: .vec3(6.0, 6.0, 6.0),
      target: .vec3(0.0, 2.0, 0.0),
      up: .vec3(0.0, 1.0, 0.0),
      fovy: 45,
      projection: .CAMERA_PERSPECTIVE,
    );

    model = LoadModel("../resources/models/gltf/robot.glb");
    position = .vec3(0.0, 0.0, 0.0);

    // Load skinning shader
    // WARNING: It requires SUPPORT_GPU_SKINNING enabled on raylib (disabled by default)
    skinningShader = LoadShader(
      "../resources/shaders/glsl${Raylib.glslVersion}/skinning.vs",
      "../resources/shaders/glsl${Raylib.glslVersion}/skinning.fs"
    );

    // Assign skinning shader to all materials shaders
    // for (int i = 0; i < model.ref.materialCount; i++) model.ref.materials[i].shader = skinningShader;

    anims = LoadModelAnimations("../resources/models/gltf/robot.glb");
  },
  loop: (_) async {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    if (IsKeyPressed(.KEY_P)) animPause = !animPause;

    if (!animPause)
    {
      if (IsKeyPressed(.KEY_SPACE) && !animTransition)
      {
        if (currentAnimPlaying == 0)
        {
          nextAnimToPlay = 1;
          animCurrentFrame1 = 0.0;
        }
        else
        {
          nextAnimToPlay = 0;
          animCurrentFrame0 = 0.0;
        }

        animTransition = true;
        animBlendTimeCounter = 0.0;
        animBlendFactor = 0.0;
      }

      if (animTransition)
      {
        animCurrentFrame0 += animFrameSpeed0;
        if (animCurrentFrame0 >= anims[animIndex0].keyframeCount) animCurrentFrame0 = 0.0;
        animCurrentFrame1 += animFrameSpeed1;
        if (animCurrentFrame1 >= anims[animIndex1].keyframeCount) animCurrentFrame1 = 0.0;

        animBlendFactor = animBlendTimeCounter/animBlendTime;
        animBlendTimeCounter += GetFrameTime();
        animBlendProgress = animBlendFactor;

        if (nextAnimToPlay == 1)
        {
          UpdateModelAnimationEx(
            model, anims[animIndex0], animCurrentFrame0,
            anims[animIndex1], animCurrentFrame1, animBlendFactor
          );
        }
        else
        {
          UpdateModelAnimationEx(
            model, anims[animIndex1], animCurrentFrame1,
            anims[animIndex0], animCurrentFrame0, animBlendFactor
          );
        }

        if (animBlendFactor > 1.0)
        {
          if (currentAnimPlaying == 0) animCurrentFrame0 = 0.0;
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
          animCurrentFrame0 += animFrameSpeed0;
          if (animCurrentFrame0 >= anims[animIndex0].keyframeCount) animCurrentFrame0 = 0.0;
          UpdateModelAnimation(model, anims[animIndex0], animCurrentFrame0);
          // UpdateModelAnimationEx(model, anims[animIndex0], animCurrentFrame0,
          //    anims[animIndex1], animCurrentFrame1, 0.0);
        }
        else if (currentAnimPlaying == 1)
        {
          animCurrentFrame1 += animFrameSpeed1;
          if (animCurrentFrame1 >= anims[animIndex1].keyframeCount) animCurrentFrame1 = 0.0;
          UpdateModelAnimation(model, anims[animIndex1], animCurrentFrame1);
          // UpdateModelAnimationEx(model, anims[animIndex0], animCurrentFrame0,
          //    anims[animIndex1], animCurrentFrame1, 1.0);
        }
      }
    }

    animFrameProgress0 = animCurrentFrame0;
    animFrameProgress1 = animCurrentFrame1;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera);

        DrawModel(model, position, 1.0, WHITE);

        DrawGrid(10, 1.0);

      EndMode3D();

      if (animTransition) DrawText("ANIM TRANSITION BLENDING!", 170, 50, 30, BLUE);

      if (dropdownEditMode0) GuiDisable();
      {
        final (_, value) = GuiSlider(
          .rect(10, 38, 160, 12),
          null, animFrameSpeed0.f1,
          animFrameSpeed0, 0.1, 2.0
        );
        animFrameSpeed0 = value;
      }
      GuiEnable();
      if (dropdownEditMode1) GuiDisable();
      {
        final (_, value) = GuiSlider(
          .rect(GetScreenWidth() - 170.0, 38, 160, 12),
          "${animFrameSpeed1.f1}x", null,
          animFrameSpeed1, 0.1, 2.0
        );
        animFrameSpeed1 = value;
      }
      GuiEnable();

      GuiSetStyle(.DROPDOWNBOX, GuiDropdownBoxProperty.DROPDOWN_ITEMS_SPACING, 1);
      {
        final (result, active) = GuiDropdownBox(
          .rect(10, 10, 160, 24),
          animNames.join(';'),
          animIndex0, dropdownEditMode0
        );
        animIndex0 = active;
        if (result != .RESULT_NONE) dropdownEditMode0 = !dropdownEditMode0;
      }

      if (nextAnimToPlay == 1) GuiSetStyle(.PROGRESSBAR, GuiProgressBarProperty.PROGRESS_SIDE, 0);
      else GuiSetStyle(.PROGRESSBAR, GuiProgressBarProperty.PROGRESS_SIDE, 1);
      {
        final (_, value) = GuiProgressBar(
          .rect(180, 14, 440, 16),
          null, null,
          animBlendProgress, 0.0, 1.0
        );
        animBlendProgress = value;
      }
      GuiSetStyle(.PROGRESSBAR, GuiProgressBarProperty.PROGRESS_SIDE, 0);
      {
        final (result, active) = GuiDropdownBox(
          .rect(GetScreenWidth() - 170.0, 10, 160, 24),
          animNames.join(';'),
          animIndex1, dropdownEditMode1
        );
        animIndex1 = active;
        if (result != .RESULT_NONE) dropdownEditMode1 = !dropdownEditMode1;
      }

      GuiProgressBar(
        .rect(60, GetScreenHeight() - 60.0, GetScreenWidth() - 180.0, 20),
        "ANIM 0", "FRAME: ${animFrameProgress0.f2} / ${anims[animIndex0].keyframeCount}",
        animFrameProgress0, 0.0, anims[animIndex0].keyframeCount.toDouble()
      );
      for (int i = 0; i < anims[animIndex0].keyframeCount; i++)
        DrawRectangle(
          60 + (((GetScreenWidth() - 180)/anims[animIndex0].keyframeCount)*i).toInt(),
          GetScreenHeight() - 60, 1, 20, BLUE
        );

      GuiProgressBar(
        .rect(60, GetScreenHeight() - 30.0, GetScreenWidth() - 180.0, 20),
        "ANIM 1", "FRAME: ${animFrameProgress1.f2} / ${anims[animIndex1].keyframeCount}",
        animFrameProgress1, 0.0, anims[animIndex1].keyframeCount.toDouble()
      );
      for (int i = 0; i < anims[animIndex1].keyframeCount; i++)
        DrawRectangle(
          60 + (((GetScreenWidth() - 180)/anims[animIndex1].keyframeCount)*i).toInt(),
          GetScreenHeight() - 30, 1, 20, BLUE
        );

    EndDrawing();
  },
  close: (_) {
    UnloadModelAnimations(anims);
    UnloadModel(model);
    UnloadShader(skinningShader);
    CloseWindow();
  },
);