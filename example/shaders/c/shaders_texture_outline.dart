// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_outline.c
// Run it: dart run shaders_texture_outline.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_texture_outline".toC);
  SetTargetFPS(60);

  final texture = LoadTexture("../resources/fudesumi.png".toC);

  final shdrOutline = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/outline.fs".toC,
  );

  double outlineSize = 2.0;
  final outlineColor = [ 1.0, 0.0, 0.0, 1.0 ];
  final textureSize = [ texture.width, texture.height ];

  int outlineSizeLoc = GetShaderLocation(shdrOutline, "outlineSize".toC);
  int outlineColorLoc = GetShaderLocation(shdrOutline, "outlineColor".toC);
  int textureSizeLoc = GetShaderLocation(shdrOutline, "textureSize".toC);

  void updateShaderOutlineSize() {
    SetShaderValue(shdrOutline, outlineSizeLoc,
      Float32$.Value(outlineSize).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
  } updateShaderOutlineSize();

  SetShaderValue(shdrOutline, outlineColorLoc,
    Float32$.Array(outlineColor).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value,
  );

  SetShaderValue(shdrOutline, textureSizeLoc,
    Float32$.Array(textureSize).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
  );

  while (!WindowShouldClose())
  {
    outlineSize += GetMouseWheelMove();
    if (outlineSize < 1.0) outlineSize = 1.0;

    updateShaderOutlineSize();

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginShaderMode(shdrOutline);

        DrawTexture(texture,
          (GetScreenWidth()/2 - texture.width/2).toInt(),
          -30,
          WHITE
        );

      EndShaderMode();

      DrawText(
        "Shader-based\ntexture\noutline".toC,
        10, 10, 20, GRAY
      );
      DrawText(
        "Scroll mouse wheel to\nchange outline size".toC,
        10, 72, 20, GRAY
      );
      DrawText(
        "Outline size: $outlineSize px".toC,
        10, 120, 20, MAROON
      );

      DrawFPS(710, 10);

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadShader(shdrOutline);
  
  CloseWindowAndDispose();
}