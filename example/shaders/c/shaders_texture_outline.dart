// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_outline.c
// Run it: dart run shaders_texture_outline.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_texture_outline".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final texture = rl.Core.LoadTexture("../resources/fudesumi.png".toC);

  final shdrOutline = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/outline.fs".toC,
  );

  double outlineSize = 2.0;
  final outlineColor = [ 1.0, 0.0, 0.0, 1.0 ];
  final textureSize = [ texture.width, texture.height ];

  int outlineSizeLoc = rl.Core.GetShaderLocation(shdrOutline, "outlineSize".toC);
  int outlineColorLoc = rl.Core.GetShaderLocation(shdrOutline, "outlineColor".toC);
  int textureSizeLoc = rl.Core.GetShaderLocation(shdrOutline, "textureSize".toC);

  void updateShaderOutlineSize() {
    rl.Core.SetShaderValue(shdrOutline, outlineSizeLoc,
      rl.Temp.Float$.Value(outlineSize).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
  } updateShaderOutlineSize();

  rl.Core.SetShaderValue(shdrOutline, outlineColorLoc,
    rl.Temp.Float$.Array(outlineColor).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value,
  );

  rl.Core.SetShaderValue(shdrOutline, textureSizeLoc,
    rl.Temp.Float$.Array(textureSize).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
  );

  while (!rl.Core.WindowShouldClose())
  {
    outlineSize += rl.Core.GetMouseWheelMove();
    if (outlineSize < 1.0) outlineSize = 1.0;

    updateShaderOutlineSize();

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginShaderMode(shdrOutline);

        rl.Core.DrawTexture(texture,
          (rl.Core.GetScreenWidth()/2 - texture.width/2).toInt(),
          -30,
          rl.Color.WHITE
        );

      rl.Core.EndShaderMode();

      rl.Core.DrawText(
        "Shader-based\ntexture\noutline".toC,
        10, 10, 20, rl.Color.GRAY
      );
      rl.Core.DrawText(
        "Scroll mouse wheel to\nchange outline size".toC,
        10, 72, 20, rl.Color.GRAY
      );
      rl.Core.DrawText(
        "Outline size: $outlineSize px".toC,
        10, 120, 20, rl.Color.MAROON
      );

      rl.Core.DrawFPS(710, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texture);
  rl.Core.UnloadShader(shdrOutline);
  
  rl.CloseWindowAndDispose();
}