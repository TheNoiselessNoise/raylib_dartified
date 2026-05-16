// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_first_person.c
// Run it: dart run core_3d_camera_first_person.dart
import '../../base.dart';

const int MAX_COLUMNS = 20;
const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = loadBaseRaylib();

  final camera = Camera3DD(
    position: .vec3(0, 2, 4),
    target: .vec3(0, 2, 0),
    up: .vec3(0, 1, 0),
    fovy: 60,
    projection: .CAMERA_PERSPECTIVE,
  );

  CameraMode cameraMode = .CAMERA_FIRST_PERSON;
  List<double> heights = [];
  final positions = <Vector3D>[];

  final colors = List.generate(MAX_COLUMNS, (i) {
    heights.add(rl.CoreD.GetRandomValue(1, 12).toDouble());
    
    positions.add(.vec3(
      rl.CoreD.GetRandomValue(-15, 15),
      heights[i] / 2,
      rl.CoreD.GetRandomValue(-15, 15),
    ));

    return ColorD(
      r: rl.CoreD.GetRandomValue(20, 255),
      g: rl.CoreD.GetRandomValue(10, 55),
      b: 30,
      a: 255,
    );
  });

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_3d_camera_first_person');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  while (!rl.CoreD.WindowShouldClose()) {
    if (rl.CoreD.IsKeyPressed(.KEY_ONE)) {
      cameraMode = .CAMERA_FREE;
      camera.up.set(0, 1, 0);
    }

    if (rl.CoreD.IsKeyPressed(.KEY_TWO)) {
      cameraMode = .CAMERA_FIRST_PERSON;
      camera.up.set(0, 1, 0);
    }

    if (rl.CoreD.IsKeyPressed(.KEY_THREE)) {
      cameraMode = .CAMERA_THIRD_PERSON;
      camera.up.set(0, 1, 0);
    }

    if (rl.CoreD.IsKeyPressed(.KEY_FOUR)) {
      cameraMode = .CAMERA_ORBITAL;
      camera.up.set(0, 1, 0);
    }

    if (rl.CoreD.IsKeyPressed(.KEY_P)) {
      if (camera.projection == .CAMERA_PERSPECTIVE) {
        cameraMode = .CAMERA_THIRD_PERSON;
        camera.position.set(0, 2, -100);
        camera.target.set(0, 2, 0);
        camera.up.set(0, 1, 0);
        camera.projection = .CAMERA_ORTHOGRAPHIC;
        camera.fovy = 20;
        rl.CameraD.CameraYaw(camera, -135*rl.DEG2RAD, true);
        rl.CameraD.CameraPitch(camera, -45*rl.DEG2RAD, true, true, false);
      } else if (camera.projection == .CAMERA_ORTHOGRAPHIC) {
        cameraMode = .CAMERA_THIRD_PERSON;
        camera.position.set(0, 2, 10);
        camera.target.set(0, 2, 0);
        camera.up.set(0, 1, 0);
        camera.projection = .CAMERA_PERSPECTIVE;
        camera.fovy = 60;
      }
    }

    rl.CoreD.UpdateCamera(camera, cameraMode);

    double up = ((rl.CoreD.IsKeyDown(.KEY_W) || rl.CoreD.IsKeyDown(.KEY_UP)).toInt()) * 0.1;
    double down = ((rl.CoreD.IsKeyDown(.KEY_S) || rl.CoreD.IsKeyDown(.KEY_DOWN)).toInt()) * 0.1;
    double right = ((rl.CoreD.IsKeyDown(.KEY_D) || rl.CoreD.IsKeyDown(.KEY_RIGHT)).toInt()) * 0.1;
    double left = ((rl.CoreD.IsKeyDown(.KEY_A) || rl.CoreD.IsKeyDown(.KEY_LEFT)).toInt()) * 0.1;

    final delta = rl.CoreD.GetMouseDelta();

    rl.CoreD.UpdateCameraPro(
      camera,
      .vec3(up - down, right - left, 0),
      .vec3(delta.x*0.05, delta.y*0.05, 0),
      rl.CoreD.GetMouseWheelMove()*2
    );

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawPlane(
          .vec3(0, 0, 0),
          .vec2(32, 32),
          .LIGHTGRAY,
        );

        rl.CoreD.DrawCube(
          .vec3(-16, 2.5, 0),
          1, 5, 32, .BLUE
        );

        rl.CoreD.DrawCube(
          .vec3(16, 2.5, 0),
          1, 5, 32, .LIME
        );

        rl.CoreD.DrawCube(
          .vec3(0, 2.5, 16),
          32, 5, 1, .GOLD
        );

        for (int i = 0; i < MAX_COLUMNS; i++) {
          rl.CoreD.DrawCube(positions[i], 2, heights[i], 2, colors[i]);
          rl.CoreD.DrawCubeWires(positions[i], 2, heights[i], 2, .MAROON);
        }

        if (cameraMode == .CAMERA_THIRD_PERSON) {
          rl.CoreD.DrawCube(camera.target, 0.5, 0.5, 0.5, .PURPLE);
          rl.CoreD.DrawCubeWires(camera.target, 0.5, 0.5, 0.5, .DARKPURPLE);
        }

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawRectangle(5, 5, 330, 100, rl.CoreD.Fade(.SKYBLUE, 0.5));
      rl.CoreD.DrawRectangleLines(5, 5, 330, 100, .BLUE);

      rl.CoreD.DrawText("Camera controls:", 15, 15, 10, .BLACK);
      rl.CoreD.DrawText("- Move keys: W, A, S, D, Space, Left-Ctrl", 15, 30, 10, .BLACK);
      rl.CoreD.DrawText("- Look around: arrow keys or mouse", 15, 45, 10, .BLACK);
      rl.CoreD.DrawText("- Camera mode keys: 1, 2, 3, 4", 15, 60, 10, .BLACK);
      rl.CoreD.DrawText("- Zoom keys: num-plus, num-minus or mouse scroll", 15, 75, 10, .BLACK);
      rl.CoreD.DrawText("- Camera projection key: P", 15, 90, 10, .BLACK);

      rl.CoreD.DrawRectangle(600, 5, 195, 100, rl.CoreD.Fade(.SKYBLUE, 0.5));
      rl.CoreD.DrawRectangleLines(600, 5, 195, 100, .BLUE);

      rl.CoreD.DrawText("Camera status:", 610, 15, 10, .BLACK);

      rl.CoreD.DrawText("- Mode: ${cameraMode.name}", 610, 30, 10, .BLACK);
      rl.CoreD.DrawText("- Projection: ${camera.projection.name}", 610, 45, 10, .BLACK);
      
      rl.CoreD.DrawText("- Position: ${camera.position.format(3)}", 610, 60, 10, .BLACK);
      rl.CoreD.DrawText("- Target: ${camera.target.format(3)}", 610, 75, 10, .BLACK);
      rl.CoreD.DrawText("- Up: ${camera.up.format(3)}", 610, 90, 10, .BLACK);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}