// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_bouncing_ball.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shapes_bouncing_ball");
  SetTargetFPS(60);

  final Vector2 ballPosition = .vec2(
    GetScreenWidth()/2.0, GetScreenHeight()/2.0
  );
  final Vector2 ballSpeed = .vec2(5.0, 4.0);
  int ballRadius = 20;

  bool pause = false;
  int framesCounter = 0;

  rl.setMainLoop(() {
    if (IsKeyPressed(.KEY_SPACE)) pause = !pause;

    if (!pause)
    {
      ballPosition.x += ballSpeed.x;
      ballPosition.y += ballSpeed.y;

      if (
        (ballPosition.x >= (GetScreenWidth() - ballRadius)) ||
        (ballPosition.x <= ballRadius)
      ) ballSpeed.x *= -1.0;
      
      if (
        (ballPosition.y >= (GetScreenHeight() - ballRadius)) ||
        (ballPosition.y <= ballRadius)
      ) ballSpeed.y *= -1.0;
    }
    else framesCounter++;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawCircleV(ballPosition, ballRadius, .MAROON);
      DrawText(
        "PRESS SPACE to PAUSE BALL MOVEMENT",
        10, GetScreenHeight() - 25, 20, .LIGHTGRAY
      );

      if (pause && ((framesCounter/30)%2 == 0))
        DrawText("PAUSED", 350, 200, 30, .GRAY);

      DrawFPS(10, 10);

    EndDrawing();
  });
});