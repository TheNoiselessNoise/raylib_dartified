// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_lines_bezier.c
// Run it: dart run shapes_lines_bezier.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shapes_lines_bezier");
  SetTargetFPS(60);

  final Vector2D startPoint = .vec2(30, 30);
  final Vector2D endPoint = .vec2(screenWidth - 30, screenHeight - 30);
  bool moveStartPoint = false;
  bool moveEndPoint = false;

  while (!WindowShouldClose())
  {
    final mouse = GetMousePosition();

    if (
      CheckCollisionPointCircle(mouse, startPoint, 10.0) &&
      IsMouseButtonDown(.MOUSE_BUTTON_LEFT)
    ) moveStartPoint = true;
    
    else if (
      CheckCollisionPointCircle(mouse, endPoint, 10.0) &&
      IsMouseButtonDown(.MOUSE_BUTTON_LEFT)
    ) moveEndPoint = true;

    if (moveStartPoint)
    {
      startPoint.setDart(mouse);
      if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT))
        moveStartPoint = false;
    }

    if (moveEndPoint)
    {
      endPoint.setDart(mouse);
      if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT))
        moveEndPoint = false;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText(
        "MOVE START-END POINTS WITH MOUSE",
        15, 20, 20, .GRAY
      );

      DrawLineBezier(startPoint, endPoint, 4.0, .BLUE);
      
      DrawCircleV(
        startPoint,
        CheckCollisionPointCircle(mouse, startPoint, 10.0) ? 14.0 : 8.0,
        moveStartPoint ? .RED : .BLUE
      );

      DrawCircleV(
        endPoint,
        CheckCollisionPointCircle(mouse, endPoint, 10.0) ? 14.0 : 8.0,
        moveEndPoint ? .RED : .BLUE
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}