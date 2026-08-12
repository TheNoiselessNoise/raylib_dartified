// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_gltf.c
// Run it: dart run models_loading_gltf.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_loading_gltf".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(6, 6, 6);
  camera.ref.target.set(0, 2, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = LoadModel("../resources/models/gltf/robot.glb".toC);
  final position = Vector3$.val.At('position');
  
  final animsCount = Int$.val.At('animsCount');
  int animIndex = 10;
  int animCurrentFrame = 0;
  final anims = LoadModelAnimations(
    "../resources/models/gltf/robot.glb".toC,
    animsCount
  );

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT.value))
      animIndex = (animIndex + 1) % animsCount.value;
    else if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value))
      animIndex = (animIndex + animsCount.value - 1) % animsCount.value;

    final anim = anims[animIndex];
    animCurrentFrame = (animCurrentFrame + 1) % anim.keyframeCount;
    UpdateModelAnimation(model, anim, animCurrentFrame.toDouble());

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);
        DrawModel(model, position.ref, 1.0, WHITE);
        DrawGrid(10, 1.0);
      EndMode3D();

      DrawText(
        "Use the LEFT/RIGHT mouse buttons to switch animation".toC,
        10, 10, 20, GRAY
      );
      DrawText(
        "Animation: ${anim.nameString}".toC,
        10, GetScreenHeight() - 20, 10, DARKGRAY
      );

    EndDrawing();
  }

  UnloadModel(model);
  
  CloseWindowAndDispose();
}