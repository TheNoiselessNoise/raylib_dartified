// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_collision_area.c
// Run it: dart run shapes_collision_area.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_collision_area");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final RectangleD boxA = .rect(
    10, rl.CoreD.GetScreenHeight()/2.0 - 50, 200, 100
  );
  int boxASpeedX = 4;

  final RectangleD boxB = .rect(
    rl.CoreD.GetScreenWidth()/2.0 - 30, rl.CoreD.GetScreenHeight()/2.0 - 30, 60, 60
  );

  RectangleD boxCollision = .zero();

  int screenUpperLimit = 40;

  bool pause = false;
  bool collision = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    final w = rl.CoreD.GetScreenWidth(), h = rl.CoreD.GetScreenHeight();

    if (!pause) boxA.x += boxASpeedX;

    if (((boxA.x + boxA.width) >= w) || (boxA.x <= 0)) boxASpeedX *= -1;

    boxB.x = rl.CoreD.GetMouseX() - boxB.width/2;
    boxB.y = rl.CoreD.GetMouseY() - boxB.height/2;

    if ((boxB.x + boxB.width) >= w) boxB.x = w - boxB.width;
    else if (boxB.x <= 0) boxB.x = 0;

    if ((boxB.y + boxB.height) >= h) boxB.y = h - boxB.height;
    else if (boxB.y <= screenUpperLimit) boxB.y = screenUpperLimit.toDouble();

    collision = rl.CoreD.CheckCollisionRecs(boxA, boxB);

    if (collision) boxCollision = rl.CoreD.GetCollisionRec(boxA, boxB);

    if (rl.CoreD.IsKeyPressed(.KEY_SPACE)) pause = !pause;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawRectangle(0, 0, screenWidth, screenUpperLimit, collision ? .RED : .BLACK);

      rl.CoreD.DrawRectangleRec(boxA, .GOLD);
      rl.CoreD.DrawRectangleRec(boxB, .BLUE);

      if (collision)
      {
        rl.CoreD.DrawRectangleRec(boxCollision, .LIME);

        rl.CoreD.DrawText(
          "COLLISION!",
          w/2 - rl.CoreD.MeasureText("COLLISION!", 20)/2,
          screenUpperLimit/2 - 10,
          20, .BLACK
        );

        rl.CoreD.DrawText(
          "Collision Area: ${boxCollision.width*boxCollision.height}",
          w/2 - 100, screenUpperLimit + 10, 20, .BLACK
        );
      }

      rl.CoreD.DrawText(
        "Press SPACE to PAUSE/RESUME",
        20, screenHeight - 35, 20, .LIGHTGRAY
      );

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}