// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_orthographic_projection.c
// Run it: dart run models_orthographic_projection.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const double FOVY_PERSPECTIVE = 45.0;
const double WIDTH_ORTHOGRAPHIC = 10.0;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_orthographic_projection".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(0, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = FOVY_PERSPECTIVE;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value))
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

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "Press Spacebar to switch camera type".toC,
        10, GetScreenHeight() - 30, 20, DARKGRAY
      );

      if (camera.ref.projection == CameraProjection.CAMERA_ORTHOGRAPHIC.value)
        DrawText("ORTHOGRAPHIC".toC, 10, 40, 20, BLACK);
      else if (camera.ref.projection == CameraProjection.CAMERA_PERSPECTIVE.value)
        DrawText("PERSPECTIVE".toC, 10, 40, 20, BLACK);

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}