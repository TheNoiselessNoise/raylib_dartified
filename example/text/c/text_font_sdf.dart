// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_sdf.c
// Run it: dart run text_font_sdf.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_font_sdf".toC);
  SetTargetFPS(60);

  String msg = "Signed Distance Fields";

  final fileSize = Int$.val.At('fileSize');
  final fileData = LoadFileData("../resources/anonymous_pro_bold.ttf".toC, fileSize);

  final fontDefault = Font$.val.At('fontDefault');
  fontDefault.ref.baseSize = 16;
  fontDefault.ref.glyphCount = 95;

  final glyphCount = Int$.val.At('glyphCount');
  fontDefault.ref.glyphs = LoadFontData(fileData, fileSize.value, 16, nullptr, 95, FontType.FONT_DEFAULT.value, glyphCount);
  final fontDefaultRects = Rectangle$.ptr.At('fontDefaultRects');
  var atlas = GenImageFontAtlas(fontDefault.ref.glyphs, fontDefaultRects, 95, 16, 4, 0);
  fontDefault.ref.recs = fontDefaultRects.value;
  fontDefault.ref.texture = LoadTextureFromImage(atlas);
  UnloadImage(atlas);

  final fontSDF = Font$.val.At('fontSDF');
  fontSDF.ref.baseSize = 16;
  fontSDF.ref.glyphCount = 95;
  fontSDF.ref.glyphs = LoadFontData(fileData, fileSize.value, 16, nullptr, 0, FontType.FONT_SDF.value, glyphCount);
  final fontSDFRects = Rectangle$.ptr.At('fontSDFRects');
  atlas = GenImageFontAtlas(fontSDF.ref.glyphs, fontSDFRects, 95, 16, 0, 1);
  fontSDF.ref.recs = fontSDFRects.value;
  fontSDF.ref.texture = LoadTextureFromImage(atlas);
  UnloadImage(atlas);

  UnloadFileData(fileData);

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/sdf.fs".toC,
  );
  SetTextureFilter(fontSDF.ref.texture, TextureFilter.TEXTURE_FILTER_BILINEAR.value);

  final fontPosition = Vector2$.val.At('fontPosition').set(40, screenHeight/2.0 - 50);
  final textSize = Vector2$.val.At('textSize').set(0.0, 0.0);
  double fontSize = 16.0;
  int currentFont = 0;

  while (!WindowShouldClose())
  {
    fontSize += GetMouseWheelMove()*8.0;

    if (fontSize < 6) fontSize = 6;

    if (IsKeyDown(KeyboardKey.KEY_SPACE.value)) currentFont = 1;
    else currentFont = 0;

    if (currentFont == 0) textSize.setC(MeasureTextEx(fontDefault.ref, msg.toC, fontSize, 0));
    else textSize.setC(MeasureTextEx(fontSDF.ref, msg.toC, fontSize, 0));

    fontPosition.ref.x = GetScreenWidth()/2 - textSize.ref.x/2;
    fontPosition.ref.y = GetScreenHeight()/2 - textSize.ref.y/2 + 80;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (currentFont == 1)
      {
        BeginShaderMode(shader);
          DrawTextEx(fontSDF.ref, msg.toC, fontPosition.ref, fontSize, 0, BLACK);
        EndShaderMode();

        DrawTexture(fontSDF.ref.texture, 10, 10, BLACK);
      }
      else
      {
        DrawTextEx(fontDefault.ref, msg.toC, fontPosition.ref, fontSize, 0, BLACK);
        DrawTexture(fontDefault.ref.texture, 10, 10, BLACK);
      }

      if (currentFont == 1) DrawText("SDF!".toC, 320, 20, 80, RED);
      else DrawText("default font".toC, 315, 40, 30, GRAY);

      DrawText(
        "FONT SIZE: 16.0".toC,
        GetScreenWidth() - 240, 20, 20, DARKGRAY
      );
      
      DrawText(
        "RENDER SIZE: ${fontSize.f2}".toC,
        GetScreenWidth() - 240, 50, 20, DARKGRAY
      );
      
      DrawText(
        "Use MOUSE WHEEL to SCALE TEXT!".toC,
        GetScreenWidth() - 240, 90, 10, DARKGRAY
      );

      DrawText(
        "HOLD SPACE to USE SDF FONT VERSION!".toC,
        340, GetScreenHeight() - 30, 20, MAROON
      );

    EndDrawing();
  }

  UnloadFont(fontDefault.ref);
  UnloadFont(fontSDF.ref);

  UnloadShader(shader);

  CloseWindowAndDispose();
}