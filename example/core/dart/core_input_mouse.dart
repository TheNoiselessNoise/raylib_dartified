// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse.c
// Run it: dart run core_input_mouse.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_input_mouse");
  SetTargetFPS(60);

  Vector2D ballPosition = .vec2(-100.0, -100.0);
  ColorD ballColor = DARKBLUE;

  while (!WindowShouldClose()) {
    if (IsKeyPressed(.KEY_H))
    {
      if (IsCursorHidden()) ShowCursor();
      else HideCursor();
    }

    ballPosition = GetMousePosition();

    if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) ballColor = MAROON;
    else if (IsMouseButtonPressed(.MOUSE_BUTTON_MIDDLE)) ballColor = LIME;
    else if (IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT)) ballColor = DARKBLUE;
    else if (IsMouseButtonPressed(.MOUSE_BUTTON_SIDE)) ballColor = PURPLE;
    else if (IsMouseButtonPressed(.MOUSE_BUTTON_EXTRA)) ballColor = YELLOW;
    else if (IsMouseButtonPressed(.MOUSE_BUTTON_FORWARD)) ballColor = ORANGE;
    else if (IsMouseButtonPressed(.MOUSE_BUTTON_BACK)) ballColor = BEIGE;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawCircleV(ballPosition, 40, ballColor);

      DrawText("move ball with mouse and click mouse button to change color", 10, 10, 20, DARKGRAY);
      DrawText("Press 'H' to toggle cursor visibility", 10, 30, 20, DARKGRAY);

      if (IsCursorHidden()) DrawText("CURSOR HIDDEN", 20, 60, 20, RED);
      else DrawText("CURSOR VISIBLE", 20, 60, 20, LIME);

    EndDrawing();
  }

  CloseWindowAndDispose();
}
