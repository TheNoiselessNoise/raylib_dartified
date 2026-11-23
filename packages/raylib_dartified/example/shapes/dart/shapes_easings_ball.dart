// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_easings_ball.c
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

int ballPositionX = -100;
int ballRadius = 20;
double ballAlpha = 0.0;
int state = 0;
int framesCounter = 0;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shapes_easings_ball");
    SetTargetFPS(60);
  },
  loop: (_) async {
    if (state == 0)
    {
      framesCounter++;
      ballPositionX = EaseElasticOut(framesCounter, -100, screenWidth/2.0 + 100, 120).toInt();

      if (framesCounter >= 120)
      {
        framesCounter = 0;
        state = 1;
      }
    }
    else if (state == 1)
    {
      framesCounter++;
      ballRadius = EaseElasticIn(framesCounter, 20, 500, 200).toInt();

      if (framesCounter >= 200)
      {
        framesCounter = 0;
        state = 2;
      }
    }
    else if (state == 2)
    {
      framesCounter++;
      ballAlpha = EaseCubicOut(framesCounter, 0.0, 1.0, 200);

      if (framesCounter >= 200)
      {
        framesCounter = 0;
        state = 3;
      }
    }
    else if (state == 3)
    {
      if (IsKeyPressed(.KEY_ENTER))
      {
        ballPositionX = -100;
        ballRadius = 20;
        ballAlpha = 0.0;
        state = 0;
      }
    }

    if (IsKeyPressed(.KEY_R)) framesCounter = 0;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      if (state >= 2) DrawRectangle(0, 0, screenWidth, screenHeight, .GREEN);
      DrawCircle(ballPositionX, 200, ballRadius, Fade(.RED, 1.0 - ballAlpha));

      if (state == 3) DrawText(
        "PRESS [ENTER] TO PLAY AGAIN!",
        240, 200, 20, .BLACK
      );

      DrawFPS(10, 10);

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);