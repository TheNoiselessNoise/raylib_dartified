// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_palette_switch.c
// Run it: dart run shaders_palette_switch.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int COLORS_PER_PALETTE = 8;

const palettes = <String, List<int>>{
  "3-BIT RGB": [
    0, 0, 0,
    255, 0, 0,
    0, 255, 0,
    0, 0, 255,
    0, 255, 255,
    255, 0, 255,
    255, 255, 0,
    255, 255, 255,
  ],
  "AMMO-8 (GameBoy-like)": [
    4, 12, 6,
    17, 35, 24,
    30, 58, 41,
    48, 93, 66,
    77, 128, 97,
    137, 162, 87,
    190, 220, 127,
    238, 255, 204,
  ],
  "RKBV (2-strip film)": [
    21, 25, 26,
    138, 76, 88,
    217, 98, 117,
    230, 184, 193,
    69, 107, 115,
    75, 151, 166,
    165, 189, 194,
    255, 245, 247,
  ]
};

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_palette_switch".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/palette_switch.fs".toC,
  );

  int paletteLoc = rl.Core.GetShaderLocation(shader, "palette".toC);

  int currentPalette = 0;
  int lineHeight = screenHeight~/COLORS_PER_PALETTE;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) currentPalette++;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value)) currentPalette--;

    if (currentPalette >= palettes.length) currentPalette = 0;
    else if (currentPalette < 0) currentPalette = palettes.length - 1;

    rl.Core.SetShaderValueV(
      shader,
      paletteLoc,
      rl.Temp.Int$.Array(palettes.values.elementAt(currentPalette)).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_IVEC3.value,
      COLORS_PER_PALETTE
    );

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.BeginShaderMode(shader);

        for (int i = 0; i < COLORS_PER_PALETTE; i++)
        {
          rl.Core.DrawRectangle(0, lineHeight*i, rl.Core.GetScreenWidth(), lineHeight, rl.Temp.color1(i, i, i, 255));
        }

      rl.Core.EndShaderMode();

      rl.Core.DrawText("< >".toC, 10, 10, 30, rl.C.DARKBLUE);
      rl.Core.DrawText("CURRENT PALETTE:".toC, 60, 15, 20, rl.C.RAYWHITE);
      rl.Core.DrawText(palettes.keys.elementAt(currentPalette).toC, 300, 15, 20, rl.C.RED);

      rl.Core.DrawFPS(700, 15);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);
  
  rl.CloseWindowAndDispose();
}