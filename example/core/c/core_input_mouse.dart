// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse.c
// Run it: dart run core_input_mouse.dart
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_input_mouse".toC);
  SetTargetFPS(60);

  var ballPosition = Vector2$.$new.set(-100.0, -100.0);
  ColorC ballColor = DARKBLUE;

  while (!WindowShouldClose()) {
    if (IsKeyPressed(KeyboardKey.KEY_H.value))
    {
      if (IsCursorHidden()) ShowCursor();
      else HideCursor();
    }

    ballPosition = GetMousePosition();

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) ballColor = MAROON;
    else if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_MIDDLE.value)) ballColor = LIME;
    else if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT.value)) ballColor = DARKBLUE;
    else if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_SIDE.value)) ballColor = PURPLE;
    else if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_EXTRA.value)) ballColor = YELLOW;
    else if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_FORWARD.value)) ballColor = ORANGE;
    else if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_BACK.value)) ballColor = BEIGE;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawCircleV(ballPosition, 40, ballColor);

      DrawText("move ball with mouse and click mouse button to change color".toC, 10, 10, 20, DARKGRAY);
      DrawText("Press 'H' to toggle cursor visibility".toC, 10, 30, 20, DARKGRAY);

      if (IsCursorHidden()) DrawText("CURSOR HIDDEN".toC, 20, 60, 20, RED);
      else DrawText("CURSOR VISIBLE".toC, 20, 60, 20, LIME);

    EndDrawing();
  }

  CloseWindowAndDispose();
}
