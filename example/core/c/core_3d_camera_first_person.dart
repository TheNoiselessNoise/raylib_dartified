// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_first_person.c
// Run it: dart run core_3d_camera_first_person.dart
import 'dart:ffi';
import '../../base.dart';

const int MAX_COLUMNS = 20;
const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = loadBaseRaylib();

  final movement = rl.Temp.Vector3$.At('movement');
  final zoom = rl.Temp.Vector3$.At('zoom');

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(0, 2, 4);
  camera.ref.target.set(0, 2, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 60;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  int cameraMode = CameraMode.CAMERA_FIRST_PERSON.value;
  List<double> heights = [];
  List<Vector3D> positions = [];

  final colors = rl.Temp.Color$.At('colors', MAX_COLUMNS);

  for (int i = 0; i < MAX_COLUMNS; i++) {
    heights.add(rl.Core.GetRandomValue(1, 12).toDouble());
    positions.add(.vec3(
      rl.Core.GetRandomValue(-15, 15).toDouble(),
      heights[i] / 2,
      rl.Core.GetRandomValue(-15, 15).toDouble(),
    ));
    colors[i].r = rl.Core.GetRandomValue(20, 255);
    colors[i].g = rl.Core.GetRandomValue(10, 55);
    colors[i].b = 30;
    colors[i].a = 255;
  }

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_3d_camera_first_person'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  while (!rl.Core.WindowShouldClose()) {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ONE.value)) {
      cameraMode = CameraMode.CAMERA_FREE.value;
      camera.ref.up.set(0, 1, 0);
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_TWO.value)) {
      cameraMode = CameraMode.CAMERA_FIRST_PERSON.value;
      camera.ref.up.set(0, 1, 0);
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_THREE.value)) {
      cameraMode = CameraMode.CAMERA_THIRD_PERSON.value;
      camera.ref.up.set(0, 1, 0);
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_FOUR.value)) {
      cameraMode = CameraMode.CAMERA_ORBITAL.value;
      camera.ref.up.set(0, 1, 0);
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_P.value)) {
      if (camera.ref.projection == CameraProjection.CAMERA_PERSPECTIVE.value) {
        cameraMode = CameraMode.CAMERA_THIRD_PERSON.value;
        camera.ref.position.set(0, 2, -100);
        camera.ref.target.set(0, 2, 0);
        camera.ref.up.set(0, 1, 0);
        camera.ref.projection = CameraProjection.CAMERA_ORTHOGRAPHIC.value;
        camera.ref.fovy = 20;
        rl.Cam.CameraYaw(camera, -135*rl.DEG2RAD, true);
        rl.Cam.CameraPitch(camera, -45*rl.DEG2RAD, true, true, false);
      } else if (camera.ref.projection == CameraProjection.CAMERA_ORTHOGRAPHIC.value) {
        cameraMode = CameraMode.CAMERA_THIRD_PERSON.value;
        camera.ref.position.set(0, 2, 10);
        camera.ref.target.set(0, 2, 0);
        camera.ref.up.set(0, 1, 0);
        camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;
        camera.ref.fovy = 60;
      }
    }

    rl.Core.UpdateCamera(camera, cameraMode);

    double up = ((rl.Core.IsKeyDown(KeyboardKey.KEY_W.value) || rl.Core.IsKeyDown(KeyboardKey.KEY_UP.value)).toInt()) * 0.1;
    double down = ((rl.Core.IsKeyDown(KeyboardKey.KEY_S.value) || rl.Core.IsKeyDown(KeyboardKey.KEY_DOWN.value)).toInt()) * 0.1;
    double right = ((rl.Core.IsKeyDown(KeyboardKey.KEY_D.value) || rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT.value)).toInt()) * 0.1;
    double left = ((rl.Core.IsKeyDown(KeyboardKey.KEY_A.value) || rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT.value)).toInt()) * 0.1;
    movement.setD(.vec3(up - down, right - left, 0));

    final delta = rl.Core.GetMouseDelta();
    zoom.setD(.vec3(delta.x*0.05, delta.y*0.05, 0));

    rl.Core.UpdateCameraPro(
      camera,
      movement.ref,
      zoom.ref,
      rl.Core.GetMouseWheelMove()*2
    );

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawPlane(rl.Temp.vec31(0, 0, 0), rl.Temp.vec21(32, 32), rl.C.LIGHTGRAY);
        rl.Core.DrawCube(rl.Temp.vec31(-16, 2.5, 0), 1, 5, 32, rl.C.BLUE);
        rl.Core.DrawCube(rl.Temp.vec31(16, 2.5, 0), 1, 5, 32, rl.C.LIME);
        rl.Core.DrawCube(rl.Temp.vec31(0, 2.5, 16), 32, 5, 1, rl.C.GOLD);

        for (int i = 0; i < MAX_COLUMNS; i++) {
          rl.Core.DrawCube(rl.Temp.vec31D(positions[i]), 2, heights[i], 2, colors[i]);
          rl.Core.DrawCubeWires(rl.Temp.vec31D(positions[i]), 2, heights[i], 2, rl.C.MAROON);
        }

        if (cameraMode == CameraMode.CAMERA_THIRD_PERSON.value) {
          rl.Core.DrawCube(camera.ref.target, 0.5, 0.5, 0.5, rl.C.PURPLE);
          rl.Core.DrawCubeWires(camera.ref.target, 0.5, 0.5, 0.5, rl.C.DARKPURPLE);
        }

      rl.Core.EndMode3D();

      rl.Core.DrawRectangle(5, 5, 330, 100, rl.Core.Fade(rl.C.SKYBLUE, 0.5));
      rl.Core.DrawRectangleLines(5, 5, 330, 100, rl.C.BLUE);

      rl.Core.DrawText("Camera controls:".toC, 15, 15, 10, rl.C.BLACK);
      rl.Core.DrawText("- Move keys: W, A, S, D, Space, Left-Ctrl".toC, 15, 30, 10, rl.C.BLACK);
      rl.Core.DrawText("- Look around: arrow keys or mouse".toC, 15, 45, 10, rl.C.BLACK);
      rl.Core.DrawText("- Camera mode keys: 1, 2, 3, 4".toC, 15, 60, 10, rl.C.BLACK);
      rl.Core.DrawText("- Zoom keys: num-plus, num-minus or mouse scroll".toC, 15, 75, 10, rl.C.BLACK);
      rl.Core.DrawText("- Camera projection key: P".toC, 15, 90, 10, rl.C.BLACK);

      rl.Core.DrawRectangle(600, 5, 195, 100, rl.Core.Fade(rl.C.SKYBLUE, 0.5));
      rl.Core.DrawRectangleLines(600, 5, 195, 100, rl.C.BLUE);

      rl.Core.DrawText("Camera status:".toC, 610, 15, 10, rl.C.BLACK);

      String cameraModeName = cameraMode == CameraMode.CAMERA_FREE.value ? "FREE" :
        cameraMode == CameraMode.CAMERA_FIRST_PERSON.value ? "FIRST_PERSON" :
        cameraMode == CameraMode.CAMERA_THIRD_PERSON.value ? "THIRD_PERSON" :
        cameraMode == CameraMode.CAMERA_ORBITAL.value ? "ORBITAL" : "CUSTOM";
      rl.Core.DrawText("- Mode: $cameraModeName".toC, 610, 30, 10, rl.C.BLACK);

      String cameraProjectionName = camera.ref.projection == CameraProjection.CAMERA_PERSPECTIVE.value ? "PERSPECTIVE" : 
        camera.ref.projection == CameraProjection.CAMERA_ORTHOGRAPHIC.value ? "ORTHOGRAPHIC" : "CUSTOM";
      rl.Core.DrawText("- Projection: $cameraProjectionName".toC, 610, 45, 10, rl.C.BLACK);
      
      rl.Core.DrawText("- Position: ${camera.ref.position.format(3)}".toC, 610, 60, 10, rl.C.BLACK);
      rl.Core.DrawText("- Target: ${camera.ref.target.format(3)}".toC, 610, 75, 10, rl.C.BLACK);
      rl.Core.DrawText("- Up: ${camera.ref.up.format(3)}".toC, 610, 90, 10, rl.C.BLACK);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}