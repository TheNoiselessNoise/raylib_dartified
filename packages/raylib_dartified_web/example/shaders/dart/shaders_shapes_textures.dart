// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_shapes_textures.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const String GLSL_VERSION = '300es';
const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shaders_shapes_textures");
  SetTargetFPS(60);

  final fudesumi = LoadTexture("../resources/fudesumi.png");

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/grayscale.fs",
  );

  rl.setMainLoop(() {
    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText(
        "USING DEFAULT SHADER",
        20, 40, 10, .RED
      );

      DrawCircle(80, 120, 35, .DARKBLUE);
      DrawCircleGradient(.vec2(80, 220), 60, .GREEN, .SKYBLUE);
      DrawCircleLines(80, 340, 80, .DARKBLUE);

      BeginShaderMode(shader);

        DrawText(
          "USING CUSTOM SHADER",
          190, 40, 10, .RED
        );

        DrawRectangle(250 - 60, 90, 120, 60, .RED);
        DrawRectangleGradientH(250 - 90, 170, 180, 130, .MAROON, .GOLD);
        DrawRectangleLines(250 - 40, 320, 80, 60, .ORANGE);

      EndShaderMode();

      DrawText(
        "USING DEFAULT SHADER",
        370, 40, 10, .RED
      );

      DrawTriangle(
        .vec2(430, 80),
        .vec2(430 - 60, 150),
        .vec2(430 + 60, 150),
        .VIOLET
      );

      DrawTriangleLines(
        .vec2(430, 160),
        .vec2(430 - 20, 230),
        .vec2(430 + 20, 230),
        .DARKBLUE
      );

      DrawPoly(.vec2(430, 320), 6, 80, 0, .BROWN);

      BeginShaderMode(shader);

        DrawTexture(fudesumi, 500, -30, .WHITE);

      EndShaderMode();

      DrawText(
        "(c) Fudesumi sprite by Eiden Marsal",
        380, screenHeight - 20, 10, .GRAY
      );

    EndDrawing();
  });
});