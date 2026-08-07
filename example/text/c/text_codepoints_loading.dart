// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_codepoints_loading.c
// Run it: dart run text_codepoints_loading.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const String text = "いろはにほへと　ちりぬるを\nわかよたれそ　つねならむ\nうゐのおくやま　けふこえて\nあさきゆめみし　ゑひもせす";

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_codepoints_loading".toC);
  SetTargetFPS(60);

  final codepointCount = Int$.At('codepointCount');
  final codepoints = LoadCodepoints(text.toC, codepointCount);

  final codepointsNoDupsCount = Int$.At('codepointsNoDupsCount');
  final codepointsNoDups = CodepointRemoveDuplicates(codepoints, codepointCount.value, codepointsNoDupsCount);
  UnloadCodepoints(codepoints);

  final font = LoadFontEx(
    "../resources/DotGothic16-Regular.ttf".toC,
    36,
    codepointsNoDups,
    codepointsNoDupsCount.value
  );

  SetTextureFilter(font.texture, TextureFilter.TEXTURE_FILTER_BILINEAR.value);

  SetTextLineSpacing(20);

  bool showFontAtlas = false;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value))
      showFontAtlas = !showFontAtlas;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawRectangle(0, 0, GetScreenWidth(), 70, BLACK);
      DrawText(
        "Total codepoints contained in provided text: ${codepointCount.value}".toC,
        10, 10, 20, GREEN
      );
      DrawText(
        "Total codepoints required for font atlas (duplicates excluded): ${codepointsNoDupsCount.value}".toC,
        10, 40, 20, GREEN
      );

      if (showFontAtlas) {
        DrawTexture(font.texture, 150, 100, BLACK);
        DrawRectangleLines(150, 100, font.texture.width, font.texture.height, BLACK);
      } else {
        DrawTextEx(
          font,
          text.toC,
          Vector2$.$1.set(160, 110),
          48, 5, BLACK
        );
      }

      DrawText(
        "Press SPACE to toggle font atlas view!".toC,
        10, GetScreenHeight() - 30, 20, GRAY
      );

    EndDrawing();
  }

  UnloadFont(font);

  CloseWindowAndDispose();
}

Pointer<Int> CodepointRemoveDuplicates(Pointer<Int> codepoints, int codepointCount, Pointer<Int> codepointsResultCount)
{
  int codepointsNoDupsCount = codepointCount;
  final codepointsNoDups = Int$.Copy(codepoints, codepointCount, key: 'codepointsNoDups');

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