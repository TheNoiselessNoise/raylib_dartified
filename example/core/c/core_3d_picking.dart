// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_picking.c
// Run it: dart run core_3d_picking.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_3d_picking".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(10, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cubePosition = Vector3$.At('cubePosition').set(0, 1, 0);
  final cubeSize = Vector3$.At('cubeSize').set(2, 2, 2);

  final ray = Ray$.At('ray');
  final collision = RayCollision$.At('rayCollision');

  while (!WindowShouldClose()) {
    if (IsCursorHidden())
      UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT.value))
    {
      if (IsCursorHidden()) EnableCursor();
      else DisableCursor();
    }

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value))
    {
      if (!collision.ref.hit)
      {
        ray.ref = GetScreenToWorldRay(GetMousePosition(), camera.ref);

        final bbox = BoundingBox$.At('collision');
        
        bbox.ref.min.set(
          cubePosition.ref.x - cubeSize.ref.x/2,
          cubePosition.ref.y - cubeSize.ref.y/2,
          cubePosition.ref.z - cubeSize.ref.z/2,
        );

        bbox.ref.max.set(
          cubePosition.ref.x + cubeSize.ref.x/2,
          cubePosition.ref.y + cubeSize.ref.y/2,
          cubePosition.ref.z + cubeSize.ref.z/2
        );

        // Check collision between ray and box
        collision.ref = GetRayCollisionBox(ray.ref, bbox.ref);
      }
      else collision.ref.hit = false;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        if (collision.ref.hit)
        {
          DrawCube(
            cubePosition.ref,
            cubeSize.ref.x, cubeSize.ref.y, cubeSize.ref.z, RED
          );
          
          DrawCubeWires(
            cubePosition.ref,
            cubeSize.ref.x, cubeSize.ref.y, cubeSize.ref.z, MAROON
          );

          DrawCubeWires(
            cubePosition.ref,
            cubeSize.ref.x + 0.2, cubeSize.ref.y + 0.2, cubeSize.ref.z + 0.2, GREEN
          );
        }
        else
        {
          DrawCube(
            cubePosition.ref,
            cubeSize.ref.x, cubeSize.ref.y, cubeSize.ref.z, GRAY
          );
          
          DrawCubeWires(
            cubePosition.ref,
            cubeSize.ref.x, cubeSize.ref.y, cubeSize.ref.z, DARKGRAY
          );
        }

        DrawRay(ray.ref, MAROON);
        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "Try clicking on the box with your mouse!".toC,
        240, 10, 20, DARKGRAY
      );

      if (collision.ref.hit) {
        final boxSelected = "BOX SELECTED".toC;
        DrawText(
          boxSelected,
          (screenWidth - MeasureText(boxSelected, 30))~/2,
          (screenHeight*0.1).toInt(),
          30,
          GREEN
        );
      }

      DrawText(
        "Right click mouse to toggle camera controls".toC,
        10, 430, 10, GRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}