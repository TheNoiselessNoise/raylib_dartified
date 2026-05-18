// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_multi_sample2d.c
// Run it: dart run shaders_multi_sample2d.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_multi_sample2d");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final imRed = rl.CoreD.GenImageColor(800, 450, .color(255, 0, 0, 255));
  final texRed = rl.CoreD.LoadTextureFromImage(imRed);
  rl.CoreD.UnloadImage(imRed);

  final imBlue = rl.CoreD.GenImageColor(800, 450, .color(0, 0, 255, 255));
  final texBlue = rl.CoreD.LoadTextureFromImage(imBlue);
  rl.CoreD.UnloadImage(imBlue);

  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/color_mix.fs",
  );

  int texBlueLoc = rl.CoreD.GetShaderLocation(shader, "texture1");
  int dividerLoc = rl.CoreD.GetShaderLocation(shader, "divider");

  double dividerValue = 0.5;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyDown(.KEY_RIGHT)) dividerValue += 0.01;
    else if (rl.CoreD.IsKeyDown(.KEY_LEFT)) dividerValue -= 0.01;

    if (dividerValue < 0.0) dividerValue = 0.0;
    else if (dividerValue > 1.0) dividerValue = 1.0;

    rl.CoreD.SetShaderValue(shader, dividerLoc,
      [dividerValue],
      .SHADER_UNIFORM_FLOAT,
    );

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginShaderMode(shader);

        rl.CoreD.SetShaderValueTexture(shader, texBlueLoc, texBlue);

        rl.CoreD.DrawTexture(texRed, 0, 0, .WHITE);

      rl.CoreD.EndShaderMode();

      rl.CoreD.DrawText(
        "Use KEY_LEFT/KEY_RIGHT to move texture mixing in shader!",
        80, rl.CoreD.GetScreenHeight() - 40, 20, .RAYWHITE
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  rl.CoreD.UnloadTexture(texRed);
  rl.CoreD.UnloadTexture(texBlue);
  
  rl.CloseWindowAndDispose();
}