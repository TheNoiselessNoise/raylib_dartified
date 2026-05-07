// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_gltf.c
// Run it: dart run models_loading_gltf.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_loading_gltf".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(6, 6, 6);
  camera.ref.target.set(0, 2, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = rl.Core.LoadModel("../resources/models/gltf/robot.glb".toC);
  final position = rl.Temp.Vector3$.At('position');
  
  final animsCount = rl.Temp.Int$.At('animsCount');
  int animIndex = 0;
  int animCurrentFrame = 0;
  final modelAnimations = rl.Core.LoadModelAnimations("../resources/models/gltf/robot.glb".toC, animsCount);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT.value))
      animIndex = (animIndex + 1) % animsCount.value;
    else if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value))
      animIndex = (animIndex + animsCount.value - 1) % animsCount.value;

    final anim = modelAnimations[animIndex];
    animCurrentFrame = (animCurrentFrame + 1) % anim.frameCount;
    rl.Core.UpdateModelAnimation(model, anim, animCurrentFrame);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);
        rl.Core.DrawModel(model, position.ref, 1.0, rl.C.WHITE);
        rl.Core.DrawGrid(10, 1.0);
      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Use the LEFT/RIGHT mouse buttons to switch animation".toC,
        10, 10, 20, rl.C.GRAY
      );
      rl.Core.DrawText(
        "Animation: ${anim.nameString}".toC,
        10, rl.Core.GetScreenHeight() - 20, 10, rl.C.DARKGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}