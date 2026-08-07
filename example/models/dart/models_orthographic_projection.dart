// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_orthographic_projection.c
// Run it: dart run models_orthographic_projection.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const double FOVY_PERSPECTIVE = 45.0;
const double WIDTH_ORTHOGRAPHIC = 10.0;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_orthographic_projection");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(0, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: FOVY_PERSPECTIVE,
    projection: .CAMERA_PERSPECTIVE,
  );

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(.KEY_SPACE))
    {
      if (camera.projection == .CAMERA_PERSPECTIVE)
      {
        camera.fovy = WIDTH_ORTHOGRAPHIC;
        camera.projection = .CAMERA_ORTHOGRAPHIC;
      }
      else
      {
        camera.fovy = FOVY_PERSPECTIVE;
        camera.projection = .CAMERA_PERSPECTIVE;
      }
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawCube(.vec3(-4.0, 0.0, 2.0), 2.0, 5.0, 2.0, .RED);
        DrawCubeWires(.vec3(-4.0, 0.0, 2.0), 2.0, 5.0, 2.0, .GOLD);
        DrawCubeWires(.vec3(-4.0, 0.0, -2.0), 3.0, 6.0, 2.0, .MAROON);

        DrawSphere(.vec3(-1.0, 0.0, -2.0), 1.0, .GREEN);
        DrawSphereWires(.vec3(1.0, 0.0, 2.0), 2.0, 16, 16, .LIME);

        DrawCylinder(.vec3(4.0, 0.0, -2.0), 1.0, 2.0, 3.0, 4, .SKYBLUE);
        DrawCylinderWires(.vec3(4.0, 0.0, -2.0), 1.0, 2.0, 3.0, 4, .DARKBLUE);
        DrawCylinderWires(.vec3(4.5, -1.0, 2.0), 1.0, 1.0, 2.0, 6, .BROWN);

        DrawCylinder(.vec3(1.0, 0.0, -4.0), 0.0, 1.5, 3.0, 8, .GOLD);
        DrawCylinderWires(.vec3(1.0, 0.0, -4.0), 0.0, 1.5, 3.0, 8, .PINK);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "Press Spacebar to switch camera type",
        10, GetScreenHeight() - 30, 20, .DARKGRAY
      );

      if (camera.projection == .CAMERA_ORTHOGRAPHIC)
        DrawText("ORTHOGRAPHIC", 10, 40, 20, .BLACK);
      else if (camera.projection == .CAMERA_PERSPECTIVE)
        DrawText("PERSPECTIVE", 10, 40, 20, .BLACK);

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}