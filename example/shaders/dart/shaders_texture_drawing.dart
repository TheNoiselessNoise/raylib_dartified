// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_texture_drawing.c
// Run it: dart run shaders_texture_drawing.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_texture_drawing");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final imBlank = rl.CoreD.GenImageColor(1024, 1024, .BLANK);
  final texture = rl.CoreD.LoadTextureFromImage(imBlank);
  rl.CoreD.UnloadImage(imBlank);

  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/cubes_panning.fs",
  );

  double time = 0.0;

  void updateShaderTime() {
    rl.CoreD.SetShaderValue(shader,
      rl.CoreD.GetShaderLocation(shader, "uTime"),
      [time],
      .SHADER_UNIFORM_FLOAT,
    );
  } updateShaderTime();

  while (!rl.CoreD.WindowShouldClose())
  {
    time = rl.CoreD.GetTime();
    updateShaderTime();

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginShaderMode(shader);
        rl.CoreD.DrawTexture(texture, 0, 0, .WHITE);
      rl.CoreD.EndShaderMode();

      rl.CoreD.DrawText(
        "BACKGROUND is PAINTED and ANIMATED on SHADER!",
        10, 10, 20, .MAROON
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  rl.CoreD.UnloadTexture(texture);

  rl.CloseWindowAndDispose();
}