// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_codepoints_loading.c
// Run it: dart run text_codepoints_loading.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const String text = "いろはにほへと　ちりぬるを\nわかよたれそ　つねならむ\nうゐのおくやま　けふこえて\nあさきゆめみし　ゑひもせす";

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "text_codepoints_loading".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final codepointCount = rl.Temp.Int$.At('codepointCount');
  final codepoints = rl.Core.LoadCodepoints(text.toC, codepointCount);

  final codepointsNoDupsCount = rl.Temp.Int$.At('codepointsNoDupsCount');
  final codepointsNoDups = CodepointRemoveDuplicates(rl, codepoints, codepointCount.value, codepointsNoDupsCount);
  rl.Core.UnloadCodepoints(codepoints);

  final font = rl.Core.LoadFontEx(
    "../resources/DotGothic16-Regular.ttf".toC,
    36,
    codepointsNoDups,
    codepointsNoDupsCount.value
  );

  rl.Core.SetTextureFilter(font.texture, TextureFilter.TEXTURE_FILTER_BILINEAR.value);

  rl.Core.SetTextLineSpacing(20);

  bool showFontAtlas = false;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value))
      showFontAtlas = !showFontAtlas;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawRectangle(0, 0, rl.Core.GetScreenWidth(), 70, rl.Color.BLACK);
      rl.Core.DrawText(
        "Total codepoints contained in provided text: ${codepointCount.value}".toC,
        10, 10, 20, rl.Color.GREEN
      );
      rl.Core.DrawText(
        "Total codepoints required for font atlas (duplicates excluded): ${codepointsNoDupsCount.value}".toC,
        10, 40, 20, rl.Color.GREEN
      );

      if (showFontAtlas) {
        rl.Core.DrawTexture(font.texture, 150, 100, rl.Color.BLACK);
        rl.Core.DrawRectangleLines(150, 100, font.texture.width, font.texture.height, rl.Color.BLACK);
      } else {
        rl.Core.DrawTextEx(
          font,
          text.toC,
          rl.Temp.vec21(160, 110),
          48, 5, rl.Color.BLACK
        );
      }

      rl.Core.DrawText(
        "Press SPACE to toggle font atlas view!".toC,
        10, rl.Core.GetScreenHeight() - 30, 20, rl.Color.GRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadFont(font);

  rl.CloseWindowAndDispose();
}

Pointer<Int> CodepointRemoveDuplicates(Raylib rl, Pointer<Int> codepoints, int codepointCount, Pointer<Int> codepointsResultCount)
{
  int codepointsNoDupsCount = codepointCount;
  final codepointsNoDups = rl.Temp.Int$.Copy(codepoints, codepointCount, key: 'codepointsNoDups');

  for (int i = 0; i < codepointsNoDupsCount; i++)
  {
    for (int j = i + 1; j < codepointsNoDupsCount; j++)
    {
      if (codepointsNoDups[i] == codepointsNoDups[j])
      {
        for (int k = j; k < codepointsNoDupsCount; k++) codepointsNoDups[k] = codepointsNoDups[k + 1];
        codepointsNoDupsCount--;
        j--;
      }
    }
  }

  codepointsResultCount.value = codepointsNoDupsCount;
  return codepointsNoDups;
}