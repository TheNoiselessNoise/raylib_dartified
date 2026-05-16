// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_sprite_fonts.c
// Run it: dart run text_sprite_fonts.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

final List<String> fontPaths = [
  "../resources/sprite_fonts/alagard.png",
  "../resources/sprite_fonts/pixelplay.png",
  "../resources/sprite_fonts/mecha.png",
  "../resources/sprite_fonts/setback.png",
  "../resources/sprite_fonts/romulus.png",
  "../resources/sprite_fonts/pixantiqua.png",
  "../resources/sprite_fonts/alpha_beta.png",
  "../resources/sprite_fonts/jupiter_crash.png",
];

final List<String> messages = [
  "ALAGARD FONT designed by Hewett Tsoi",
  "PIXELPLAY FONT designed by Aleksander Shevchuk",
  "MECHA FONT designed by Captain Falcon",
  "SETBACK FONT designed by Brian Kent (AEnigma)",
  "ROMULUS FONT designed by Hewett Tsoi",
  "PIXANTIQUA FONT designed by Gerhard Grossmann",
  "ALPHA_BETA FONT designed by Brian Kent (AEnigma)",
  "JUPITER_CRASH FONT designed by Brian Kent (AEnigma)",
];

final List<int> spacings = [2, 4, 8, 4, 3, 4, 4, 1];

void main()
{
  assert(fontPaths.length == messages.length);
  assert(fontPaths.length == spacings.length);

  final rl = loadBaseRaylib();

  final List<ColorC> colors = [
    rl.Color.MAROON, rl.Color.ORANGE, rl.Color.DARKGREEN, rl.Color.DARKBLUE,
    rl.Color.DARKPURPLE, rl.Color.LIME, rl.Color.GOLD, rl.Color.RED
  ];
  assert(fontPaths.length == colors.length);

  rl.Core.InitWindow(screenWidth, screenHeight, "text_sprite_fonts".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  
  final fonts = rl.Temp.Font$.At('fonts', fontPaths.length);
  for (int i = 0; i < fontPaths.length; i++) {
    fonts[i] = rl.Core.LoadFont(fontPaths[i].toC);
  }

  final positions = rl.Temp.Vector2$.At('positions', fontPaths.length);
  for (int i = 0; i < fontPaths.length; i++) {
    final fontSize = rl.Core.MeasureTextEx(
      fonts[i],
      messages[i].toC,
      fonts[i].baseSize*2,
      spacings[i].toDouble(),
    );
    positions[i].x = screenWidth/2 - fontSize.x/2;
    positions[i].y = (60 + fonts[i].baseSize + 45*i).toDouble();
  }

  positions[3].y += 8;
  positions[4].y += 2;
  positions[7].y -= 8;

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawText(
        "free sprite fonts included with raylib".toC,
        220, 20, 20, rl.Color.DARKGRAY
      );
      rl.Core.DrawLine(220, 50, 600, 50, rl.Color.DARKGRAY);

      for (int i = 0; i < fontPaths.length; i++)
      {
        rl.Core.DrawTextEx(
          fonts[i],
          messages[i].toC,
          positions[i], 
          fonts[i].baseSize*2.0,
          spacings[i].toDouble(),
          colors[i]
        );
      }

    rl.Core.EndDrawing();
  }

  for (int i = 0; i < fontPaths.length; i++) {
    rl.Core.UnloadFont(fonts[i]);
  }

  rl.CloseWindowAndDispose();
}