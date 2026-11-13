// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_input_keys.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "core_input_keys");
  SetTargetFPS(60);

  final Vector2 ballPosition = .vec2(screenWidth/2, screenHeight/2);

  rl.setMainLoop(() {
    if (IsKeyDown(.KEY_RIGHT)) ballPosition.x += 2.0;
    if (IsKeyDown(.KEY_LEFT)) ballPosition.x -= 2.0;
    if (IsKeyDown(.KEY_UP)) ballPosition.y -= 2.0;
    if (IsKeyDown(.KEY_DOWN)) ballPosition.y += 2.0;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("move the ball with arrow keys", 10, 10, 20, DARKGRAY);

      DrawCircleV(ballPosition, 50, MAROON);

    EndDrawing();
  });
});