// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_outline.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const String GLSL_VERSION = '300es';
const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shaders_texture_outline");
  SetTargetFPS(60);

  final texture = LoadTexture("../resources/fudesumi.png");

  final shdrOutline = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/outline.fs",
  );

  double outlineSize = 2.0;
  final outlineColor = [ 1.0, 0.0, 0.0, 1.0 ];
  final textureSize = [ texture.width, texture.height ];

  int outlineSizeLoc = GetShaderLocation(shdrOutline, "outlineSize");
  int outlineColorLoc = GetShaderLocation(shdrOutline, "outlineColor");
  int textureSizeLoc = GetShaderLocation(shdrOutline, "texSize");

  void updateShaderOutlineSize() {
    SetShaderValue(shdrOutline, outlineSizeLoc,
      [outlineSize],
      .SHADER_UNIFORM_FLOAT,
    );
  } updateShaderOutlineSize();

  SetShaderValue(shdrOutline, outlineColorLoc,
    outlineColor,
    .SHADER_UNIFORM_VEC4,
  );

  SetShaderValue(shdrOutline, textureSizeLoc,
    textureSize,
    .SHADER_UNIFORM_VEC2,
  );

  rl.setMainLoop(() {
    outlineSize += GetMouseWheelMove();
    if (outlineSize < 1.0) outlineSize = 1.0;

    updateShaderOutlineSize();

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
  });
});