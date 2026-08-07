// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_starfield_effect.c
// Run it: dart run shapes_starfield_effect.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int STAR_COUNT = 7;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_starfield_effect".toC);
  SetTargetFPS(60);

  ColorC bgColor = ColorLerp(DARKBLUE, BLACK, 0.69);
  double speed = 10.0/9.0;
  bool drawLines = true;

  List<Vector3D> stars = .generate(STAR_COUNT, (_) => Vector3D.zero());
  List<Vector2D> starsScreenPos = .generate(STAR_COUNT, (_) => Vector2D.zero());

  for (int i = 0; i < STAR_COUNT; i++) {
    stars[i].x = GetRandomValue((-screenWidth / 2).toInt(), (screenWidth / 2).toInt()).toDouble();
    stars[i].x = GetRandomValue((-screenHeight / 2).toInt(), (screenHeight / 2).toInt()).toDouble();
    stars[i].z = 1.0;
  }

  while (!WindowShouldClose())
  {
    final mouseMove = GetMouseWheelMove();
    if (mouseMove != 0) speed += 2.0*mouseMove/9.0;
    if (speed < 0.0) speed = 0.1;
    else if (speed > 2.0) speed = 2.0;

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) drawLines = !drawLines;

    final dt = GetFrameTime();
    for (int i = 0; i < STAR_COUNT; i++)
    {
      stars[i].z -= dt*speed;

      starsScreenPos[i].x = screenWidth*0.5 + stars[i].x/stars[i].z;
      starsScreenPos[i].y = screenHeight*0.5 + stars[i].y/stars[i].z;

      if ((stars[i].z < 0.0) || (starsScreenPos[i].x < 0) || (starsScreenPos[i].y < 0.0) ||
        (starsScreenPos[i].x > screenWidth) || (starsScreenPos[i].y > screenHeight))
      {
        stars[i].x = GetRandomValue((-screenWidth / 2).toInt(), (screenWidth / 2).toInt()).toDouble();
        stars[i].y = GetRandomValue((-screenHeight / 2).toInt(), (screenHeight / 2).toInt()).toDouble();
        stars[i].z = 1.0;
      }
    }

    BeginDrawing();

      ClearBackground(bgColor);

      for (int i = 0; i < STAR_COUNT; i++)
      {
        final starScreenPos = Vector2$.At('starScreenPos').setD(starsScreenPos[i]);

        if (drawLines)
        {
          final t = Clamp(stars[i].z + 1.0/32.0, 0.0, 1.0);

          if ((t - stars[i].z) > 1e-3)
          {
            final startPos = Vector2$.At('startPos').set(
              screenWidth*0.5 + stars[i].x/t,
              screenHeight*0.5 + stars[i].y/t,
            );

            DrawLineV(startPos.ref, starScreenPos.ref, RAYWHITE);
          }
        }
        else
        {
          final radius = Lerp(stars[i].z, 1.0, 5.0);

          DrawCircleV(starScreenPos.ref, radius, RAYWHITE);
        }
      }

      DrawText(
        "[MOUSE WHEEL] Current Speed: ${9.0*speed/2.0}".toC,
        10, 40, 20, RAYWHITE
      );

      DrawText(
        "[SPACE] Current draw mode: ${drawLines ? "Lines" : "Circles"}".toC,
        10, 70, 20, RAYWHITE
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}