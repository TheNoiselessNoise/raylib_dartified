// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_logo_raylib_anim.c
// Run it: dart run shapes_logo_raylib_anim.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_logo_raylib_anim");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

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

  while (!rl.CoreD.WindowShouldClose())
  {
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
      if (rl.CoreD.IsKeyPressed(.KEY_R))
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

    final w = rl.CoreD.GetScreenWidth(), h = rl.CoreD.GetScreenHeight();

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      if (state == 0)
      {
        if ((framesCounter/15)%2 == 0) rl.CoreD.DrawRectangle(
          logoPositionX, logoPositionY, 16, 16, .BLACK
        );
      }
      else if (state == 1)
      {
        rl.CoreD.DrawRectangle(logoPositionX, logoPositionY, topSideRecWidth, 16, .BLACK);
        rl.CoreD.DrawRectangle(logoPositionX, logoPositionY, 16, leftSideRecHeight, .BLACK);
      }
      else if (state == 2)
      {
        rl.CoreD.DrawRectangle(logoPositionX, logoPositionY, topSideRecWidth, 16, .BLACK);
        rl.CoreD.DrawRectangle(logoPositionX, logoPositionY, 16, leftSideRecHeight, .BLACK);

        rl.CoreD.DrawRectangle(logoPositionX + 240, logoPositionY, 16, rightSideRecHeight, .BLACK);
        rl.CoreD.DrawRectangle(logoPositionX, logoPositionY + 240, bottomSideRecWidth, 16, .BLACK);
      }
      else if (state == 3)
      {
        rl.CoreD.DrawRectangle(logoPositionX, logoPositionY, topSideRecWidth, 16, rl.CoreD.Fade(.BLACK, alpha));
        rl.CoreD.DrawRectangle(logoPositionX, logoPositionY + 16, 16, leftSideRecHeight - 32, rl.CoreD.Fade(.BLACK, alpha));

        rl.CoreD.DrawRectangle(logoPositionX + 240, logoPositionY + 16, 16, rightSideRecHeight - 32, rl.CoreD.Fade(.BLACK, alpha));
        rl.CoreD.DrawRectangle(logoPositionX, logoPositionY + 240, bottomSideRecWidth, 16, rl.CoreD.Fade(.BLACK, alpha));

        rl.CoreD.DrawRectangle(w~/2 - 112, h~/2 - 112, 224, 224, rl.CoreD.Fade(.RAYWHITE, alpha));

        rl.CoreD.DrawText(
          text.substring(0, lettersCount),
          w~/2 - 44, h~/2 + 48, 50, rl.CoreD.Fade(.BLACK, alpha)
        );
      }
      else if (state == 4)
      {
        rl.CoreD.DrawText("[R] REPLAY", 340, 200, 20, .GRAY);
      }

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}