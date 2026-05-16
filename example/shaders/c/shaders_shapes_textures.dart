// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_shapes_textures.c
// Run it: dart run shaders_shapes_textures.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_shapes_textures".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final fudesumi = rl.Core.LoadTexture("../resources/fudesumi.png".toC);

  final shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/grayscale.fs".toC,
  );

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawText(
        "USING DEFAULT SHADER".toC,
        20, 40, 10, rl.Color.RED
      );

      rl.Core.DrawCircle(80, 120, 35, rl.Color.DARKBLUE);
      rl.Core.DrawCircleGradient(80, 220, 60, rl.Color.GREEN, rl.Color.SKYBLUE);
      rl.Core.DrawCircleLines(80, 340, 80, rl.Color.DARKBLUE);

      rl.Core.BeginShaderMode(shader);

        rl.Core.DrawText(
          "USING CUSTOM SHADER".toC,
          190, 40, 10, rl.Color.RED
        );

        rl.Core.DrawRectangle(250 - 60, 90, 120, 60, rl.Color.RED);
        rl.Core.DrawRectangleGradientH(250 - 90, 170, 180, 130, rl.Color.MAROON, rl.Color.GOLD);
        rl.Core.DrawRectangleLines(250 - 40, 320, 80, 60, rl.Color.ORANGE);

      rl.Core.EndShaderMode();

      rl.Core.DrawText(
        "USING DEFAULT SHADER".toC,
        370, 40, 10, rl.Color.RED
      );

      rl.Core.DrawTriangle(
        rl.Temp.vec21(430, 80),
        rl.Temp.vec22(430 - 60, 150),
        rl.Temp.vec23(430 + 60, 150),
        rl.Color.VIOLET
      );

      rl.Core.DrawTriangleLines(
        rl.Temp.vec21(430, 160),
        rl.Temp.vec22(430 - 20, 230),
        rl.Temp.vec23(430 + 20, 230),
        rl.Color.DARKBLUE
      );

      rl.Core.DrawPoly(rl.Temp.vec21(430, 320), 6, 80, 0, rl.Color.BROWN);

      rl.Core.BeginShaderMode(shader);

        rl.Core.DrawTexture(fudesumi, 500, -30, rl.Color.WHITE);

      rl.Core.EndShaderMode();

      rl.Core.DrawText(
        "(c) Fudesumi sprite by Eiden Marsal".toC,
        380, screenHeight - 20, 10, rl.Color.GRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);
  rl.Core.UnloadTexture(fudesumi);

  rl.CloseWindowAndDispose();
}