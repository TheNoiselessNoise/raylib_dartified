// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_bouncing_ball.c
// Run it: dart run shapes_bouncing_ball.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_bouncing_ball");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final Vector2D ballPosition = .vec2(
    rl.CoreD.GetScreenWidth()/2.0, rl.CoreD.GetScreenHeight()/2.0
  );
  final Vector2D ballSpeed = .vec2(5.0, 4.0);
  int ballRadius = 20;

  bool pause = false;
  int framesCounter = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyPressed(.KEY_SPACE)) pause = !pause;

    if (!pause)
    {
      ballPosition.x += ballSpeed.x;
      ballPosition.y += ballSpeed.y;

      if (
        (ballPosition.x >= (rl.CoreD.GetScreenWidth() - ballRadius)) ||
        (ballPosition.x <= ballRadius)
      ) ballSpeed.x *= -1.0;
      
      if (
        (ballPosition.y >= (rl.CoreD.GetScreenHeight() - ballRadius)) ||
        (ballPosition.y <= ballRadius)
      ) ballSpeed.y *= -1.0;
    }
    else framesCounter++;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawCircleV(ballPosition, ballRadius.toDouble(), .MAROON);
      rl.CoreD.DrawText(
        "PRESS SPACE to PAUSE BALL MOVEMENT",
        10, rl.CoreD.GetScreenHeight() - 25, 20, .LIGHTGRAY
      );

      if (pause && ((framesCounter/30)%2 == 0))
        rl.CoreD.DrawText("PAUSED", 350, 200, 30, .GRAY);

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}