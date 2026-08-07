// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_first_person.c
// Run it: dart run core_3d_camera_first_person.dart
import 'dart:ffi';
import '../../base_c.dart';

const int MAX_COLUMNS = 20;
const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  final movement = Vector3$.At('movement');
  final zoom = Vector3$.At('zoom');

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(0, 2, 4);
  camera.ref.target.set(0, 2, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 60;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  int cameraMode = CameraMode.CAMERA_FIRST_PERSON.value;
  List<double> heights = [];
  List<Vector3D> positions = [];

  final colors = Color$.At('colors', MAX_COLUMNS);

  for (int i = 0; i < MAX_COLUMNS; i++) {
    heights.add(GetRandomValue(1, 12).toDouble());
    positions.add(.vec3(
      GetRandomValue(-15, 15).toDouble(),
      heights[i] / 2,
      GetRandomValue(-15, 15).toDouble(),
    ));
    colors[i].r = GetRandomValue(20, 255);
    colors[i].g = GetRandomValue(10, 55);
    colors[i].b = 30;
    colors[i].a = 255;
  }

  InitWindow(screenWidth, screenHeight, "core_3d_camera_first_person".toC);
  SetTargetFPS(60);
  DisableCursor();

  while (!WindowShouldClose()) {
    if (IsKeyPressed(KeyboardKey.KEY_ONE.value)) {
      cameraMode = CameraMode.CAMERA_FREE.value;
      camera.ref.up.set(0, 1, 0);
    }

    if (IsKeyPressed(KeyboardKey.KEY_TWO.value)) {
      cameraMode = CameraMode.CAMERA_FIRST_PERSON.value;
      camera.ref.up.set(0, 1, 0);
    }

    if (IsKeyPressed(KeyboardKey.KEY_THREE.value)) {
      cameraMode = CameraMode.CAMERA_THIRD_PERSON.value;
      camera.ref.up.set(0, 1, 0);
    }

    if (IsKeyPressed(KeyboardKey.KEY_FOUR.value)) {
      cameraMode = CameraMode.CAMERA_ORBITAL.value;
      camera.ref.up.set(0, 1, 0);
    }

    if (IsKeyPressed(KeyboardKey.KEY_P.value)) {
      if (camera.ref.projection == CameraProjection.CAMERA_PERSPECTIVE.value) {
        cameraMode = CameraMode.CAMERA_THIRD_PERSON.value;
        camera.ref.position.set(0, 2, -100);
        camera.ref.target.set(0, 2, 0);
        camera.ref.up.set(0, 1, 0);
        camera.ref.projection = CameraProjection.CAMERA_ORTHOGRAPHIC.value;
        camera.ref.fovy = 20;
        CameraYaw(camera, -135*rl.DEG2RAD, true);
        CameraPitch(camera, -45*rl.DEG2RAD, true, true, false);
      } else if (camera.ref.projection == CameraProjection.CAMERA_ORTHOGRAPHIC.value) {
        cameraMode = CameraMode.CAMERA_THIRD_PERSON.value;
        camera.ref.position.set(0, 2, 10);
        camera.ref.target.set(0, 2, 0);
        camera.ref.up.set(0, 1, 0);
        camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;
        camera.ref.fovy = 60;
      }
    }

    UpdateCamera(camera, cameraMode);

    double up = ((IsKeyDown(KeyboardKey.KEY_W.value) || IsKeyDown(KeyboardKey.KEY_UP.value)).toInt()) * 0.1;
    double down = ((IsKeyDown(KeyboardKey.KEY_S.value) || IsKeyDown(KeyboardKey.KEY_DOWN.value)).toInt()) * 0.1;
    double right = ((IsKeyDown(KeyboardKey.KEY_D.value) || IsKeyDown(KeyboardKey.KEY_RIGHT.value)).toInt()) * 0.1;
    double left = ((IsKeyDown(KeyboardKey.KEY_A.value) || IsKeyDown(KeyboardKey.KEY_LEFT.value)).toInt()) * 0.1;
    movement.setD(.vec3(up - down, right - left, 0));

    final delta = GetMouseDelta();
    zoom.setD(.vec3(delta.x*0.05, delta.y*0.05, 0));

    UpdateCameraPro(
      camera,
      movement.ref,
      zoom.ref,
      GetMouseWheelMove()*2
    );

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawPlane(Vector3$.$1.set(0, 0, 0), Vector2$.$1.set(32, 32), LIGHTGRAY);
        DrawCube(Vector3$.$1.set(-16, 2.5, 0), 1, 5, 32, BLUE);
        DrawCube(Vector3$.$1.set(16, 2.5, 0), 1, 5, 32, LIME);
        DrawCube(Vector3$.$1.set(0, 2.5, 16), 32, 5, 1, GOLD);

        for (int i = 0; i < MAX_COLUMNS; i++) {
          DrawCube(Vector3$.$1.setD(positions[i]), 2, heights[i], 2, colors[i]);
          DrawCubeWires(Vector3$.$1.setD(positions[i]), 2, heights[i], 2, MAROON);
        }

        if (cameraMode == CameraMode.CAMERA_THIRD_PERSON.value) {
          DrawCube(camera.ref.target, 0.5, 0.5, 0.5, PURPLE);
          DrawCubeWires(camera.ref.target, 0.5, 0.5, 0.5, DARKPURPLE);
        }

      EndMode3D();

      DrawRectangle(5, 5, 330, 100, Fade(SKYBLUE, 0.5));
      DrawRectangleLines(5, 5, 330, 100, BLUE);

      DrawText("Camera controls:".toC, 15, 15, 10, BLACK);
      DrawText("- Move keys: W, A, S, D, Space, Left-Ctrl".toC, 15, 30, 10, BLACK);
      DrawText("- Look around: arrow keys or mouse".toC, 15, 45, 10, BLACK);
      DrawText("- Camera mode keys: 1, 2, 3, 4".toC, 15, 60, 10, BLACK);
      DrawText("- Zoom keys: num-plus, num-minus or mouse scroll".toC, 15, 75, 10, BLACK);
      DrawText("- Camera projection key: P".toC, 15, 90, 10, BLACK);

      DrawRectangle(600, 5, 195, 100, Fade(SKYBLUE, 0.5));
      DrawRectangleLines(600, 5, 195, 100, BLUE);

      DrawText("Camera status:".toC, 610, 15, 10, BLACK);

      String cameraModeName = cameraMode == CameraMode.CAMERA_FREE.value ? "FREE" :
        cameraMode == CameraMode.CAMERA_FIRST_PERSON.value ? "FIRST_PERSON" :
        cameraMode == CameraMode.CAMERA_THIRD_PERSON.value ? "THIRD_PERSON" :
        cameraMode == CameraMode.CAMERA_ORBITAL.value ? "ORBITAL" : "CUSTOM";
      DrawText("- Mode: $cameraModeName".toC, 610, 30, 10, BLACK);

      String cameraProjectionName = camera.ref.projection == CameraProjection.CAMERA_PERSPECTIVE.value ? "PERSPECTIVE" : 
        camera.ref.projection == CameraProjection.CAMERA_ORTHOGRAPHIC.value ? "ORTHOGRAPHIC" : "CUSTOM";
      DrawText("- Projection: $cameraProjectionName".toC, 610, 45, 10, BLACK);
      
      DrawText("- Position: ${camera.ref.position.toD().format(3)}".toC, 610, 60, 10, BLACK);
      DrawText("- Target: ${camera.ref.target.toD().format(3)}".toC, 610, 75, 10, BLACK);
      DrawText("- Up: ${camera.ref.up.toD().format(3)}".toC, 610, 90, 10, BLACK);

    EndDrawing();
  }

  CloseWindowAndDispose();
}