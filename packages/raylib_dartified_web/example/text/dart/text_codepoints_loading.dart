// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_codepoints_loading.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const String text = "いろはにほへと　ちりぬるを\nわかよたれそ　つねならむ\nうゐのおくやま　けふこえて\nあさきゆめみし　ゑひもせす";

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "text_codepoints_loading");
  SetTargetFPS(60);

  final codepoints = LoadCodepoints(text);
  final codepointsNoDups = codepoints.toSet().toList();

  final font = LoadFontEx(
    "../resources/DotGothic16-Regular.ttf",
    36,
    .fromList(codepointsNoDups),
  );

  SetTextureFilter(font.texture, .TEXTURE_FILTER_BILINEAR);

  SetTextLineSpacing(20);

  bool showFontAtlas = false;

  int index = 0;

  rl.setMainLoop(() {
    if (IsKeyPressed(.KEY_SPACE))
      showFontAtlas = !showFontAtlas;

    if (IsKeyPressed(.KEY_RIGHT)) {
      GetCodepointNext(text[index]);
      index++;

    } else if (IsKeyPressed(.KEY_LEFT)) {
      GetCodepointPrevious(text[index]);
      index--;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawRectangle(0, 0, GetScreenWidth(), 70, .BLACK);
      DrawText(
        "Total codepoints contained in provided text: ${codepoints.length}",
        10, 10, 20, .GREEN
      );
      DrawText(
        "Total codepoints required for font atlas (duplicates excluded): ${codepointsNoDups.length}",
        10, 40, 20, .GREEN
      );

      if (showFontAtlas) {
        DrawTexture(font.texture, 150, 100, .BLACK);
        DrawRectangleLines(150, 100, font.texture.width, font.texture.height, .BLACK);
      } else {
        DrawTextEx(font, text, .vec2(160, 110), 48, 5, .BLACK);
      }

      DrawText(
        "Press SPACE to toggle font atlas view!",
        10, GetScreenHeight() - 30, 20, .GRAY
      );

    EndDrawing();
  });
});