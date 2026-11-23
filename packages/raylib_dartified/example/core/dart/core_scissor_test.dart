// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_scissor_test.c
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Rectangle scissorArea;
bool scissorMode = true;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "core_scissor_test");
    SetTargetFPS(60);

    scissorArea = .rect(0, 0, 300, 300);
  },
  loop: (_) async {
    if (IsKeyPressed(.KEY_S)) scissorMode = !scissorMode;

    scissorArea.x = GetMouseX() - scissorArea.width/2;
    scissorArea.y = GetMouseY() - scissorArea.height/2;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (scissorMode) BeginScissorMode(scissorArea.x, scissorArea.y, scissorArea.width, scissorArea.height);

      DrawRectangle(0, 0, GetScreenWidth(), GetScreenHeight(), RED);
      DrawText("Move the mouse around to reveal this text!", 190, 200, 20, LIGHTGRAY);

      if (scissorMode) EndScissorMode();

      DrawRectangleLinesEx(scissorArea, 1, BLACK);
      DrawText("Press S to toggle scissor test", 10, 10, 20, BLACK);

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);