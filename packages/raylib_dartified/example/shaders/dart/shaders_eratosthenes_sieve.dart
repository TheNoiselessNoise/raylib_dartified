// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_eratosthenes_sieve.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late RenderTexture target;
late Shader shader;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shaders_eratosthenes_sieve");
    SetTargetFPS(60);

    target = LoadRenderTexture(screenWidth, screenHeight);

    shader = LoadShader(
      null,
      "../resources/shaders/glsl${Raylib.glslVersion}/eratosthenes.fs",
    );
  },
  loop: (_) async {
    BeginTextureMode(target);
      ClearBackground(.BLACK);

      DrawRectangle(
        0, 0,
        GetScreenWidth(), GetScreenHeight(),
        .BLACK
      );
    EndTextureMode();

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginShaderMode(shader);
        DrawTextureRec(
          target.texture,
          .rect(
            0, 0,
            target.texture.width, -target.texture.height
          ),
          .zero(),
          .WHITE
        );
      EndShaderMode();

    EndDrawing();
  },
  close: (_) {
    UnloadShader(shader);
    UnloadRenderTexture(target);
    CloseWindow();
  },
);