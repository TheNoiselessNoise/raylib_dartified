// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_picking.c
// Run it: dart run core_3d_picking.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_3d_picking'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(10, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cubePosition = rl.Temp.Vector3$.At('cubePosition').set(0, 1, 0);
  final cubeSize = rl.Temp.Vector3$.At('cubeSize').set(2, 2, 2);

  final ray = rl.Temp.Ray$.At('ray');
  final collision = rl.Temp.RayCollision$.At('rayCollision');

  while (!rl.Core.WindowShouldClose()) {
    if (rl.Core.IsCursorHidden())
      rl.Core.UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT.value))
    {
      if (rl.Core.IsCursorHidden()) rl.Core.EnableCursor();
      else rl.Core.DisableCursor();
    }

    if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value))
    {
      if (!collision.ref.hit)
      {
        ray.ref = rl.Core.GetScreenToWorldRay(rl.Core.GetMousePosition(), camera.ref);

        final bbox = rl.Temp.BoundingBox$.At('collision');
        
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
        collision.ref = rl.Core.GetRayCollisionBox(ray.ref, bbox.ref);
      }
      else collision.ref.hit = false;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        if (collision.ref.hit)
        {
          rl.Core.DrawCube(
            cubePosition.ref,
            cubeSize.ref.x, cubeSize.ref.y, cubeSize.ref.z, rl.Color.RED
          );
          
          rl.Core.DrawCubeWires(
            cubePosition.ref,
            cubeSize.ref.x, cubeSize.ref.y, cubeSize.ref.z, rl.Color.MAROON
          );

          rl.Core.DrawCubeWires(
            cubePosition.ref,
            cubeSize.ref.x + 0.2, cubeSize.ref.y + 0.2, cubeSize.ref.z + 0.2, rl.Color.GREEN
          );
        }
        else
        {
          rl.Core.DrawCube(
            cubePosition.ref,
            cubeSize.ref.x, cubeSize.ref.y, cubeSize.ref.z, rl.Color.GRAY
          );
          
          rl.Core.DrawCubeWires(
            cubePosition.ref,
            cubeSize.ref.x, cubeSize.ref.y, cubeSize.ref.z, rl.Color.DARKGRAY
          );
        }

        rl.Core.DrawRay(ray.ref, rl.Color.MAROON);
        rl.Core.DrawGrid(10, 1.0);

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Try clicking on the box with your mouse!".toC,
        240, 10, 20, rl.Color.DARKGRAY
      );

      if (collision.ref.hit) {
        final boxSelected = "BOX SELECTED".toC;
        rl.Core.DrawText(
          boxSelected,
          (screenWidth - rl.Core.MeasureText(boxSelected, 30))~/2,
          (screenHeight*0.1).toInt(),
          30,
          rl.Color.GREEN
        );
      }

      rl.Core.DrawText(
        "Right click mouse to toggle camera controls".toC,
        10, 430, 10, rl.Color.GRAY
      );

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}