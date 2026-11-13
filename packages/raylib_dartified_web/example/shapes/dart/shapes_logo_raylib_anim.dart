// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_logo_raylib_anim.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shapes_logo_raylib_anim");
  SetTargetFPS(60);

  int logoPositionX = screenWidth~/2 - 128;
  int logoPositionY = screenHeight~/2 - 128;

  int framesCounter = 0;
  int lettersCount = 0;

  int topSideRecWidth = 16;
  int leftSideRecHeight = 16;

  int bottomSideRecWidth = 16;
  int rightSideRecHeight = 16;

  int state = 0;
  double alpha = 1.0;

  String text = "raylib";

  rl.setMainLoop(() {
    if (state == 0)
    {
      framesCounter++;

      if (framesCounter == 120)
      {
        state = 1;
        framesCounter = 0;
      }
    }
    else if (state == 1)
    {
      topSideRecWidth += 4;
      leftSideRecHeight += 4;

      if (topSideRecWidth == 256) state = 2;
    }
    else if (state == 2)
    {
      bottomSideRecWidth += 4;
      rightSideRecHeight += 4;

      if (bottomSideRecWidth == 256) state = 3;
    }
    else if (state == 3)
    {
      framesCounter++;

      if (framesCounter~/12 > 0)
      {
        lettersCount++;
        if (lettersCount > text.length) lettersCount = text.length;
        framesCounter = 0;
      }

      if (lettersCount >= text.length)
      {
        alpha -= 0.02;

        if (alpha <= 0.0)
        {
          alpha = 0.0;
          state = 4;
        }
      }
    }
    else if (state == 4)
    {
      if (IsKeyPressed(.KEY_R))
      {
        framesCounter = 0;
        lettersCount = 0;

        topSideRecWidth = 16;
        leftSideRecHeight = 16;

        bottomSideRecWidth = 16;
        rightSideRecHeight = 16;

        alpha = 1.0;
        state = 0;
      }
    }

    final w = GetScreenWidth(), h = GetScreenHeight();

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      if (state == 0)
      {
        if ((framesCounter/15)%2 == 0) DrawRectangle(
          logoPositionX, logoPositionY, 16, 16, .BLACK
        );
      }
      else if (state == 1)
      {
        DrawRectangle(logoPositionX, logoPositionY, topSideRecWidth, 16, .BLACK);
        DrawRectangle(logoPositionX, logoPositionY, 16, leftSideRecHeight, .BLACK);
      }
      else if (state == 2)
      {
        DrawRectangle(logoPositionX, logoPositionY, topSideRecWidth, 16, .BLACK);
        DrawRectangle(logoPositionX, logoPositionY, 16, leftSideRecHeight, .BLACK);

        DrawRectangle(logoPositionX + 240, logoPositionY, 16, rightSideRecHeight, .BLACK);
        DrawRectangle(logoPositionX, logoPositionY + 240, bottomSideRecWidth, 16, .BLACK);
      }
      else if (state == 3)
      {
        DrawRectangle(logoPositionX, logoPositionY, topSideRecWidth, 16, Fade(.BLACK, alpha));
        DrawRectangle(logoPositionX, logoPositionY + 16, 16, leftSideRecHeight - 32, Fade(.BLACK, alpha));

        DrawRectangle(logoPositionX + 240, logoPositionY + 16, 16, rightSideRecHeight - 32, Fade(.BLACK, alpha));
        DrawRectangle(logoPositionX, logoPositionY + 240, bottomSideRecWidth, 16, Fade(.BLACK, alpha));

        DrawRectangle(w~/2 - 112, h~/2 - 112, 224, 224, Fade(.RAYWHITE, alpha));

        DrawText(
          text.substring(0, lettersCount),
          w~/2 - 44, h~/2 + 48, 50, Fade(.BLACK, alpha)
        );
      }
      else if (state == 4)
      {
        DrawText("[R] REPLAY", 340, 200, 20, .GRAY);
      }

    EndDrawing();
  });
});