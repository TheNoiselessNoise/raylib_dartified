// Run it: dart run temp_dart_vector2.dart
import '../../base.dart';

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(800, 450, "temp_dart_vector2");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  Vector2D pos = .vec2(200, 200);
  Vector2D vel = .zero();

  while (!rl.CoreD.WindowShouldClose())
  {
    // D version also works directly with Enums
    if (rl.CoreD.IsKeyDown(.KEY_W))
      vel.y = vel.y - 0.5;
    else if (rl.CoreD.IsKeyDown(.KEY_S))
      vel.y = vel.y + 0.5;

    if (rl.CoreD.IsKeyDown(.KEY_A))
      vel.x = vel.x - 0.5;
    else if (rl.CoreD.IsKeyDown(.KEY_D))
      vel.x = vel.x + 0.5;

    // C versions of objects/structs are mutated directly
    // D versions create completely new objects, that's why we either reassign:
    vel = vel.scale(0.9);
    pos = pos.add(vel);
    // or use setD:
    // vel.setD(vel.scale(0.9));
    // pos.setD(pos.add(vel));

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);
      rl.CoreD.DrawRectangleV(pos, .vec2(50, 50), .BLUE);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.CloseWindow();
  // automatically disposes all rl.Temp allocations
  rl.dispose();

  // or in a single call
  // rl.CloseWindowAndDispose();
}