// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_window.c
// Run it: dart run core_basic_window.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_basic_window'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  while (!rl.Core.WindowShouldClose()) {
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);
      rl.Core.DrawText(
        "Congrats! You created your first window!".toC,
        190, 200, 20, rl.Color.LIGHTGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}