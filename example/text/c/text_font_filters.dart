// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_filters.c
// Run it: dart run text_font_filters.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_font_filters".toC);
  SetTargetFPS(60);

  final msg = "Loaded Font";

  final font = Font$.val.At('font');
  final fontTexture = Texture$.val.At('fontTexture');
  font.ref = LoadFontEx("../resources/KAISG.ttf".toC, 96, nullptr, 0);
  fontTexture.ref = font.ref.texture;
  GenTextureMipmaps(fontTexture);

  double fontSize = font.ref.baseSize.toDouble();
  final fontPosition = Vector2$.val.At('fontPosition').set(40, screenHeight / 2 - 80);
  final textSize = Vector2$.val.At('textSize');

  int currentFontFilter = TextureFilter.TEXTURE_FILTER_POINT.value;
  SetTextureFilter(fontTexture.ref, currentFontFilter);

  while (!WindowShouldClose())
  {
    fontSize += GetMouseWheelMove()*4;

    if (IsKeyPressed(KeyboardKey.KEY_ONE.value)) {
      currentFontFilter = TextureFilter.TEXTURE_FILTER_POINT.value;
      SetTextureFilter(fontTexture.ref, currentFontFilter);
    }

    if (IsKeyPressed(KeyboardKey.KEY_TWO.value)) {
      currentFontFilter = TextureFilter.TEXTURE_FILTER_BILINEAR.value;
      SetTextureFilter(fontTexture.ref, currentFontFilter);
    }

    if (IsKeyPressed(KeyboardKey.KEY_THREE.value)) {
      currentFontFilter = TextureFilter.TEXTURE_FILTER_TRILINEAR.value;
      SetTextureFilter(fontTexture.ref, currentFontFilter);
    }

    textSize.ref = MeasureTextEx(font.ref, msg.toC, fontSize, 0);

    if (IsKeyDown(KeyboardKey.KEY_LEFT.value)) {
      fontPosition.ref.x -= 10;
    } else if (IsKeyDown(KeyboardKey.KEY_RIGHT.value)) {
      fontPosition.ref.x += 10;
    }

    if (IsFileDropped()) {
      final droppedFiles = LoadDroppedFiles();

      if (IsFileExtension(droppedFiles.paths[0], ".ttf".toC)) {
        UnloadFont(font.ref);
        
        font.ref = LoadFontEx(droppedFiles.paths[0], fontSize.toInt(), nullptr, 0);
        fontTexture.ref = font.ref.texture;
        GenTextureMipmaps(fontTexture);
      }

      UnloadDroppedFiles(droppedFiles);
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText(
        "Use mouse wheel to change font size".toC,
        20, 20, 10, GRAY
      );
      DrawText(
        "Use KEY_RIGHT and KEY_LEFT to move text".toC,
        20, 40, 10, GRAY
      );
      DrawText(
        "Use 1, 2, 3 to change texture filter".toC,
        20, 60, 10, GRAY
      );
      DrawText(
        "Drop a new TTF font for dynamic loading".toC,
        20, 80, 10, DARKGRAY
      );

      DrawTextEx(font.ref, msg.toC, fontPosition.ref, fontSize, 0, BLACK);

      DrawRectangle(0, screenHeight - 80, screenWidth, 80, LIGHTGRAY);
      DrawText(
        "Font size: ${fontSize.f2}".toC,
        20, screenHeight - 50, 10, DARKGRAY
      );
      DrawText(
        "Text size: ${textSize.toD().format(2)}".toC,
        20, screenHeight - 30, 10, DARKGRAY
      );
      DrawText(
        "CURRENT TEXTURE FILTER:".toC,
        250, 400, 20, GRAY
      );

      if (currentFontFilter == TextureFilter.TEXTURE_FILTER_POINT.value) {
        DrawText(
          "POINT".toC,
          570, 400, 20, BLACK
        );
      } else if (currentFontFilter == TextureFilter.TEXTURE_FILTER_BILINEAR.value) {
        DrawText(
          "BILINEAR".toC,
          570, 400, 20, BLACK
        );
      } else if (currentFontFilter == TextureFilter.TEXTURE_FILTER_TRILINEAR.value) {
        DrawText(
          "TRILINEAR".toC,
          570, 400, 20, BLACK
        );
      }

    EndDrawing();
  }

  UnloadFont(font.ref);

  CloseWindowAndDispose();
}