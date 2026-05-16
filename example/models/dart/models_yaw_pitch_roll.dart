// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_yaw_pitch_roll.c
// Run it: dart run models_yaw_pitch_roll.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_yaw_pitch_roll");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(0, 50, -120),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 30,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = rl.CoreD.LoadModel("../resources/models/obj/plane.obj");
  final texture = rl.CoreD.LoadTexture("../resources/models/obj/plane_diffuse.png");
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  double pitch = 0.0;
  double roll = 0.0;
  double yaw = 0.0;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyDown(.KEY_DOWN)) pitch += 0.6;
    else if (rl.CoreD.IsKeyDown(.KEY_UP)) pitch -= 0.6;
    else
    {
      if (pitch > 0.3) pitch -= 0.3;
      else if (pitch < -0.3) pitch += 0.3;
    }

    if (rl.CoreD.IsKeyDown(.KEY_S)) yaw -= 1.0;
    else if (rl.CoreD.IsKeyDown(.KEY_A)) yaw += 1.0;
    else
    {
      if (yaw > 0.0) yaw -= 0.5;
      else if (yaw < 0.0) yaw += 0.5;
    }

    if (rl.CoreD.IsKeyDown(.KEY_LEFT)) roll -= 1.0;
    else if (rl.CoreD.IsKeyDown(.KEY_RIGHT)) roll += 1.0;
    else
    {
      if (roll > 0.0) roll -= 0.5;
      else if (roll < 0.0) roll += 0.5;
    }

    model.transform.setD(.rotateXYZ(.vec3(rl.DEG2RAD*pitch, rl.DEG2RAD*yaw, rl.DEG2RAD*roll)));

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawModel(model, .vec3(0, -8, 0), 1.0, .WHITE);
        rl.CoreD.DrawGrid(10, 10.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawRectangle(30, 370, 260, 70, rl.CoreD.Fade(.GREEN, 0.5));
      rl.CoreD.DrawRectangleLines(30, 370, 260, 70, rl.CoreD.Fade(.DARKGREEN, 0.5));

      rl.CoreD.DrawText(
        "Pitch controlled with: KEY_UP / KEY_DOWN",
        40, 380, 10, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "Roll controlled with: KEY_LEFT / KEY_RIGHT",
        40, 400, 10, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "Yaw controlled with: KEY_A / KEY_S",
        40, 420, 10, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "(c) WWI Plane Model created by GiaHanLam",
        screenWidth - 240, screenHeight - 20, 10, .DARKGRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadModel(model);
  rl.CoreD.UnloadTexture(texture);
  
  rl.CloseWindowAndDispose();
}