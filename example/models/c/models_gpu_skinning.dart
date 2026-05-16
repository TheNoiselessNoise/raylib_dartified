// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_gpu_skinning.c
// Run it: dart run models_gpu_skinning.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_gpu_skinning".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(5, 5, 5);
  camera.ref.target.set(0, 2, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final characterModel = rl.Core.LoadModel('../resources/models/gltf/greenman.glb'.toC);

  final skinningShader = rl.Core.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/skinning.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/skinning.fs".toC,
  );

  characterModel.materials[1].shader = skinningShader;
    
  final animsCount = rl.Temp.Int$.At('animsCount');
  int animIndex = 0;
  int animCurrentFrame = 0;
  final modelAnimations = rl.Core.LoadModelAnimations(
    "../resources/models/gltf/greenman.glb".toC,
    animsCount
  );

  final position = rl.Temp.Vector3$.At('position');

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_THIRD_PERSON.value);

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_T.value)) 
      animIndex = (animIndex + 1) % animsCount.value;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_G.value)) 
      animIndex = (animIndex + animsCount.value - 1) % animsCount.value;

    final anim = modelAnimations[animIndex];
    animCurrentFrame = (animCurrentFrame + 1)%anim.frameCount;
    characterModel.transform.setD(rl.Matrix.MatrixTranslate(position.ref.x, position.ref.y, position.ref.z));
    rl.Core.UpdateModelAnimationBones(characterModel, anim, animCurrentFrame);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawMesh(characterModel.meshes[0], characterModel.materials[1], characterModel.transform);
        rl.Core.DrawGrid(10, 1.0);

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Use the T/G to switch animation".toC,
        10, 10, 20, rl.Color.GRAY
      );

      rl.Core.DrawText(
        "Current animation: $animIndex [Frame: $animCurrentFrame]".toC,
        10, 30, 20, rl.Color.GRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadModelAnimations(modelAnimations, animsCount.value);
  rl.Core.UnloadModel(characterModel);
  rl.Core.UnloadShader(skinningShader);
  
  rl.CloseWindowAndDispose();
}