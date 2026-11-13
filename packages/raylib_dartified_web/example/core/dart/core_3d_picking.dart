// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_picking.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "core_3d_picking");
  SetTargetFPS(60);

  final camera = Camera3D(
    position: .vec3(10, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final Vector3 cubePosition = .vec3(0, 1, 0);
  final Vector3 cubeSize = .vec3(2, 2, 2);

  Ray ray = .zero();
  RayCollision collision = .zero();

  rl.setMainLoop(() {
    if (IsCursorHidden())
      UpdateCamera(camera, .CAMERA_FIRST_PERSON);

    if (IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT))
    {
      if (IsCursorHidden()) EnableCursor();
      else DisableCursor();
    }

    if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT))
    {
      if (!collision.hit)
      {
        ray = GetScreenToWorldRay(GetMousePosition(), camera);

        final BoundingBox bbox = .new(
          min: cubePosition.sub(cubeSize.divideBy(2)),
          max: cubePosition.add(cubeSize.divideBy(2)),
        );

        // Check collision between ray and box
        collision = GetRayCollisionBox(ray, bbox);
      }
      else collision.hit = false;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        if (collision.hit)
        {
          DrawCube(
            cubePosition,
            cubeSize.x, cubeSize.y, cubeSize.z, .RED
          );
          
          DrawCubeWires(
            cubePosition,
            cubeSize.x, cubeSize.y, cubeSize.z, .MAROON
          );

          DrawCubeWires(
            cubePosition,
            cubeSize.x + 0.2, cubeSize.y + 0.2, cubeSize.z + 0.2, .GREEN
          );
        }
        else
        {
          DrawCube(
            cubePosition,
            cubeSize.x, cubeSize.y, cubeSize.z, .GRAY
          );
          
          DrawCubeWires(
            cubePosition,
            cubeSize.x, cubeSize.y, cubeSize.z, .DARKGRAY
          );
        }

        DrawRay(ray, .MAROON);
        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "Try clicking on the box with your mouse!",
        240, 10, 20, .DARKGRAY
      );

      if (collision.hit) {
        final boxSelected = "BOX SELECTED";
        DrawText(
          boxSelected,
          (screenWidth - MeasureText(boxSelected, 30))~/2,
          screenHeight*0.1,
          30,
          .GREEN
        );
      }

      DrawText(
        "Right click mouse to toggle camera controls",
        10, 430, 10, .GRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  });
});