// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_sdf.c
// Run it: dart run text_font_sdf.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "text_font_sdf");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  String msg = "Signed Distance Fields";

  final fileData = rl.CoreD.LoadFileData("../resources/anonymous_pro_bold.ttf");

  final fontDefault = FontD(
    baseSize: 16,
    glyphCount: 95,
  );
  fontDefault.glyphs = rl.CoreD.LoadFontData(fileData, 16, null, 95, .FONT_DEFAULT);
  var (fontDefaultAtlas, fontDefaultRecs) = rl.CoreD.GenImageFontAtlas(fontDefault.glyphs, 16, 4, 0);
  fontDefault.recs = fontDefaultRecs;
  fontDefault.texture = rl.CoreD.LoadTextureFromImage(fontDefaultAtlas);
  rl.CoreD.UnloadImage(fontDefaultAtlas);

  final fontSDF = FontD(
    baseSize: 16,
    glyphCount: 95,
  );
  fontSDF.glyphs = rl.CoreD.LoadFontData(fileData, 16, null, 0, .FONT_SDF);
  var (fontSDFAtlas, fontSDFRects) = rl.CoreD.GenImageFontAtlas(fontSDF.glyphs, 16, 0, 1);
  fontSDF.recs = fontSDFRects;
  fontSDF.texture = rl.CoreD.LoadTextureFromImage(fontSDFAtlas);
  rl.CoreD.UnloadImage(fontSDFAtlas);

  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/sdf.fs"
  );
  rl.CoreD.SetTextureFilter(fontSDF.texture, .TEXTURE_FILTER_BILINEAR);

  final Vector2D fontPosition = .vec2(40, screenHeight/2.0 - 50);
  final Vector2D textSize = .vec2(0.0, 0.0);
  double fontSize = 16.0;
  int currentFont = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    fontSize += rl.CoreD.GetMouseWheelMove()*8.0;

    if (fontSize < 6) fontSize = 6;

    if (rl.CoreD.IsKeyDown(.KEY_SPACE)) currentFont = 1;
    else currentFont = 0;

    if (currentFont == 0) textSize.setD(rl.CoreD.MeasureTextEx(fontDefault, msg, fontSize, 0));
    else textSize.setD(rl.CoreD.MeasureTextEx(fontSDF, msg, fontSize, 0));

    fontPosition.x = rl.CoreD.GetScreenWidth()/2 - textSize.x/2;
    fontPosition.y = rl.CoreD.GetScreenHeight()/2 - textSize.y/2 + 80;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      if (currentFont == 1)
      {
        rl.CoreD.BeginShaderMode(shader);
          rl.CoreD.DrawTextEx(fontSDF, msg, fontPosition, fontSize, 0, .BLACK);
        rl.CoreD.EndShaderMode();

        rl.CoreD.DrawTexture(fontSDF.texture, 10, 10, .BLACK);
      }
      else
      {
        rl.CoreD.DrawTextEx(fontDefault, msg, fontPosition, fontSize, 0, .BLACK);
        rl.CoreD.DrawTexture(fontDefault.texture, 10, 10, .BLACK);
      }

      if (currentFont == 1) rl.CoreD.DrawText("SDF!", 320, 20, 80, .RED);
      else rl.CoreD.DrawText("default font", 315, 40, 30, .GRAY);

      rl.CoreD.DrawText(
        "FONT SIZE: 16.0",
        rl.CoreD.GetScreenWidth() - 240, 20, 20, .DARKGRAY
      );
      
      rl.CoreD.DrawText(
        "RENDER SIZE: ${fontSize.f2}",
        rl.CoreD.GetScreenWidth() - 240, 50, 20, .DARKGRAY
      );
      
      rl.CoreD.DrawText(
        "Use MOUSE WHEEL to SCALE TEXT!",
        rl.CoreD.GetScreenWidth() - 240, 90, 10, .DARKGRAY
      );

      rl.CoreD.DrawText(
        "HOLD SPACE to USE SDF FONT VERSION!",
        340, rl.CoreD.GetScreenHeight() - 30, 20, .MAROON
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadFont(fontDefault);
  rl.CoreD.UnloadFont(fontSDF);

  rl.CoreD.UnloadShader(shader);

  rl.CloseWindowAndDispose();
}