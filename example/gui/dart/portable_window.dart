// Example dartified, see original for reference:
// https://github.com/raysan5/raygui/blob/master/examples/portable_window/portable_window.c
// Run it: dart run portable_window.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 600;

void main()
{
  final rl = loadBaseRaylib();

  final Vector2D mousePosition = .zero();
  final Vector2D windowPosition = .vec2(500, 200);
  final Vector2D panOffset = .zero();
  bool dragWindow = false;
  bool exitWindow = false;

  rl.CoreD.SetConfigFlags([.FLAG_WINDOW_UNDECORATED]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "portable_window");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetWindowPosition(windowPosition.x, windowPosition.y);
  rl.CoreD.SetTargetFPS(60);

  while (!exitWindow && !rl.CoreD.WindowShouldClose())
  {
    mousePosition.setD(rl.CoreD.GetMousePosition());

    if (
      rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT) &&
      !dragWindow
    ) {
      if (rl.CoreD.CheckCollisionPointRec(
        mousePosition,
        .rect(0, 0, screenWidth, 20)
      )) {
        windowPosition.setD(rl.CoreD.GetWindowPosition());
        dragWindow = true;
        panOffset.setD(mousePosition);
      }
    }

    if (dragWindow) {
      windowPosition.setD(windowPosition.add(mousePosition.sub(panOffset)));

      rl.CoreD.SetWindowPosition(windowPosition.x, windowPosition.y);

      if (rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) {
        dragWindow = false;
      }
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      exitWindow = rl.GuiD.GuiWindowBox(
        .rect(0, 0, screenWidth, screenHeight),
        "#198# PORTABLE WINDOW"
      ) != 0;

      rl.CoreD.DrawText(
        "Mouse Position: $mousePosition",
        10, 40, 10, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "Window Position: $windowPosition",
        10, 60, 10, .DARKGRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}