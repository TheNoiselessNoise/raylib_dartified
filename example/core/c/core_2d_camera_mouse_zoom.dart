// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera_mouse_zoom.c
// Run it: dart run core_2d_camera_mouse_zoom.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  final camera = Camera2D$.val.$newPtr;
  camera.ref.zoom = 1;

  int zoomMode = 0;

  InitWindow(screenWidth, screenHeight, "core_2d_camera_mouse_zoom".toC);
  SetTargetFPS(60);

  while (!WindowShouldClose()) {
    if (IsKeyPressed(KeyboardKey.KEY_ONE.value)) {
      zoomMode = 0;
    } else if (IsKeyPressed(KeyboardKey.KEY_TWO.value)) {
      zoomMode = 1;
    }

    if (IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      final delta = GetMouseDelta();
      final finalDelta = delta.toD().scale(-1/camera.ref.zoom);
      camera.ref.target.setD(camera.ref.target.toD().add(finalDelta));
    }

    if (zoomMode == 0) {
      double wheel = GetMouseWheelMove();
      if (wheel != 0) {
        final mouseWorldPos = GetScreenToWorld2D(GetMousePosition(), camera.ref);
        camera.ref.offset.setC(GetMousePosition());
        camera.ref.target = mouseWorldPos;
        double scale = 0.2*wheel;
        camera.ref.zoom = Clamp(math.exp(math.log(camera.ref.zoom)+scale), 0.125, 64);
      }
    } else {
      if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT.value)) {
        final mouseWorldPos = GetScreenToWorld2D(GetMousePosition(), camera.ref);
        camera.ref.offset = GetMousePosition();
        camera.ref.target = mouseWorldPos;
      }

      if (IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value)) {
        double deltaX = GetMouseDelta().x;
        double scale = 0.005*deltaX;
        camera.ref.zoom = Clamp(math.exp(math.log(camera.ref.zoom)+scale), 0.125, 64);
      }
    }

    BeginDrawing();
      ClearBackground(RAYWHITE);

      BeginMode2D(camera.ref);
        rlPushMatrix();
          rlTranslatef(0, 25*50, 0);
          rlRotatef(90, 1, 0, 0);
          DrawGrid(100, 50);
        rlPopMatrix();

        DrawCircle(GetScreenWidth()~/2, GetScreenHeight()~/2, 50, MAROON);
      EndMode2D();

      DrawCircleV(GetMousePosition(), 4, DARKGRAY);

      final textPos = GetMousePosition().toD().add(.vec2(-44, -24));

      DrawTextEx(
        GetFontDefault(),
        "[${GetMouseX()}, ${GetMouseY()}]".toC,
        Vector2$.val.$1.setD(textPos),
        20, 2, BLACK,
      );

      DrawText(
        "[1][2] Select mouse zoom mode (Wheel or Move)".toC,
        20, 20, 20, DARKGRAY
      );

      if (zoomMode == 0) {
        DrawText(
          "Mouse left button drag to move, mouse wheel to zoom".toC,
          20, 50, 20, DARKGRAY
        );
      } else {
        DrawText(
          "Mouse left button drag to move, mouse press and move to zoom".toC,
          20, 50, 20, DARKGRAY
        ); 
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}