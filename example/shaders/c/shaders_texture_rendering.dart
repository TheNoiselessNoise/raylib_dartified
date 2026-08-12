// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_rendering.c
// Run it: dart run shaders_texture_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_texture_rendering".toC);
  SetTargetFPS(60);

  final imBlank = GenImageColor(1024, 1024, BLANK);
  final texture = LoadTextureFromImage(imBlank);
  UnloadImage(imBlank);

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/cubes_panning.fs".toC,
  );

  double time = 0.0;

  void updateShaderTime() {
    SetShaderValue(shader,
      GetShaderLocation(shader, "uTime".toC),
      Float32$.val.Value(time).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
  } updateShaderTime();

  while (!WindowShouldClose())
  {
    time = GetTime();
    updateShaderTime();

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginShaderMode(shader);
        DrawTexture(texture, 0, 0, WHITE);
      EndShaderMode();

      DrawText(
        "BACKGROUND is PAINTED and ANIMATED on SHADER!".toC,
        10, 10, 20, MAROON
      );

    EndDrawing();
  }

  UnloadShader(shader);
  UnloadTexture(texture);

  CloseWindowAndDispose();
}