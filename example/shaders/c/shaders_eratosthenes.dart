// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_eratosthenes.c
// Run it: dart run shaders_eratosthenes.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_eratosthenes".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final target = rl.Core.LoadRenderTexture(screenWidth, screenHeight);

  final shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/eratosthenes.fs".toC,
  );

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginTextureMode(target);
      rl.Core.ClearBackground(rl.Color.BLACK);

      rl.Core.DrawRectangle(
        0, 0,
        rl.Core.GetScreenWidth(), rl.Core.GetScreenHeight(),
        rl.Color.BLACK
      );
    rl.Core.EndTextureMode();

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginShaderMode(shader);
        rl.Core.DrawTextureRec(
          target.texture,
          rl.Temp.rect1(
            0, 0,
            target.texture.width, -target.texture.height
          ),
          rl.Temp.vec2Zero,
          rl.Color.WHITE
        );
      rl.Core.EndShaderMode();

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);
  rl.Core.UnloadRenderTexture(target);
  
  rl.CloseWindowAndDispose();
}