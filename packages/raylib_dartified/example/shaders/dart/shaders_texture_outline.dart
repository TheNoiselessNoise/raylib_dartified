// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_outline.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Texture texture;
late Shader shdrOutline;
double outlineSize = 2.0;
final outlineColor = [ 1.0, 0.0, 0.0, 1.0 ];
final textureSize = [ texture.width, texture.height ];
late int outlineSizeLoc;
late int outlineColorLoc;
late int textureSizeLoc;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shaders_texture_outline");
    SetTargetFPS(60);

    texture = LoadTexture("../resources/fudesumi.png");

    shdrOutline = LoadShader(
      null,
      "../resources/shaders/glsl${Raylib.glslVersion}/outline.fs",
    );

    outlineSizeLoc = GetShaderLocation(shdrOutline, "outlineSize");
    outlineColorLoc = GetShaderLocation(shdrOutline, "outlineColor");
    textureSizeLoc = GetShaderLocation(shdrOutline, "textureSize");

    SetShaderValue(shdrOutline, outlineSizeLoc, [outlineSize], .SHADER_UNIFORM_FLOAT);
    SetShaderValue(shdrOutline, outlineColorLoc, outlineColor, .SHADER_UNIFORM_VEC4);
    SetShaderValue(shdrOutline, textureSizeLoc, textureSize, .SHADER_UNIFORM_VEC2);
  },
  loop: (_) async {
    outlineSize += GetMouseWheelMove();
    if (outlineSize < 1.0) outlineSize = 1.0;

    SetShaderValue(shdrOutline, outlineSizeLoc, [outlineSize], .SHADER_UNIFORM_FLOAT);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginShaderMode(shdrOutline);

        DrawTexture(texture,
          (GetScreenWidth()/2 - texture.width/2).toInt(),
          -30,
          .WHITE
        );

      EndShaderMode();

      DrawText(
        "Shader-based\ntexture\noutline",
        10, 10, 20, .GRAY
      );
      DrawText(
        "Scroll mouse wheel to\nchange outline size",
        10, 72, 20, .GRAY
      );
      DrawText(
        "Outline size: $outlineSize px",
        10, 120, 20, .MAROON
      );

      DrawFPS(710, 10);

    EndDrawing();
  },
  close: (_) {
    UnloadTexture(texture);
    UnloadShader(shdrOutline);
    CloseWindow();
  },
);