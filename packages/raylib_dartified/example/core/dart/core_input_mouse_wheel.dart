// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse_wheel.c
// Run it: dart run core_input_mouse_wheel.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_input_mouse_wheel");
  SetTargetFPS(60);

  int boxPositionY = screenHeight~/2 - 40;
  int scrollSpeed = 4;

  while (!WindowShouldClose()) {
    boxPositionY -= (GetMouseWheelMove()*scrollSpeed).toInt();

    BeginDrawing();
      ClearBackground(.RAYWHITE);

      DrawRectangle(screenWidth~/2 - 40, boxPositionY, 80, 80, .MAROON);

      DrawText(
        "Use mouse wheel to move the cube up and down!",
        10, 10, 20, .GRAY
      );
      DrawText(
        "Box position Y: ${boxPositionY.pad(3)}",
        10, 40, 20, .LIGHTGRAY
      );
    EndDrawing();
  }

  CloseWindowAndDispose();
}