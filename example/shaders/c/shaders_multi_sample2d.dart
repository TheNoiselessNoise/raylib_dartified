// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_multi_sample2d.c
// Run it: dart run shaders_multi_sample2d.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_multi_sample2d".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final imRed = rl.Core.GenImageColor(800, 450, rl.Temp.color1(255, 0, 0, 255));
  final texRed = rl.Core.LoadTextureFromImage(imRed);
  rl.Core.UnloadImage(imRed);

  final imBlue = rl.Core.GenImageColor(800, 450, rl.Temp.color1(0, 0, 255, 255));
  final texBlue = rl.Core.LoadTextureFromImage(imBlue);
  rl.Core.UnloadImage(imBlue);

  final shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/color_mix.fs".toC,
  );

  int texBlueLoc = rl.Core.GetShaderLocation(shader, "texture1".toC);
  int dividerLoc = rl.Core.GetShaderLocation(shader, "divider".toC);

  double dividerValue = 0.5;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT.value)) dividerValue += 0.01;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT.value)) dividerValue -= 0.01;

    if (dividerValue < 0.0) dividerValue = 0.0;
    else if (dividerValue > 1.0) dividerValue = 1.0;

    rl.Core.SetShaderValue(shader, dividerLoc,
      rl.Temp.Float$.Value(dividerValue).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.BeginShaderMode(shader);

        rl.Core.SetShaderValueTexture(shader, texBlueLoc, texBlue);

        rl.Core.DrawTexture(texRed, 0, 0, rl.C.WHITE);

      rl.Core.EndShaderMode();

      rl.Core.DrawText(
        "Use KEY_LEFT/KEY_RIGHT to move texture mixing in shader!".toC,
        80, rl.Core.GetScreenHeight() - 40, 20, rl.C.RAYWHITE
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);
  rl.Core.UnloadTexture(texRed);
  rl.Core.UnloadTexture(texBlue);
  
  rl.CloseWindowAndDispose();
}