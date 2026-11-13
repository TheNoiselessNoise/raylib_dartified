// Example dartified, see original for reference:
// https://github.com/raysan5/raygui/blob/master/examples/portable_window/portable_window.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 600;

void main() => Raylib((rl) {
  Vector2 mousePosition = .zero();
  Vector2 windowPosition = .vec2(500, 200);
  Vector2 panOffset = .zero();
  bool dragWindow = false;

  SetConfigFlags([.FLAG_WINDOW_UNDECORATED]);
  InitWindow(screenWidth, screenHeight, "portable_window");
  SetWindowMonitor(0);
  SetWindowPosition(windowPosition.x, windowPosition.y);
  SetTargetFPS(60);

  rl.setMainLoop(() {
    mousePosition = GetMousePosition();

    if (
      IsMouseButtonDown(.MOUSE_BUTTON_LEFT) &&
      !dragWindow
    ) {
      if (CheckCollisionPointRec(
        mousePosition,
        .rect(0, 0, screenWidth, 20)
      )) {
        windowPosition = GetWindowPosition();
        dragWindow = true;
        panOffset = mousePosition.copy();
      }
    }

    if (dragWindow) {
      windowPosition = windowPosition.add(mousePosition.sub(panOffset));

      SetWindowPosition(windowPosition.x, windowPosition.y);

      if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) {
        dragWindow = false;
      }
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      GuiWindowBox(
        .rect(0, 0, screenWidth, screenHeight),
        "#198# PORTABLE WINDOW"
      );

      DrawText(
        "Mouse Position: $mousePosition",
        10, 40, 10, .DARKGRAY
      );
      DrawText(
        "Window Position: $windowPosition",
        10, 60, 10, .DARKGRAY
      );

    EndDrawing();
  });
});