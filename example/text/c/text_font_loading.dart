// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_loading.c
// Run it: dart run text_font_loading.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "text_font_loading".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  String msg = "!\"#\$%&'()*+,-./0123456789:;<=>?@ABCDEFGHI\nJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmn\nopqrstuvwxyz{|}~¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓ\nÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷\nøùúûüýþÿ";

  final fontBm = rl.Core.LoadFont("../resources/pixantiqua.fnt".toC);

  final fontTtf = rl.Core.LoadFontEx("../resources/pixantiqua.ttf".toC, 32, nullptr, 250);

  rl.Core.SetTextLineSpacing(16);
  bool useTtf = false;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_SPACE.value)) useTtf = true;
    else useTtf = false;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawText(
        "Hold SPACE to use TTF generated font".toC,
        20, 20, 20, rl.Color.LIGHTGRAY
      );

      if (!useTtf)
      {
        rl.Core.DrawTextEx(
          fontBm,
          msg.toC,
          rl.Temp.vec21(20.0, 100.0),
          fontBm.baseSize.toDouble(), 2, rl.Color.MAROON
        );

        rl.Core.DrawText(
          "Using BMFont (Angelcode) imported".toC,
          20, rl.Core.GetScreenHeight() - 30, 20, rl.Color.GRAY
        );
      }
      else
      {
        rl.Core.DrawTextEx(
          fontTtf,
          msg.toC,
          rl.Temp.vec21(20.0, 100.0),
          fontTtf.baseSize.toDouble(), 2, rl.Color.LIME
        );
        
        rl.Core.DrawText(
          "Using TTF font generated".toC,
          20, rl.Core.GetScreenHeight() - 30, 20, rl.Color.GRAY
        );
      }

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadFont(fontBm);
  rl.Core.UnloadFont(fontTtf);

  rl.CloseWindowAndDispose();
}