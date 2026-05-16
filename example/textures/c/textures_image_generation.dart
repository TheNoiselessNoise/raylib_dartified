// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_generation.c
// Run it: dart run textures_image_generation.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_image_generation".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final verticalGradient = rl.Core.GenImageGradientLinear(screenWidth, screenHeight, 0, rl.Color.RED, rl.Color.BLUE);
  final horizontalGradient = rl.Core.GenImageGradientLinear(screenWidth, screenHeight, 90, rl.Color.RED, rl.Color.BLUE);
  final diagonalGradient = rl.Core.GenImageGradientLinear(screenWidth, screenHeight, 45, rl.Color.RED, rl.Color.BLUE);
  final radialGradient = rl.Core.GenImageGradientRadial(screenWidth, screenHeight, 0.0, rl.Color.WHITE, rl.Color.BLACK);
  final squareGradient = rl.Core.GenImageGradientSquare(screenWidth, screenHeight, 0.0, rl.Color.WHITE, rl.Color.BLACK);
  final checked = rl.Core.GenImageChecked(screenWidth, screenHeight, 32, 32, rl.Color.RED, rl.Color.BLUE);
  final whiteNoise = rl.Core.GenImageWhiteNoise(screenWidth, screenHeight, 0.5);
  final perlinNoise = rl.Core.GenImagePerlinNoise(screenWidth, screenHeight, 50, 50, 4.0);
  final cellular = rl.Core.GenImageCellular(screenWidth, screenHeight, 32);

  final textures = <TextureC>[
    rl.Core.LoadTextureFromImage(verticalGradient),
    rl.Core.LoadTextureFromImage(horizontalGradient),
    rl.Core.LoadTextureFromImage(diagonalGradient),
    rl.Core.LoadTextureFromImage(radialGradient),
    rl.Core.LoadTextureFromImage(squareGradient),
    rl.Core.LoadTextureFromImage(checked),
    rl.Core.LoadTextureFromImage(whiteNoise),
    rl.Core.LoadTextureFromImage(perlinNoise),
    rl.Core.LoadTextureFromImage(cellular),
  ];

  rl.Core.UnloadImage(verticalGradient);
  rl.Core.UnloadImage(horizontalGradient);
  rl.Core.UnloadImage(diagonalGradient);
  rl.Core.UnloadImage(radialGradient);
  rl.Core.UnloadImage(squareGradient);
  rl.Core.UnloadImage(checked);
  rl.Core.UnloadImage(whiteNoise);
  rl.Core.UnloadImage(perlinNoise);
  rl.Core.UnloadImage(cellular);

  int currentTexture = 0;

  while (!rl.Core.WindowShouldClose())
  {
    if (
      rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value) ||
      rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)
    ) {
      currentTexture = (currentTexture + 1)%textures.length;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawTexture(textures[currentTexture], 0, 0, rl.Color.WHITE);

      rl.Core.DrawRectangle(30, 400, 325, 30, rl.Core.Fade(rl.Color.SKYBLUE, 0.5));
      rl.Core.DrawRectangleLines(30, 400, 325, 30, rl.Core.Fade(rl.Color.WHITE, 0.5));
      rl.Core.DrawText(
        "MOUSE LEFT BUTTON to CYCLE PROCEDURAL TEXTURES".toC,
        40, 410, 10, rl.Color.WHITE
      );

      switch(currentTexture)
      {
        case 0: rl.Core.DrawText("VERTICAL GRADIENT".toC, 20, 10, 20, rl.Color.RAYWHITE); break;
        case 1: rl.Core.DrawText("HORIZONTAL GRADIENT".toC, 20, 10, 20, rl.Color.RAYWHITE); break;
        case 2: rl.Core.DrawText("DIAGONAL GRADIENT".toC, 20, 10, 20, rl.Color.RAYWHITE); break;
        case 3: rl.Core.DrawText("RADIAL GRADIENT".toC, 20, 10, 20, rl.Color.LIGHTGRAY); break;
        case 4: rl.Core.DrawText("SQUARE GRADIENT".toC, 20, 10, 20, rl.Color.LIGHTGRAY); break;
        case 5: rl.Core.DrawText("CHECKED".toC, 20, 10, 20, rl.Color.RAYWHITE); break;
        case 6: rl.Core.DrawText("WHITE NOISE".toC, 20, 10, 20, rl.Color.RED); break;
        case 7: rl.Core.DrawText("PERLIN NOISE".toC, 20, 10, 20, rl.Color.RED); break;
        case 8: rl.Core.DrawText("CELLULAR".toC, 20, 10, 20, rl.Color.RAYWHITE); break;
        default: break;
      }

    rl.Core.EndDrawing();
  }

  textures.forEach(rl.Core.UnloadTexture);

  rl.CloseWindowAndDispose();
}