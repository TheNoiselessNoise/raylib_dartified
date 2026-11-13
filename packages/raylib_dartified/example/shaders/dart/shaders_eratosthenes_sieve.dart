// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_eratosthenes_sieve.c
// Run it: dart run shaders_eratosthenes_sieve.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_eratosthenes_sieve");
  SetTargetFPS(60);

  final target = LoadRenderTexture(screenWidth, screenHeight);

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/eratosthenes.fs",
  );

  while (!WindowShouldClose())
  {
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
  }

  UnloadShader(shader);
  UnloadRenderTexture(target);
  
  CloseWindowAndDispose();
}