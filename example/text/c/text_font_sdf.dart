// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_sdf.c
// Run it: dart run text_font_sdf.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "text_font_sdf".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  String msg = "Signed Distance Fields";

  final fileSize = rl.Temp.Int$.At('fileSize');
  final fileData = rl.Core.LoadFileData("../resources/anonymous_pro_bold.ttf".toC, fileSize);

  final fontDefault = rl.Temp.Font$.At('fontDefault');
  fontDefault.ref.baseSize = 16;
  fontDefault.ref.glyphCount = 95;

  // final glyphCount = rl.Temp.Int$.At('glyphCount');
  fontDefault.ref.glyphs = rl.Core.LoadFontData(fileData, fileSize.value, 16, nullptr, 95, FontType.FONT_DEFAULT.value);//, glyphCount);
  final fontDefaultRects = rl.Temp.Ptr$Rectangle$.At('fontDefaultRects');
  var atlas = rl.Core.GenImageFontAtlas(fontDefault.ref.glyphs, fontDefaultRects, 95, 16, 4, 0);
  fontDefault.ref.recs = fontDefaultRects.value;
  fontDefault.ref.texture = rl.Core.LoadTextureFromImage(atlas);
  rl.Core.UnloadImage(atlas);

  final fontSDF = rl.Temp.Font$.At('fontSDF');
  fontSDF.ref.baseSize = 16;
  fontSDF.ref.glyphCount = 95;
  fontSDF.ref.glyphs = rl.Core.LoadFontData(fileData, fileSize.value, 16, nullptr, 0, FontType.FONT_SDF.value);//, glyphCount);
  final fontSDFRects = rl.Temp.Ptr$Rectangle$.At('fontSDFRects');
  atlas = rl.Core.GenImageFontAtlas(fontSDF.ref.glyphs, fontSDFRects, 95, 16, 0, 1);
  fontSDF.ref.recs = fontSDFRects.value;
  fontSDF.ref.texture = rl.Core.LoadTextureFromImage(atlas);
  rl.Core.UnloadImage(atlas);

  rl.Core.UnloadFileData(fileData);

  final shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/sdf.fs".toC,
  );
  rl.Core.SetTextureFilter(fontSDF.ref.texture, TextureFilter.TEXTURE_FILTER_BILINEAR.value);

  final fontPosition = rl.Temp.Vector2$.At('fontPosition').set(40, screenHeight/2.0 - 50);
  final textSize = rl.Temp.Vector2$.At('textSize').set(0.0, 0.0);
  double fontSize = 16.0;
  int currentFont = 0;

  while (!rl.Core.WindowShouldClose())
  {
    fontSize += rl.Core.GetMouseWheelMove()*8.0;

    if (fontSize < 6) fontSize = 6;

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_SPACE.value)) currentFont = 1;
    else currentFont = 0;

    if (currentFont == 0) textSize.setC(rl.Core.MeasureTextEx(fontDefault.ref, msg.toC, fontSize, 0));
    else textSize.setC(rl.Core.MeasureTextEx(fontSDF.ref, msg.toC, fontSize, 0));

    fontPosition.ref.x = rl.Core.GetScreenWidth()/2 - textSize.ref.x/2;
    fontPosition.ref.y = rl.Core.GetScreenHeight()/2 - textSize.ref.y/2 + 80;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      if (currentFont == 1)
      {
        rl.Core.BeginShaderMode(shader);
          rl.Core.DrawTextEx(fontSDF.ref, msg.toC, fontPosition.ref, fontSize, 0, rl.Color.BLACK);
        rl.Core.EndShaderMode();

        rl.Core.DrawTexture(fontSDF.ref.texture, 10, 10, rl.Color.BLACK);
      }
      else
      {
        rl.Core.DrawTextEx(fontDefault.ref, msg.toC, fontPosition.ref, fontSize, 0, rl.Color.BLACK);
        rl.Core.DrawTexture(fontDefault.ref.texture, 10, 10, rl.Color.BLACK);
      }

      if (currentFont == 1) rl.Core.DrawText("SDF!".toC, 320, 20, 80, rl.Color.RED);
      else rl.Core.DrawText("default font".toC, 315, 40, 30, rl.Color.GRAY);

      rl.Core.DrawText(
        "FONT SIZE: 16.0".toC,
        rl.Core.GetScreenWidth() - 240, 20, 20, rl.Color.DARKGRAY
      );
      
      rl.Core.DrawText(
        "RENDER SIZE: ${fontSize.f2}".toC,
        rl.Core.GetScreenWidth() - 240, 50, 20, rl.Color.DARKGRAY
      );
      
      rl.Core.DrawText(
        "Use MOUSE WHEEL to SCALE TEXT!".toC,
        rl.Core.GetScreenWidth() - 240, 90, 10, rl.Color.DARKGRAY
      );

      rl.Core.DrawText(
        "HOLD SPACE to USE SDF FONT VERSION!".toC,
        340, rl.Core.GetScreenHeight() - 30, 20, rl.Color.MAROON
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadFont(fontDefault.ref);
  rl.Core.UnloadFont(fontSDF.ref);

  rl.Core.UnloadShader(shader);

  rl.CloseWindowAndDispose();
}