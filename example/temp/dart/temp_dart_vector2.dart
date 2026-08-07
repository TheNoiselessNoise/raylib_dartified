// Run it: dart run temp_dart_vector2.dart
import '../../base_dart.dart';

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(800, 450, "temp_dart_vector2");
  SetTargetFPS(60);

  Vector2D pos = .vec2(200, 200);
  Vector2D vel = .zero();

  while (!WindowShouldClose())
  {
    // D version also works directly with Enums
    if (IsKeyDown(.KEY_W))
      vel.y = vel.y - 0.5;
    else if (IsKeyDown(.KEY_S))
      vel.y = vel.y + 0.5;

    if (IsKeyDown(.KEY_A))
      vel.x = vel.x - 0.5;
    else if (IsKeyDown(.KEY_D))
      vel.x = vel.x + 0.5;

    // C versions of objects/structs are mutated directly
    // D versions create completely new objects, that's why we either reassign:
    vel = vel.scale(0.9);
    pos = pos.add(vel);
    // or use setD:
    // vel.setD(vel.scale(0.9));
    // pos.setD(pos.add(vel));

    BeginDrawing();

      ClearBackground(.RAYWHITE);
      DrawRectangleV(pos, .vec2(50, 50), .BLUE);

    EndDrawing();
  }

  CloseWindow();
  // automatically disposes all rl.Temp allocations
  rl.dispose();

  // or in a single call
  // CloseWindowAndDispose();
}