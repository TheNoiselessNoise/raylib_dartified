// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_eratosthenes.c
// Run it: dart run shaders_eratosthenes.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_eratosthenes");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final target = rl.CoreD.LoadRenderTexture(screenWidth, screenHeight);

  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/eratosthenes.fs",
  );

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.BeginTextureMode(target);
      rl.CoreD.ClearBackground(.BLACK);

      rl.CoreD.DrawRectangle(
        0, 0,
        rl.CoreD.GetScreenWidth(), rl.CoreD.GetScreenHeight(),
        .BLACK
      );
    rl.CoreD.EndTextureMode();

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginShaderMode(shader);
        rl.CoreD.DrawTextureRec(
          target.texture,
          .rect(
            0, 0,
            target.texture.width, -target.texture.height
          ),
          .zero(),
          .WHITE
        );
      rl.CoreD.EndShaderMode();

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  rl.CoreD.UnloadRenderTexture(target);
  
  rl.CloseWindowAndDispose();
}