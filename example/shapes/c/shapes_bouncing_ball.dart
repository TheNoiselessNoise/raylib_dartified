// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_bouncing_ball.c
// Run it: dart run shapes_bouncing_ball.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shapes_bouncing_ball".toC);
  SetTargetFPS(60);

  final ballPosition = Vector2$.At('ballPosition').set(
    GetScreenWidth()/2.0, GetScreenHeight()/2.0
  );
  final ballSpeed = Vector2$.At('ballSpeed').set(5.0, 4.0);
  int ballRadius = 20;

  bool pause = false;
  int framesCounter = 0;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) pause = !pause;

    if (!pause)
    {
      ballPosition.ref.x += ballSpeed.ref.x;
      ballPosition.ref.y += ballSpeed.ref.y;

      if (
        (ballPosition.ref.x >= (GetScreenWidth() - ballRadius)) ||
        (ballPosition.ref.x <= ballRadius)
      ) ballSpeed.ref.x *= -1.0;
      
      if (
        (ballPosition.ref.y >= (GetScreenHeight() - ballRadius)) ||
        (ballPosition.ref.y <= ballRadius)
      ) ballSpeed.ref.y *= -1.0;
    }
    else framesCounter++;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawCircleV(ballPosition.ref, ballRadius.toDouble(), MAROON);
      DrawText(
        "PRESS SPACE to PAUSE BALL MOVEMENT".toC,
        10, GetScreenHeight() - 25, 20, LIGHTGRAY
      );

      if (pause && ((framesCounter/30)%2 == 0))
        DrawText("PAUSED".toC, 350, 200, 30, GRAY);

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}