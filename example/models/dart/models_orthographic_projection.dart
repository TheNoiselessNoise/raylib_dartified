// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_orthographic_projection.c
// Run it: dart run models_orthographic_projection.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const double FOVY_PERSPECTIVE = 45.0;
const double WIDTH_ORTHOGRAPHIC = 10.0;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_orthographic_projection");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = CameraD(
    position: .vec3(0, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: FOVY_PERSPECTIVE,
    projection: .CAMERA_PERSPECTIVE,
  );

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyPressed(.KEY_SPACE))
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

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawCube(.vec3(-4.0, 0.0, 2.0), 2.0, 5.0, 2.0, .RED);
        rl.CoreD.DrawCubeWires(.vec3(-4.0, 0.0, 2.0), 2.0, 5.0, 2.0, .GOLD);
        rl.CoreD.DrawCubeWires(.vec3(-4.0, 0.0, -2.0), 3.0, 6.0, 2.0, .MAROON);

        rl.CoreD.DrawSphere(.vec3(-1.0, 0.0, -2.0), 1.0, .GREEN);
        rl.CoreD.DrawSphereWires(.vec3(1.0, 0.0, 2.0), 2.0, 16, 16, .LIME);

        rl.CoreD.DrawCylinder(.vec3(4.0, 0.0, -2.0), 1.0, 2.0, 3.0, 4, .SKYBLUE);
        rl.CoreD.DrawCylinderWires(.vec3(4.0, 0.0, -2.0), 1.0, 2.0, 3.0, 4, .DARKBLUE);
        rl.CoreD.DrawCylinderWires(.vec3(4.5, -1.0, 2.0), 1.0, 1.0, 2.0, 6, .BROWN);

        rl.CoreD.DrawCylinder(.vec3(1.0, 0.0, -4.0), 0.0, 1.5, 3.0, 8, .GOLD);
        rl.CoreD.DrawCylinderWires(.vec3(1.0, 0.0, -4.0), 0.0, 1.5, 3.0, 8, .PINK);

        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Press Spacebar to switch camera type",
        10, rl.CoreD.GetScreenHeight() - 30, 20, .DARKGRAY
      );

      if (camera.projection == .CAMERA_ORTHOGRAPHIC)
        rl.CoreD.DrawText("ORTHOGRAPHIC", 10, 40, 20, .BLACK);
      else if (camera.projection == .CAMERA_PERSPECTIVE)
        rl.CoreD.DrawText("PERSPECTIVE", 10, 40, 20, .BLACK);

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}