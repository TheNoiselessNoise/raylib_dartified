// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_orthographic_projection.c
// Run it: dart run models_orthographic_projection.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const double FOVY_PERSPECTIVE = 45.0;
const double WIDTH_ORTHOGRAPHIC = 10.0;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_orthographic_projection".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(0, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = FOVY_PERSPECTIVE;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value))
    {
      if (camera.ref.projection == CameraProjection.CAMERA_PERSPECTIVE.value)
      {
        camera.ref.fovy = WIDTH_ORTHOGRAPHIC;
        camera.ref.projection = CameraProjection.CAMERA_ORTHOGRAPHIC.value;
      }
      else
      {
        camera.ref.fovy = FOVY_PERSPECTIVE;
        camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;
      }
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawCube(rl.Temp.vec31(-4.0, 0.0, 2.0), 2.0, 5.0, 2.0, rl.Color.RED);
        rl.Core.DrawCubeWires(rl.Temp.vec31(-4.0, 0.0, 2.0), 2.0, 5.0, 2.0, rl.Color.GOLD);
        rl.Core.DrawCubeWires(rl.Temp.vec31(-4.0, 0.0, -2.0), 3.0, 6.0, 2.0, rl.Color.MAROON);

        rl.Core.DrawSphere(rl.Temp.vec31(-1.0, 0.0, -2.0), 1.0, rl.Color.GREEN);
        rl.Core.DrawSphereWires(rl.Temp.vec31(1.0, 0.0, 2.0), 2.0, 16, 16, rl.Color.LIME);

        rl.Core.DrawCylinder(rl.Temp.vec31(4.0, 0.0, -2.0), 1.0, 2.0, 3.0, 4, rl.Color.SKYBLUE);
        rl.Core.DrawCylinderWires(rl.Temp.vec31(4.0, 0.0, -2.0), 1.0, 2.0, 3.0, 4, rl.Color.DARKBLUE);
        rl.Core.DrawCylinderWires(rl.Temp.vec31(4.5, -1.0, 2.0), 1.0, 1.0, 2.0, 6, rl.Color.BROWN);

        rl.Core.DrawCylinder(rl.Temp.vec31(1.0, 0.0, -4.0), 0.0, 1.5, 3.0, 8, rl.Color.GOLD);
        rl.Core.DrawCylinderWires(rl.Temp.vec31(1.0, 0.0, -4.0), 0.0, 1.5, 3.0, 8, rl.Color.PINK);

        rl.Core.DrawGrid(10, 1.0);

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Press Spacebar to switch camera type".toC,
        10, rl.Core.GetScreenHeight() - 30, 20, rl.Color.DARKGRAY
      );

      if (camera.ref.projection == CameraProjection.CAMERA_ORTHOGRAPHIC.value)
        rl.Core.DrawText("ORTHOGRAPHIC".toC, 10, 40, 20, rl.Color.BLACK);
      else if (camera.ref.projection == CameraProjection.CAMERA_PERSPECTIVE.value)
        rl.Core.DrawText("PERSPECTIVE".toC, 10, 40, 20, rl.Color.BLACK);

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}