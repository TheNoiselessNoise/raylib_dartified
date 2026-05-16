// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_font_spritefont.c
// Run it: dart run text_font_spritefont.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "text_font_spritefont".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  String msg1 = "THIS IS A custom SPRITE FONT...";
  String msg2 = "...and this is ANOTHER CUSTOM font...";
  String msg3 = "...and a THIRD one! GREAT! :D";

  final font1 = rl.Core.LoadFont("../resources/custom_mecha.png".toC);
  final font2 = rl.Core.LoadFont("../resources/custom_alagard.png".toC);
  final font3 = rl.Core.LoadFont("../resources/custom_jupiter_crash.png".toC);

  final fontPosition1 = rl.Temp.vec21(
    screenWidth/2.0 - rl.Core.MeasureTextEx(font1, msg1.toC, font1.baseSize.toDouble(), -3).x/2,
    screenHeight/2.0 - font1.baseSize/2.0 - 80.0
  );

  final fontPosition2 = rl.Temp.vec22(
    screenWidth/2.0 - rl.Core.MeasureTextEx(font2, msg2.toC, font2.baseSize.toDouble(), -2.0).x/2.0,
    screenHeight/2.0 - font2.baseSize/2.0 - 10.0
  );

  final fontPosition3 = rl.Temp.vec23(
    screenWidth/2.0 - rl.Core.MeasureTextEx(font3, msg3.toC, font3.baseSize.toDouble(), 2.0).x/2.0,
    screenHeight/2.0 - font3.baseSize/2.0 + 50.0
  );

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawTextEx(font1, msg1.toC, fontPosition1, font1.baseSize.toDouble(), -3, rl.Color.WHITE);
      rl.Core.DrawTextEx(font2, msg2.toC, fontPosition2, font2.baseSize.toDouble(), -2, rl.Color.WHITE);
      rl.Core.DrawTextEx(font3, msg3.toC, fontPosition3, font3.baseSize.toDouble(), 2, rl.Color.WHITE);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadFont(font1);
  rl.Core.UnloadFont(font2);
  rl.Core.UnloadFont(font3);

  rl.CloseWindowAndDispose();
}