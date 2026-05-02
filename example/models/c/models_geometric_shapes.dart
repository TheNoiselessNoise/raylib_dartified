// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_geometric_shapes.c
// Run it: dart run models_geometric_shapes.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_geometric_shapes".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(0, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawCube(rl.Temp.vec31(-4.0, 0.0, 2.0), 2.0, 5.0, 2.0, rl.C.RED);
        rl.Core.DrawCubeWires(rl.Temp.vec31(-4.0, 0.0, 2.0), 2.0, 5.0, 2.0, rl.C.GOLD);
        rl.Core.DrawCubeWires(rl.Temp.vec31(-4.0, 0.0, -2.0), 3.0, 6.0, 2.0, rl.C.MAROON);

        rl.Core.DrawSphere(rl.Temp.vec31(-1.0, 0.0, -2.0), 1.0, rl.C.GREEN);
        rl.Core.DrawSphereWires(rl.Temp.vec31(1.0, 0.0, 2.0), 2.0, 16, 16, rl.C.LIME);

        rl.Core.DrawCylinder(rl.Temp.vec31(4.0, 0.0, -2.0), 1.0, 2.0, 3.0, 4, rl.C.SKYBLUE);
        rl.Core.DrawCylinderWires(rl.Temp.vec31(4.0, 0.0, -2.0), 1.0, 2.0, 3.0, 4, rl.C.DARKBLUE);
        rl.Core.DrawCylinderWires(rl.Temp.vec31(4.5, -1.0, 2.0), 1.0, 1.0, 2.0, 6, rl.C.BROWN);

        rl.Core.DrawCylinder(rl.Temp.vec31(1.0, 0.0, -4.0), 0.0, 1.5, 3.0, 8, rl.C.GOLD);
        rl.Core.DrawCylinderWires(rl.Temp.vec31(1.0, 0.0, -4.0), 0.0, 1.5, 3.0, 8, rl.C.PINK);

        rl.Core.DrawCapsule     (rl.Temp.vec31(-3.0, 1.5, -4.0), rl.Temp.vec32(-4.0, -1.0, -4.0), 1.2, 8, 8, rl.C.VIOLET);
        rl.Core.DrawCapsuleWires(rl.Temp.vec31(-3.0, 1.5, -4.0), rl.Temp.vec32(-4.0, -1.0, -4.0), 1.2, 8, 8, rl.C.PURPLE);

        rl.Core.DrawGrid(10, 1.0);

      rl.Core.EndMode3D();

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}