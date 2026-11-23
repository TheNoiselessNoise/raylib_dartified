// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_spritefont.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

final msg1 = "THIS IS A custom SPRITE FONT...";
final msg2 = "...and this is ANOTHER CUSTOM font...";
final msg3 = "...and a THIRD one! GREAT! :D";
late Font font1;
late Font font2;
late Font font3;
late Vector2 fontPosition1;
late Vector2 fontPosition2;
late Vector2 fontPosition3;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "text_font_spritefont");
    SetTargetFPS(60);

    font1 = LoadFont("../resources/custom_mecha.png");
    font2 = LoadFont("../resources/custom_alagard.png");
    font3 = LoadFont("../resources/custom_jupiter_crash.png");

    fontPosition1 = .vec2(
      screenWidth/2.0 - MeasureTextEx(font1, msg1, font1.baseSize, -3).x/2,
      screenHeight/2.0 - font1.baseSize/2.0 - 80.0
    );

    fontPosition2 = .vec2(
      screenWidth/2.0 - MeasureTextEx(font2, msg2, font2.baseSize, -2.0).x/2.0,
      screenHeight/2.0 - font2.baseSize/2.0 - 10.0
    );

    fontPosition3 = .vec2(
      screenWidth/2.0 - MeasureTextEx(font3, msg3, font3.baseSize, 2.0).x/2.0,
      screenHeight/2.0 - font3.baseSize/2.0 + 50.0
    );
  },
  loop: (_) async {
    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTextEx(font1, msg1, fontPosition1, font1.baseSize, -3, .WHITE);
      DrawTextEx(font2, msg2, fontPosition2, font2.baseSize, -2, .WHITE);
      DrawTextEx(font3, msg3, fontPosition3, font3.baseSize, 2, .WHITE);

    EndDrawing();
  },
  close: (_) {
    UnloadFont(font1);
    UnloadFont(font2);
    UnloadFont(font3);
    CloseWindow();
  },
);