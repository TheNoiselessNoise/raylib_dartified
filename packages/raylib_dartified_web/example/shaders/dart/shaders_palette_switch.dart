// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_palette_switch.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const String GLSL_VERSION = '300es';
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

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shaders_palette_switch");
  SetTargetFPS(60);

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/palette_switch.fs",
  );

  int paletteLoc = GetShaderLocation(shader, "palette");

  int currentPalette = 0;
  int lineHeight = screenHeight~/COLORS_PER_PALETTE;

  rl.setMainLoop(() {
    if (IsKeyPressed(.KEY_RIGHT)) currentPalette++;
    else if (IsKeyPressed(.KEY_LEFT)) currentPalette--;

    if (currentPalette >= palettes.length) currentPalette = 0;
    else if (currentPalette < 0) currentPalette = palettes.length - 1;

    SetShaderValueV(
      shader,
      paletteLoc,
      palettes.values.elementAt(currentPalette),
      .SHADER_UNIFORM_IVEC3,
      COLORS_PER_PALETTE,
    );

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginShaderMode(shader);

        for (int i = 0; i < COLORS_PER_PALETTE; i++)
        {
          DrawRectangle(0, lineHeight*i, GetScreenWidth(), lineHeight, .color(i, i, i, 255));
        }

      EndShaderMode();

      DrawText("< >", 10, 10, 30, .DARKBLUE);
      DrawText("CURRENT PALETTE:", 60, 15, 20, .RAYWHITE);
      DrawText(palettes.keys.elementAt(currentPalette), 300, 15, 20, .RED);

      DrawFPS(700, 15);

    EndDrawing();
  });
});