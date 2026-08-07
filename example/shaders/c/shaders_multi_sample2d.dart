// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_multi_sample2d.c
// Run it: dart run shaders_multi_sample2d.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_multi_sample2d".toC);
  SetTargetFPS(60);

  final imRed = GenImageColor(800, 450, Color$.$1.set(255, 0, 0, 255));
  final texRed = LoadTextureFromImage(imRed);
  UnloadImage(imRed);

  final imBlue = GenImageColor(800, 450, Color$.$1.set(0, 0, 255, 255));
  final texBlue = LoadTextureFromImage(imBlue);
  UnloadImage(imBlue);

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/color_mix.fs".toC,
  );

  int texBlueLoc = GetShaderLocation(shader, "texture1".toC);
  int dividerLoc = GetShaderLocation(shader, "divider".toC);

  double dividerValue = 0.5;

  while (!WindowShouldClose())
  {
    if (IsKeyDown(KeyboardKey.KEY_RIGHT.value)) dividerValue += 0.01;
    else if (IsKeyDown(KeyboardKey.KEY_LEFT.value)) dividerValue -= 0.01;

    if (dividerValue < 0.0) dividerValue = 0.0;
    else if (dividerValue > 1.0) dividerValue = 1.0;

    SetShaderValue(shader, dividerLoc,
      Float32$.Value(dividerValue).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginShaderMode(shader);

        SetShaderValueTexture(shader, texBlueLoc, texBlue);

        DrawTexture(texRed, 0, 0, WHITE);

      EndShaderMode();

      DrawText(
        "Use KEY_LEFT/KEY_RIGHT to move texture mixing in shader!".toC,
        80, GetScreenHeight() - 40, 20, RAYWHITE
      );

    EndDrawing();
  }

  UnloadShader(shader);
  UnloadTexture(texRed);
  UnloadTexture(texBlue);
  
  CloseWindowAndDispose();
}