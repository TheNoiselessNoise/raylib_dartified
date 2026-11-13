// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_collision_area.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shapes_collision_area");
  SetTargetFPS(60);

  final Rectangle boxA = .rect(
    10, GetScreenHeight()/2.0 - 50, 200, 100
  );
  int boxASpeedX = 4;

  final Rectangle boxB = .rect(
    GetScreenWidth()/2.0 - 30, GetScreenHeight()/2.0 - 30, 60, 60
  );

  Rectangle boxCollision = .zero();

  int screenUpperLimit = 40;

  bool pause = false;
  bool collision = false;

  rl.setMainLoop(() {
    final w = GetScreenWidth(), h = GetScreenHeight();

    if (!pause) boxA.x += boxASpeedX;

    if (((boxA.x + boxA.width) >= w) || (boxA.x <= 0)) boxASpeedX *= -1;

    boxB.x = GetMouseX() - boxB.width/2;
    boxB.y = GetMouseY() - boxB.height/2;

    if ((boxB.x + boxB.width) >= w) boxB.x = w - boxB.width;
    else if (boxB.x <= 0) boxB.x = 0;

    if ((boxB.y + boxB.height) >= h) boxB.y = h - boxB.height;
    else if (boxB.y <= screenUpperLimit) boxB.y = screenUpperLimit.toDouble();

    collision = CheckCollisionRecs(boxA, boxB);

    if (collision) boxCollision = GetCollisionRec(boxA, boxB);

    if (IsKeyPressed(.KEY_SPACE)) pause = !pause;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawRectangle(0, 0, screenWidth, screenUpperLimit, collision ? .RED : .BLACK);

      DrawRectangleRec(boxA, .GOLD);
      DrawRectangleRec(boxB, .BLUE);

      if (collision)
      {
        DrawRectangleRec(boxCollision, .LIME);

        DrawText(
          "COLLISION!",
          w/2 - MeasureText("COLLISION!", 20)/2,
          screenUpperLimit/2 - 10,
          20, .BLACK
        );

        DrawText(
          "Collision Area: ${boxCollision.width*boxCollision.height}",
          w/2 - 100, screenUpperLimit + 10, 20, .BLACK
        );
      }

      DrawText(
        "Press SPACE to PAUSE/RESUME",
        20, screenHeight - 35, 20, .LIGHTGRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  });
});