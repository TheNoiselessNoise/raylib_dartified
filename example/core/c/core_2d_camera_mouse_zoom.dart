// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera_mouse_zoom.c
// Run it: dart run core_2d_camera_mouse_zoom.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = loadBaseRaylib();

  final camera = rl.Temp.Camera2D$.At('camera');
  camera.ref.zoom = 1;

  int zoomMode = 0;

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_2d_camera_mouse_zoom'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  while (!rl.Core.WindowShouldClose()) {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ONE.value)) {
      zoomMode = 0;
    } else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_TWO.value)) {
      zoomMode = 1;
    }

    if (rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      final delta = rl.Core.GetMouseDelta();
      final finalDelta = delta.toD().scale(-1/camera.ref.zoom);
      camera.ref.target.setD(camera.ref.target.toD().add(finalDelta));
    }

    if (zoomMode == 0) {
      double wheel = rl.Core.GetMouseWheelMove();
      if (wheel != 0) {
        final mouseWorldPos = rl.Core.GetScreenToWorld2D(rl.Core.GetMousePosition(), camera.ref);
        camera.ref.offset.setC(rl.Core.GetMousePosition());
        camera.ref.target = mouseWorldPos;
        double scale = 0.2*wheel;
        camera.ref.zoom = rl.Clamp(math.exp(math.log(camera.ref.zoom)+scale), 0.125, 64);
      }
    } else {
      if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT.value)) {
        final mouseWorldPos = rl.Core.GetScreenToWorld2D(rl.Core.GetMousePosition(), camera.ref);
        camera.ref.offset = rl.Core.GetMousePosition();
        camera.ref.target = mouseWorldPos;
      }

      if (rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value)) {
        double deltaX = rl.Core.GetMouseDelta().x;
        double scale = 0.005*deltaX;
        camera.ref.zoom = rl.Clamp(math.exp(math.log(camera.ref.zoom)+scale), 0.125, 64);
      }
    }

    rl.Core.BeginDrawing();
      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.BeginMode2D(camera.ref);
        rl.Rlgl.rlPushMatrix();
          rl.Rlgl.rlTranslatef(0, 25*50, 0);
          rl.Rlgl.rlRotatef(90, 1, 0, 0);
          rl.Core.DrawGrid(100, 50);
        rl.Rlgl.rlPopMatrix();

        rl.Core.DrawCircle(rl.Core.GetScreenWidth()~/2, rl.Core.GetScreenHeight()~/2, 50, rl.C.MAROON);
      rl.Core.EndMode2D();

      rl.Core.DrawCircleV(rl.Core.GetMousePosition(), 4, rl.C.DARKGRAY);

      final textPos = rl.Core.GetMousePosition().toD().add(.vec2(-44, -24));

      rl.Core.DrawTextEx(
        rl.Core.GetFontDefault(),
        "[${rl.Core.GetMouseX()}, ${rl.Core.GetMouseY()}]".toC,
        rl.Temp.vec21D(textPos),
        20, 2, rl.C.BLACK,
      );

      rl.Core.DrawText(
        "[1][2] Select mouse zoom mode (Wheel or Move)".toC,
        20, 20, 20, rl.C.DARKGRAY
      );

      if (zoomMode == 0) {
        rl.Core.DrawText(
          "Mouse left button drag to move, mouse wheel to zoom".toC,
          20, 50, 20, rl.C.DARKGRAY
        );
      } else {
        rl.Core.DrawText(
          "Mouse left button drag to move, mouse press and move to zoom".toC,
          20, 50, 20, rl.C.DARKGRAY
        ); 
      }

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}