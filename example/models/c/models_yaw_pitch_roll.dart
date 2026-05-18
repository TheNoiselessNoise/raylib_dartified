// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_yaw_pitch_roll.c
// Run it: dart run models_yaw_pitch_roll.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "models_yaw_pitch_roll".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(0, 50, -120);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 30;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = rl.Core.LoadModel("../resources/models/obj/plane.obj".toC);
  final texture = rl.Core.LoadTexture("../resources/models/obj/plane_diffuse.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  double pitch = 0.0;
  double roll = 0.0;
  double yaw = 0.0;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_DOWN.value)) pitch += 0.6;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_UP.value)) pitch -= 0.6;
    else
    {
      if (pitch > 0.3) pitch -= 0.3;
      else if (pitch < -0.3) pitch += 0.3;
    }

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_S.value)) yaw -= 1.0;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_A.value)) yaw += 1.0;
    else
    {
      if (yaw > 0.0) yaw -= 0.5;
      else if (yaw < 0.0) yaw += 0.5;
    }

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT.value)) roll -= 1.0;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT.value)) roll += 1.0;
    else
    {
      if (roll > 0.0) roll -= 0.5;
      else if (roll < 0.0) roll += 0.5;
    }

    model.transform.setD(.rotateXYZ(.vec3(rl.DEG2RAD*pitch, rl.DEG2RAD*yaw, rl.DEG2RAD*roll)));

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawModel(model, rl.Temp.vec31(0, -8, 0), 1.0, rl.Color.WHITE);
        rl.Core.DrawGrid(10, 10.0);

      rl.Core.EndMode3D();

      rl.Core.DrawRectangle(30, 370, 260, 70, rl.Core.Fade(rl.Color.GREEN, 0.5));
      rl.Core.DrawRectangleLines(30, 370, 260, 70, rl.Core.Fade(rl.Color.DARKGREEN, 0.5));

      rl.Core.DrawText(
        "Pitch controlled with: KEY_UP / KEY_DOWN".toC,
        40, 380, 10, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "Roll controlled with: KEY_LEFT / KEY_RIGHT".toC,
        40, 400, 10, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "Yaw controlled with: KEY_A / KEY_S".toC,
        40, 420, 10, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "(c) WWI Plane Model created by GiaHanLam".toC,
        screenWidth - 240, screenHeight - 20, 10, rl.Color.DARKGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadModel(model);
  rl.Core.UnloadTexture(texture);
  
  rl.CloseWindowAndDispose();
}