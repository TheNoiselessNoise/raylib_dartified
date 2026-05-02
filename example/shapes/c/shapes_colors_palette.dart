// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_colors_palette.c
// Run it: dart run shapes_colors_palette.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_colors_palette".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  
  final colors = <String, ColorC>{
    'DARKGRAY': rl.C.DARKGRAY, 'MAROON': rl.C.MAROON, 'ORANGE': rl.C.ORANGE,
    'DARKGREEN': rl.C.DARKGREEN, 'DARKBLUE': rl.C.DARKBLUE, 'DARKPURPLE': rl.C.DARKPURPLE,
    'DARKBROWN': rl.C.DARKBROWN, 'GRAY': rl.C.GRAY, 'RED': rl.C.RED, 'GOLD': rl.C.GOLD,
    'LIME': rl.C.LIME, 'BLUE': rl.C.BLUE, 'VIOLET': rl.C.VIOLET, 'BROWN': rl.C.BROWN,
    'LIGHTGRAY': rl.C.LIGHTGRAY, 'PINK': rl.C.PINK, 'YELLOW': rl.C.YELLOW, 
    'GREEN': rl.C.GREEN, 'SKYBLUE': rl.C.SKYBLUE, 'PURPLE': rl.C.PURPLE, 'BEIGE': rl.C.BEIGE
  };

  final colorsRecs = rl.Temp.Rectangle$.At('colorsRecs', colors.length);

  for (int i = 0; i < colors.length; i++)
  {
    colorsRecs[i].x = 20.0 + 100.0 * (i%7) + 10.0 * (i%7);
    colorsRecs[i].y = 80.0 + 100.0 * (i~/7) + 10.0 * (i~/7);
    colorsRecs[i].width = 100.0;
    colorsRecs[i].height = 100.0;
  }

  final colorState = rl.Temp.Bool$.At('colorState', colors.length);

  final mousePoint = rl.Temp.Vector2$.At('mousePoint');

  while (!rl.Core.WindowShouldClose())
  {
    mousePoint.setC(rl.Core.GetMousePosition());

    for (int i = 0; i < colors.length; i++)
    {
      if (rl.Core.CheckCollisionPointRec(mousePoint.ref, colorsRecs[i])) colorState[i] = true;
      else colorState[i] = false;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.DrawText(
        "raylib colors palette".toC,
        28, 42, 20, rl.C.BLACK
      );

      rl.Core.DrawText(
        "press SPACE to see all colors".toC,
        rl.Core.GetScreenWidth() - 180, rl.Core.GetScreenHeight() - 40, 10, rl.C.GRAY
      );

      for (int i = 0; i < colors.length; i++)
      {
        final (name, color) = (colors.keys.elementAt(i), colors.values.elementAt(i));
        final (rect, state) = (colorsRecs[i], colorState[i]);

        rl.Core.DrawRectangleRec(rect, rl.Core.Fade(color, state ? 0.6 : 1.0));

        if (rl.Core.IsKeyDown(KeyboardKey.KEY_SPACE.value) || state)
        {
          rl.Core.DrawRectangle(rect.x.toInt(), (rect.y + rect.height - 26).toInt(), rect.width.toInt(), 20, rl.C.BLACK);
          rl.Core.DrawRectangleLinesEx(rect, 6, rl.Core.Fade(rl.C.BLACK, 0.3));
          rl.Core.DrawText(
            name.toC,
            (rect.x + rect.width - rl.Core.MeasureText(name.toC, 10) - 12).toInt(),
            (rect.y + rect.height - 20).toInt(),
            10, color
          );
        }
      }

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}