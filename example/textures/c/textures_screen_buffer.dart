// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_screen_buffer.c
// Run it: dart run textures_screen_buffer.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int MAX_COLORS = 256;
const int SCALE_FACTOR = 2;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_screen_buffer".toC);
  SetTargetFPS(60);

  int imageWidth = screenWidth~/SCALE_FACTOR;
  int imageHeight = screenHeight~/SCALE_FACTOR;
  int flameWidth = screenWidth~/SCALE_FACTOR;

  final palette = Color$.val.At('palette', MAX_COLORS);
  final indexBuffer = UnsignedChar$.val.At('indexBuffer', imageWidth*imageWidth);
  final flameRootBuffer = UnsignedChar$.val.At('flameRootBuffer', flameWidth);

  final screenImage = Image$.val.At('screenImage');
  screenImage.ref = GenImageColor(imageWidth, imageHeight, BLACK);
  
  final screenTexture = LoadTextureFromImage(screenImage.ref);

  for (int i = 0; i < MAX_COLORS; i++)
  {
    final t = i/(MAX_COLORS - 1);
    final hue = t*t;
    final saturation = t;
    final value = t;

    palette[i] = ColorFromHSV(250.0 + 150.0*hue, saturation, value);
  }

  while (!WindowShouldClose())
  {
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

    UpdateTexture(screenTexture, screenImage.ref.data);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTextureEx(screenTexture, Vector2$.val.$zero, 0.0, 2.0, WHITE);

    EndDrawing();
  }

  UnloadTexture(screenTexture);
  UnloadImage(screenImage.ref);

  CloseWindowAndDispose();
}