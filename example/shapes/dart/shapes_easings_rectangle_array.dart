// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_easings_rectangle_array.c
// Run it: dart run shapes_easings_rectangle_array.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int RECS_WIDTH = 50;
const int RECS_HEIGHT = 50;
const int MAX_RECS_X = 800~/RECS_WIDTH;
const int MAX_RECS_Y = 450~/RECS_HEIGHT;
const int PLAY_TIME_IN_FRAMES = 240;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_easings_rectangle_array");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final List<RectangleD> recs = .generate(MAX_RECS_X*MAX_RECS_Y, (_) => .zero());

  for (int y = 0; y < MAX_RECS_Y; y++)
  {
    for (int x = 0; x < MAX_RECS_X; x++)
    {
      recs[y*MAX_RECS_X + x].x = RECS_WIDTH/2.0 + RECS_WIDTH*x;
      recs[y*MAX_RECS_X + x].y = RECS_HEIGHT/2.0 + RECS_HEIGHT*y;
      recs[y*MAX_RECS_X + x].width = RECS_WIDTH.toDouble();
      recs[y*MAX_RECS_X + x].height = RECS_HEIGHT.toDouble();
    }
  }

  double rotation = 0.0;
  int framesCounter = 0;
  int state = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (state == 0)
    {
      framesCounter++;

      for (int i = 0; i < MAX_RECS_X*MAX_RECS_Y; i++)
      {
        recs[i].height = rl.Ease.EaseCircOut(framesCounter, RECS_HEIGHT, -RECS_HEIGHT, PLAY_TIME_IN_FRAMES);
        recs[i].width = rl.Ease.EaseCircOut(framesCounter, RECS_WIDTH, -RECS_WIDTH, PLAY_TIME_IN_FRAMES);

        if (recs[i].height < 0) recs[i].height = 0;
        if (recs[i].width < 0) recs[i].width = 0;

        if ((recs[i].height == 0) && (recs[i].width == 0)) state = 1;

        rotation = rl.Ease.EaseLinearIn(framesCounter, 0.0, 360.0, PLAY_TIME_IN_FRAMES);
      }
    }
    else if ((state == 1) && rl.CoreD.IsKeyPressed(.KEY_SPACE))
    {
      framesCounter = 0;

      for (int i = 0; i < MAX_RECS_X*MAX_RECS_Y; i++)
      {
        recs[i].height = RECS_HEIGHT.toDouble();
        recs[i].width = RECS_WIDTH.toDouble();
      }

      state = 0;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      if (state == 0)
      {
        for (int i = 0; i < MAX_RECS_X*MAX_RECS_Y; i++)
        {
          rl.CoreD.DrawRectanglePro(
            recs[i],
            .vec2(recs[i].width/2, recs[i].height/2),
            rotation, .RED
          );
        }
      }
      else if (state == 1) rl.CoreD.DrawText(
        "PRESS [SPACE] TO PLAY AGAIN!",
        240, 200, 20, .GRAY
      );

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}