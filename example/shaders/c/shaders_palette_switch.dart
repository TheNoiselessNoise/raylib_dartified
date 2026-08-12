// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_palette_switch.c
// Run it: dart run shaders_palette_switch.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

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
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_palette_switch".toC);
  SetTargetFPS(60);

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/palette_switch.fs".toC,
  );

  int paletteLoc = GetShaderLocation(shader, "palette".toC);

  int currentPalette = 0;
  int lineHeight = screenHeight~/COLORS_PER_PALETTE;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) currentPalette++;
    else if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) currentPalette--;

    if (currentPalette >= palettes.length) currentPalette = 0;
    else if (currentPalette < 0) currentPalette = palettes.length - 1;

    SetShaderValueV(
      shader,
      paletteLoc,
      Int$.val.Array(palettes.values.elementAt(currentPalette)).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_IVEC3.value,
      COLORS_PER_PALETTE
    );

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginShaderMode(shader);

        for (int i = 0; i < COLORS_PER_PALETTE; i++)
        {
          DrawRectangle(0, lineHeight*i, GetScreenWidth(), lineHeight, Color$.val.$1.set(i, i, i, 255));
        }

      EndShaderMode();

      DrawText("< >".toC, 10, 10, 30, DARKBLUE);
      DrawText("CURRENT PALETTE:".toC, 60, 15, 20, RAYWHITE);
      DrawText(palettes.keys.elementAt(currentPalette).toC, 300, 15, 20, RED);

      DrawFPS(700, 15);

    EndDrawing();
  }

  UnloadShader(shader);
  
  CloseWindowAndDispose();
}