// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_window.c
// Run it: dart run core_basic_window.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_basic_window");
  SetTargetFPS(60);

  while (!WindowShouldClose()) {
    BeginDrawing();

      ClearBackground(.RAYWHITE);
      DrawText(
        "Congrats! You created your first window!",
        190, 200, 20, .LIGHTGRAY
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}