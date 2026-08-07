// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_mouse_trail.c
// Run it: dart run shapes_mouse_trail.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_TRAIL_LENGTH = 30;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_mouse_trail");
  SetTargetFPS(60);

  final List<Vector2D> trailPositions = .generate(MAX_TRAIL_LENGTH, (_) => .zero());

  while (!WindowShouldClose())
  {
    final mousePosition = GetMousePosition();

    for (int i = MAX_TRAIL_LENGTH - 1; i > 0; i--)
    {
      trailPositions[i] = trailPositions[i - 1];
    }

    trailPositions[0] = mousePosition;

    BeginDrawing();

      ClearBackground(.BLACK);

      for (int i = 0; i < MAX_TRAIL_LENGTH; i++)
      {
        if ((trailPositions[i].x != 0.0) || (trailPositions[i].y != 0.0))
        {
          final ratio = (MAX_TRAIL_LENGTH - i)/MAX_TRAIL_LENGTH;

          final trailColor = Fade(.SKYBLUE, ratio*0.5 + 0.5);

          final trailRadius = 15.0*ratio;

          DrawCircleV(trailPositions[i], trailRadius, trailColor);
        }
      }

      DrawCircleV(mousePosition, 15.0, .WHITE);

      DrawText("Move the mouse to see the trail effect!", 10, screenHeight - 30, 20, .LIGHTGRAY);

    EndDrawing();
  }

  CloseWindowAndDispose();
}