// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_animation_gpu_skinning.c
// Run it: dart run models_animation_gpu_skinning.dart
// WARNING: expects resources from the raylib source

// WARNING: This example uses GPU skinning.
// It requires raylib to be built with `SUPPORT_GPU_SKINNING=1` (NOT the raylib default).
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_animation_gpu_skinning".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(5, 5, 5);
  camera.ref.target.set(0, 1, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = LoadModel('../resources/models/gltf/greenman.glb'.toC);

  final skinningShader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/skinning.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/skinning.fs".toC,
  );

  model.materials[1].shader = skinningShader;
    
  final animCount = Int$.val.At('animCount');
  final anims = LoadModelAnimations(
    "../resources/models/gltf/greenman.glb".toC,
    animCount
  );

  int animIndex = 0;
  int animCurrentFrame = 0;

  final position = Vector3$.val.At('position');

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) 
      animIndex = (animIndex + 1) % animCount.value;
    else if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) 
      animIndex = (animIndex + animCount.value - 1) % animCount.value;

    animCurrentFrame = (animCurrentFrame + 1)%anims[animIndex].keyframeCount;
    UpdateModelAnimation(model, anims[animIndex], animCurrentFrame.toDouble());

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawModel(model, position.ref, 1, WHITE);
        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "Current animation: $animIndex [Frame: $animCurrentFrame]".toC,
        10, 40, 20, MAROON
      );

      DrawText(
        "Use the LEFT/RIGHT to switch animation".toC,
        10, 10, 20, GRAY
      );

    EndDrawing();
  }

  UnloadModelAnimations(anims, animCount.value);
  UnloadModel(model);
  UnloadShader(skinningShader);
  
  CloseWindowAndDispose();
}