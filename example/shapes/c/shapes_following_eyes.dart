// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_following_eyes.c
// Run it: dart run shapes_following_eyes.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_following_eyes".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final scleraLeftPosition = rl.Temp.Vector2$.At('scleraLeftPosition').set(
    rl.Core.GetScreenWidth()/2.0 - 100.0,
    rl.Core.GetScreenHeight()/2.0
  );
  final scleraRightPosition = rl.Temp.Vector2$.At('scleraRightPosition').set(
    rl.Core.GetScreenWidth()/2.0 + 100.0,
    rl.Core.GetScreenHeight()/2.0
  );
  double scleraRadius = 80;

  final irisLeftPosition = rl.Temp.Vector2$.At('irisLeftPosition').set(
    rl.Core.GetScreenWidth()/2.0 - 100.0,
    rl.Core.GetScreenHeight()/2.0
  );
  final irisRightPosition = rl.Temp.Vector2$.At('irisRightPosition').set(
    rl.Core.GetScreenWidth()/2.0 + 100.0,
    rl.Core.GetScreenHeight()/2.0
  );
  double irisRadius = 24;

  double angle = 0.0;
  double dx = 0.0, dy = 0.0, dxx = 0.0, dyy = 0.0;

  while (!rl.Core.WindowShouldClose())
  {
    irisLeftPosition.setC(rl.Core.GetMousePosition());
    irisRightPosition.setC(rl.Core.GetMousePosition());

    if (!rl.Core.CheckCollisionPointCircle(irisLeftPosition.ref, scleraLeftPosition.ref, scleraRadius - irisRadius))
    {
      dx = irisLeftPosition.ref.x - scleraLeftPosition.ref.x;
      dy = irisLeftPosition.ref.y - scleraLeftPosition.ref.y;

      angle = math.atan2(dy, dx);

      dxx = (scleraRadius - irisRadius)*math.cos(angle);
      dyy = (scleraRadius - irisRadius)*math.sin(angle);

      irisLeftPosition.ref.x = scleraLeftPosition.ref.x + dxx;
      irisLeftPosition.ref.y = scleraLeftPosition.ref.y + dyy;
    }

    if (!rl.Core.CheckCollisionPointCircle(irisRightPosition.ref, scleraRightPosition.ref, scleraRadius - irisRadius))
    {
      dx = irisRightPosition.ref.x - scleraRightPosition.ref.x;
      dy = irisRightPosition.ref.y - scleraRightPosition.ref.y;

      angle = math.atan2(dy, dx);

      dxx = (scleraRadius - irisRadius)*math.cos(angle);
      dyy = (scleraRadius - irisRadius)*math.sin(angle);

      irisRightPosition.ref.x = scleraRightPosition.ref.x + dxx;
      irisRightPosition.ref.y = scleraRightPosition.ref.y + dyy;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawCircleV(scleraLeftPosition.ref, scleraRadius, rl.Color.LIGHTGRAY);
      rl.Core.DrawCircleV(irisLeftPosition.ref, irisRadius, rl.Color.BROWN);
      rl.Core.DrawCircleV(irisLeftPosition.ref, 10, rl.Color.BLACK);

      rl.Core.DrawCircleV(scleraRightPosition.ref, scleraRadius, rl.Color.LIGHTGRAY);
      rl.Core.DrawCircleV(irisRightPosition.ref, irisRadius, rl.Color.DARKGREEN);
      rl.Core.DrawCircleV(irisRightPosition.ref, 10, rl.Color.BLACK);

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}