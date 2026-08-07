// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_window_should_close.c
// Run it: dart run core_window_should_close.dart
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_window_should_close".toC);
  SetTargetFPS(60);

  SetExitKey(KeyboardKey.KEY_NULL.value);

  bool exitWindowRequested = false;
  bool exitWindow = false;

  while (!exitWindow) {
    if (WindowShouldClose() || IsKeyPressed(KeyboardKey.KEY_ESCAPE.value)) exitWindowRequested = true;

    if (exitWindowRequested)
    {
      if (IsKeyPressed(KeyboardKey.KEY_Y.value)) exitWindow = true;
      else if (IsKeyPressed(KeyboardKey.KEY_N.value)) exitWindowRequested = false;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (exitWindowRequested)
      {
        DrawRectangle(0, 100, screenWidth, 200, BLACK);
        DrawText("Are you sure you want to exit program? [Y/N]".toC, 40, 180, 30, WHITE);
      }
      else DrawText("Try to close the window to get confirmation message!".toC, 120, 200, 20, LIGHTGRAY);

    EndDrawing();
  }

  CloseWindowAndDispose();
}
