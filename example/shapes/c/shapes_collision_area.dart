// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_collision_area.c
// Run it: dart run shapes_collision_area.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_collision_area".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final boxA = rl.Temp.Rectangle$.At('boxA').set(
    10, rl.Core.GetScreenHeight()/2.0 - 50, 200, 100
  );
  int boxASpeedX = 4;

  final boxB = rl.Temp.Rectangle$.At('boxB').set(
    rl.Core.GetScreenWidth()/2.0 - 30, rl.Core.GetScreenHeight()/2.0 - 30, 60, 60
  );

  final boxCollision = rl.Temp.Rectangle$.At('boxCollision');

  int screenUpperLimit = 40;

  bool pause = false;
  bool collision = false;

  while (!rl.Core.WindowShouldClose())
  {
    final w = rl.Core.GetScreenWidth(), h = rl.Core.GetScreenHeight();

    if (!pause) boxA.ref.x += boxASpeedX;

    if (((boxA.ref.x + boxA.ref.width) >= w) || (boxA.ref.x <= 0)) boxASpeedX *= -1;

    boxB.ref.x = rl.Core.GetMouseX() - boxB.ref.width/2;
    boxB.ref.y = rl.Core.GetMouseY() - boxB.ref.height/2;

    if ((boxB.ref.x + boxB.ref.width) >= w) boxB.ref.x = w - boxB.ref.width;
    else if (boxB.ref.x <= 0) boxB.ref.x = 0;

    if ((boxB.ref.y + boxB.ref.height) >= h) boxB.ref.y = h - boxB.ref.height;
    else if (boxB.ref.y <= screenUpperLimit) boxB.ref.y = screenUpperLimit.toDouble();

    collision = rl.Core.CheckCollisionRecs(boxA.ref, boxB.ref);

    if (collision) boxCollision.setC(rl.Core.GetCollisionRec(boxA.ref, boxB.ref));

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value)) pause = !pause;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawRectangle(0, 0, screenWidth, screenUpperLimit, collision ? rl.Color.RED : rl.Color.BLACK);

      rl.Core.DrawRectangleRec(boxA.ref, rl.Color.GOLD);
      rl.Core.DrawRectangleRec(boxB.ref, rl.Color.BLUE);

      if (collision)
      {
        rl.Core.DrawRectangleRec(boxCollision.ref, rl.Color.LIME);

        rl.Core.DrawText(
          "COLLISION!".toC,
          (w/2 - rl.Core.MeasureText("COLLISION!".toC, 20)/2).toInt(),
          (screenUpperLimit/2 - 10).toInt(),
          20, rl.Color.BLACK
        );

        rl.Core.DrawText(
          "Collision Area: ${boxCollision.ref.width*boxCollision.ref.height}".toC,
          (w/2 - 100).toInt(), screenUpperLimit + 10, 20, rl.Color.BLACK
        );
      }

      rl.Core.DrawText(
        "Press SPACE to PAUSE/RESUME".toC,
        20, screenHeight - 35, 20, rl.Color.LIGHTGRAY
      );

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}