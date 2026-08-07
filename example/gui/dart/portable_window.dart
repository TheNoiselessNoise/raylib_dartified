// Example dartified, see original for reference:
// https://github.com/raysan5/raygui/blob/master/examples/portable_window/portable_window.c
// Run it: dart run portable_window.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 600;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  final Vector2D mousePosition = .zero();
  final Vector2D windowPosition = .vec2(500, 200);
  final Vector2D panOffset = .zero();
  bool dragWindow = false;
  bool exitWindow = false;

  SetConfigFlags([.FLAG_WINDOW_UNDECORATED]);
  InitWindow(screenWidth, screenHeight, "portable_window");
  SetWindowPosition(windowPosition.x, windowPosition.y);
  SetTargetFPS(60);

  while (!exitWindow && !WindowShouldClose())
  {
    mousePosition.setD(GetMousePosition());

    if (
      IsMouseButtonDown(.MOUSE_BUTTON_LEFT) &&
      !dragWindow
    ) {
      if (CheckCollisionPointRec(
        mousePosition,
        .rect(0, 0, screenWidth, 20)
      )) {
        windowPosition.setD(GetWindowPosition());
        dragWindow = true;
        panOffset.setD(mousePosition);
      }
    }

    if (dragWindow) {
      windowPosition.setD(windowPosition.add(mousePosition.sub(panOffset)));

      SetWindowPosition(windowPosition.x, windowPosition.y);

      if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) {
        dragWindow = false;
      }
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      exitWindow = GuiWindowBox(
        .rect(0, 0, screenWidth, screenHeight),
        "#198# PORTABLE WINDOW"
      ) != 0;

      DrawText(
        "Mouse Position: $mousePosition",
        10, 40, 10, .DARKGRAY
      );
      DrawText(
        "Window Position: $windowPosition",
        10, 60, 10, .DARKGRAY
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}