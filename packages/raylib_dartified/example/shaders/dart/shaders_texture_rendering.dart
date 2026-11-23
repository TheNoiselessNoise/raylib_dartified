// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_rendering.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Texture texture;
late Shader shader;
double time = 0.0;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shaders_texture_rendering");
    SetTargetFPS(60);

    final imBlank = GenImageColor(1024, 1024, .BLANK);
    texture = LoadTextureFromImage(imBlank);
    UnloadImage(imBlank);

    shader = LoadShader(
      null,
      "../resources/shaders/glsl${Raylib.glslVersion}/cubes_panning.fs",
    );

    SetShaderValue(shader, GetShaderLocation(shader, "uTime"), [time], .SHADER_UNIFORM_FLOAT);
  },
  loop: (_) async {
    time = GetTime();

    SetShaderValue(shader, GetShaderLocation(shader, "uTime"), [time], .SHADER_UNIFORM_FLOAT);

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
  },
  close: (_) {
    UnloadShader(shader);
    UnloadTexture(texture);
    CloseWindow();
  },
);