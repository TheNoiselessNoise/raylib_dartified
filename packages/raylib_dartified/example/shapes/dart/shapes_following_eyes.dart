// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_following_eyes.c
import 'dart:math' as math;
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Vector2 scleraLeftPosition;
late Vector2 scleraRightPosition;
double scleraRadius = 80;
late Vector2 irisLeftPosition;
late Vector2 irisRightPosition;
double irisRadius = 24;
double angle = 0.0;
double dx = 0.0, dy = 0.0, dxx = 0.0, dyy = 0.0;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shapes_following_eyes");
    SetTargetFPS(60);

    scleraLeftPosition = .vec2(GetScreenWidth()/2.0 - 100.0, GetScreenHeight()/2.0);
    scleraRightPosition = .vec2(GetScreenWidth()/2.0 + 100.0, GetScreenHeight()/2.0);
    irisLeftPosition = .vec2(GetScreenWidth()/2.0 - 100.0, GetScreenHeight()/2.0);
    irisRightPosition = .vec2(GetScreenWidth()/2.0 + 100.0, GetScreenHeight()/2.0);
  },
  loop: (_) async {
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
  },
  close: (_) {
    CloseWindow();
  },
);