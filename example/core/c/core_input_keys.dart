// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_input_keys.c
// Run it: dart run core_input_keys.dart
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_input_keys".toC);
  SetTargetFPS(60);

  final ballPosition = Vector2$.$new.set(screenWidth/2, screenHeight/2);

  while (!WindowShouldClose()) {
    if (IsKeyDown(KeyboardKey.KEY_RIGHT.value)) ballPosition.x += 2.0;
    if (IsKeyDown(KeyboardKey.KEY_LEFT.value)) ballPosition.x -= 2.0;
    if (IsKeyDown(KeyboardKey.KEY_UP.value)) ballPosition.y -= 2.0;
    if (IsKeyDown(KeyboardKey.KEY_DOWN.value)) ballPosition.y += 2.0;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("move the ball with arrow keys".toC, 10, 10, 20, DARKGRAY);

      DrawCircleV(ballPosition, 50, MAROON);

    EndDrawing();
  }

  CloseWindowAndDispose();
}