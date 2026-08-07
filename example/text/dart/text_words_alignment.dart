// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_words_alignment.c
// Run it: dart run text_words_alignment.dart
import '../../base_dart.dart';

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

  InitWindow(screenWidth, screenHeight, "text_words_alignment");
  SetTargetFPS(60);

  final RectangleD textContainerRect = .rect(
    screenWidth/2-screenWidth/4,
    screenHeight/2-screenHeight/3,
    screenWidth/2,
    screenHeight*2/3
  );

  int wordIndex = 0;
  final words = TextSplit("raylib is a simple and easy-to-use library to enjoy videogames programming", ' ');

  int fontSize = 40;

  final font = GetFontDefault();

  TextAlignmentH hAlign = .TEXT_ALIGN_CENTRE;
  TextAlignmentV vAlign = .TEXT_ALIGN_MIDDLE;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(.KEY_LEFT)) hAlign = hAlign.prev;
    if (IsKeyPressed(.KEY_RIGHT)) hAlign = hAlign.next;
    if (IsKeyPressed(.KEY_UP)) vAlign = vAlign.prev;
    if (IsKeyPressed(.KEY_DOWN)) vAlign = vAlign.next;

    if (words.isNotEmpty) wordIndex = (GetTime()%words.length).toInt();
    else wordIndex = 0;

    BeginDrawing();

      ClearBackground(.DARKBLUE);

      DrawText("Use Arrow Keys to change the text alignment", 20, 20, 18, .LIGHTGRAY);
      DrawText("Alignment: Horizontal = ${hAlign.name}, Vertical = ${vAlign.name}", 20, 40, 18, .LIGHTGRAY);

      DrawRectangleRec(textContainerRect, .BLUE);

      final textSize = MeasureTextEx(font, words[wordIndex], fontSize, fontSize*.1);

      DrawTextEx(
        font,
        words[wordIndex],
        .vec2(
          textContainerRect.x + Lerp(0.0, textContainerRect.width  - textSize.x, hAlign.index*0.5),
          textContainerRect.y + Lerp(0.0, textContainerRect.height - textSize.y, vAlign.index*0.5)
        ),
        fontSize,
        fontSize*.1,
        .RAYWHITE
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}
