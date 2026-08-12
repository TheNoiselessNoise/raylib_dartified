// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_collision_area.c
// Run it: dart run shapes_collision_area.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_collision_area".toC);
  SetTargetFPS(60);

  final boxA = Rectangle$.val.At('boxA').set(
    10, GetScreenHeight()/2.0 - 50, 200, 100
  );
  int boxASpeedX = 4;

  final boxB = Rectangle$.val.At('boxB').set(
    GetScreenWidth()/2.0 - 30, GetScreenHeight()/2.0 - 30, 60, 60
  );

  final boxCollision = Rectangle$.val.At('boxCollision');

  int screenUpperLimit = 40;

  bool pause = false;
  bool collision = false;

  while (!WindowShouldClose())
  {
    final w = GetScreenWidth(), h = GetScreenHeight();

    if (!pause) boxA.ref.x += boxASpeedX;

    if (((boxA.ref.x + boxA.ref.width) >= w) || (boxA.ref.x <= 0)) boxASpeedX *= -1;

    boxB.ref.x = GetMouseX() - boxB.ref.width/2;
    boxB.ref.y = GetMouseY() - boxB.ref.height/2;

    if ((boxB.ref.x + boxB.ref.width) >= w) boxB.ref.x = w - boxB.ref.width;
    else if (boxB.ref.x <= 0) boxB.ref.x = 0;

    if ((boxB.ref.y + boxB.ref.height) >= h) boxB.ref.y = h - boxB.ref.height;
    else if (boxB.ref.y <= screenUpperLimit) boxB.ref.y = screenUpperLimit.toDouble();

    collision = CheckCollisionRecs(boxA.ref, boxB.ref);

    if (collision) boxCollision.setC(GetCollisionRec(boxA.ref, boxB.ref));

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) pause = !pause;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawRectangle(0, 0, screenWidth, screenUpperLimit, collision ? RED : BLACK);

      DrawRectangleRec(boxA.ref, GOLD);
      DrawRectangleRec(boxB.ref, BLUE);

      if (collision)
      {
        DrawRectangleRec(boxCollision.ref, LIME);

        DrawText(
          "COLLISION!".toC,
          (w/2 - MeasureText("COLLISION!".toC, 20)/2).toInt(),
          (screenUpperLimit/2 - 10).toInt(),
          20, BLACK
        );

        DrawText(
          "Collision Area: ${boxCollision.ref.width*boxCollision.ref.height}".toC,
          (w/2 - 100).toInt(), screenUpperLimit + 10, 20, BLACK
        );
      }

      DrawText(
        "Press SPACE to PAUSE/RESUME".toC,
        20, screenHeight - 35, 20, LIGHTGRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}