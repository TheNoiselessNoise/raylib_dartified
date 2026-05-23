// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/others/raymath_vector_angle.c
// Run it: dart run raymath_vector_angle.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "raymath_vector_angle".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  Vector2D v0 = .vec2(screenWidth/2, screenHeight/2);
  Vector2D v1 = v0.add(.vec2(100.0, 80.0));
  Vector2D v2 = .zero();
  
  double angle = 0.0;
  bool angleMode = false;

  while (!rl.Core.WindowShouldClose())
  {
    double startAngle = 0.0;

    if (!angleMode) startAngle = -v0.lineAngle(v1)*rl.RAD2DEG;
    if (angleMode) startAngle = 0.0;

    v2.nativeReadFrom(rl.Core.GetMousePosition());

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value)) angleMode = !angleMode;
    
    if(!angleMode && rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value))
      v1.nativeReadFrom(rl.Core.GetMousePosition());

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

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);
        
      if (!angleMode)
      {
        rl.Core.DrawText(
          "MODE 0: Angle between V1 and V2".toC,
          10, 10, 20, rl.Color.BLACK
        );
        rl.Core.DrawText(
          "Right Click to Move V2".toC,
          10, 30, 20, rl.Color.DARKGRAY
        );
        
        rl.Core.DrawLineEx(rl.Temp.vec21D(v0), rl.Temp.vec22D(v1), 2.0, rl.Color.BLACK);
        rl.Core.DrawLineEx(rl.Temp.vec21D(v0), rl.Temp.vec22D(v2), 2.0, rl.Color.RED);

        rl.Core.DrawCircleSector(
          rl.Temp.vec21D(v0), 40.0,
          startAngle, startAngle + angle, 32,
          rl.Core.Fade(rl.Color.GREEN, 0.6)
        );
      }
      else if (angleMode)
      {
        rl.Core.DrawText(
          "MODE 1: Angle formed by line V1 to V2".toC,
          10, 10, 20, rl.Color.BLACK
        );
        
        rl.Core.DrawLine(
          0, screenHeight~/2,
          screenWidth, screenHeight~/2,
          rl.Color.LIGHTGRAY
        );

        rl.Core.DrawLineEx(rl.Temp.vec21D(v0), rl.Temp.vec22D(v2), 2.0, rl.Color.RED);

        rl.Core.DrawCircleSector(
          rl.Temp.vec21D(v0), 40.0,
          startAngle, startAngle - angle, 32,
          rl.Core.Fade(rl.Color.GREEN, 0.6)
        );
      }
        
      rl.Core.DrawText(
        "v0".toC,
        v0.x.toInt(), v0.y.toInt(), 10, rl.Color.DARKGRAY
      );

      if (!angleMode && v0.sub(v1).y > 0.0) rl.Core.DrawText(
        "v1".toC,
        v1.x.toInt(), (v1.y-10).toInt(), 10, rl.Color.DARKGRAY
      );
      
      if (!angleMode && v0.sub(v1).y < 0.0) rl.Core.DrawText(
        "v1".toC,
        v1.x.toInt(), v1.y.toInt(), 10, rl.Color.DARKGRAY
      );

      if (angleMode) rl.Core.DrawText(
        "v1".toC,
        (v0.x + 40.0).toInt(), v0.y.toInt(), 10, rl.Color.DARKGRAY
      );

      rl.Core.DrawText(
        "v2".toC,
        (v2.x-10.0).toInt(), (v2.y-10.0).toInt(), 10, rl.Color.DARKGRAY
      );

      rl.Core.DrawText(
        "Press SPACE to change MODE".toC,
        460, 10, 20, rl.Color.DARKGRAY
      );

      rl.Core.DrawText(
        "ANGLE: ${angle.f2}".toC,
        10, 70, 20, rl.Color.LIME
      );
        
    rl.Core.EndDrawing();
  }
  
  rl.CloseWindowAndDispose();
}
