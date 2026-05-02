// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_lines_bezier.c
// Run it: dart run shapes_lines_bezier.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_lines_bezier".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final startPoint = rl.Temp.Vector2$.At('startPoint').set(30, 30);
  final endPoint = rl.Temp.Vector2$.At('endPoint').set(screenWidth - 30, screenHeight - 30);
  bool moveStartPoint = false;
  bool moveEndPoint = false;

  while (!rl.Core.WindowShouldClose())
  {
    final mouse = rl.Core.GetMousePosition();

    if (
      rl.Core.CheckCollisionPointCircle(mouse, startPoint.ref, 10.0) &&
      rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)
    ) moveStartPoint = true;
    
    else if (
      rl.Core.CheckCollisionPointCircle(mouse, endPoint.ref, 10.0) &&
      rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)
    ) moveEndPoint = true;

    if (moveStartPoint)
    {
      startPoint.setC(mouse);
      if (rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value))
        moveStartPoint = false;
    }

    if (moveEndPoint)
    {
      endPoint.setC(mouse);
      if (rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value))
        moveEndPoint = false;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.DrawText(
        "MOVE START-END POINTS WITH MOUSE".toC,
        15, 20, 20, rl.C.GRAY
      );

      rl.Core.DrawLineBezier(startPoint.ref, endPoint.ref, 4.0, rl.C.BLUE);
      
      rl.Core.DrawCircleV(
        startPoint.ref,
        rl.Core.CheckCollisionPointCircle(mouse, startPoint.ref, 10.0) ? 14.0 : 8.0,
        moveStartPoint ? rl.C.RED : rl.C.BLUE
      );

      rl.Core.DrawCircleV(
        endPoint.ref,
        rl.Core.CheckCollisionPointCircle(mouse, endPoint.ref, 10.0) ? 14.0 : 8.0,
        moveEndPoint ? rl.C.RED : rl.C.BLUE
      );

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}