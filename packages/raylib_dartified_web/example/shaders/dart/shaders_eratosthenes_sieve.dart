// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_eratosthenes_sieve.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const String GLSL_VERSION = '300es';
const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shaders_eratosthenes_sieve");
  SetTargetFPS(60);

  final target = LoadRenderTexture(screenWidth, screenHeight);

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/eratosthenes.fs",
  );

  rl.setMainLoop(() {
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
  });
});