// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_rectangle_bounds.c
// Run it: dart run text_rectangle_bounds.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "text_rectangle_bounds");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  String text =
    "Text cannot escape\tthis container\t...word wrap also works when active so here's "
    "a long text for testing.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod "
    "tempor incididunt ut labore et dolore magna aliqua. Nec ullamcorper sit amet risus nullam eget felis eget.";

  bool resizing = false;
  bool wordWrap = true;

  final RectangleD container = .rect(
    25.0, 25.0,
    screenWidth - 50.0, screenHeight - 250.0
  );
  final RectangleD resizer = .rect(
    container.x + container.width - 17, container.y + container.height - 17,
    14, 14
  );

  final minWidth = 60;
  final minHeight = 60;
  final maxWidth = screenWidth - 50.0;
  final maxHeight = screenHeight - 160.0;

  Vector2D lastMouse = .zero();
  ColorD borderColor = .MAROON;
  final font = rl.CoreD.GetFontDefault();

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyPressed(.KEY_SPACE))
      wordWrap = !wordWrap;

    final mouse = rl.CoreD.GetMousePosition();

    if (rl.CoreD.CheckCollisionPointRec(mouse, container))
      borderColor = rl.CoreD.Fade(.MAROON, 0.4);
    else if (!resizing)
      borderColor = .MAROON;

    if (resizing)
    {
      if (rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_LEFT))
        resizing = false;

      final width = container.width + (mouse.x - lastMouse.x);
      container.width = ((width > minWidth)? ((width < maxWidth)? width : maxWidth) : minWidth).toDouble();

      final height = container.height + (mouse.y - lastMouse.y);
      container.height = ((height > minHeight)? ((height < maxHeight)? height : maxHeight) : minHeight).toDouble();
    }
    else
    {
      if (
        rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT) &&
        rl.CoreD.CheckCollisionPointRec(mouse, resizer)
      ) resizing = true;
    }

    resizer.x = container.x + container.width - 17;
    resizer.y = container.y + container.height - 17;

    lastMouse = mouse;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawRectangleLinesEx(container, 3, borderColor);

      DrawTextBoxed(
        rl,
        font,
        text,
        .rect(
          container.x + 4, container.y + 4,
          container.width - 4, container.height - 4
        ),
        20.0,
        2.0,
        wordWrap,
        .GRAY
      );

      rl.CoreD.DrawRectangleRec(resizer, borderColor);

      rl.CoreD.DrawRectangle(0, screenHeight - 54, screenWidth, 54, .GRAY);

      rl.CoreD.DrawRectangleRec(
        .rect(382.0, screenHeight - 34.0, 12.0, 12.0),
        .MAROON
      );

      rl.CoreD.DrawText(
        "Word Wrap: ",
        313, screenHeight-115, 20, .BLACK
      );
      
      rl.CoreD.DrawText(
        wordWrap ? "ON" : "OFF",
        447, screenHeight - 115, 20, .RED
      );

      rl.CoreD.DrawText(
        "Press [SPACE] to toggle word wrap",
        218, screenHeight - 86, 20, .GRAY
      );

      rl.CoreD.DrawText(
        "Click hold & drag the    to resize the container",
        155, screenHeight - 38, 20, .RAYWHITE
      );

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}

void DrawTextBoxed(
  Raylib rl,
  FontD font,
  String text,
  RectangleD rec,
  double fontSize,
  double spacing,
  bool wordWrap,
  ColorD tint,
) => DrawTextBoxedSelectable(
  rl, font, text, rec, fontSize, spacing,
  wordWrap, tint, 0, 0, .WHITE, .WHITE
);

enum State { MEASURE_STATE, DRAW_STATE }
State nextState(State current) => switch (current) {
  .DRAW_STATE => .MEASURE_STATE,
  .MEASURE_STATE => .DRAW_STATE,
};

void DrawTextBoxedSelectable(
  Raylib rl,
  FontD font,
  String text,
  RectangleD rec,
  double fontSize,
  double spacing,
  bool wordWrap,
  ColorD tint,
  int selectStart,
  int selectLength,
  ColorD selectTint,
  ColorD selectBackTint,
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
    var (codepoint, codepointSize) = rl.CoreD.GetCodepoint(text[i]);
    int index = rl.CoreD.GetGlyphIndex(font, codepoint);

    if (codepoint == 0x3f) codepointSize = 1;
    i += codepointSize - 1;

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
          endLine -= codepointSize;
        if ((startLine + codepointSize) == endLine)
          endLine = i - codepointSize;

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
          rl.CoreD.DrawRectangleRec(
            .rect(
              rec.x + textOffsetX - 1, rec.y + textOffsetY,
              glyphWidth, font.baseSize*scaleFactor,
            ),
            selectBackTint
          );
          isGlyphSelected = true;
        }

        if ((codepoint != ' '.ch) && (codepoint != '\t'.ch))
        {
          rl.CoreD.DrawTextCodepoint(
            font,
            codepoint,
            .vec2(rec.x + textOffsetX, rec.y + textOffsetY),
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
