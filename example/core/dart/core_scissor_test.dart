// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_scissor_test.c
// Run it: dart run core_scissor_test.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_scissor_test");
  SetTargetFPS(60);

  final RectangleD scissorArea = .rect(0, 0, 300, 300);
  bool scissorMode = true;

  while (!WindowShouldClose()) {
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
  }

  CloseWindowAndDispose();
}