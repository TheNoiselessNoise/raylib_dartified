// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse_wheel.c
// Run it: dart run core_input_mouse_wheel.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_input_mouse_wheel');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  int boxPositionY = screenHeight~/2 - 40;
  int scrollSpeed = 4;

  while (!rl.CoreD.WindowShouldClose()) {
    boxPositionY -= (rl.CoreD.GetMouseWheelMove()*scrollSpeed).toInt();

    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawRectangle(screenWidth~/2 - 40, boxPositionY, 80, 80, .MAROON);

      rl.CoreD.DrawText(
        "Use mouse wheel to move the cube up and down!",
        10, 10, 20, .GRAY
      );
      rl.CoreD.DrawText(
        "Box position Y: ${boxPositionY.pad(3)}",
        10, 40, 20, .LIGHTGRAY
      );
    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}