// Run it: dart run temp_dart_vector2.dart
import 'dart:ffi';
import '../../base_c.dart';

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(800, 450, "temp_dart_vector2".toC);
  SetTargetFPS(60);

  final pos = Vector2$.At('position').set(200, 200);
  final vel = Vector2$.At('velocity');

  while (!WindowShouldClose())
  {
    if (IsKeyDown(KeyboardKey.KEY_W.value))
      vel.ref.y = vel.ref.y - 0.5;
    else if (IsKeyDown(KeyboardKey.KEY_S.value))
      vel.ref.y = vel.ref.y + 0.5;

    if (IsKeyDown(KeyboardKey.KEY_A.value))
      vel.ref.x = vel.ref.x - 0.5;
    else if (IsKeyDown(KeyboardKey.KEY_D.value))
      vel.ref.x = vel.ref.x + 0.5;

    // we want to use some Vector math, we need D layer
    var velD = vel.toD();
    var posD = pos.toD();

    // do the math
    velD = velD.scale(0.9);
    posD = posD.add(velD);

    // assign back
    vel.setD(velD);
    pos.setD(posD);

    BeginDrawing();

      ClearBackground(RAYWHITE);
      DrawRectangleV(pos.ref, Vector2$.$1.set(50, 50), BLUE);

    EndDrawing();
  }

  CloseWindow();
  // automatically disposes all rl.Temp allocations
  rl.dispose();

  // or in a single call
  // CloseWindowAndDispose();
}