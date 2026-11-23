// Example dartified, see original for reference:
// https://github.com/raysan5/raygui/blob/master/examples/portable_window/portable_window.c
// WARNING: if you are running under Linux/Wayland you should run with:
// `WAYLAND_DISPLAY= XDG_SESSION_TYPE=x11`
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 600;

bool _windowShouldClose() => switch (currentMemoryPlatformType) {
  .native => WindowShouldClose(),
  .web => false,
};

late Vector2 mousePosition;
late Vector2 windowPosition;
late Vector2 panOffset;
bool dragWindow = false;
bool exitWindow = false;

void main() => runExample(
  init: (_) {
    mousePosition = .zero();
    windowPosition = .vec2(500, 200);
    panOffset = .zero();

    SetConfigFlags([.FLAG_WINDOW_UNDECORATED]);
    InitWindow(screenWidth, screenHeight, "portable_window");
    SetWindowPosition(windowPosition.x, windowPosition.y);
    SetTargetFPS(60);
  },
  shouldClose: (_) => !(!exitWindow && !_windowShouldClose()),
  loop: (_) async {
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

      exitWindow = GuiWindowBox(
        .rect(0, 0, screenWidth, screenHeight),
        "#198# PORTABLE WINDOW"
      ) != .RESULT_NONE;

      DrawText(
        "Mouse Position: $mousePosition",
        10, 40, 10, .DARKGRAY
      );
      DrawText(
        "Window Position: $windowPosition",
        10, 60, 10, .DARKGRAY
      );

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);