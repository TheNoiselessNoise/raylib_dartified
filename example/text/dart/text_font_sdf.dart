// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_sdf.c
// Run it: dart run text_font_sdf.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  rl.debugEverything(true);

  InitWindow(screenWidth, screenHeight, "text_font_sdf");
  SetTargetFPS(60);

  String msg = "Signed Distance Fields";

  final fileData = LoadFileData("../resources/anonymous_pro_bold.ttf");

  final fontDefault = FontD(baseSize: 16, glyphCount: 95);
  fontDefault.glyphs = LoadFontData(fileData, 16, null, 95, .FONT_DEFAULT);
  var (fontDefaultAtlas, fontDefaultRecs) = GenImageFontAtlas(fontDefault.glyphs, 16, 4, 0);
  fontDefault.recs = fontDefaultRecs;
  fontDefault.texture = LoadTextureFromImage(fontDefaultAtlas);
  UnloadImage(fontDefaultAtlas);

  final fontSDF = FontD(baseSize: 16, glyphCount: 95);
  fontSDF.glyphs = LoadFontData(fileData, 16, null, 0, .FONT_SDF);
  var (fontSDFAtlas, fontSDFRects) = GenImageFontAtlas(fontSDF.glyphs, 16, 0, 1);
  fontSDF.recs = fontSDFRects;
  fontSDF.texture = LoadTextureFromImage(fontSDFAtlas);
  UnloadImage(fontSDFAtlas);

  final shader = LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/sdf.fs");
  SetTextureFilter(fontSDF.texture, .TEXTURE_FILTER_BILINEAR);

  final Vector2D fontPosition = .vec2(40, screenHeight/2.0 - 50);
  Vector2D textSize = .vec2(0.0, 0.0);
  double fontSize = 16.0;
  int currentFont = 0;

  while (!WindowShouldClose())
  {
    fontSize += GetMouseWheelMove()*8.0;

    if (fontSize < 6) fontSize = 6;

    if (IsKeyDown(.KEY_SPACE)) currentFont = 1;
    else currentFont = 0;

    if (currentFont == 0) textSize = MeasureTextEx(fontDefault, msg, fontSize, 0);
    else textSize = MeasureTextEx(fontSDF, msg, fontSize, 0);

    fontPosition.x = GetScreenWidth()/2 - textSize.x/2;
    fontPosition.y = GetScreenHeight()/2 - textSize.y/2 + 80;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      if (currentFont == 1)
      {
        BeginShaderMode(shader);
          DrawTextEx(fontSDF, msg, fontPosition, fontSize, 0, .BLACK);
        EndShaderMode();

        DrawTexture(fontSDF.texture, 10, 10, .BLACK);
      }
      else
      {
        DrawTextEx(fontDefault, msg, fontPosition, fontSize, 0, .BLACK);
        DrawTexture(fontDefault.texture, 10, 10, .BLACK);
      }

      if (currentFont == 1) DrawText("SDF!", 320, 20, 80, .RED);
      else DrawText("default font", 315, 40, 30, .GRAY);

      DrawText(
        "FONT SIZE: 16.0",
        GetScreenWidth() - 240, 20, 20, .DARKGRAY
      );
      
      DrawText(
        "RENDER SIZE: ${fontSize.f2}",
        GetScreenWidth() - 240, 50, 20, .DARKGRAY
      );
      
      DrawText(
        "Use MOUSE WHEEL to SCALE TEXT!",
        GetScreenWidth() - 240, 90, 10, .DARKGRAY
      );

      DrawText(
        "HOLD SPACE to USE SDF FONT VERSION!",
        340, GetScreenHeight() - 30, 20, .MAROON
      );

    EndDrawing();
  }

  UnloadFont(fontDefault);
  UnloadFont(fontSDF);

  UnloadShader(shader);

  CloseWindowAndDispose();
}