// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_following_eyes.c
// Run it: dart run shapes_following_eyes.dart
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_following_eyes");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final Vector2D scleraLeftPosition = .vec2(
    rl.CoreD.GetScreenWidth()/2.0 - 100.0,
    rl.CoreD.GetScreenHeight()/2.0
  );
  final Vector2D scleraRightPosition = .vec2(
    rl.CoreD.GetScreenWidth()/2.0 + 100.0,
    rl.CoreD.GetScreenHeight()/2.0
  );
  double scleraRadius = 80;

  final Vector2D irisLeftPosition = .vec2(
    rl.CoreD.GetScreenWidth()/2.0 - 100.0,
    rl.CoreD.GetScreenHeight()/2.0
  );
  final Vector2D irisRightPosition = .vec2(
    rl.CoreD.GetScreenWidth()/2.0 + 100.0,
    rl.CoreD.GetScreenHeight()/2.0
  );
  double irisRadius = 24;

  double angle = 0.0;
  double dx = 0.0, dy = 0.0, dxx = 0.0, dyy = 0.0;

  while (!rl.CoreD.WindowShouldClose())
  {
    irisLeftPosition.setD(rl.CoreD.GetMousePosition());
    irisRightPosition.setD(rl.CoreD.GetMousePosition());

    if (!rl.CoreD.CheckCollisionPointCircle(irisLeftPosition, scleraLeftPosition, scleraRadius - irisRadius))
    {
      dx = irisLeftPosition.x - scleraLeftPosition.x;
      dy = irisLeftPosition.y - scleraLeftPosition.y;

      angle = math.atan2(dy, dx);

      dxx = (scleraRadius - irisRadius)*math.cos(angle);
      dyy = (scleraRadius - irisRadius)*math.sin(angle);

      irisLeftPosition.x = scleraLeftPosition.x + dxx;
      irisLeftPosition.y = scleraLeftPosition.y + dyy;
    }

    if (!rl.CoreD.CheckCollisionPointCircle(irisRightPosition, scleraRightPosition, scleraRadius - irisRadius))
    {
      dx = irisRightPosition.x - scleraRightPosition.x;
      dy = irisRightPosition.y - scleraRightPosition.y;

      angle = math.atan2(dy, dx);

      dxx = (scleraRadius - irisRadius)*math.cos(angle);
      dyy = (scleraRadius - irisRadius)*math.sin(angle);

      irisRightPosition.x = scleraRightPosition.x + dxx;
      irisRightPosition.y = scleraRightPosition.y + dyy;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawCircleV(scleraLeftPosition, scleraRadius, .LIGHTGRAY);
      rl.CoreD.DrawCircleV(irisLeftPosition, irisRadius, .BROWN);
      rl.CoreD.DrawCircleV(irisLeftPosition, 10, .BLACK);

      rl.CoreD.DrawCircleV(scleraRightPosition, scleraRadius, .LIGHTGRAY);
      rl.CoreD.DrawCircleV(irisRightPosition, irisRadius, .DARKGREEN);
      rl.CoreD.DrawCircleV(irisRightPosition, 10, .BLACK);

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}