// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_window_should_close.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "core_window_should_close");
  SetTargetFPS(60);

  SetExitKey(.KEY_NULL);

  bool exitWindowRequested = false;
  bool exitWindow = false;

  rl.setMainLoop(() {
    if (exitWindow) {
      rl.cancelMainLoop();
      return;
    }

    if (WindowShouldClose() || IsKeyPressed(.KEY_ESCAPE)) exitWindowRequested = true;

    if (exitWindowRequested)
    {
      if (IsKeyPressed(.KEY_Y)) exitWindow = true;
      else if (IsKeyPressed(.KEY_N)) exitWindowRequested = false;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (exitWindowRequested)
      {
        DrawRectangle(0, 100, screenWidth, 200, BLACK);
        DrawText("Are you sure you want to exit program? [Y/N]", 40, 180, 30, WHITE);
      }
      else DrawText("Try to close the window to get confirmation message!", 120, 200, 20, LIGHTGRAY);

    EndDrawing();
  });
});