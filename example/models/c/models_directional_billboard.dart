// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_directional_billboard.c
// Run it: dart run models_directional_billboard.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_directional_billboard".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(2.0, 1.0, 2.0);
  camera.ref.target.set(0.0, 0.5, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final skillbot = LoadTexture("../resources/skillbot.png".toC);

  double anim_timer = 0.0;
  int anim = 0;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    anim_timer += GetFrameTime();

    if (anim_timer > 0.5)
    {
      anim_timer = 0.0;
      anim += 1;
    }

    if (anim >= 4) anim = 0;

    double dir = ((Vector2D.vec2(2.0, 0.0)
      .angle(.vec2(camera.ref.position.x, camera.ref.position.z)) / PI * 4.0) + 0.25)
      .floorToDouble();

    if (dir < 0.0)
    {
      dir = 8.0 - dir.abs();
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawGrid(10, 1.0);

        DrawBillboardPro(
          camera.ref,
          skillbot,
          Rectangle$.val.$1.set(0.0 + (anim*24.0), 0.0 + (dir*24.0), 24.0, 24.0),
          Vector3$.val.$zero,
          Vector3$.val.$1.set(0.0, 1.0, 0.0),
          Vector2$.val.$1.set(1, 1),
          Vector2$.val.$2.set(0.5, 0.0),
          0,
          WHITE
        );

      EndMode3D();

      DrawText("animation: $anim".toC, 10, 10, 20, DARKGRAY);
      DrawText("direction frame: ${dir.f0}".toC, 10, 40, 20, DARKGRAY);

    EndDrawing();
  }

  UnloadTexture(skillbot);

  CloseWindowAndDispose();
}