// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_colors_palette.c
// Run it: dart run shapes_colors_palette.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_colors_palette".toC);
  SetTargetFPS(60);
  
  final colors = <String, ColorC>{
    'DARKGRAY': DARKGRAY, 'MAROON': MAROON, 'ORANGE': ORANGE,
    'DARKGREEN': DARKGREEN, 'DARKBLUE': DARKBLUE, 'DARKPURPLE': DARKPURPLE,
    'DARKBROWN': DARKBROWN, 'GRAY': GRAY, 'RED': RED, 'GOLD': GOLD,
    'LIME': LIME, 'BLUE': BLUE, 'VIOLET': VIOLET, 'BROWN': BROWN,
    'LIGHTGRAY': LIGHTGRAY, 'PINK': PINK, 'YELLOW': YELLOW, 
    'GREEN': GREEN, 'SKYBLUE': SKYBLUE, 'PURPLE': PURPLE, 'BEIGE': BEIGE
  };

  final colorsRecs = Rectangle$.val.At('colorsRecs', colors.length);

  for (int i = 0; i < colors.length; i++)
  {
    colorsRecs[i].x = 20.0 + 100.0 * (i%7) + 10.0 * (i%7);
    colorsRecs[i].y = 80.0 + 100.0 * (i~/7) + 10.0 * (i~/7);
    colorsRecs[i].width = 100.0;
    colorsRecs[i].height = 100.0;
  }

  final colorState = Bool$.At('colorState', colors.length);

  final mousePoint = Vector2$.val.At('mousePoint');

  while (!WindowShouldClose())
  {
    mousePoint.setC(GetMousePosition());

    for (int i = 0; i < colors.length; i++)
    {
      if (CheckCollisionPointRec(mousePoint.ref, colorsRecs[i])) colorState[i] = true;
      else colorState[i] = false;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText(
        "raylib colors palette".toC,
        28, 42, 20, BLACK
      );

      DrawText(
        "press SPACE to see all colors".toC,
        GetScreenWidth() - 180, GetScreenHeight() - 40, 10, GRAY
      );

      for (int i = 0; i < colors.length; i++)
      {
        final (name, color) = (colors.keys.elementAt(i), colors.values.elementAt(i));
        final (rect, state) = (colorsRecs[i], colorState[i]);

        DrawRectangleRec(rect, Fade(color, state ? 0.6 : 1.0));

        if (IsKeyDown(KeyboardKey.KEY_SPACE.value) || state)
        {
          DrawRectangle(rect.x.toInt(), (rect.y + rect.height - 26).toInt(), rect.width.toInt(), 20, BLACK);
          DrawRectangleLinesEx(rect, 6, Fade(BLACK, 0.3));
          DrawText(
            name.toC,
            (rect.x + rect.width - MeasureText(name.toC, 10) - 12).toInt(),
            (rect.y + rect.height - 20).toInt(),
            10, color
          );
        }
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}