// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_colors_palette.c
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Map<String, Color> colors;
late List<Rectangle> colorsRecs;
late List<bool> colorState;
late Vector2 mousePoint;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shapes_colors_palette");
    SetTargetFPS(60);
    
    colors = {
      'DARKGRAY': .DARKGRAY, 'MAROON': .MAROON, 'ORANGE': .ORANGE,
      'DARKGREEN': .DARKGREEN, 'DARKBLUE': .DARKBLUE, 'DARKPURPLE': .DARKPURPLE,
      'DARKBROWN': .DARKBROWN, 'GRAY': .GRAY, 'RED': .RED, 'GOLD': .GOLD,
      'LIME': .LIME, 'BLUE': .BLUE, 'VIOLET': .VIOLET, 'BROWN': .BROWN,
      'LIGHTGRAY': .LIGHTGRAY, 'PINK': .PINK, 'YELLOW': .YELLOW, 
      'GREEN': .GREEN, 'SKYBLUE': .SKYBLUE, 'PURPLE': .PURPLE, 'BEIGE': .BEIGE
    };

    colorsRecs = .generate(colors.length, (i) => .new(
      x: 20.0 + 100.0 * (i%7) + 10.0 * (i%7),
      y: 80.0 + 100.0 * (i~/7) + 10.0 * (i~/7),
      width: 100.0,
      height: 100.0,
    ));

    colorState = List.filled(colors.length, false);

    mousePoint = .zero();
  },
  loop: (_) async {
    mousePoint = GetMousePosition();

    for (int i = 0; i < colors.length; i++)
    {
      if (CheckCollisionPointRec(mousePoint, colorsRecs[i])) colorState[i] = true;
      else colorState[i] = false;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText(
        "raylib colors palette",
        28, 42, 20, .BLACK
      );

      DrawText(
        "press SPACE to see all colors",
        GetScreenWidth() - 180, GetScreenHeight() - 40, 10, .GRAY
      );

      for (int i = 0; i < colors.length; i++)
      {
        final (name, color) = (colors.keys.elementAt(i), colors.values.elementAt(i));
        final (rect, state) = (colorsRecs[i], colorState[i]);

        DrawRectangleRec(rect, Fade(color, state ? 0.6 : 1.0));

        if (IsKeyDown(.KEY_SPACE) || state)
        {
          DrawRectangle(rect.x, rect.y + rect.height - 26, rect.width, 20, .BLACK);
          DrawRectangleLinesEx(rect, 6, Fade(.BLACK, 0.3));
          DrawText(
            name,
            rect.x + rect.width - MeasureText(name, 10) - 12,
            rect.y + rect.height - 20,
            10, color
          );
        }
      }

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);