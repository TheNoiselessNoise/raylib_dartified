// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_colors_palette.c
// Run it: dart run shapes_colors_palette.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_colors_palette");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  
  final colors = <String, ColorD>{
    'DARKGRAY': .DARKGRAY, 'MAROON': .MAROON, 'ORANGE': .ORANGE,
    'DARKGREEN': .DARKGREEN, 'DARKBLUE': .DARKBLUE, 'DARKPURPLE': .DARKPURPLE,
    'DARKBROWN': .DARKBROWN, 'GRAY': .GRAY, 'RED': .RED, 'GOLD': .GOLD,
    'LIME': .LIME, 'BLUE': .BLUE, 'VIOLET': .VIOLET, 'BROWN': .BROWN,
    'LIGHTGRAY': .LIGHTGRAY, 'PINK': .PINK, 'YELLOW': .YELLOW, 
    'GREEN': .GREEN, 'SKYBLUE': .SKYBLUE, 'PURPLE': .PURPLE, 'BEIGE': .BEIGE
  };

  final List<RectangleD> colorsRecs = .generate(colors.length, (i) => .new(
    x: 20.0 + 100.0 * (i%7) + 10.0 * (i%7),
    y: 80.0 + 100.0 * (i~/7) + 10.0 * (i~/7),
    width: 100.0,
    height: 100.0,
  ));

  final colorState = List.filled(colors.length, false);

  Vector2D mousePoint = .zero();

  while (!rl.CoreD.WindowShouldClose())
  {
    mousePoint = rl.CoreD.GetMousePosition();

    for (int i = 0; i < colors.length; i++)
    {
      if (rl.CoreD.CheckCollisionPointRec(mousePoint, colorsRecs[i])) colorState[i] = true;
      else colorState[i] = false;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText(
        "raylib colors palette",
        28, 42, 20, .BLACK
      );

      rl.CoreD.DrawText(
        "press SPACE to see all colors",
        rl.CoreD.GetScreenWidth() - 180, rl.CoreD.GetScreenHeight() - 40, 10, .GRAY
      );

      for (int i = 0; i < colors.length; i++)
      {
        final (name, color) = (colors.keys.elementAt(i), colors.values.elementAt(i));
        final (rect, state) = (colorsRecs[i], colorState[i]);

        rl.CoreD.DrawRectangleRec(rect, rl.CoreD.Fade(color, state ? 0.6 : 1.0));

        if (rl.CoreD.IsKeyDown(.KEY_SPACE) || state)
        {
          rl.CoreD.DrawRectangle(rect.x, rect.y + rect.height - 26, rect.width, 20, .BLACK);
          rl.CoreD.DrawRectangleLinesEx(rect, 6, rl.CoreD.Fade(.BLACK, 0.3));
          rl.CoreD.DrawText(
            name,
            rect.x + rect.width - rl.CoreD.MeasureText(name, 10) - 12,
            rect.y + rect.height - 20,
            10, color
          );
        }
      }

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}