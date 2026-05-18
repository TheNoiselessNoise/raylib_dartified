// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_rectangle_bounds.c
// Run it: dart run text_rectangle_bounds.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "text_rectangle_bounds".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  String text =
    "Text cannot escape\tthis container\t...word wrap also works when active so here's "
    "a long text for testing.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod "
    "tempor incididunt ut labore et dolore magna aliqua. Nec ullamcorper sit amet risus nullam eget felis eget.";

  bool resizing = false;
  bool wordWrap = true;

  final container = rl.Temp.Rectangle$.At('container').set(
    25.0, 25.0,
    screenWidth - 50.0, screenHeight - 250.0
  );
  final resizer = rl.Temp.Rectangle$.At('resizer').set(
    container.ref.x + container.ref.width - 17, container.ref.y + container.ref.height - 17,
    14, 14
  );

  final minWidth = 60;
  final minHeight = 60;
  final maxWidth = screenWidth - 50.0;
  final maxHeight = screenHeight - 160.0;

  final lastMouse = rl.Temp.Vector2$.At('lastMouse');
  ColorC borderColor = rl.Color.MAROON;
  final font = rl.Core.GetFontDefault();

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value))
      wordWrap = !wordWrap;

    final mouse = rl.Core.GetMousePosition();

    if (rl.Core.CheckCollisionPointRec(mouse, container.ref))
      borderColor = rl.Core.Fade(rl.Color.MAROON, 0.4);
    else if (!resizing)
      borderColor = rl.Color.MAROON;

    if (resizing)
    {
      if (rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value))
        resizing = false;

      final width = container.ref.width + (mouse.x - lastMouse.ref.x);
      container.ref.width = ((width > minWidth)? ((width < maxWidth)? width : maxWidth) : minWidth).toDouble();

      final height = container.ref.height + (mouse.y - lastMouse.ref.y);
      container.ref.height = ((height > minHeight)? ((height < maxHeight)? height : maxHeight) : minHeight).toDouble();
    }
    else
    {
      if (
        rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) &&
        rl.Core.CheckCollisionPointRec(mouse, resizer.ref)
      ) resizing = true;
    }

    resizer.ref.x = container.ref.x + container.ref.width - 17;
    resizer.ref.y = container.ref.y + container.ref.height - 17;

    lastMouse.setC(mouse);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawRectangleLinesEx(container.ref, 3, borderColor);

      final rect = rl.Temp.Rectangle$.At('rect');

      rect.set(
        container.ref.x + 4, container.ref.y + 4,
        container.ref.width - 4, container.ref.height - 4
      );
      DrawTextBoxed(rl, font, text, rect.ref, 20.0, 2.0, wordWrap, rl.Color.GRAY);

      rl.Core.DrawRectangleRec(resizer.ref, borderColor);

      rl.Core.DrawRectangle(0, screenHeight - 54, screenWidth, 54, rl.Color.GRAY);

      rl.Core.DrawRectangleRec(
        rect.set(382.0, screenHeight - 34.0, 12.0, 12.0).ref,
        rl.Color.MAROON
      );

      rl.Core.DrawText(
        "Word Wrap: ".toC,
        313, screenHeight-115, 20, rl.Color.BLACK
      );
      
      rl.Core.DrawText(
        (wordWrap ? "ON" : "OFF").toC,
        447, screenHeight - 115, 20, rl.Color.RED
      );

      rl.Core.DrawText(
        "Press [SPACE] to toggle word wrap".toC,
        218, screenHeight - 86, 20, rl.Color.GRAY
      );

      rl.Core.DrawText(
        "Click hold & drag the    to resize the container".toC,
        155, screenHeight - 38, 20, rl.Color.RAYWHITE
      );

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}

void DrawTextBoxed(
  Raylib rl,
  FontC font,
  String text,
  RectangleC rec,
  double fontSize,
  double spacing,
  bool wordWrap,
  ColorC tint,
) => DrawTextBoxedSelectable(
  rl, font, text, rec, fontSize, spacing,
  wordWrap, tint, 0, 0, rl.Color.WHITE, rl.Color.WHITE
);

enum State { MEASURE_STATE, DRAW_STATE }
State nextState(State current) => switch (current) {
  .DRAW_STATE => .MEASURE_STATE,
  .MEASURE_STATE => .DRAW_STATE,
};

void DrawTextBoxedSelectable(
  Raylib rl,
  FontC font,
  String text,
  RectangleC rec,
  double fontSize,
  double spacing,
  bool wordWrap,
  ColorC tint,
  int selectStart,
  int selectLength,
  ColorC selectTint,
  ColorC selectBackTint,
) {
  double textOffsetY = 0;
  double textOffsetX = 0.0;

  double scaleFactor = fontSize/font.baseSize;

  State state = wordWrap ? .MEASURE_STATE : .DRAW_STATE;

  int startLine = -1;
  int endLine = -1;
  int lastk = -1;

  for (int i = 0, k = 0; i < text.length; i++, k++)
  {
    final codepointByteCount = rl.Temp.Int$.At('codepointByteCount');
    int codepoint = rl.Core.GetCodepoint(text[i].toC, codepointByteCount);
    int index = rl.Core.GetGlyphIndex(font, codepoint);

    if (codepoint == 0x3f) codepointByteCount.value = 1;
    i += codepointByteCount.value - 1;

    double glyphWidth = 0;
    if (codepoint != '\n'.ch)
    {
      glyphWidth = font.glyphs[index].advanceX == 0 ?
        font.recs[index].width*scaleFactor :
        font.glyphs[index].advanceX*scaleFactor;

      if (i + 1 < text.length) glyphWidth = glyphWidth + spacing;
    }

    if (state == .MEASURE_STATE)
    {
      if (
        (codepoint == ' '.ch) ||
        (codepoint == '\t'.ch) ||
        (codepoint == '\n'.ch)
      ) endLine = i;

      if ((textOffsetX + glyphWidth) > rec.width)
      {
        endLine = (endLine < 1)? i : endLine;
        if (i == endLine)
          endLine -= codepointByteCount.value;
        if ((startLine + codepointByteCount.value) == endLine)
          endLine = i - codepointByteCount.value;

        state = nextState(state);
      }
      else if ((i + 1) == text.length)
      {
        endLine = i;
        state = nextState(state);
      }
      else if (codepoint == '\n'.ch) state = nextState(state);

      if (state == .DRAW_STATE)
      {
        textOffsetX = 0;
        i = startLine;
        glyphWidth = 0;

        int tmp = lastk;
        lastk = k - 1;
        k = tmp;
      }
    }
    else
    {
      if (codepoint == '\n'.ch)
      {
        if (!wordWrap)
        {
          textOffsetY += (font.baseSize + font.baseSize/2)*scaleFactor;
          textOffsetX = 0;
        }
      }
      else
      {
        if (!wordWrap && ((textOffsetX + glyphWidth) > rec.width))
        {
          textOffsetY += (font.baseSize + font.baseSize/2)*scaleFactor;
          textOffsetX = 0;
        }

        if ((textOffsetY + font.baseSize*scaleFactor) > rec.height) break;

        bool isGlyphSelected = false;
        if ((selectStart >= 0) && (k >= selectStart) && (k < (selectStart + selectLength)))
        {
          rl.Core.DrawRectangleRec(
            rl.Temp.rect1(
              rec.x + textOffsetX - 1, rec.y + textOffsetY,
              glyphWidth, font.baseSize*scaleFactor,
            ),
            selectBackTint
          );
          isGlyphSelected = true;
        }

        if ((codepoint != ' '.ch) && (codepoint != '\t'.ch))
        {
          rl.Core.DrawTextCodepoint(
            font,
            codepoint,
            rl.Temp.vec21(rec.x + textOffsetX, rec.y + textOffsetY),
            fontSize,
            isGlyphSelected ? selectTint : tint
          );
        }
      }

      if (wordWrap && (i == endLine))
      {
        textOffsetY += (font.baseSize + font.baseSize/2)*scaleFactor;
        textOffsetX = 0;
        startLine = endLine;
        endLine = -1;
        glyphWidth = 0;
        selectStart += lastk - k;
        k = lastk;

        state = nextState(state);
      }
    }

    if ((textOffsetX != 0) || (codepoint != ' '.ch))
      textOffsetX += glyphWidth;
  }
}
