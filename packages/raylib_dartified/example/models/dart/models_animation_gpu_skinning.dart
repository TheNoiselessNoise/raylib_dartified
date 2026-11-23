// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_animation_gpu_skinning.c
// WARNING: expects resources from the raylib source

// WARNING: This example uses GPU skinning.
// It requires raylib to be built with `SUPPORT_GPU_SKINNING=1` (NOT the raylib default).
// And [RaylibConfig.SUPPORT_GPU_SKINNING] to be set to `true` before loading Raylib.
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Camera3D camera;
late Model model;
late Shader skinningShader;
late List<ModelAnimation> anims;
int animIndex = 0;
int animCurrentFrame = 0;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "models_animation_gpu_skinning");
    SetTargetFPS(60);

    camera = .new(
      position: .vec3(5, 5, 5),
      target: .vec3(0, 1, 0),
      up: .vec3(0, 1, 0),
      fovy: 45,
      projection: .CAMERA_PERSPECTIVE,
    );

    model = LoadModel('../resources/models/gltf/greenman.glb');

    skinningShader = LoadShader(
      "../resources/shaders/glsl${Raylib.glslVersion}/skinning.vs",
      "../resources/shaders/glsl${Raylib.glslVersion}/skinning.fs",
    );

    model.materials[1].shader = skinningShader;
      
    anims = LoadModelAnimations("../resources/models/gltf/greenman.glb");
  },
  loop: (_) async {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    if (IsKeyPressed(.KEY_RIGHT)) 
      animIndex = (animIndex + 1) % anims.length;
    else if (IsKeyPressed(.KEY_LEFT)) 
      animIndex = (animIndex + anims.length - 1) % anims.length;

    animCurrentFrame = (animCurrentFrame + 1)%anims[animIndex].keyframeCount;
    UpdateModelAnimation(model, anims[animIndex], animCurrentFrame);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawModel(model, .zero(), 1, .WHITE);
        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "Current animation: $animIndex [Frame: $animCurrentFrame]",
        10, 40, 20, .MAROON
      );

      DrawText(
        "Use the LEFT/RIGHT to switch animation",
        10, 10, 20, .GRAY
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