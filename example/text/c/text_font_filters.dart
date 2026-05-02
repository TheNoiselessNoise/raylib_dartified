// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_filters.c
// Run it: dart run text_font_filters.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "text_font_filters".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final msg = "Loaded Font";

  final font = rl.Temp.Font$.At('font');
  final fontTexture = rl.Temp.Texture$.At('fontTexture');
  font.ref = rl.Core.LoadFontEx("../resources/KAISG.ttf".toC, 96, nullptr, 0);
  fontTexture.ref = font.ref.texture;
  rl.Core.GenTextureMipmaps(fontTexture);

  double fontSize = font.ref.baseSize.toDouble();
  final fontPosition = rl.Temp.Vector2$.At('fontPosition').set(40, screenHeight / 2 - 80);
  final textSize = rl.Temp.Vector2$.At('textSize');

  int currentFontFilter = TextureFilter.TEXTURE_FILTER_POINT.value;
  rl.Core.SetTextureFilter(fontTexture.ref, currentFontFilter);

  while (!rl.Core.WindowShouldClose())
  {
    fontSize += rl.Core.GetMouseWheelMove()*4;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ONE.value)) {
      currentFontFilter = TextureFilter.TEXTURE_FILTER_POINT.value;
      rl.Core.SetTextureFilter(fontTexture.ref, currentFontFilter);
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_TWO.value)) {
      currentFontFilter = TextureFilter.TEXTURE_FILTER_BILINEAR.value;
      rl.Core.SetTextureFilter(fontTexture.ref, currentFontFilter);
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_THREE.value)) {
      currentFontFilter = TextureFilter.TEXTURE_FILTER_TRILINEAR.value;
      rl.Core.SetTextureFilter(fontTexture.ref, currentFontFilter);
    }

    textSize.ref = rl.Core.MeasureTextEx(font.ref, msg.toC, fontSize, 0);

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT.value)) {
      fontPosition.ref.x -= 10;
    } else if (rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT.value)) {
      fontPosition.ref.x += 10;
    }

    if (rl.Core.IsFileDropped()) {
      final droppedFiles = rl.Core.LoadDroppedFiles();

      if (rl.Core.IsFileExtension(droppedFiles.paths[0], ".ttf".toC)) {
        rl.Core.UnloadFont(font.ref);
        
        font.ref = rl.Core.LoadFontEx(droppedFiles.paths[0], fontSize.toInt(), nullptr, 0);
        fontTexture.ref = font.ref.texture;
        rl.Core.GenTextureMipmaps(fontTexture);
      }

      rl.Core.UnloadDroppedFiles(droppedFiles);
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.DrawText(
        "Use mouse wheel to change font size".toC,
        20, 20, 10, rl.C.GRAY
      );
      rl.Core.DrawText(
        "Use KEY_RIGHT and KEY_LEFT to move text".toC,
        20, 40, 10, rl.C.GRAY
      );
      rl.Core.DrawText(
        "Use 1, 2, 3 to change texture filter".toC,
        20, 60, 10, rl.C.GRAY
      );
      rl.Core.DrawText(
        "Drop a new TTF font for dynamic loading".toC,
        20, 80, 10, rl.C.DARKGRAY
      );

      rl.Core.DrawTextEx(font.ref, msg.toC, fontPosition.ref, fontSize, 0, rl.C.BLACK);

      rl.Core.DrawRectangle(0, screenHeight - 80, screenWidth, 80, rl.C.LIGHTGRAY);
      rl.Core.DrawText(
        "Font size: ${fontSize.f2}".toC,
        20, screenHeight - 50, 10, rl.C.DARKGRAY
      );
      rl.Core.DrawText(
        "Text size: ${textSize.format(2)}".toC,
        20, screenHeight - 30, 10, rl.C.DARKGRAY
      );
      rl.Core.DrawText(
        "CURRENT TEXTURE FILTER:".toC,
        250, 400, 20, rl.C.GRAY
      );

      if (currentFontFilter == TextureFilter.TEXTURE_FILTER_POINT.value) {
        rl.Core.DrawText(
          "POINT".toC,
          570, 400, 20, rl.C.BLACK
        );
      } else if (currentFontFilter == TextureFilter.TEXTURE_FILTER_BILINEAR.value) {
        rl.Core.DrawText(
          "BILINEAR".toC,
          570, 400, 20, rl.C.BLACK
        );
      } else if (currentFontFilter == TextureFilter.TEXTURE_FILTER_TRILINEAR.value) {
        rl.Core.DrawText(
          "TRILINEAR".toC,
          570, 400, 20, rl.C.BLACK
        );
      }

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadFont(font.ref);

  rl.CloseWindowAndDispose();
}