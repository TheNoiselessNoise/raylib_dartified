// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_random_sequence.c
// Run it: dart run core_random_sequence.dart
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

final class ColorRect extends Struct {
  external ColorC color;
  external RectangleC rect;
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_random_sequence".toC);
  SetTargetFPS(60);

  int rectCount = 20;
  double rectSize = screenWidth/rectCount;
  var rectangles = GenerateRandomColorRectSequence(rectCount.toDouble(), rectSize, screenWidth.toDouble(), 0.75*screenHeight);

  while (!WindowShouldClose()) {
    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) ShuffleColorRectSequence(rectangles, rectCount);

    if (IsKeyPressed(KeyboardKey.KEY_UP.value))
    {
      rectCount++;
      rectSize = screenWidth/rectCount;
      calloc.free(rectangles);
      rectangles = GenerateRandomColorRectSequence(rectCount.toDouble(), rectSize, screenWidth.toDouble(), 0.75*screenHeight);
    }

    if (IsKeyPressed(KeyboardKey.KEY_DOWN.value))
    {
      if (rectCount >= 4)
      {
        rectCount--;
        rectSize = screenWidth/rectCount;
        calloc.free(rectangles);
        rectangles = GenerateRandomColorRectSequence(rectCount.toDouble(), rectSize, screenWidth.toDouble(), 0.75*screenHeight);
      }
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      for (int i = 0; i < rectCount; i++)
      {
        DrawRectangleRec(rectangles[i].rect, rectangles[i].color);

        DrawText("Press SPACE to shuffle the current sequence".toC, 10, screenHeight - 96, 20, BLACK);
        DrawText("Press UP to add a rectangle and generate a new sequence".toC, 10, screenHeight - 64, 20, BLACK);
        DrawText("Press DOWN to remove a rectangle and generate a new sequence".toC, 10, screenHeight - 32, 20, BLACK);
      }

      DrawText("Count: $rectCount rectangles".toC, 10, 10, 20, MAROON);

      DrawFPS(screenWidth - 80, 10);

    EndDrawing();
  }

  calloc.free(rectangles);

  CloseWindowAndDispose();
}

void GenerateRandomColor(ColorC dest)
{
  dest.r = GetRandomValue(0, 255);
  dest.g = GetRandomValue(0, 255);
  dest.b = GetRandomValue(0, 255);
  dest.a = 255;
}

Pointer<ColorRect> GenerateRandomColorRectSequence(double rectCount, double rectWidth, double screenWidth, double screenHeight)
{
  final rectangles = calloc<ColorRect>(rectCount.toInt());

  final seq = LoadRandomSequence(rectCount.toInt(), 0, (rectCount - 1).toInt());
  final rectSeqWidth = rectCount*rectWidth;
  final startX = (screenWidth - rectSeqWidth)*0.5;

  for (int i = 0; i < rectCount; i++)
  {
    int rectHeight = Remap(seq[i], 0, rectCount - 1, 0, screenHeight).toInt();

    GenerateRandomColor(rectangles[i].color);
    rectangles[i].rect.set(startX + i*rectWidth, screenHeight - rectHeight, rectWidth, rectHeight);
  }

  UnloadRandomSequence(seq);

  return rectangles;
}

void ShuffleColorRectSequence(Pointer<ColorRect> rectangles, int rectCount)
{
  final seq = LoadRandomSequence(rectCount, 0, rectCount - 1);

  for (int i1 = 0; i1 < rectCount; i1++)
  {
    final r1 = rectangles[i1];
    final r2 = rectangles[seq[i1]];

    final tmpR = r1.color.r, tmpG = r1.color.g, tmpB = r1.color.b, tmpA = r1.color.a;
    r1.color.r = r2.color.r; r1.color.g = r2.color.g; r1.color.b = r2.color.b; r1.color.a = r2.color.a;
    r2.color.r = tmpR; r2.color.g = tmpG; r2.color.b = tmpB; r2.color.a = tmpA;

    final tmpHeight = r1.rect.height;
    r1.rect.height = r2.rect.height;
    r2.rect.height = tmpHeight;

    final tmpY = r1.rect.y;
    r1.rect.y = r2.rect.y;
    r2.rect.y = tmpY;
  }

  UnloadRandomSequence(seq);
}
