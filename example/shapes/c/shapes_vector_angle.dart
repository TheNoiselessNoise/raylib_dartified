// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_vector_angle.c
// Run it: dart run shapes_vector_angle.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_vector_angle".toC);
  SetTargetFPS(60);

  Vector2D v0 = .vec2(screenWidth/2.0, screenHeight/2.0);
  Vector2D v1 = v0.add(.vec2(100.0, 80.0));
  Vector2D v2 = .zero();

  double angle = 0.0;
  bool angleMode = false;

  while (!WindowShouldClose())
  {
    double startangle = 0.0;

    if (!angleMode) startangle = -v0.lineAngle(v1)*rl.RAD2DEG;
    if (angleMode) startangle = 0.0;

    v2 = GetMousePosition().toD();

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) angleMode = !angleMode;

    if ((!angleMode) && IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value))
      v1 = GetMousePosition().toD();

    if (!angleMode)
    {
      Vector2D v1Normal = v1.sub(v0).normalize();
      Vector2D v2Normal = v2.sub(v0).normalize();

      angle = v1Normal.angle(v2Normal)*rl.RAD2DEG;
    }
    else if (angleMode)
    {
      angle = v0.lineAngle(v2)*rl.RAD2DEG;
    }

    final startPos = Vector2$.val.At('startPos').setD(v0);
    final endPos = Vector2$.val.At('endPos');

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (!angleMode)
      {
        DrawText(
          "MODE 0: Angle between V1 and V2".toC,
          10, 10, 20, BLACK
        );
        DrawText(
          "Right Click to Move V2".toC,
          10, 30, 20, DARKGRAY
        );

        DrawLineEx(startPos.ref, endPos.setD(v1).ref, 2.0, BLACK);
        DrawLineEx(startPos.ref, endPos.setD(v2).ref, 2.0, RED);

        DrawCircleSector(
          startPos.ref, 40.0, startangle,
          startangle + angle, 32,
          Fade(GREEN, 0.6),
        );
      }
      else if (angleMode)
      {
        DrawText(
          "MODE 1: Angle formed by line V1 to V2".toC,
          10, 10, 20, BLACK
        );

        DrawLine(0, screenHeight~/2, screenWidth, screenHeight~/2, LIGHTGRAY);
        DrawLineEx(startPos.ref, endPos.setD(v2).ref, 2.0, RED);

        DrawCircleSector(
          startPos.ref, 40.0, startangle,
          startangle - angle, 32,
          Fade(GREEN, 0.6)
        );
      }

      DrawText("v0".toC, v0.x.toInt(), v0.y.toInt(), 10, DARKGRAY);

      if (!angleMode && v0.sub(v1).y > 0.0)
        DrawText("v1".toC, v1.x.toInt(), (v1.y-10).toInt(), 10, DARKGRAY);
      if (!angleMode && v0.sub(v1).y < 0.0)
        DrawText("v1".toC, v1.x.toInt(), v1.y.toInt(), 10, DARKGRAY);

      if (angleMode)
        DrawText("v1".toC, (v0.x + 40).toInt(), v0.y.toInt(), 10, DARKGRAY);

      DrawText("v2".toC, (v2.x-10).toInt(), (v2.y-10).toInt(), 10, DARKGRAY);

      DrawText(
        "Press SPACE to change MODE".toC,
        460, 10, 20, DARKGRAY
      );

      DrawText(
        "ANGLE: ${angle.f2}".toC,
        10, 70, 20, LIME
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}