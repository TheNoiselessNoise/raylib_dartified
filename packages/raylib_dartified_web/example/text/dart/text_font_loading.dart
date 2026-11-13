// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_loading.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "text_font_loading");
  SetTargetFPS(60);

  String msg = "!\"#\$%&'()*+,-./0123456789:;<=>?@ABCDEFGHI\nJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmn\nopqrstuvwxyz{|}~¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓ\nÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷\nøùúûüýþÿ";

  final fontBm = LoadFont("../resources/pixantiqua.fnt");

  final fontTtf = LoadFontEx("../resources/pixantiqua.ttf", 32, null, 250);

  SetTextLineSpacing(16);
  bool useTtf = false;

  rl.setMainLoop(() {
    if (IsKeyDown(.KEY_SPACE)) useTtf = true;
    else useTtf = false;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText(
        "Hold SPACE to use TTF generated font",
        20, 20, 20, .LIGHTGRAY
      );

      if (!useTtf)
      {
        DrawTextEx(
          fontBm,
          msg,
          .vec2(20.0, 100.0),
          fontBm.baseSize, 2, .MAROON
        );

        DrawText(
          "Using BMFont (Angelcode) imported",
          20, GetScreenHeight() - 30, 20, .GRAY
        );
      }
      else
      {
        DrawTextEx(
          fontTtf,
          msg,
          .vec2(20.0, 100.0),
          fontTtf.baseSize, 2, .LIME
        );
        
        DrawText(
          "Using TTF font generated",
          20, GetScreenHeight() - 30, 20, .GRAY
        );
      }

    EndDrawing();
  });
});