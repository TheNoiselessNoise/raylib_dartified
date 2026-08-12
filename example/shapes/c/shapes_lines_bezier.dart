// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_lines_bezier.c
// Run it: dart run shapes_lines_bezier.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shapes_lines_bezier".toC);
  SetTargetFPS(60);

  final startPoint = Vector2$.val.At('startPoint').set(30, 30);
  final endPoint = Vector2$.val.At('endPoint').set(screenWidth - 30, screenHeight - 30);
  bool moveStartPoint = false;
  bool moveEndPoint = false;

  while (!WindowShouldClose())
  {
    final mouse = GetMousePosition();

    if (
      CheckCollisionPointCircle(mouse, startPoint.ref, 10.0) &&
      IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)
    ) moveStartPoint = true;
    
    else if (
      CheckCollisionPointCircle(mouse, endPoint.ref, 10.0) &&
      IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)
    ) moveEndPoint = true;

    if (moveStartPoint)
    {
      startPoint.setC(mouse);
      if (IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value))
        moveStartPoint = false;
    }

    if (moveEndPoint)
    {
      endPoint.setC(mouse);
      if (IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value))
        moveEndPoint = false;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText(
        "MOVE START-END POINTS WITH MOUSE".toC,
        15, 20, 20, GRAY
      );

      DrawLineBezier(startPoint.ref, endPoint.ref, 4.0, BLUE);
      
      DrawCircleV(
        startPoint.ref,
        CheckCollisionPointCircle(mouse, startPoint.ref, 10.0) ? 14.0 : 8.0,
        moveStartPoint ? RED : BLUE
      );

      DrawCircleV(
        endPoint.ref,
        CheckCollisionPointCircle(mouse, endPoint.ref, 10.0) ? 14.0 : 8.0,
        moveEndPoint ? RED : BLUE
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}