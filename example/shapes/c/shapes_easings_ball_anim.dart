// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_easings_ball_anim.c
// Run it: dart run shapes_easings_ball_anim.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_easings_ball_anim".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  int ballPositionX = -100;
  int ballRadius = 20;
  double ballAlpha = 0.0;

  int state = 0;
  int framesCounter = 0;

  while (!rl.Core.WindowShouldClose())
  {
    if (state == 0)
    {
      framesCounter++;
      ballPositionX = rl.Ease.EaseElasticOut(framesCounter, -100, screenWidth/2.0 + 100, 120).toInt();

      if (framesCounter >= 120)
      {
        framesCounter = 0;
        state = 1;
      }
    }
    else if (state == 1)
    {
      framesCounter++;
      ballRadius = rl.Ease.EaseElasticIn(framesCounter, 20, 500, 200).toInt();

      if (framesCounter >= 200)
      {
        framesCounter = 0;
        state = 2;
      }
    }
    else if (state == 2)
    {
      framesCounter++;
      ballAlpha = rl.Ease.EaseCubicOut(framesCounter, 0.0, 1.0, 200);

      if (framesCounter >= 200)
      {
        framesCounter = 0;
        state = 3;
      }
    }
    else if (state == 3)
    {
      if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ENTER.value))
      {
        ballPositionX = -100;
        ballRadius = 20;
        ballAlpha = 0.0;
        state = 0;
      }
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_R.value)) framesCounter = 0;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      if (state >= 2) rl.Core.DrawRectangle(0, 0, screenWidth, screenHeight, rl.Color.GREEN);
      rl.Core.DrawCircle(ballPositionX, 200, ballRadius.toDouble(), rl.Core.Fade(rl.Color.RED, 1.0 - ballAlpha));

      if (state == 3) rl.Core.DrawText(
        "PRESS [ENTER] TO PLAY AGAIN!".toC,
        240, 200, 20, rl.Color.BLACK
      );

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}