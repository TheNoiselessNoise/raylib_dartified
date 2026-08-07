// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_generation.c
// Run it: dart run textures_image_generation.dart
import '../../base_dart.dart';

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
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_image_generation");
  SetTargetFPS(60);

  final verticalGradient = GenImageGradientLinear(screenWidth, screenHeight, 0, .RED, .BLUE);
  final horizontalGradient = GenImageGradientLinear(screenWidth, screenHeight, 90, .RED, .BLUE);
  final diagonalGradient = GenImageGradientLinear(screenWidth, screenHeight, 45, .RED, .BLUE);
  final radialGradient = GenImageGradientRadial(screenWidth, screenHeight, 0.0, .WHITE, .BLACK);
  final squareGradient = GenImageGradientSquare(screenWidth, screenHeight, 0.0, .WHITE, .BLACK);
  final checked = GenImageChecked(screenWidth, screenHeight, 32, 32, .RED, .BLUE);
  final whiteNoise = GenImageWhiteNoise(screenWidth, screenHeight, 0.5);
  final perlinNoise = GenImagePerlinNoise(screenWidth, screenHeight, 50, 50, 4.0);
  final cellular = GenImageCellular(screenWidth, screenHeight, 32);

  final textures = <TexInfo>[
    TexInfo("VERTICAL GRADIENT", LoadTextureFromImage(verticalGradient), .RAYWHITE),
    TexInfo("HORIZONTAL GRADIENT", LoadTextureFromImage(horizontalGradient), .RAYWHITE),
    TexInfo("DIAGONAL GRADIENT", LoadTextureFromImage(diagonalGradient), .RAYWHITE),
    TexInfo("RADIAL GRADIENT", LoadTextureFromImage(radialGradient), .LIGHTGRAY),
    TexInfo("SQUARE GRADIENT", LoadTextureFromImage(squareGradient), .LIGHTGRAY),
    TexInfo("CHECKED", LoadTextureFromImage(checked), .RAYWHITE),
    TexInfo("WHITE NOISE", LoadTextureFromImage(whiteNoise), .RED),
    TexInfo("PERLIN NOISE", LoadTextureFromImage(perlinNoise), .RED),
    TexInfo("CELLULAR", LoadTextureFromImage(cellular), .RAYWHITE),
  ];

  UnloadImage(verticalGradient);
  UnloadImage(horizontalGradient);
  UnloadImage(diagonalGradient);
  UnloadImage(radialGradient);
  UnloadImage(squareGradient);
  UnloadImage(checked);
  UnloadImage(whiteNoise);
  UnloadImage(perlinNoise);
  UnloadImage(cellular);

  int currentTexture = 0;

  while (!WindowShouldClose())
  {
    if (
      IsMouseButtonPressed(.MOUSE_BUTTON_LEFT) ||
      IsKeyPressed(.KEY_RIGHT)
    ) {
      currentTexture = (currentTexture + 1)%textures.length;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      final texInfo = textures[currentTexture];

      DrawTexture(texInfo.tex, 0, 0, .WHITE);

      DrawRectangle(30, 400, 325, 30, Fade(.SKYBLUE, 0.5));
      DrawRectangleLines(30, 400, 325, 30, Fade(.WHITE, 0.5));
      DrawText(
        "MOUSE LEFT BUTTON to CYCLE PROCEDURAL TEXTURES",
        40, 410, 10, .WHITE
      );

      DrawText(texInfo.name, 20, 10, 20, texInfo.textColor);

    EndDrawing();
  }

  textures.forEach((info) => UnloadTexture(info.tex));

  CloseWindowAndDispose();
}