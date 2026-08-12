// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_ellipse_collision.c
// Run it: dart run shapes_ellipse_collision.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_ellipse_collision".toC);
  SetTargetFPS(60);

  final ellipseACenter = Vector2$.val.AtUnique().set(screenWidth/4, screenHeight/2);
  double ellipseARx = 120.0;
  double ellipseARy = 70.0;

  final ellipseBCenter = Vector2$.val.AtUnique().set(screenWidth*3/4, screenHeight/2);
  double ellipseBRx = 90.0;
  double ellipseBRy = 140.0;

  int controlled = 0;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_A.value)) controlled = 0;
    if (IsKeyPressed(KeyboardKey.KEY_B.value)) controlled = 1;

    if (controlled == 0) ellipseACenter.ref = GetMousePosition();
    else ellipseBCenter.ref = GetMousePosition();

    bool ellipsesCollide = CheckCollisionEllipses(
      ellipseACenter.ref, ellipseARx, ellipseARy,
      ellipseBCenter.ref, ellipseBRx, ellipseBRy
    );

    bool mouseInA = CheckCollisionPointEllipse(GetMousePosition(), ellipseACenter.ref, ellipseARx, ellipseARy);
    bool mouseInB = CheckCollisionPointEllipse(GetMousePosition(), ellipseBCenter.ref, ellipseBRx, ellipseBRy);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawEllipse(ellipseACenter.ref.x.toInt(), ellipseACenter.ref.y.toInt(), ellipseARx, ellipseARy, ellipsesCollide ? RED : BLUE);

      DrawEllipse(ellipseBCenter.ref.x.toInt(), ellipseBCenter.ref.y.toInt(), ellipseBRx, ellipseBRy, ellipsesCollide ? RED : GREEN);

      DrawEllipseLines(ellipseACenter.ref.x.toInt(), ellipseACenter.ref.y.toInt(), ellipseARx, ellipseARy, WHITE);

      DrawEllipseLines(ellipseBCenter.ref.x.toInt(), ellipseBCenter.ref.y.toInt(), ellipseBRx, ellipseBRy, WHITE);

      DrawCircleV(ellipseACenter.ref, 4, WHITE);
      DrawCircleV(ellipseBCenter.ref, 4, WHITE);

      if (ellipsesCollide) DrawText("ELLIPSES COLLIDE".toC, screenWidth~/2 - 120, 40, 28, RED);
      else DrawText("NO COLLISION".toC, screenWidth~/2 - 80, 40, 28, DARKGRAY);

      DrawText((controlled == 0 ? "Controlling: A" : "Controlling: B").toC, 20, screenHeight - 40, 20, YELLOW);

      if (mouseInA && controlled != 0) DrawText("Mouse inside ellipse A".toC, 20, screenHeight - 70, 20, BLUE);
      if (mouseInB && controlled != 1) DrawText("Mouse inside ellipse B".toC, 20, screenHeight - 70, 20, GREEN);

      DrawText("Press [A] or [B] to switch control".toC, 20, 20, 20, GRAY);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

bool CheckCollisionPointEllipse(Vector2C point, Vector2C center, double rx, double ry)
{
  final dx = (point.x - center.x)/rx;
  final dy = (point.y - center.y)/ry;
  return (dx*dx + dy*dy) <= 1.0;
}

bool CheckCollisionEllipses(Vector2C c1, double rx1, double ry1, Vector2C c2, double rx2, double ry2)
{
  final dx = c2.x - c1.x;
  final dy = c2.y - c1.y;
  final dist = math.sqrt(dx*dx + dy*dy);

  if (dist == 0.0) return true;

  final theta = math.atan2(dy, dx);
  final cosT = math.cos(theta);
  final sinT = math.sin(theta);

  final r1 = (rx1*ry1)/math.sqrt((ry1*cosT)*(ry1*cosT) + (rx1*sinT)*(rx1*sinT));
  final r2 = (rx2*ry2)/math.sqrt((ry2*cosT)*(ry2*cosT) + (rx2*sinT)*(rx2*sinT));

  return dist <= (r1 + r2);
}