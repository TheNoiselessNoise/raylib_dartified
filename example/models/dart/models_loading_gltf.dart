// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_gltf.c
// Run it: dart run models_loading_gltf.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_loading_gltf");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(6, 6, 6),
    target: .vec3(0, 2, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = rl.CoreD.LoadModel("../resources/models/gltf/robot.glb");
  final Vector3D position = .zero();
  
  int animIndex = 0;
  int animCurrentFrame = 0;
  final modelAnimations = rl.CoreD.LoadModelAnimations("../resources/models/gltf/robot.glb");

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT))
      animIndex = (animIndex + 1) % modelAnimations.length;
    else if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT))
      animIndex = (animIndex + modelAnimations.length - 1) % modelAnimations.length;

    final anim = modelAnimations[animIndex];
    animCurrentFrame = (animCurrentFrame + 1) % anim.frameCount;
    rl.CoreD.UpdateModelAnimation(model, anim, animCurrentFrame);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);
        rl.CoreD.DrawModel(model, position, 1.0, .WHITE);
        rl.CoreD.DrawGrid(10, 1.0);
      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Use the LEFT/RIGHT mouse buttons to switch animation",
        10, 10, 20, .GRAY
      );
      rl.CoreD.DrawText(
        "Animation: ${anim.name}",
        10, rl.CoreD.GetScreenHeight() - 20, 10, .DARKGRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}