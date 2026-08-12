// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_words_alignment.c
// Run it: dart run text_words_alignment.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

enum TextAlignmentV {
  TEXT_ALIGN_TOP,
  TEXT_ALIGN_MIDDLE,
  TEXT_ALIGN_BOTTOM;

  TextAlignmentV get prev => switch (this) {
    TEXT_ALIGN_BOTTOM => TEXT_ALIGN_MIDDLE,
    TEXT_ALIGN_MIDDLE => TEXT_ALIGN_TOP,
    TEXT_ALIGN_TOP => TEXT_ALIGN_BOTTOM,
  };

  TextAlignmentV get next => switch (this) {
    TEXT_ALIGN_TOP => TEXT_ALIGN_MIDDLE,
    TEXT_ALIGN_MIDDLE => TEXT_ALIGN_BOTTOM,
    TEXT_ALIGN_BOTTOM => TEXT_ALIGN_TOP,
  };
}

enum TextAlignmentH {
  TEXT_ALIGN_LEFT,
  TEXT_ALIGN_CENTRE,
  TEXT_ALIGN_RIGHT;

  TextAlignmentH get prev => switch (this) {
    TEXT_ALIGN_RIGHT => TEXT_ALIGN_CENTRE,
    TEXT_ALIGN_CENTRE => TEXT_ALIGN_LEFT,
    TEXT_ALIGN_LEFT => TEXT_ALIGN_RIGHT,
  };

  TextAlignmentH get next => switch (this) {
    TEXT_ALIGN_LEFT => TEXT_ALIGN_CENTRE,
    TEXT_ALIGN_CENTRE => TEXT_ALIGN_RIGHT,
    TEXT_ALIGN_RIGHT => TEXT_ALIGN_LEFT,
  };
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_words_alignment".toC);
  SetTargetFPS(60);

  final textContainerRect = Rectangle$.val.At('textContainerRect').set(
    screenWidth/2-screenWidth/4,
    screenHeight/2-screenHeight/3,
    screenWidth/2,
    screenHeight*2/3
  );

  int wordIndex = 0;
  final wordCount = Int$.val.At('wordCount');
  final words = TextSplit("raylib is a simple and easy-to-use library to enjoy videogames programming".toC, ' '.ch, wordCount);

  int fontSize = 40;

  final font = GetFontDefault();

  TextAlignmentH hAlign = .TEXT_ALIGN_CENTRE;
  TextAlignmentV vAlign = .TEXT_ALIGN_MIDDLE;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) hAlign = hAlign.prev;
    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) hAlign = hAlign.next;
    if (IsKeyPressed(KeyboardKey.KEY_UP.value)) vAlign = vAlign.prev;
    if (IsKeyPressed(KeyboardKey.KEY_DOWN.value)) vAlign = vAlign.next;

    if (wordCount.value > 0) wordIndex = (GetTime()%wordCount.value).toInt();
    else wordIndex = 0;

    BeginDrawing();

      ClearBackground(DARKBLUE);

      DrawText("Use Arrow Keys to change the text alignment".toC, 20, 20, 18, LIGHTGRAY);
      DrawText("Alignment: Horizontal = ${hAlign.name}, Vertical = ${vAlign.name}".toC, 20, 40, 18, LIGHTGRAY);

      DrawRectangleRec(textContainerRect.ref, BLUE);

      final textSize = MeasureTextEx(font, words[wordIndex], fontSize.toDouble(), fontSize*.1);

      DrawTextEx(
        font,
        words[wordIndex],
        Vector2$.val.$1.set(
          textContainerRect.ref.x + Lerp(0.0, textContainerRect.ref.width  - textSize.x, hAlign.index*0.5),
          textContainerRect.ref.y + Lerp(0.0, textContainerRect.ref.height - textSize.y, vAlign.index*0.5)
        ),
        fontSize.toDouble(),
        fontSize*.1,
        RAYWHITE
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}
