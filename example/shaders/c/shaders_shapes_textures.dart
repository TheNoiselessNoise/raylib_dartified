// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_shapes_textures.c
// Run it: dart run shaders_shapes_textures.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_shapes_textures".toC);
  SetTargetFPS(60);

  final fudesumi = LoadTexture("../resources/fudesumi.png".toC);

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/grayscale.fs".toC,
  );

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText(
        "USING DEFAULT SHADER".toC,
        20, 40, 10, RED
      );

      DrawCircle(80, 120, 35, DARKBLUE);
      DrawCircleGradient(Vector2$.val.$1.set(80, 220), 60, GREEN, SKYBLUE);
      DrawCircleLines(80, 340, 80, DARKBLUE);

      BeginShaderMode(shader);

        DrawText(
          "USING CUSTOM SHADER".toC,
          190, 40, 10, RED
        );

        DrawRectangle(250 - 60, 90, 120, 60, RED);
        DrawRectangleGradientH(250 - 90, 170, 180, 130, MAROON, GOLD);
        DrawRectangleLines(250 - 40, 320, 80, 60, ORANGE);

      EndShaderMode();

      DrawText(
        "USING DEFAULT SHADER".toC,
        370, 40, 10, RED
      );

      DrawTriangle(
        Vector2$.val.$1.set(430, 80),
        Vector2$.val.$2.set(430 - 60, 150),
        Vector2$.val.$3.set(430 + 60, 150),
        VIOLET
      );

      DrawTriangleLines(
        Vector2$.val.$1.set(430, 160),
        Vector2$.val.$2.set(430 - 20, 230),
        Vector2$.val.$3.set(430 + 20, 230),
        DARKBLUE
      );

      DrawPoly(Vector2$.val.$1.set(430, 320), 6, 80, 0, BROWN);

      BeginShaderMode(shader);

        DrawTexture(fudesumi, 500, -30, WHITE);

      EndShaderMode();

      DrawText(
        "(c) Fudesumi sprite by Eiden Marsal".toC,
        380, screenHeight - 20, 10, GRAY
      );

    EndDrawing();
  }

  UnloadShader(shader);
  UnloadTexture(fudesumi);

  CloseWindowAndDispose();
}