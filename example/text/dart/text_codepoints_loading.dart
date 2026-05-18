// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_codepoints_loading.c
// Run it: dart run text_codepoints_loading.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const String text = "いろはにほへと　ちりぬるを\nわかよたれそ　つねならむ\nうゐのおくやま　けふこえて\nあさきゆめみし　ゑひもせす";

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "text_codepoints_loading");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final codepoints = rl.CoreD.LoadCodepoints(text);
  final codepointsNoDups = codepoints.toSet().toList();

  final font = rl.CoreD.LoadFontEx(
    "../resources/DotGothic16-Regular.ttf",
    36,
    .fromList(codepointsNoDups),
  );

  rl.CoreD.SetTextureFilter(font.texture, .TEXTURE_FILTER_BILINEAR);

  rl.CoreD.SetTextLineSpacing(20);

  bool showFontAtlas = false;

  int index = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyPressed(.KEY_SPACE))
      showFontAtlas = !showFontAtlas;

    if (rl.CoreD.IsKeyPressed(.KEY_RIGHT)) {
      rl.CoreD.GetCodepointNext(text[index]);
      index++;

    } else if (rl.CoreD.IsKeyPressed(.KEY_LEFT)) {
      rl.CoreD.GetCodepointPrevious(text[index]);
      index--;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawRectangle(0, 0, rl.CoreD.GetScreenWidth(), 70, .BLACK);
      rl.CoreD.DrawText(
        "Total codepoints contained in provided text: ${codepoints.length}",
        10, 10, 20, .GREEN
      );
      rl.CoreD.DrawText(
        "Total codepoints required for font atlas (duplicates excluded): ${codepointsNoDups.length}",
        10, 40, 20, .GREEN
      );

      if (showFontAtlas) {
        rl.CoreD.DrawTexture(font.texture, 150, 100, .BLACK);
        rl.CoreD.DrawRectangleLines(150, 100, font.texture.width, font.texture.height, .BLACK);
      } else {
        rl.CoreD.DrawTextEx(font, text, .vec2(160, 110), 48, 5, .BLACK);
      }

      rl.CoreD.DrawText(
        "Press SPACE to toggle font atlas view!",
        10, rl.CoreD.GetScreenHeight() - 30, 20, .GRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadFont(font);

  rl.CloseWindowAndDispose();
}