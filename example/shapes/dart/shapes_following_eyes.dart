// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_following_eyes.c
// Run it: dart run shapes_following_eyes.dart
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_following_eyes");
  SetTargetFPS(60);

  final Vector2D scleraLeftPosition = .vec2(
    GetScreenWidth()/2.0 - 100.0,
    GetScreenHeight()/2.0
  );
  final Vector2D scleraRightPosition = .vec2(
    GetScreenWidth()/2.0 + 100.0,
    GetScreenHeight()/2.0
  );
  double scleraRadius = 80;

  Vector2D irisLeftPosition = .vec2(
    GetScreenWidth()/2.0 - 100.0,
    GetScreenHeight()/2.0
  );
  Vector2D irisRightPosition = .vec2(
    GetScreenWidth()/2.0 + 100.0,
    GetScreenHeight()/2.0
  );
  double irisRadius = 24;

  double angle = 0.0;
  double dx = 0.0, dy = 0.0, dxx = 0.0, dyy = 0.0;

  while (!WindowShouldClose())
  {
    irisLeftPosition = GetMousePosition();
    irisRightPosition = GetMousePosition();

    if (!CheckCollisionPointCircle(irisLeftPosition, scleraLeftPosition, scleraRadius - irisRadius))
    {
      dx = irisLeftPosition.x - scleraLeftPosition.x;
      dy = irisLeftPosition.y - scleraLeftPosition.y;

      angle = math.atan2(dy, dx);

      dxx = (scleraRadius - irisRadius)*math.cos(angle);
      dyy = (scleraRadius - irisRadius)*math.sin(angle);

      irisLeftPosition.x = scleraLeftPosition.x + dxx;
      irisLeftPosition.y = scleraLeftPosition.y + dyy;
    }

    if (!CheckCollisionPointCircle(irisRightPosition, scleraRightPosition, scleraRadius - irisRadius))
    {
      dx = irisRightPosition.x - scleraRightPosition.x;
      dy = irisRightPosition.y - scleraRightPosition.y;

      angle = math.atan2(dy, dx);

      dxx = (scleraRadius - irisRadius)*math.cos(angle);
      dyy = (scleraRadius - irisRadius)*math.sin(angle);

      irisRightPosition.x = scleraRightPosition.x + dxx;
      irisRightPosition.y = scleraRightPosition.y + dyy;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawCircleV(scleraLeftPosition, scleraRadius, .LIGHTGRAY);
      DrawCircleV(irisLeftPosition, irisRadius, .BROWN);
      DrawCircleV(irisLeftPosition, 10, .BLACK);

      DrawCircleV(scleraRightPosition, scleraRadius, .LIGHTGRAY);
      DrawCircleV(irisRightPosition, irisRadius, .DARKGREEN);
      DrawCircleV(irisRightPosition, 10, .BLACK);

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}