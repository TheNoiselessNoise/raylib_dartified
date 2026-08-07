// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_scissor_test.c
// Run it: dart run core_scissor_test.dart
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_scissor_test".toC);
  SetTargetFPS(60);

  final scissorArea = Rectangle$.$new.set(0, 0, 300, 300);
  bool scissorMode = true;

  while (!WindowShouldClose()) {
    if (IsKeyPressed(KeyboardKey.KEY_S.value)) scissorMode = !scissorMode;

    scissorArea.x = GetMouseX() - scissorArea.width/2;
    scissorArea.y = GetMouseY() - scissorArea.height/2;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (scissorMode) BeginScissorMode(scissorArea.x.toInt(), scissorArea.y.toInt(), scissorArea.width.toInt(), scissorArea.height.toInt());

      DrawRectangle(0, 0, GetScreenWidth(), GetScreenHeight(), RED);
      DrawText("Move the mouse around to reveal this text!".toC, 190, 200, 20, LIGHTGRAY);

      if (scissorMode) EndScissorMode();

      DrawRectangleLinesEx(scissorArea, 1, BLACK);
      DrawText("Press S to toggle scissor test".toC, 10, 10, 20, BLACK);

    EndDrawing();
  }

  CloseWindowAndDispose();
}