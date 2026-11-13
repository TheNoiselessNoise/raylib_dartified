// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_multi_sample2d.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const String GLSL_VERSION = '300es';
const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shaders_multi_sample2d");
  SetTargetFPS(60);

  final imRed = GenImageColor(800, 450, .color(255, 0, 0, 255));
  final texRed = LoadTextureFromImage(imRed);
  UnloadImage(imRed);

  final imBlue = GenImageColor(800, 450, .color(0, 0, 255, 255));
  final texBlue = LoadTextureFromImage(imBlue);
  UnloadImage(imBlue);

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/color_mix.fs",
  );

  int texBlueLoc = GetShaderLocation(shader, "texture1");
  int dividerLoc = GetShaderLocation(shader, "divider");

  double dividerValue = 0.5;

  rl.setMainLoop(() {
    if (IsKeyDown(.KEY_RIGHT)) dividerValue += 0.01;
    else if (IsKeyDown(.KEY_LEFT)) dividerValue -= 0.01;

    if (dividerValue < 0.0) dividerValue = 0.0;
    else if (dividerValue > 1.0) dividerValue = 1.0;

    SetShaderValue(shader, dividerLoc,
      [dividerValue],
      .SHADER_UNIFORM_FLOAT,
    );

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginShaderMode(shader);

        SetShaderValueTexture(shader, texBlueLoc, texBlue);

        DrawTexture(texRed, 0, 0, .WHITE);

      EndShaderMode();

      DrawText(
        "Use KEY_LEFT/KEY_RIGHT to move texture mixing in shader!",
        80, GetScreenHeight() - 40, 20, .RAYWHITE
      );

    EndDrawing();
  });
});