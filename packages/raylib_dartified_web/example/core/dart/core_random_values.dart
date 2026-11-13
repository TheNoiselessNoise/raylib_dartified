// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_random_values.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "core_random_values");
  SetTargetFPS(60);

  // SetRandomSeed(0xaabbccff);

  int randValue = GetRandomValue(-8, 5);

  int framesCounter = 0;

  rl.setMainLoop(() {
    framesCounter++;

    if (((framesCounter/120)%2) == 1)
    {
      randValue = GetRandomValue(-8, 5);
      framesCounter = 0;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("Every 2 seconds a new random value is generated:", 130, 100, 20, MAROON);

      DrawText("$randValue", 360, 180, 80, LIGHTGRAY);

    EndDrawing();
  });
});
