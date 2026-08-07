// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_geometric_shapes.c
// Run it: dart run models_geometric_shapes.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_geometric_shapes");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(0, 10, 10),
    target: .vec3(0.0, 0.0, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  while (!WindowShouldClose())
  {
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

        DrawCapsule     (.vec3(-3.0, 1.5, -4.0), .vec3(-4.0, -1.0, -4.0), 1.2, 8, 8, .VIOLET);
        DrawCapsuleWires(.vec3(-3.0, 1.5, -4.0), .vec3(-4.0, -1.0, -4.0), 1.2, 8, 8, .PURPLE);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}