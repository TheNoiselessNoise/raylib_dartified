// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_spritefont.c
// Run it: dart run text_font_spritefont.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "text_font_spritefont");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  String msg1 = "THIS IS A custom SPRITE FONT...";
  String msg2 = "...and this is ANOTHER CUSTOM font...";
  String msg3 = "...and a THIRD one! GREAT! :D";

  final font1 = rl.CoreD.LoadFont("../resources/custom_mecha.png");
  final font2 = rl.CoreD.LoadFont("../resources/custom_alagard.png");
  final font3 = rl.CoreD.LoadFont("../resources/custom_jupiter_crash.png");

  final Vector2D fontPosition1 = .vec2(
    screenWidth/2.0 - rl.CoreD.MeasureTextEx(font1, msg1, font1.baseSize, -3).x/2,
    screenHeight/2.0 - font1.baseSize/2.0 - 80.0
  );

  final Vector2D fontPosition2 = .vec2(
    screenWidth/2.0 - rl.CoreD.MeasureTextEx(font2, msg2, font2.baseSize, -2.0).x/2.0,
    screenHeight/2.0 - font2.baseSize/2.0 - 10.0
  );

  final Vector2D fontPosition3 = .vec2(
    screenWidth/2.0 - rl.CoreD.MeasureTextEx(font3, msg3, font3.baseSize, 2.0).x/2.0,
    screenHeight/2.0 - font3.baseSize/2.0 + 50.0
  );

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawTextEx(font1, msg1, fontPosition1, font1.baseSize, -3, .WHITE);
      rl.CoreD.DrawTextEx(font2, msg2, fontPosition2, font2.baseSize, -2, .WHITE);
      rl.CoreD.DrawTextEx(font3, msg3, fontPosition3, font3.baseSize, 2, .WHITE);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadFont(font1);
  rl.CoreD.UnloadFont(font2);
  rl.CoreD.UnloadFont(font3);

  rl.CloseWindowAndDispose();
}