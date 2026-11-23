// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera_mouse_zoom.c
import 'dart:math' as math;
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Camera2D camera;
int zoomMode = 0;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "core_2d_camera_mouse_zoom");
    SetTargetFPS(60);

    camera = .new(zoom: 1);
  },
  loop: (_) async {
    if (IsKeyPressed(.KEY_ONE)) {
      zoomMode = 0;
    } else if (IsKeyPressed(.KEY_TWO)) {
      zoomMode = 1;
    }

    if (IsMouseButtonDown(.MOUSE_BUTTON_LEFT)) {
      final delta = GetMouseDelta();
      final finalDelta = delta.scale(-1/camera.zoom);
      camera.target = camera.target.add(finalDelta);
    }

    if (zoomMode == 0) {
      double wheel = GetMouseWheelMove();
      if (wheel != 0) {
        final mouseWorldPos = GetScreenToWorld2D(GetMousePosition(), camera);
        camera.offset = GetMousePosition();
        camera.target = mouseWorldPos;
        double scale = 0.2*wheel;
        camera.zoom = Clamp(math.exp(math.log(camera.zoom)+scale), 0.125, 64);
      }
    } else {
      if (IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT)) {
        final mouseWorldPos = GetScreenToWorld2D(GetMousePosition(), camera);
        camera.offset = GetMousePosition();
        camera.target = mouseWorldPos;
      }

      if (IsMouseButtonDown(.MOUSE_BUTTON_RIGHT)) {
        double deltaX = GetMouseDelta().x;
        double scale = 0.005*deltaX;
        camera.zoom = Clamp(math.exp(math.log(camera.zoom)+scale), 0.125, 64);
      }
    }

    BeginDrawing();
      ClearBackground(.RAYWHITE);

      BeginMode2D(camera);
        rlPushMatrix();
          rlTranslatef(0, 25*50, 0);
          rlRotatef(90, 1, 0, 0);
          DrawGrid(100, 50);
        rlPopMatrix();

        DrawCircle(
          GetScreenWidth()~/2,
          GetScreenHeight()~/2,
          50,
          .MAROON
        );
      EndMode2D();

      DrawCircleV(GetMousePosition(), 4, .DARKGRAY);

      DrawTextEx(
        GetFontDefault(),
        "[${GetMouseX()}, ${GetMouseY()}]",
        GetMousePosition().add(.vec2(-44, -24)),
        20, 2, .BLACK,
      );

      DrawText(
        "[1][2] Select mouse zoom mode (Wheel or Move)",
        20, 20, 20, .DARKGRAY
      );

      if (zoomMode == 0) {
        DrawText(
          "Mouse left button drag to move, mouse wheel to zoom",
          20, 50, 20, .DARKGRAY
        );
      } else {
        DrawText(
          "Mouse left button drag to move, mouse press and move to zoom",
          20, 50, 20, .DARKGRAY
        ); 
      }

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);