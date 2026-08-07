// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_filters.c
// Run it: dart run text_font_filters.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_font_filters");
  SetTargetFPS(60);

  final msg = "Loaded Font";

  var font = LoadFontEx("../resources/KAISG.ttf", 96);
  var fontTexture = font.texture;
  GenTextureMipmaps(fontTexture);

  double fontSize = font.baseSize.toDouble();
  final Vector2D fontPosition = .vec2(40, screenHeight / 2 - 80);

  TextureFilter currentFontFilter = .TEXTURE_FILTER_POINT;
  SetTextureFilter(fontTexture, currentFontFilter);

  while (!WindowShouldClose())
  {
    fontSize += GetMouseWheelMove()*4;

    if (IsKeyPressed(.KEY_ONE)) {
      currentFontFilter = .TEXTURE_FILTER_POINT;
      SetTextureFilter(fontTexture, currentFontFilter);
    }

    if (IsKeyPressed(.KEY_TWO)) {
      currentFontFilter = .TEXTURE_FILTER_BILINEAR;
      SetTextureFilter(fontTexture, currentFontFilter);
    }

    if (IsKeyPressed(.KEY_THREE)) {
      currentFontFilter = .TEXTURE_FILTER_TRILINEAR;
      SetTextureFilter(fontTexture, currentFontFilter);
    }

    final textSize = MeasureTextEx(font, msg, fontSize, 0);

    if (IsKeyDown(.KEY_LEFT)) {
      fontPosition.x -= 10;
    } else if (IsKeyDown(.KEY_RIGHT)) {
      fontPosition.x += 10;
    }

    if (IsFileDropped()) {
      final droppedFiles = LoadDroppedFiles();

      if (IsFileExtension(droppedFiles.paths[0], ".ttf")) {
        UnloadFont(font);
        
        font = LoadFontEx(droppedFiles.paths[0], fontSize);
        fontTexture = font.texture;
        GenTextureMipmaps(fontTexture);
      }
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText(
        "Use mouse wheel to change font size",
        20, 20, 10, .GRAY
      );
      DrawText(
        "Use KEY_RIGHT and KEY_LEFT to move text",
        20, 40, 10, .GRAY
      );
      DrawText(
        "Use 1, 2, 3 to change texture filter",
        20, 60, 10, .GRAY
      );
      DrawText(
        "Drop a new TTF font for dynamic loading",
        20, 80, 10, .DARKGRAY
      );

      DrawTextEx(font, msg, fontPosition, fontSize, 0, .BLACK);

      DrawRectangle(0, screenHeight - 80, screenWidth, 80, .LIGHTGRAY);
      DrawText(
        "Font size: ${fontSize.f2}",
        20, screenHeight - 50, 10, .DARKGRAY
      );
      DrawText(
        "Text size: ${textSize.format(2)}",
        20, screenHeight - 30, 10, .DARKGRAY
      );
      DrawText(
        "FILTER:",
        220, 400, 20, .GRAY
      );

      DrawText(
        currentFontFilter.name,
        340, 400, 20, .BLACK
      );

    EndDrawing();
  }

  UnloadFont(font);

  CloseWindowAndDispose();
}