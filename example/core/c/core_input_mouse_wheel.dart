// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse_wheel.c
// Run it: dart run core_input_mouse_wheel.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_input_mouse_wheel'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  int boxPositionY = screenHeight~/2 - 40;
  int scrollSpeed = 4;

  while (!rl.Core.WindowShouldClose()) {
    boxPositionY -= (rl.Core.GetMouseWheelMove()*scrollSpeed).toInt();

    rl.Core.BeginDrawing();
      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawRectangle(screenWidth~/2 - 40, boxPositionY, 80, 80, rl.Color.MAROON);

      rl.Core.DrawText(
        "Use mouse wheel to move the cube up and down!".toC,
        10, 10, 20, rl.Color.GRAY
      );
      rl.Core.DrawText(
        "Box position Y: ${boxPositionY.pad(3)}".toC,
        10, 40, 20, rl.Color.LIGHTGRAY
      );
    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}