// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_screen_buffer.c
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_COLORS = 256;
const int SCALE_FACTOR = 2;

int imageWidth = screenWidth~/SCALE_FACTOR;
int imageHeight = screenHeight~/SCALE_FACTOR;
int flameWidth = screenWidth~/SCALE_FACTOR;
late List<Color> palette;
late List<int> indexBuffer;
late List<int> flameRootBuffer;
late Image screenImage;
late Texture screenTexture;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "textures_screen_buffer");
    SetTargetFPS(60);

    palette = .generate(MAX_COLORS, (_) => .zero());
    indexBuffer = .filled(imageWidth*imageWidth, 0);
    flameRootBuffer = .filled(flameWidth, 0);

    screenImage = GenImageColor(imageWidth, imageHeight, .BLACK);
    
    screenTexture = LoadTextureFromImage(screenImage);

    for (int i = 0; i < MAX_COLORS; i++)
    {
      final t = i/(MAX_COLORS - 1);
      final hue = t*t;
      final saturation = t;
      final value = t;

      palette[i] = ColorFromHSV(250.0 + 150.0*hue, saturation, value);
    }
  },
  loop: (_) async {
    for (int x = 2; x < flameWidth; x++)
    {
      int flame = flameRootBuffer[x];
      flame += GetRandomValue(0, 2);
      flameRootBuffer[x] = (flame > 255)? 255: flame;
    }

    for (int x = 0; x < flameWidth; x++)
    {
      int i = x + (imageHeight - 1)*imageWidth;
      indexBuffer[i] = flameRootBuffer[x];
    }

    for (int x = 0; x < imageWidth; x++)
    {
      if (indexBuffer[x] != 0) indexBuffer[x] = 0;
    }

    for (int y = 1; y < imageHeight; y++)
    {
      for (int x = 0; x < imageWidth; x++)
      {
        int i = x + y*imageWidth;
        int colorIndex = indexBuffer[i];

        if (colorIndex != 0)
        {
          indexBuffer[i] = 0;
          int moveX = GetRandomValue(0, 2) - 1;
          int newX = x + moveX;

          if ((newX > 0) && (newX < imageWidth))
          {
            final iabove = i - imageWidth + moveX;
            int decay = GetRandomValue(0, 3);
            colorIndex -= (decay < colorIndex)? decay : colorIndex;
            indexBuffer[iabove] = colorIndex;
          }
        }
      }
    }

    for (int y = 1; y < imageHeight; y++)
    {
      for (int x = 0; x < imageWidth; x++)
      {
        int i = x + y*imageWidth;
        int colorIndex = indexBuffer[i];
        final col = palette[colorIndex];

        ImageDrawPixel(screenImage, x, y, col);
      }
    }

    UpdateTexture(screenTexture, .fromList(screenImage.dataView));

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTextureEx(screenTexture, .zero(), 0.0, 2.0, .WHITE);

    EndDrawing();
  },
  close: (_) {
    UnloadTexture(screenTexture);
    UnloadImage(screenImage);
    CloseWindow();
  },
);