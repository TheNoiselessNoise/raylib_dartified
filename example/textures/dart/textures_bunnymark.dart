// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_bunnymark.c
// Run it: dart run textures_bunnymark.dart
// WARNING: expects resources from the raylib source
// INFORMATION: ~27 FPS with all 50000 bunnies
import '../../base_dart.dart';

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
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_bunnymark");
  SetTargetFPS(120);

  final texBunny = LoadTexture("../resources/raybunny.png");
  final bunnies = <Bunny>[];

  while (!WindowShouldClose())
  {
    if (IsMouseButtonDown(.MOUSE_BUTTON_LEFT))
    {
      for (int i = 0; i < 100; i++)
      {
        if (bunnies.length < MAX_BUNNIES)
        {
          bunnies.add(.new(
            position: GetMousePosition(),
            speed: .new(
              x: GetRandomValue(-250, 250)/60.0,
              y: GetRandomValue(-250, 250)/60.0,
            ),
            color: .new(
              r: GetRandomValue(50, 240),
              g: GetRandomValue(80, 240),
              b: GetRandomValue(100, 240),
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

      if (((bunnies[i].position.x + texBunny.width/2) > GetScreenWidth()) ||
          ((bunnies[i].position.x + texBunny.width/2) < 0)) bunnies[i].speed.x *= -1;
      if (((bunnies[i].position.y + texBunny.height/2) > GetScreenHeight()) ||
          ((bunnies[i].position.y + texBunny.height/2 - 40) < 0)) bunnies[i].speed.y *= -1;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      for (int i = 0; i < bunnies.length; i++)
      {
        DrawTexture(
          texBunny,
          bunnies[i].position.x,
          bunnies[i].position.y,
          bunnies[i].color,
        );
      }

      DrawRectangle(0, 0, screenWidth, 40, .BLACK);
      DrawText(
        "bunnies: ${bunnies.length}",
        120, 10, 20, .GREEN
      );
      DrawText(
        "batched draw calls: ${1 + bunnies.length/MAX_BATCH_ELEMENTS}",
        320, 10, 20, .MAROON
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(texBunny);

  CloseWindowAndDispose();
}