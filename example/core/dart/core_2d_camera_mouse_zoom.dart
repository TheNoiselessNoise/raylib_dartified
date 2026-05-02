// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera_mouse_zoom.c
// Run it: dart run core_2d_camera_mouse_zoom.dart
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = loadBaseRaylib();

  final camera = Camera2DD(zoom: 1);

  int zoomMode = 0;

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_2d_camera_mouse_zoom');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  while (!rl.CoreD.WindowShouldClose()) {
    if (rl.CoreD.IsKeyPressed(.KEY_ONE)) {
      zoomMode = 0;
    } else if (rl.CoreD.IsKeyPressed(.KEY_TWO)) {
      zoomMode = 1;
    }

    if (rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT)) {
      final delta = rl.CoreD.GetMouseDelta();
      final finalDelta = delta.scale(-1/camera.zoom);
      camera.target.setD(camera.target.add(finalDelta));
    }

    if (zoomMode == 0) {
      double wheel = rl.CoreD.GetMouseWheelMove();
      if (wheel != 0) {
        final mouseWorldPos = rl.CoreD.GetScreenToWorld2D(rl.CoreD.GetMousePosition(), camera);
        camera.offset.setD(rl.CoreD.GetMousePosition());
        camera.target = mouseWorldPos;
        double scale = 0.2*wheel;
        camera.zoom = rl.Clamp(math.exp(math.log(camera.zoom)+scale), 0.125, 64);
      }
    } else {
      if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT)) {
        final mouseWorldPos = rl.CoreD.GetScreenToWorld2D(rl.CoreD.GetMousePosition(), camera);
        camera.offset = rl.CoreD.GetMousePosition();
        camera.target = mouseWorldPos;
      }

      if (rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_RIGHT)) {
        double deltaX = rl.CoreD.GetMouseDelta().x;
        double scale = 0.005*deltaX;
        camera.zoom = rl.Clamp(math.exp(math.log(camera.zoom)+scale), 0.125, 64);
      }
    }

    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode2D(camera);
        rl.RlglD.rlPushMatrix();
          rl.RlglD.rlTranslatef(0, 25*50, 0);
          rl.RlglD.rlRotatef(90, 1, 0, 0);
          rl.CoreD.DrawGrid(100, 50);
        rl.RlglD.rlPopMatrix();

        rl.CoreD.DrawCircle(
          rl.CoreD.GetScreenWidth()~/2,
          rl.CoreD.GetScreenHeight()~/2,
          50,
          .MAROON
        );
      rl.CoreD.EndMode2D();

      rl.CoreD.DrawCircleV(rl.CoreD.GetMousePosition(), 4, .DARKGRAY);

      rl.CoreD.DrawTextEx(
        rl.CoreD.GetFontDefault(),
        "[${rl.CoreD.GetMouseX()}, ${rl.CoreD.GetMouseY()}]",
        rl.CoreD.GetMousePosition().add(.vec2(-44, -24)),
        20, 2, .BLACK,
      );

      rl.CoreD.DrawText(
        "[1][2] Select mouse zoom mode (Wheel or Move)",
        20, 20, 20, .DARKGRAY
      );

      if (zoomMode == 0) {
        rl.CoreD.DrawText(
          "Mouse left button drag to move, mouse wheel to zoom",
          20, 50, 20, .DARKGRAY
        );
      } else {
        rl.CoreD.DrawText(
          "Mouse left button drag to move, mouse press and move to zoom",
          20, 50, 20, .DARKGRAY
        ); 
      }

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}