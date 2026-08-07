// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_spritefont.c
// Run it: dart run text_font_spritefont.dart
// WARNING: expects resources from the raylib source
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_font_spritefont".toC);
  SetTargetFPS(60);

  String msg1 = "THIS IS A custom SPRITE FONT...";
  String msg2 = "...and this is ANOTHER CUSTOM font...";
  String msg3 = "...and a THIRD one! GREAT! :D";

  final font1 = LoadFont("../resources/custom_mecha.png".toC);
  final font2 = LoadFont("../resources/custom_alagard.png".toC);
  final font3 = LoadFont("../resources/custom_jupiter_crash.png".toC);

  final fontPosition1 = Vector2$.$1.set(
    screenWidth/2.0 - MeasureTextEx(font1, msg1.toC, font1.baseSize.toDouble(), -3).x/2,
    screenHeight/2.0 - font1.baseSize/2.0 - 80.0
  );

  final fontPosition2 = Vector2$.$2.set(
    screenWidth/2.0 - MeasureTextEx(font2, msg2.toC, font2.baseSize.toDouble(), -2.0).x/2.0,
    screenHeight/2.0 - font2.baseSize/2.0 - 10.0
  );

  final fontPosition3 = Vector2$.$3.set(
    screenWidth/2.0 - MeasureTextEx(font3, msg3.toC, font3.baseSize.toDouble(), 2.0).x/2.0,
    screenHeight/2.0 - font3.baseSize/2.0 + 50.0
  );

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTextEx(font1, msg1.toC, fontPosition1, font1.baseSize.toDouble(), -3, WHITE);
      DrawTextEx(font2, msg2.toC, fontPosition2, font2.baseSize.toDouble(), -2, WHITE);
      DrawTextEx(font3, msg3.toC, fontPosition3, font3.baseSize.toDouble(), 2, WHITE);

    EndDrawing();
  }

  UnloadFont(font1);
  UnloadFont(font2);
  UnloadFont(font3);

  CloseWindowAndDispose();
}