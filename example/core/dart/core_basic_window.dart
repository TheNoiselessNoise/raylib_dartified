// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_window.c
// Run it: dart run core_basic_window.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_basic_window');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  while (!rl.CoreD.WindowShouldClose()) {
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);
      rl.CoreD.DrawText(
        "Congrats! You created your first window!",
        190, 200, 20, .LIGHTGRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}