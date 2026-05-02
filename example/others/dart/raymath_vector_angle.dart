// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/others/raymath_vector_angle.c
// Run it: dart run raymath_vector_angle.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "raymath_vector_angle");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  Vector2D v0 = .vec2(screenWidth/2, screenHeight/2);
  Vector2D v1 = v0.add(.vec2(100.0, 80.0));
  Vector2D v2 = .zero();
  
  double angle = 0.0;
  bool angleMode = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    double startAngle = 0.0;

    if (!angleMode) startAngle = -v0.lineAngle(v1)*rl.RAD2DEG;
    if (angleMode) startAngle = 0.0;

    v2 = rl.CoreD.GetMousePosition();

    if (rl.CoreD.IsKeyPressed(.KEY_SPACE)) angleMode = !angleMode;
    
    if(!angleMode && rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_RIGHT))
      v1 = rl.CoreD.GetMousePosition();

    if (!angleMode)
    {
      final v1Normal = v1.sub(v0).normalize();
      final v2Normal = v2.sub(v0).normalize();

      angle = v1Normal.angle(v2Normal)*rl.RAD2DEG;
    }
    else if (angleMode)
    {
      angle = v0.lineAngle(v2)*rl.RAD2DEG;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);
        
      if (!angleMode)
      {
        rl.CoreD.DrawText(
          "MODE 0: Angle between V1 and V2",
          10, 10, 20, .BLACK
        );
        rl.CoreD.DrawText(
          "Right Click to Move V2",
          10, 30, 20, .DARKGRAY
        );
        
        rl.CoreD.DrawLineEx(v0, v1, 2.0, .BLACK);
        rl.CoreD.DrawLineEx(v0, v2, 2.0, .RED);

        rl.CoreD.DrawCircleSector(
          v0, 40.0,
          startAngle, startAngle + angle, 32,
          rl.CoreD.Fade(.GREEN, 0.6)
        );
      }
      else if (angleMode)
      {
        rl.CoreD.DrawText(
          "MODE 1: Angle formed by line V1 to V2",
          10, 10, 20, .BLACK
        );
        
        rl.CoreD.DrawLine(
          0, screenHeight~/2,
          screenWidth, screenHeight~/2,
          .LIGHTGRAY
        );

        rl.CoreD.DrawLineEx(v0, v2, 2.0, .RED);

        rl.CoreD.DrawCircleSector(
          v0, 40.0,
          startAngle, startAngle - angle, 32,
          rl.CoreD.Fade(.GREEN, 0.6)
        );
      }
        
      rl.CoreD.DrawText(
        "v0",
        v0.x.toInt(), v0.y.toInt(), 10, .DARKGRAY
      );

      if (!angleMode && v0.sub(v1).y > 0.0) rl.CoreD.DrawText(
        "v1",
        v1.x.toInt(), (v1.y-10).toInt(), 10, .DARKGRAY
      );
      
      if (!angleMode && v0.sub(v1).y < 0.0) rl.CoreD.DrawText(
        "v1",
        v1.x.toInt(), v1.y.toInt(), 10, .DARKGRAY
      );

      if (angleMode) rl.CoreD.DrawText(
        "v1",
        (v0.x + 40.0).toInt(), v0.y.toInt(), 10, .DARKGRAY
      );

      rl.CoreD.DrawText(
        "v2",
        (v2.x-10.0).toInt(), (v2.y-10.0).toInt(), 10, .DARKGRAY
      );

      rl.CoreD.DrawText(
        "Press SPACE to change MODE",
        460, 10, 20, .DARKGRAY
      );

      rl.CoreD.DrawText(
        "ANGLE: ${angle.f2}",
        10, 70, 20, .LIME
      );
        
    rl.CoreD.EndDrawing();
  }
  
  rl.CloseWindowAndDispose();
}
