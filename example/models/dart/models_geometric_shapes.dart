// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_geometric_shapes.c
// Run it: dart run models_geometric_shapes.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_geometric_shapes");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(0, 10, 10),
    target: .vec3(0.0, 0.0, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  while (!rl.CoreD.WindowShouldClose())
  {
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

        rl.CoreD.DrawCapsule     (.vec3(-3.0, 1.5, -4.0), .vec3(-4.0, -1.0, -4.0), 1.2, 8, 8, .VIOLET);
        rl.CoreD.DrawCapsuleWires(.vec3(-3.0, 1.5, -4.0), .vec3(-4.0, -1.0, -4.0), 1.2, 8, 8, .PURPLE);

        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}