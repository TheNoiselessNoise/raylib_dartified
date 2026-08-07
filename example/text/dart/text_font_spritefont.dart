// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_spritefont.c
// Run it: dart run text_font_spritefont.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_font_spritefont");
  SetTargetFPS(60);

  String msg1 = "THIS IS A custom SPRITE FONT...";
  String msg2 = "...and this is ANOTHER CUSTOM font...";
  String msg3 = "...and a THIRD one! GREAT! :D";

  final font1 = LoadFont("../resources/custom_mecha.png");
  final font2 = LoadFont("../resources/custom_alagard.png");
  final font3 = LoadFont("../resources/custom_jupiter_crash.png");

  final Vector2D fontPosition1 = .vec2(
    screenWidth/2.0 - MeasureTextEx(font1, msg1, font1.baseSize, -3).x/2,
    screenHeight/2.0 - font1.baseSize/2.0 - 80.0
  );

  final Vector2D fontPosition2 = .vec2(
    screenWidth/2.0 - MeasureTextEx(font2, msg2, font2.baseSize, -2.0).x/2.0,
    screenHeight/2.0 - font2.baseSize/2.0 - 10.0
  );

  final Vector2D fontPosition3 = .vec2(
    screenWidth/2.0 - MeasureTextEx(font3, msg3, font3.baseSize, 2.0).x/2.0,
    screenHeight/2.0 - font3.baseSize/2.0 + 50.0
  );

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTextEx(font1, msg1, fontPosition1, font1.baseSize, -3, .WHITE);
      DrawTextEx(font2, msg2, fontPosition2, font2.baseSize, -2, .WHITE);
      DrawTextEx(font3, msg3, fontPosition3, font3.baseSize, 2, .WHITE);

    EndDrawing();
  }

  UnloadFont(font1);
  UnloadFont(font2);
  UnloadFont(font3);

  CloseWindowAndDispose();
}