// Run it: dart run temp_dart_vector2.dart
import 'dart:ffi';
import '../../base.dart';

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(800, 450, "temp_dart_vector2".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final pos = rl.Temp.Vector2$.At('position').set(200, 200);
  final vel = rl.Temp.Vector2$.At('velocity');

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_W.value))
      vel.ref.y = vel.ref.y - 0.5;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_S.value))
      vel.ref.y = vel.ref.y + 0.5;

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_A.value))
      vel.ref.x = vel.ref.x - 0.5;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_D.value))
      vel.ref.x = vel.ref.x + 0.5;

    // C versions of objects/structs are mutated directly
    vel.scale(0.9);
    pos.add(vel);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);
      rl.Core.DrawRectangleV(pos.ref, rl.Temp.vec21(50, 50), rl.Color.BLUE);

    rl.Core.EndDrawing();
  }

  rl.Core.CloseWindow();
  // automatically disposes all rl.Temp allocations
  rl.dispose();

  // or in a single call
  // rl.CloseWindowAndDispose();
}