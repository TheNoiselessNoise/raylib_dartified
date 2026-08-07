// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_directional_billboard.c
// Run it: dart run models_directional_billboard.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_directional_billboard");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(2.0, 1.0, 2.0),
    target: .vec3(0.0, 0.5, 0.0),
    up: .vec3(0.0, 1.0, 0.0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final skillbot = LoadTexture("../resources/skillbot.png");

  double anim_timer = 0.0;
  int anim = 0;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    anim_timer += GetFrameTime();

    if (anim_timer > 0.5)
    {
      anim_timer = 0.0;
      anim += 1;
    }

    if (anim >= 4) anim = 0;

    double dir = ((Vector2D.vec2(2.0, 0.0)
      .angle(.vec2(camera.position.x, camera.position.z)) / PI * 4.0) + 0.25)
      .floorToDouble();

    if (dir < 0.0)
    {
      dir = 8.0 - dir.abs();
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera);

        DrawGrid(10, 1.0);

        DrawBillboardPro(
          camera,
          skillbot,
          .rect(0.0 + (anim*24.0), 0.0 + (dir*24.0), 24.0, 24.0),
          .zero(),
          .vec3(0.0, 1.0, 0.0),
          .vec2(1, 1),
          .vec2(0.5, 0.0),
          0,
          WHITE
        );

      EndMode3D();

      DrawText("animation: $anim", 10, 10, 20, DARKGRAY);
      DrawText("direction frame: ${dir.f0}", 10, 40, 20, DARKGRAY);

    EndDrawing();
  }

  UnloadTexture(skillbot);

  CloseWindowAndDispose();
}