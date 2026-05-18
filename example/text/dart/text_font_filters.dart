// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_filters.c
// Run it: dart run text_font_filters.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "text_font_filters");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final msg = "Loaded Font";

  var font = rl.CoreD.LoadFontEx("../resources/KAISG.ttf", 96);
  var fontTexture = font.texture;
  rl.CoreD.GenTextureMipmaps(fontTexture);

  double fontSize = font.baseSize.toDouble();
  final Vector2D fontPosition = .vec2(40, screenHeight / 2 - 80);

  TextureFilter currentFontFilter = .TEXTURE_FILTER_POINT;
  rl.CoreD.SetTextureFilter(fontTexture, currentFontFilter);

  while (!rl.CoreD.WindowShouldClose())
  {
    fontSize += rl.CoreD.GetMouseWheelMove()*4;

    if (rl.CoreD.IsKeyPressed(.KEY_ONE)) {
      currentFontFilter = .TEXTURE_FILTER_POINT;
      rl.CoreD.SetTextureFilter(fontTexture, currentFontFilter);
    }

    if (rl.CoreD.IsKeyPressed(.KEY_TWO)) {
      currentFontFilter = .TEXTURE_FILTER_BILINEAR;
      rl.CoreD.SetTextureFilter(fontTexture, currentFontFilter);
    }

    if (rl.CoreD.IsKeyPressed(.KEY_THREE)) {
      currentFontFilter = .TEXTURE_FILTER_TRILINEAR;
      rl.CoreD.SetTextureFilter(fontTexture, currentFontFilter);
    }

    final textSize = rl.CoreD.MeasureTextEx(font, msg, fontSize, 0);

    if (rl.CoreD.IsKeyDown(.KEY_LEFT)) {
      fontPosition.x -= 10;
    } else if (rl.CoreD.IsKeyDown(.KEY_RIGHT)) {
      fontPosition.x += 10;
    }

    if (rl.CoreD.IsFileDropped()) {
      final droppedFiles = rl.CoreD.LoadDroppedFiles();

      if (rl.CoreD.IsFileExtension(droppedFiles.paths[0], ".ttf")) {
        rl.CoreD.UnloadFont(font);
        
        font = rl.CoreD.LoadFontEx(droppedFiles.paths[0], fontSize);
        fontTexture = font.texture;
        rl.CoreD.GenTextureMipmaps(fontTexture);
      }
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText(
        "Use mouse wheel to change font size",
        20, 20, 10, .GRAY
      );
      rl.CoreD.DrawText(
        "Use KEY_RIGHT and KEY_LEFT to move text",
        20, 40, 10, .GRAY
      );
      rl.CoreD.DrawText(
        "Use 1, 2, 3 to change texture filter",
        20, 60, 10, .GRAY
      );
      rl.CoreD.DrawText(
        "Drop a new TTF font for dynamic loading",
        20, 80, 10, .DARKGRAY
      );

      rl.CoreD.DrawTextEx(font, msg, fontPosition, fontSize, 0, .BLACK);

      rl.CoreD.DrawRectangle(0, screenHeight - 80, screenWidth, 80, .LIGHTGRAY);
      rl.CoreD.DrawText(
        "Font size: ${fontSize.f2}",
        20, screenHeight - 50, 10, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "Text size: ${textSize.format(2)}",
        20, screenHeight - 30, 10, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "FILTER:",
        220, 400, 20, .GRAY
      );

      rl.CoreD.DrawText(
        currentFontFilter.name,
        340, 400, 20, .BLACK
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadFont(font);

  rl.CloseWindowAndDispose();
}