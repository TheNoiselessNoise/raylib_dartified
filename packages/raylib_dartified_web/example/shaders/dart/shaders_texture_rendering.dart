// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_rendering.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const String GLSL_VERSION = '300es';
const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shaders_texture_rendering");
  SetTargetFPS(60);

  final imBlank = GenImageColor(1024, 1024, .BLANK);
  final texture = LoadTextureFromImage(imBlank);
  UnloadImage(imBlank);

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/cubes_panning.fs",
  );

  double time = 0.0;

  void updateShaderTime() {
    SetShaderValue(shader,
      GetShaderLocation(shader, "uTime"),
      [time],
      .SHADER_UNIFORM_FLOAT,
    );
  } updateShaderTime();

  rl.setMainLoop(() {
    time = GetTime();
    updateShaderTime();

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginShaderMode(shader);
        DrawTexture(texture, 0, 0, .WHITE);
      EndShaderMode();

      DrawText(
        "BACKGROUND is PAINTED and ANIMATED on SHADER!",
        10, 10, 20, .MAROON
      );

    EndDrawing();
  });
});