// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_animation_gpu_skinning.c
// Run it: dart run models_animation_gpu_skinning.dart
// WARNING: expects resources from the raylib source

// WARNING: This example uses GPU skinning.
// It requires raylib to be built with `SUPPORT_GPU_SKINNING=1` (NOT the raylib default).
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_animation_gpu_skinning");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(5, 5, 5),
    target: .vec3(0, 1, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = LoadModel('../resources/models/gltf/greenman.glb');

  final skinningShader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/skinning.vs",
    "../resources/shaders/glsl$GLSL_VERSION/skinning.fs",
  );

  model.materials[1].shader = skinningShader;
    
  final anims = LoadModelAnimations("../resources/models/gltf/greenman.glb");

  int animIndex = 0;
  int animCurrentFrame = 0;

  while (!WindowShouldClose())
  {
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
  }

  UnloadModelAnimations(anims);
  UnloadModel(model);
  UnloadShader(skinningShader);
  
  CloseWindowAndDispose();
}