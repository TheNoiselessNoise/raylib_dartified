// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_lines_bezier.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shapes_lines_bezier");
  SetTargetFPS(60);

  Vector2 startPoint = .vec2(30, 30);
  Vector2 endPoint = .vec2(screenWidth - 30, screenHeight - 30);
  bool moveStartPoint = false;
  bool moveEndPoint = false;

  rl.setMainLoop(() {
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
      startPoint = mouse;
      if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT))
        moveStartPoint = false;
    }

    if (moveEndPoint)
    {
      endPoint = mouse;
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
  });
});