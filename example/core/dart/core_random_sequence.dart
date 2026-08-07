// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_random_sequence.c
// Run it: dart run core_random_sequence.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

class ColorRect {
  ColorD color = .zero();
  RectangleD rect = .zero();
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_random_sequence");
  SetTargetFPS(60);

  int rectCount = 20;
  double rectSize = screenWidth/rectCount;
  var rectangles = GenerateRandomColorRectSequence(rectCount, rectSize, screenWidth, 0.75*screenHeight);

  while (!WindowShouldClose()) {
    if (IsKeyPressed(.KEY_SPACE)) ShuffleColorRectSequence(rectangles);

    if (IsKeyPressed(.KEY_UP))
    {
      rectCount++;
      rectSize = screenWidth/rectCount;
      rectangles = GenerateRandomColorRectSequence(rectCount, rectSize, screenWidth, 0.75*screenHeight);
    }

    if (IsKeyPressed(.KEY_DOWN))
    {
      if (rectCount >= 4)
      {
        rectCount--;
        rectSize = screenWidth/rectCount;
        rectangles = GenerateRandomColorRectSequence(rectCount, rectSize, screenWidth, 0.75*screenHeight);
      }
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      for (int i = 0; i < rectCount; i++)
      {
        DrawRectangleRec(rectangles[i].rect, rectangles[i].color);

        DrawText("Press SPACE to shuffle the current sequence", 10, screenHeight - 96, 20, BLACK);
        DrawText("Press UP to add a rectangle and generate a new sequence", 10, screenHeight - 64, 20, BLACK);
        DrawText("Press DOWN to remove a rectangle and generate a new sequence", 10, screenHeight - 32, 20, BLACK);
      }

      DrawText("Count: $rectCount rectangles", 10, 10, 20, MAROON);

      DrawFPS(screenWidth - 80, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

ColorD GenerateRandomColor() => .color(
  GetRandomValue(0, 255),
  GetRandomValue(0, 255),
  GetRandomValue(0, 255),
  255,
);

List<ColorRect> GenerateRandomColorRectSequence(num rectCount, num rectWidth, num screenWidth, num screenHeight)
{
  final List<ColorRect> rectangles = .generate(rectCount.toInt(), (_) => .new());

  final seq = LoadRandomSequence(rectCount, 0, rectCount - 1);
  final rectSeqWidth = rectCount*rectWidth;
  final startX = (screenWidth - rectSeqWidth)*0.5;

  for (int i = 0; i < rectCount; i++)
  {
    int rectHeight = Remap(seq[i], 0, rectCount - 1, 0, screenHeight).toInt();

    rectangles[i].color = GenerateRandomColor();
    rectangles[i].rect = .rect(startX + i*rectWidth, screenHeight - rectHeight, rectWidth, rectHeight);
  }

  return rectangles;
}

void ShuffleColorRectSequence(List<ColorRect> rectangles)
{
  final seq = LoadRandomSequence(rectangles.length, 0, rectangles.length - 1);

  for (int i1 = 0; i1 < rectangles.length; i1++)
  {
    final r1 = rectangles[i1];
    final r2 = rectangles[seq[i1]];

    final tmpColor = r1.color.copy();
    r1.color = r2.color.copy();
    r2.color = tmpColor;

    final tmpHeight = r1.rect.height;
    r1.rect.height = r2.rect.height;
    r2.rect.height = tmpHeight;

    final tmpY = r1.rect.y;
    r1.rect.y = r2.rect.y;
    r2.rect.y = tmpY;
  }
}
