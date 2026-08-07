// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_generation.c
// Run it: dart run textures_image_generation.dart
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_image_generation".toC);
  SetTargetFPS(60);

  final verticalGradient = GenImageGradientLinear(screenWidth, screenHeight, 0, RED, BLUE);
  final horizontalGradient = GenImageGradientLinear(screenWidth, screenHeight, 90, RED, BLUE);
  final diagonalGradient = GenImageGradientLinear(screenWidth, screenHeight, 45, RED, BLUE);
  final radialGradient = GenImageGradientRadial(screenWidth, screenHeight, 0.0, WHITE, BLACK);
  final squareGradient = GenImageGradientSquare(screenWidth, screenHeight, 0.0, WHITE, BLACK);
  final checked = GenImageChecked(screenWidth, screenHeight, 32, 32, RED, BLUE);
  final whiteNoise = GenImageWhiteNoise(screenWidth, screenHeight, 0.5);
  final perlinNoise = GenImagePerlinNoise(screenWidth, screenHeight, 50, 50, 4.0);
  final cellular = GenImageCellular(screenWidth, screenHeight, 32);

  final textures = <TextureC>[
    LoadTextureFromImage(verticalGradient),
    LoadTextureFromImage(horizontalGradient),
    LoadTextureFromImage(diagonalGradient),
    LoadTextureFromImage(radialGradient),
    LoadTextureFromImage(squareGradient),
    LoadTextureFromImage(checked),
    LoadTextureFromImage(whiteNoise),
    LoadTextureFromImage(perlinNoise),
    LoadTextureFromImage(cellular),
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
      IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value) ||
      IsKeyPressed(KeyboardKey.KEY_RIGHT.value)
    ) {
      currentTexture = (currentTexture + 1)%textures.length;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTexture(textures[currentTexture], 0, 0, WHITE);

      DrawRectangle(30, 400, 325, 30, Fade(SKYBLUE, 0.5));
      DrawRectangleLines(30, 400, 325, 30, Fade(WHITE, 0.5));
      DrawText(
        "MOUSE LEFT BUTTON to CYCLE PROCEDURAL TEXTURES".toC,
        40, 410, 10, WHITE
      );

      switch(currentTexture)
      {
        case 0: DrawText("VERTICAL GRADIENT".toC, 20, 10, 20, RAYWHITE); break;
        case 1: DrawText("HORIZONTAL GRADIENT".toC, 20, 10, 20, RAYWHITE); break;
        case 2: DrawText("DIAGONAL GRADIENT".toC, 20, 10, 20, RAYWHITE); break;
        case 3: DrawText("RADIAL GRADIENT".toC, 20, 10, 20, LIGHTGRAY); break;
        case 4: DrawText("SQUARE GRADIENT".toC, 20, 10, 20, LIGHTGRAY); break;
        case 5: DrawText("CHECKED".toC, 20, 10, 20, RAYWHITE); break;
        case 6: DrawText("WHITE NOISE".toC, 20, 10, 20, RED); break;
        case 7: DrawText("PERLIN NOISE".toC, 20, 10, 20, RED); break;
        case 8: DrawText("CELLULAR".toC, 20, 10, 20, RAYWHITE); break;
        default: break;
      }

    EndDrawing();
  }

  textures.forEach(UnloadTexture);

  CloseWindowAndDispose();
}