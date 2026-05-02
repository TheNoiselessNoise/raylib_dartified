// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_starfield_effect.c
// Run it: dart run shapes_starfield_effect.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int STAR_COUNT = 7;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_starfield_effect");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final bgColor = rl.CoreD.ColorLerp(.DARKBLUE, .BLACK, 0.69);
  double speed = 10.0/9.0;
  bool drawLines = true;

  final stars = <Vector3D>[];
  List<Vector2D> starsScreenPos = List.generate(STAR_COUNT, (_) => .zero());

  for (int i = 0; i < STAR_COUNT; i++) {
    stars.add(.vec3(
      rl.CoreD.GetRandomValue(-screenWidth / 2, screenWidth / 2),
      rl.CoreD.GetRandomValue(-screenHeight / 2, screenHeight / 2),
      1.0,
    ));
  }

  while (!rl.CoreD.WindowShouldClose())
  {
    final mouseMove = rl.CoreD.GetMouseWheelMove();
    if (mouseMove != 0) speed += 2.0*mouseMove/9.0;
    if (speed < 0.0) speed = 0.1;
    else if (speed > 2.0) speed = 2.0;

    if (rl.CoreD.IsKeyPressed(.KEY_SPACE)) drawLines = !drawLines;

    final dt = rl.CoreD.GetFrameTime();
    for (int i = 0; i < STAR_COUNT; i++)
    {
      stars[i].z -= dt*speed;

      starsScreenPos[i].x = screenWidth*0.5 + stars[i].x/stars[i].z;
      starsScreenPos[i].y = screenHeight*0.5 + stars[i].y/stars[i].z;

      if ((stars[i].z < 0.0) || (starsScreenPos[i].x < 0) || (starsScreenPos[i].y < 0.0) ||
        (starsScreenPos[i].x > screenWidth) || (starsScreenPos[i].y > screenHeight))
      {
        stars[i].x = rl.CoreD.GetRandomValue(-screenWidth / 2, screenWidth / 2).toDouble();
        stars[i].y = rl.CoreD.GetRandomValue(-screenHeight / 2, screenHeight / 2).toDouble();
        stars[i].z = 1.0;
      }
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(bgColor);

      for (int i = 0; i < STAR_COUNT; i++)
      {
        final Vector2D starScreenPos = starsScreenPos[i].copy();

        if (drawLines)
        {
          final t = rl.Clamp(stars[i].z + 1.0/32.0, 0.0, 1.0);

          if ((t - stars[i].z) > 1e-3)
          {
            final Vector2D startPos = .vec2(
              screenWidth*0.5 + stars[i].x/t,
              screenHeight*0.5 + stars[i].y/t,
            );

            rl.CoreD.DrawLineV(startPos, starScreenPos, .RAYWHITE);
          }
        }
        else
        {
          final radius = rl.Lerp(stars[i].z, 1.0, 5.0);

          rl.CoreD.DrawCircleV(starScreenPos, radius, .RAYWHITE);
        }
      }

      rl.CoreD.DrawText(
        "[MOUSE WHEEL] Current Speed: ${9.0*speed/2.0}",
        10, 40, 20, .RAYWHITE
      );

      rl.CoreD.DrawText(
        "[SPACE] Current draw mode: ${drawLines ? "Lines" : "Circles"}",
        10, 70, 20, .RAYWHITE
      );

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}