// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_shapes_textures.c
// Run it: dart run shaders_shapes_textures.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_shapes_textures");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final fudesumi = rl.CoreD.LoadTexture("../resources/fudesumi.png");

  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/grayscale.fs",
  );

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText(
        "USING DEFAULT SHADER",
        20, 40, 10, .RED
      );

      rl.CoreD.DrawCircle(80, 120, 35, .DARKBLUE);
      rl.CoreD.DrawCircleGradient(80, 220, 60, .GREEN, .SKYBLUE);
      rl.CoreD.DrawCircleLines(80, 340, 80, .DARKBLUE);

      rl.CoreD.BeginShaderMode(shader);

        rl.CoreD.DrawText(
          "USING CUSTOM SHADER",
          190, 40, 10, .RED
        );

        rl.CoreD.DrawRectangle(250 - 60, 90, 120, 60, .RED);
        rl.CoreD.DrawRectangleGradientH(250 - 90, 170, 180, 130, .MAROON, .GOLD);
        rl.CoreD.DrawRectangleLines(250 - 40, 320, 80, 60, .ORANGE);

      rl.CoreD.EndShaderMode();

      rl.CoreD.DrawText(
        "USING DEFAULT SHADER",
        370, 40, 10, .RED
      );

      rl.CoreD.DrawTriangle(
        .vec2(430, 80),
        .vec2(430 - 60, 150),
        .vec2(430 + 60, 150),
        .VIOLET
      );

      rl.CoreD.DrawTriangleLines(
        .vec2(430, 160),
        .vec2(430 - 20, 230),
        .vec2(430 + 20, 230),
        .DARKBLUE
      );

      rl.CoreD.DrawPoly(.vec2(430, 320), 6, 80, 0, .BROWN);

      rl.CoreD.BeginShaderMode(shader);

        rl.CoreD.DrawTexture(fudesumi, 500, -30, .WHITE);

      rl.CoreD.EndShaderMode();

      rl.CoreD.DrawText(
        "(c) Fudesumi sprite by Eiden Marsal",
        380, screenHeight - 20, 10, .GRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  rl.CoreD.UnloadTexture(fudesumi);

  rl.CloseWindowAndDispose();
}