// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_loading.c
// Run it: dart run text_font_loading.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_font_loading".toC);
  SetTargetFPS(60);

  String msg = "!\"#\$%&'()*+,-./0123456789:;<=>?@ABCDEFGHI\nJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmn\nopqrstuvwxyz{|}~¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓ\nÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷\nøùúûüýþÿ";

  final fontBm = LoadFont("../resources/pixantiqua.fnt".toC);

  final fontTtf = LoadFontEx("../resources/pixantiqua.ttf".toC, 32, nullptr, 250);

  SetTextLineSpacing(16);
  bool useTtf = false;

  while (!WindowShouldClose())
  {
    if (IsKeyDown(KeyboardKey.KEY_SPACE.value)) useTtf = true;
    else useTtf = false;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText(
        "Hold SPACE to use TTF generated font".toC,
        20, 20, 20, LIGHTGRAY
      );

      if (!useTtf)
      {
        DrawTextEx(
          fontBm,
          msg.toC,
          Vector2$.$1.set(20.0, 100.0),
          fontBm.baseSize.toDouble(), 2, MAROON
        );

        DrawText(
          "Using BMFont (Angelcode) imported".toC,
          20, GetScreenHeight() - 30, 20, GRAY
        );
      }
      else
      {
        DrawTextEx(
          fontTtf,
          msg.toC,
          Vector2$.$1.set(20.0, 100.0),
          fontTtf.baseSize.toDouble(), 2, LIME
        );
        
        DrawText(
          "Using TTF font generated".toC,
          20, GetScreenHeight() - 30, 20, GRAY
        );
      }

    EndDrawing();
  }

  UnloadFont(fontBm);
  UnloadFont(fontTtf);

  CloseWindowAndDispose();
}