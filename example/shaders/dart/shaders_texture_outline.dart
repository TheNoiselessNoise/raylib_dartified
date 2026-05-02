// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_outline.c
// Run it: dart run shaders_texture_outline.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_texture_outline");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final texture = rl.CoreD.LoadTexture("../resources/fudesumi.png");

  final shdrOutline = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/outline.fs",
  );

  double outlineSize = 2.0;
  final outlineColor = [ 1.0, 0.0, 0.0, 1.0 ];
  final textureSize = [ texture.width, texture.height ];

  int outlineSizeLoc = rl.CoreD.GetShaderLocation(shdrOutline, "outlineSize");
  int outlineColorLoc = rl.CoreD.GetShaderLocation(shdrOutline, "outlineColor");
  int textureSizeLoc = rl.CoreD.GetShaderLocation(shdrOutline, "textureSize");

  void updateShaderOutlineSize() {
    rl.CoreD.SetShaderValue(shdrOutline, outlineSizeLoc,
      [outlineSize],
      .SHADER_UNIFORM_FLOAT,
    );
  } updateShaderOutlineSize();

  rl.CoreD.SetShaderValue(shdrOutline, outlineColorLoc,
    outlineColor,
    .SHADER_UNIFORM_VEC4,
  );

  rl.CoreD.SetShaderValue(shdrOutline, textureSizeLoc,
    textureSize,
    .SHADER_UNIFORM_VEC2,
  );

  while (!rl.CoreD.WindowShouldClose())
  {
    outlineSize += rl.CoreD.GetMouseWheelMove();
    if (outlineSize < 1.0) outlineSize = 1.0;

    updateShaderOutlineSize();

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginShaderMode(shdrOutline);

        rl.CoreD.DrawTexture(texture,
          (rl.CoreD.GetScreenWidth()/2 - texture.width/2).toInt(),
          -30,
          .WHITE
        );

      rl.CoreD.EndShaderMode();

      rl.CoreD.DrawText(
        "Shader-based\ntexture\noutline",
        10, 10, 20, .GRAY
      );
      rl.CoreD.DrawText(
        "Scroll mouse wheel to\nchange outline size",
        10, 72, 20, .GRAY
      );
      rl.CoreD.DrawText(
        "Outline size: $outlineSize px",
        10, 120, 20, .MAROON
      );

      rl.CoreD.DrawFPS(710, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadShader(shdrOutline);
  
  rl.CloseWindowAndDispose();
}