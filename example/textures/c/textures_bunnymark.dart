// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_bunnymark.c
// Run it: dart run textures_bunnymark.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_BUNNIES = 50000;
const int MAX_BATCH_ELEMENTS = 8192;

class Bunny {
  Vector2D position;
  Vector2D speed;
  ColorD color;

  Bunny({
    required this.position,
    required this.speed,
    required this.color,
  });
}

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_bunnymark".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(120);

  final texBunny = rl.Core.LoadTexture("../resources/wabbit_alpha.png".toC);
  final bunnies = <Bunny>[];

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value))
    {
      for (int i = 0; i < 100; i++)
      {
        if (bunnies.length < MAX_BUNNIES)
        {
          bunnies.add(.new(
            position: rl.Core.GetMousePosition().toD(),
            speed: .new(
              x: rl.Core.GetRandomValue(-250, 250)/60.0,
              y: rl.Core.GetRandomValue(-250, 250)/60.0,
            ),
            color: .new(
              r: rl.Core.GetRandomValue(50, 240),
              g: rl.Core.GetRandomValue(80, 240),
              b: rl.Core.GetRandomValue(100, 240),
              a: 255,
            ),
          ));
        }
      }
    }

    for (int i = 0; i < bunnies.length; i++)
    {
      bunnies[i].position.x += bunnies[i].speed.x;
      bunnies[i].position.y += bunnies[i].speed.y;

      if (((bunnies[i].position.x + texBunny.width/2) > rl.Core.GetScreenWidth()) ||
          ((bunnies[i].position.x + texBunny.width/2) < 0)) bunnies[i].speed.x *= -1;
      if (((bunnies[i].position.y + texBunny.height/2) > rl.Core.GetScreenHeight()) ||
          ((bunnies[i].position.y + texBunny.height/2 - 40) < 0)) bunnies[i].speed.y *= -1;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      for (int i = 0; i < bunnies.length; i++)
      {
        // NOTE: ~50 FPS with all 50000 bunnies
        rl.Core.DrawTexture(
          texBunny,
          bunnies[i].position.x.toInt(),
          bunnies[i].position.y.toInt(),
          rl.Temp.color1D(bunnies[i].color),
        );
      }

      rl.Core.DrawRectangle(0, 0, screenWidth, 40, rl.Color.BLACK);
      rl.Core.DrawText(
        "bunnies: ${bunnies.length}".toC,
        120, 10, 20, rl.Color.GREEN
      );
      rl.Core.DrawText(
        "batched draw calls: ${1 + bunnies.length/MAX_BATCH_ELEMENTS}".toC,
        320, 10, 20, rl.Color.MAROON
      );

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texBunny);

  rl.CloseWindowAndDispose();
}