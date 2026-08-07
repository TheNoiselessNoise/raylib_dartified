// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_gltf.c
// Run it: dart run models_loading_gltf.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_loading_gltf");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(6, 6, 6),
    target: .vec3(0, 2, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = LoadModel("../resources/models/gltf/robot.glb");
  
  int animIndex = 0;
  int animCurrentFrame = 0;
  final modelAnimations = LoadModelAnimations("../resources/models/gltf/robot.glb");

  while (!WindowShouldClose())
  {

    UpdateCamera(camera, .CAMERA_ORBITAL);

    if (IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT))
      animIndex = (animIndex + 1) % modelAnimations.length;
    else if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT))
      animIndex = (animIndex + modelAnimations.length - 1) % modelAnimations.length;

    final anim = modelAnimations[animIndex];
    animCurrentFrame = (animCurrentFrame + 1) % anim.keyframeCount;
    UpdateModelAnimation(model, anim, animCurrentFrame);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);
        DrawModel(model, .zero(), 1.0, .WHITE);
        DrawGrid(10, 1.0);
      EndMode3D();

      DrawText(
        "Use the LEFT/RIGHT mouse buttons to switch animation",
        10, 10, 20, .GRAY
      );
      DrawText(
        "Animation: ${anim.name}",
        10, GetScreenHeight() - 20, 10, .DARKGRAY
      );

    EndDrawing();
  }

  UnloadModel(model);
  
  CloseWindowAndDispose();
}