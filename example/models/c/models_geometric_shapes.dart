// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_geometric_shapes.c
// Run it: dart run models_geometric_shapes.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_geometric_shapes".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(0, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawCube(Vector3$.val.$1.set(-4.0, 0.0, 2.0), 2.0, 5.0, 2.0, RED);
        DrawCubeWires(Vector3$.val.$1.set(-4.0, 0.0, 2.0), 2.0, 5.0, 2.0, GOLD);
        DrawCubeWires(Vector3$.val.$1.set(-4.0, 0.0, -2.0), 3.0, 6.0, 2.0, MAROON);

        DrawSphere(Vector3$.val.$1.set(-1.0, 0.0, -2.0), 1.0, GREEN);
        DrawSphereWires(Vector3$.val.$1.set(1.0, 0.0, 2.0), 2.0, 16, 16, LIME);

        DrawCylinder(Vector3$.val.$1.set(4.0, 0.0, -2.0), 1.0, 2.0, 3.0, 4, SKYBLUE);
        DrawCylinderWires(Vector3$.val.$1.set(4.0, 0.0, -2.0), 1.0, 2.0, 3.0, 4, DARKBLUE);
        DrawCylinderWires(Vector3$.val.$1.set(4.5, -1.0, 2.0), 1.0, 1.0, 2.0, 6, BROWN);

        DrawCylinder(Vector3$.val.$1.set(1.0, 0.0, -4.0), 0.0, 1.5, 3.0, 8, GOLD);
        DrawCylinderWires(Vector3$.val.$1.set(1.0, 0.0, -4.0), 0.0, 1.5, 3.0, 8, PINK);

        DrawCapsule     (Vector3$.val.$1.set(-3.0, 1.5, -4.0), Vector3$.val.$2.set(-4.0, -1.0, -4.0), 1.2, 8, 8, VIOLET);
        DrawCapsuleWires(Vector3$.val.$1.set(-3.0, 1.5, -4.0), Vector3$.val.$2.set(-4.0, -1.0, -4.0), 1.2, 8, 8, PURPLE);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}