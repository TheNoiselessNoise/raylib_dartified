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

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_bunnymark");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(120);

  final texBunny = rl.CoreD.LoadTexture("../resources/wabbit_alpha.png");
  final bunnies = <Bunny>[];

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT))
    {
      for (int i = 0; i < 100; i++)
      {
        if (bunnies.length < MAX_BUNNIES)
        {
          bunnies.add(.new(
            position: rl.CoreD.GetMousePosition(),
            speed: .new(
              x: rl.CoreD.GetRandomValue(-250, 250)/60.0,
              y: rl.CoreD.GetRandomValue(-250, 250)/60.0,
            ),
            color: .new(
              r: rl.CoreD.GetRandomValue(50, 240),
              g: rl.CoreD.GetRandomValue(80, 240),
              b: rl.CoreD.GetRandomValue(100, 240),
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

      if (((bunnies[i].position.x + texBunny.width/2) > rl.CoreD.GetScreenWidth()) ||
          ((bunnies[i].position.x + texBunny.width/2) < 0)) bunnies[i].speed.x *= -1;
      if (((bunnies[i].position.y + texBunny.height/2) > rl.CoreD.GetScreenHeight()) ||
          ((bunnies[i].position.y + texBunny.height/2 - 40) < 0)) bunnies[i].speed.y *= -1;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      for (int i = 0; i < bunnies.length; i++)
      {
        // NOTE: ~13 FPS with all 50000 bunnies
        rl.CoreD.DrawTexture(
          texBunny,
          bunnies[i].position.x,
          bunnies[i].position.y,
          bunnies[i].color,
        );

        // NOTE: ~29 FPS with all 50000 bunnies
        // rl.Core.DrawTexture(
        //   rl.Temp.Texture2D$(texBunny).ref,
        //   bunnies[i].position.x,
        //   bunnies[i].position.y,
        //   rl.Temp.Color$(bunnies[i].color).ref,
        // );
      }

      rl.CoreD.DrawRectangle(0, 0, screenWidth, 40, .BLACK);
      rl.CoreD.DrawText(
        "bunnies: ${bunnies.length}",
        120, 10, 20, .GREEN
      );
      rl.CoreD.DrawText(
        "batched draw calls: ${1 + bunnies.length/MAX_BATCH_ELEMENTS}",
        320, 10, 20, .MAROON
      );

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texBunny);

  rl.CloseWindowAndDispose();
}