// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_texture_drawing.c
// Run it: dart run shaders_texture_drawing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_texture_drawing".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final imBlank = rl.Core.GenImageColor(1024, 1024, rl.Color.BLANK);
  final texture = rl.Core.LoadTextureFromImage(imBlank);
  rl.Core.UnloadImage(imBlank);

  final shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/cubes_panning.fs".toC,
  );

  double time = 0.0;

  void updateShaderTime() {
    rl.Core.SetShaderValue(shader,
      rl.Core.GetShaderLocation(shader, "uTime".toC),
      rl.Temp.Float$.Value(time).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
  } updateShaderTime();

  while (!rl.Core.WindowShouldClose())
  {
    time = rl.Core.GetTime();
    updateShaderTime();

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginShaderMode(shader);
        rl.Core.DrawTexture(texture, 0, 0, rl.Color.WHITE);
      rl.Core.EndShaderMode();

      rl.Core.DrawText(
        "BACKGROUND is PAINTED and ANIMATED on SHADER!".toC,
        10, 10, 20, rl.Color.MAROON
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);
  rl.Core.UnloadTexture(texture);

  rl.CloseWindowAndDispose();
}