// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_generation.c
// Run it: dart run textures_image_generation.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

class TexInfo {
  final String name;
  final TextureD tex;
  final ColorD textColor;

  TexInfo(this.name, this.tex, this.textColor);
}

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_image_generation");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final verticalGradient = rl.CoreD.GenImageGradientLinear(screenWidth, screenHeight, 0, .RED, .BLUE);
  final horizontalGradient = rl.CoreD.GenImageGradientLinear(screenWidth, screenHeight, 90, .RED, .BLUE);
  final diagonalGradient = rl.CoreD.GenImageGradientLinear(screenWidth, screenHeight, 45, .RED, .BLUE);
  final radialGradient = rl.CoreD.GenImageGradientRadial(screenWidth, screenHeight, 0.0, .WHITE, .BLACK);
  final squareGradient = rl.CoreD.GenImageGradientSquare(screenWidth, screenHeight, 0.0, .WHITE, .BLACK);
  final checked = rl.CoreD.GenImageChecked(screenWidth, screenHeight, 32, 32, .RED, .BLUE);
  final whiteNoise = rl.CoreD.GenImageWhiteNoise(screenWidth, screenHeight, 0.5);
  final perlinNoise = rl.CoreD.GenImagePerlinNoise(screenWidth, screenHeight, 50, 50, 4.0);
  final cellular = rl.CoreD.GenImageCellular(screenWidth, screenHeight, 32);

  final textures = <TexInfo>[
    TexInfo("VERTICAL GRADIENT", rl.CoreD.LoadTextureFromImage(verticalGradient), .RAYWHITE),
    TexInfo("HORIZONTAL GRADIENT", rl.CoreD.LoadTextureFromImage(horizontalGradient), .RAYWHITE),
    TexInfo("DIAGONAL GRADIENT", rl.CoreD.LoadTextureFromImage(diagonalGradient), .RAYWHITE),
    TexInfo("RADIAL GRADIENT", rl.CoreD.LoadTextureFromImage(radialGradient), .LIGHTGRAY),
    TexInfo("SQUARE GRADIENT", rl.CoreD.LoadTextureFromImage(squareGradient), .LIGHTGRAY),
    TexInfo("CHECKED", rl.CoreD.LoadTextureFromImage(checked), .RAYWHITE),
    TexInfo("WHITE NOISE", rl.CoreD.LoadTextureFromImage(whiteNoise), .RED),
    TexInfo("PERLIN NOISE", rl.CoreD.LoadTextureFromImage(perlinNoise), .RED),
    TexInfo("CELLULAR", rl.CoreD.LoadTextureFromImage(cellular), .RAYWHITE),
  ];

  rl.CoreD.UnloadImage(verticalGradient);
  rl.CoreD.UnloadImage(horizontalGradient);
  rl.CoreD.UnloadImage(diagonalGradient);
  rl.CoreD.UnloadImage(radialGradient);
  rl.CoreD.UnloadImage(squareGradient);
  rl.CoreD.UnloadImage(checked);
  rl.CoreD.UnloadImage(whiteNoise);
  rl.CoreD.UnloadImage(perlinNoise);
  rl.CoreD.UnloadImage(cellular);

  int currentTexture = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (
      rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT) ||
      rl.CoreD.IsKeyPressed(.KEY_RIGHT)
    ) {
      currentTexture = (currentTexture + 1)%textures.length;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      final texInfo = textures[currentTexture];

      rl.CoreD.DrawTexture(texInfo.tex, 0, 0, .WHITE);

      rl.CoreD.DrawRectangle(30, 400, 325, 30, rl.CoreD.Fade(.SKYBLUE, 0.5));
      rl.CoreD.DrawRectangleLines(30, 400, 325, 30, rl.CoreD.Fade(.WHITE, 0.5));
      rl.CoreD.DrawText(
        "MOUSE LEFT BUTTON to CYCLE PROCEDURAL TEXTURES",
        40, 410, 10, .WHITE
      );

      rl.CoreD.DrawText(texInfo.name, 20, 10, 20, texInfo.textColor);

    rl.CoreD.EndDrawing();
  }

  textures.forEach((info) => rl.CoreD.UnloadTexture(info.tex));

  rl.CloseWindowAndDispose();
}