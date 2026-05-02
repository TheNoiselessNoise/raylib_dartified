// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_bouncing_ball.c
// Run it: dart run shapes_bouncing_ball.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_bouncing_ball".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final ballPosition = rl.Temp.Vector2$.At('ballPosition').set(
    rl.Core.GetScreenWidth()/2.0, rl.Core.GetScreenHeight()/2.0
  );
  final ballSpeed = rl.Temp.Vector2$.At('ballSpeed').set(5.0, 4.0);
  int ballRadius = 20;

  bool pause = false;
  int framesCounter = 0;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value)) pause = !pause;

    if (!pause)
    {
      ballPosition.ref.x += ballSpeed.ref.x;
      ballPosition.ref.y += ballSpeed.ref.y;

      if (
        (ballPosition.ref.x >= (rl.Core.GetScreenWidth() - ballRadius)) ||
        (ballPosition.ref.x <= ballRadius)
      ) ballSpeed.ref.x *= -1.0;
      
      if (
        (ballPosition.ref.y >= (rl.Core.GetScreenHeight() - ballRadius)) ||
        (ballPosition.ref.y <= ballRadius)
      ) ballSpeed.ref.y *= -1.0;
    }
    else framesCounter++;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.DrawCircleV(ballPosition.ref, ballRadius.toDouble(), rl.C.MAROON);
      rl.Core.DrawText(
        "PRESS SPACE to PAUSE BALL MOVEMENT".toC,
        10, rl.Core.GetScreenHeight() - 25, 20, rl.C.LIGHTGRAY
      );

      if (pause && ((framesCounter/30)%2 == 0))
        rl.Core.DrawText("PAUSED".toC, 350, 200, 30, rl.C.GRAY);

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}