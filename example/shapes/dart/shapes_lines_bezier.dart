// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_lines_bezier.c
// Run it: dart run shapes_lines_bezier.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_lines_bezier");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final Vector2D startPoint = .vec2(30, 30);
  final Vector2D endPoint = .vec2(screenWidth - 30, screenHeight - 30);
  bool moveStartPoint = false;
  bool moveEndPoint = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    final mouse = rl.CoreD.GetMousePosition();

    if (
      rl.CoreD.CheckCollisionPointCircle(mouse, startPoint, 10.0) &&
      rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT)
    ) moveStartPoint = true;
    
    else if (
      rl.CoreD.CheckCollisionPointCircle(mouse, endPoint, 10.0) &&
      rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT)
    ) moveEndPoint = true;

    if (moveStartPoint)
    {
      startPoint.setD(mouse);
      if (rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_LEFT))
        moveStartPoint = false;
    }

    if (moveEndPoint)
    {
      endPoint.setD(mouse);
      if (rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_LEFT))
        moveEndPoint = false;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText(
        "MOVE START-END POINTS WITH MOUSE",
        15, 20, 20, .GRAY
      );

      rl.CoreD.DrawLineBezier(startPoint, endPoint, 4.0, .BLUE);
      
      rl.CoreD.DrawCircleV(
        startPoint,
        rl.CoreD.CheckCollisionPointCircle(mouse, startPoint, 10.0) ? 14.0 : 8.0,
        moveStartPoint ? .RED : .BLUE
      );

      rl.CoreD.DrawCircleV(
        endPoint,
        rl.CoreD.CheckCollisionPointCircle(mouse, endPoint, 10.0) ? 14.0 : 8.0,
        moveEndPoint ? .RED : .BLUE
      );

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}