// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_gpu_skinning.c
// Run it: dart run models_gpu_skinning.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_gpu_skinning");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = CameraD(
    position: .vec3(5, 5, 5),
    target: .vec3(0, 2, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final characterModel = rl.CoreD.LoadModel('../resources/models/gltf/greenman.glb');

  final skinningShader = rl.CoreD.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/skinning.vs",
    "../resources/shaders/glsl$GLSL_VERSION/skinning.fs"
  );

  characterModel.materials[1].shader = skinningShader;
    
  int animIndex = 0;
  int animCurrentFrame = 0;
  final modelAnimations = rl.CoreD.LoadModelAnimations("../resources/models/gltf/greenman.glb");
  final animsCount = modelAnimations.length;

  final Vector3D position = .zero();

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_THIRD_PERSON);

    if (rl.CoreD.IsKeyPressed(.KEY_T)) 
      animIndex = (animIndex + 1) % animsCount;
    else if (rl.CoreD.IsKeyPressed(.KEY_G)) 
      animIndex = (animIndex + animsCount - 1) % animsCount;

    final anim = modelAnimations[animIndex];
    animCurrentFrame = (animCurrentFrame + 1) % anim.frameCount;
    characterModel.transform.setD(.translateVector3(position));
    rl.CoreD.UpdateModelAnimationBones(characterModel, anim, animCurrentFrame);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawMesh(characterModel.meshes[0], characterModel.materials[1], characterModel.transform);
        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Use the T/G to switch animation",
        10, 10, 20, .GRAY
      );

      rl.CoreD.DrawText(
        "Current animation: $animIndex [Frame: $animCurrentFrame]",
        10, 30, 20, .GRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadModelAnimations(modelAnimations);
  rl.CoreD.UnloadModel(characterModel);
  rl.CoreD.UnloadShader(skinningShader);
  
  rl.CloseWindowAndDispose();
}