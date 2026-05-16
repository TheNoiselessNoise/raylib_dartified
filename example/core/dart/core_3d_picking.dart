// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_picking.c
// Run it: dart run core_3d_picking.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_3d_picking');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(10, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final Vector3D cubePosition = .vec3(0, 1, 0);
  final Vector3D cubeSize = .vec3(2, 2, 2);

  final ray = RayD();
  final collision = RayCollisionD();

  while (!rl.CoreD.WindowShouldClose()) {
    if (rl.CoreD.IsCursorHidden())
      rl.CoreD.UpdateCamera(camera, .CAMERA_FIRST_PERSON);

    if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT))
    {
      if (rl.CoreD.IsCursorHidden()) rl.CoreD.EnableCursor();
      else rl.CoreD.DisableCursor();
    }

    if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT))
    {
      if (!collision.hit)
      {
        ray.setD(rl.CoreD.GetScreenToWorldRay(rl.CoreD.GetMousePosition(), camera));

        final BoundingBoxD bbox = .new(
          min: cubePosition.sub(cubeSize.divideBy(2)),
          max: cubePosition.add(cubeSize.divideBy(2)),
        );

        // Check collision between ray and box
        collision.setD(rl.CoreD.GetRayCollisionBox(ray, bbox));
      }
      else collision.hit = false;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        if (collision.hit)
        {
          rl.CoreD.DrawCube(
            cubePosition,
            cubeSize.x, cubeSize.y, cubeSize.z, .RED
          );
          
          rl.CoreD.DrawCubeWires(
            cubePosition,
            cubeSize.x, cubeSize.y, cubeSize.z, .MAROON
          );

          rl.CoreD.DrawCubeWires(
            cubePosition,
            cubeSize.x + 0.2, cubeSize.y + 0.2, cubeSize.z + 0.2, .GREEN
          );
        }
        else
        {
          rl.CoreD.DrawCube(
            cubePosition,
            cubeSize.x, cubeSize.y, cubeSize.z, .GRAY
          );
          
          rl.CoreD.DrawCubeWires(
            cubePosition,
            cubeSize.x, cubeSize.y, cubeSize.z, .DARKGRAY
          );
        }

        rl.CoreD.DrawRay(ray, .MAROON);
        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Try clicking on the box with your mouse!",
        240, 10, 20, .DARKGRAY
      );

      if (collision.hit) {
        final boxSelected = "BOX SELECTED";
        rl.CoreD.DrawText(
          boxSelected,
          (screenWidth - rl.CoreD.MeasureText(boxSelected, 30))~/2,
          screenHeight*0.1,
          30,
          .GREEN
        );
      }

      rl.CoreD.DrawText(
        "Right click mouse to toggle camera controls",
        10, 430, 10, .GRAY
      );

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}