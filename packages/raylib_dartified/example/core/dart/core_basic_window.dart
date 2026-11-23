// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_window.c
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "core_basic_window");
    SetTargetFPS(60);
  },
  loop: (_) async {
    BeginDrawing();

      ClearBackground(.RAYWHITE);
      DrawText(
        "Congrats! You created your first window!",
        190, 200, 20, .LIGHTGRAY
      );

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);