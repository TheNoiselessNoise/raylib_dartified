// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_following_eyes.c
// Run it: dart run shapes_following_eyes.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_following_eyes".toC);
  SetTargetFPS(60);

  final scleraLeftPosition = Vector2$.val.At('scleraLeftPosition').set(
    GetScreenWidth()/2.0 - 100.0,
    GetScreenHeight()/2.0
  );
  final scleraRightPosition = Vector2$.val.At('scleraRightPosition').set(
    GetScreenWidth()/2.0 + 100.0,
    GetScreenHeight()/2.0
  );
  double scleraRadius = 80;

  final irisLeftPosition = Vector2$.val.At('irisLeftPosition').set(
    GetScreenWidth()/2.0 - 100.0,
    GetScreenHeight()/2.0
  );
  final irisRightPosition = Vector2$.val.At('irisRightPosition').set(
    GetScreenWidth()/2.0 + 100.0,
    GetScreenHeight()/2.0
  );
  double irisRadius = 24;

  double angle = 0.0;
  double dx = 0.0, dy = 0.0, dxx = 0.0, dyy = 0.0;

  while (!WindowShouldClose())
  {
    irisLeftPosition.setC(GetMousePosition());
    irisRightPosition.setC(GetMousePosition());

    if (!CheckCollisionPointCircle(irisLeftPosition.ref, scleraLeftPosition.ref, scleraRadius - irisRadius))
    {
      dx = irisLeftPosition.ref.x - scleraLeftPosition.ref.x;
      dy = irisLeftPosition.ref.y - scleraLeftPosition.ref.y;

      angle = math.atan2(dy, dx);

      dxx = (scleraRadius - irisRadius)*math.cos(angle);
      dyy = (scleraRadius - irisRadius)*math.sin(angle);

      irisLeftPosition.ref.x = scleraLeftPosition.ref.x + dxx;
      irisLeftPosition.ref.y = scleraLeftPosition.ref.y + dyy;
    }

    if (!CheckCollisionPointCircle(irisRightPosition.ref, scleraRightPosition.ref, scleraRadius - irisRadius))
    {
      dx = irisRightPosition.ref.x - scleraRightPosition.ref.x;
      dy = irisRightPosition.ref.y - scleraRightPosition.ref.y;

      angle = math.atan2(dy, dx);

      dxx = (scleraRadius - irisRadius)*math.cos(angle);
      dyy = (scleraRadius - irisRadius)*math.sin(angle);

      irisRightPosition.ref.x = scleraRightPosition.ref.x + dxx;
      irisRightPosition.ref.y = scleraRightPosition.ref.y + dyy;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawCircleV(scleraLeftPosition.ref, scleraRadius, LIGHTGRAY);
      DrawCircleV(irisLeftPosition.ref, irisRadius, BROWN);
      DrawCircleV(irisLeftPosition.ref, 10, BLACK);

      DrawCircleV(scleraRightPosition.ref, scleraRadius, LIGHTGRAY);
      DrawCircleV(irisRightPosition.ref, irisRadius, DARKGREEN);
      DrawCircleV(irisRightPosition.ref, 10, BLACK);

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}