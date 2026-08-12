// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_yaw_pitch_roll.c
// Run it: dart run models_yaw_pitch_roll.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_yaw_pitch_roll".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(0, 50, -120);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 30;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = LoadModel("../resources/models/obj/plane.obj".toC);
  final texture = LoadTexture("../resources/models/obj/plane_diffuse.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  double pitch = 0.0;
  double roll = 0.0;
  double yaw = 0.0;

  while (!WindowShouldClose())
  {
    if (IsKeyDown(KeyboardKey.KEY_DOWN.value)) pitch += 0.6;
    else if (IsKeyDown(KeyboardKey.KEY_UP.value)) pitch -= 0.6;
    else
    {
      if (pitch > 0.3) pitch -= 0.3;
      else if (pitch < -0.3) pitch += 0.3;
    }

    if (IsKeyDown(KeyboardKey.KEY_S.value)) yaw -= 1.0;
    else if (IsKeyDown(KeyboardKey.KEY_A.value)) yaw += 1.0;
    else
    {
      if (yaw > 0.0) yaw -= 0.5;
      else if (yaw < 0.0) yaw += 0.5;
    }

    if (IsKeyDown(KeyboardKey.KEY_LEFT.value)) roll -= 1.0;
    else if (IsKeyDown(KeyboardKey.KEY_RIGHT.value)) roll += 1.0;
    else
    {
      if (roll > 0.0) roll -= 0.5;
      else if (roll < 0.0) roll += 0.5;
    }

    model.transform.setD(.rotateXYZ(.vec3(rl.DEG2RAD*pitch, rl.DEG2RAD*yaw, rl.DEG2RAD*roll)));

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawModel(model, Vector3$.val.$1.set(0, -8, 0), 1.0, WHITE);
        DrawGrid(10, 10.0);

      EndMode3D();

      DrawRectangle(30, 370, 260, 70, Fade(GREEN, 0.5));
      DrawRectangleLines(30, 370, 260, 70, Fade(DARKGREEN, 0.5));

      DrawText(
        "Pitch controlled with: KEY_UP / KEY_DOWN".toC,
        40, 380, 10, DARKGRAY
      );
      DrawText(
        "Roll controlled with: KEY_LEFT / KEY_RIGHT".toC,
        40, 400, 10, DARKGRAY
      );
      DrawText(
        "Yaw controlled with: KEY_A / KEY_S".toC,
        40, 420, 10, DARKGRAY
      );
      DrawText(
        "(c) WWI Plane Model created by GiaHanLam".toC,
        screenWidth - 240, screenHeight - 20, 10, DARKGRAY
      );

    EndDrawing();
  }

  UnloadModel(model);
  UnloadTexture(texture);
  
  CloseWindowAndDispose();
}