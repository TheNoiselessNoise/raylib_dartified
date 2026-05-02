// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_loading.c
// Run it: dart run text_font_loading.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "text_font_loading");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  String msg = "!\"#\$%&'()*+,-./0123456789:;<=>?@ABCDEFGHI\nJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmn\nopqrstuvwxyz{|}~¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓ\nÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷\nøùúûüýþÿ";

  final fontBm = rl.CoreD.LoadFont("../resources/pixantiqua.fnt");

  final fontTtf = rl.CoreD.LoadFontEx("../resources/pixantiqua.ttf", 32, null, 250);

  rl.CoreD.SetTextLineSpacing(16);
  bool useTtf = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyDown(.KEY_SPACE)) useTtf = true;
    else useTtf = false;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText(
        "Hold SPACE to use TTF generated font",
        20, 20, 20, .LIGHTGRAY
      );

      if (!useTtf)
      {
        rl.CoreD.DrawTextEx(
          fontBm,
          msg,
          .vec2(20.0, 100.0),
          fontBm.baseSize, 2, .MAROON
        );

        rl.CoreD.DrawText(
          "Using BMFont (Angelcode) imported",
          20, rl.CoreD.GetScreenHeight() - 30, 20, .GRAY
        );
      }
      else
      {
        rl.CoreD.DrawTextEx(
          fontTtf,
          msg,
          .vec2(20.0, 100.0),
          fontTtf.baseSize, 2, .LIME
        );
        
        rl.CoreD.DrawText(
          "Using TTF font generated",
          20, rl.CoreD.GetScreenHeight() - 30, 20, .GRAY
        );
      }

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadFont(fontBm);
  rl.CoreD.UnloadFont(fontTtf);

  rl.CloseWindowAndDispose();
}