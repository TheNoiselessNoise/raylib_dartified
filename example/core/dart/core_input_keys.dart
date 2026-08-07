// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_input_keys.c
// Run it: dart run core_input_keys.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_input_keys");
  SetTargetFPS(60);

  final Vector2D ballPosition = .vec2(screenWidth/2, screenHeight/2);

  while (!WindowShouldClose()) {
    if (IsKeyDown(.KEY_RIGHT)) ballPosition.x += 2.0;
    if (IsKeyDown(.KEY_LEFT)) ballPosition.x -= 2.0;
    if (IsKeyDown(.KEY_UP)) ballPosition.y -= 2.0;
    if (IsKeyDown(.KEY_DOWN)) ballPosition.y += 2.0;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("move the ball with arrow keys", 10, 10, 20, DARKGRAY);

      DrawCircleV(ballPosition, 50, MAROON);

    EndDrawing();
  }

  CloseWindowAndDispose();
}