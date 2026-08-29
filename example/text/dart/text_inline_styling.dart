// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_inline_styling.c
// Run it: dart run text_inline_styling.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_inline_styling");
  SetTargetFPS(60);

  final font = GetFontDefault();
  Vector2D textSize = .zero();
  final ColorD colRandom = .RED;
  int frameCounter = 0; 

  while (!WindowShouldClose())
  {
    frameCounter++;

    if ((frameCounter%20) == 0)
    {
      colRandom.r = GetRandomValue(0, 255);
      colRandom.g = GetRandomValue(0, 255);
      colRandom.b = GetRandomValue(0, 255);
      colRandom.a = 255;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTextStyled(font,
        "This changes the [cFF0000F]foreground color[r] of provided text!!!",
        .vec2(100, 80), 20.0, 2.0, .BLACK
      );

      DrawTextStyled(font,
        "This changes the [bFF00FFF]background color[r] of provided text!!!",
        .vec2(100, 120), 20.0, 2.0, .BLACK
      );

      DrawTextStyled(font,
        "This changes the [c00f00f][bff0000f]foreground and background colors[r]!!!",
        .vec2(100, 160), 20.0, 2.0, .BLACK
      );

      DrawTextStyled(font,
        "This changes the [c00f00f]alpha[r] relative [cffffffff][b000000f]from source[r] [cff000088]color[r]!!!",
        .vec2(100, 200), 20.0, 2.0, .color(0, 0, 0, 100)
      );

      final text = "Let's be [c${colRandom.toHex()}]CREATIVE[r] !!!";
      DrawTextStyled(font,
        text,
        .vec2(100, 240), 40.0, 2.0, .BLACK
      );

      textSize = MeasureTextStyled(font, text, 40.0, 2.0);
      DrawRectangleLines(100, 240, textSize.x, textSize.y, .GREEN);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void DrawTextStyled(FontD font, String text, Vector2D position, double fontSize, double spacing, ColorD color)
{
  if (font.texture.id == 0) font = GetFontDefault();

  final codepoints = text.runes.toList();
  int textLen = codepoints.length;

  ColorD colFront = color;
  ColorD colBack = .BLANK;
  int backRecPadding = 4;

  double textOffsetY = 0.0;
  double textOffsetX = 0.0;
  double textLineSpacing = 0.0;
  double scaleFactor = fontSize/font.baseSize;

  for (int i = 0; i < textLen;)
  {
    int codepoint = codepoints[i];

    if (codepoint == '\n'.ch)
    {
      textOffsetY += (fontSize + textLineSpacing);
      textOffsetX = 0.0;
    }
    else
    {
      if (codepoint == '['.ch)
      {
        if (((i + 2) < textLen) && (codepoints[i + 1] == 'r'.ch) && (codepoints[i + 2] == ']'.ch))
        {
          colFront = color;
          colBack = .BLANK;

          i += 3;
          continue;
        }
        else if (((i + 1) < textLen) && ((codepoints[i + 1] == 'c'.ch) || (codepoints[i + 1] == 'b'.ch)))
        {
          int tagChar = codepoints[i + 1];
          i += 2;

          int colHexCount = 0;
          final colHexBuffer = StringBuffer();

          while (((i + colHexCount) < textLen) && (codepoints[i + colHexCount] != ']'.ch))
          {
            int c = codepoints[i + colHexCount];
            if (
              ((c >= '0'.ch) && (c <= '9'.ch)) ||
              ((c >= 'A'.ch) && (c <= 'F'.ch)) ||
              ((c >= 'a'.ch) && (c <= 'f'.ch))
            ) {
              colHexBuffer.writeCharCode(c);
              colHexCount++;
            }
            else break;
          }

          int colHexValue = int.parse(colHexBuffer.toString(), radix: 16);
          if (tagChar == 'c'.ch)
          {
            colFront = GetColor(colHexValue);
          }
          else if (tagChar == 'b'.ch)
          {
            colBack = GetColor(colHexValue);
          }

          i += (colHexCount + 1);
          continue;
        }
      }

      int index = GetGlyphIndex(font, codepoint);
      double increaseX = 0.0;

      if (font.glyphs[index].advanceX == 0) increaseX = font.recs[index].width*scaleFactor + spacing;
      else increaseX += font.glyphs[index].advanceX*scaleFactor + spacing;

      if (colBack.a > 0) DrawRectangleRec(
        .rect(position.x + textOffsetX, position.y + textOffsetY - backRecPadding, increaseX, fontSize + 2*backRecPadding),
        colBack
      );

      if ((codepoint != ' '.ch) && (codepoint != '\t'.ch))
      {
        DrawTextCodepoint(font, codepoint, .vec2(position.x + textOffsetX, position.y + textOffsetY), fontSize, colFront);
      }

      textOffsetX += increaseX;
    }

    i += 1;
  }
}

Vector2D MeasureTextStyled(FontD font, String text, double fontSize, double spacing)
{
  final Vector2D textSize = .zero();

  if ((font.texture.id == 0) || text.isEmpty) return textSize;

  final codepoints = text.runes.toList();
  int textLen = codepoints.length;

  double textWidth = 0.0;
  double textHeight = fontSize;
  double scaleFactor = fontSize/font.baseSize;

  int codepoint = 0;
  int index = 0;
  int validCodepointCounter = 0;

  for (int i = 0; i < textLen;)
  {
    codepoint = codepoints[i];

    if (codepoint == '['.ch)
    {
      if (((i + 2) < textLen) && (codepoints[i + 1] == 'r'.ch) && (codepoints[i + 2] == ']'.ch))
      {
        i += 3;
        continue;
      }
      else if (((i + 1) < textLen) && ((codepoints[i + 1] == 'c'.ch) || (codepoints[i + 1] == 'b'.ch)))
      {
        i += 2;

        int colHexCount = 0;
        while (((i + colHexCount) < textLen) && (codepoints[i + colHexCount] != ']'.ch))
        {
          int c = codepoints[i + colHexCount];
          if (
            ((c >= '0'.ch) && (c <= '9'.ch)) ||
            ((c >= 'A'.ch) && (c <= 'F'.ch)) ||
            ((c >= 'a'.ch) && (c <= 'f'.ch))
          ) {
            colHexCount++;
          }
          else break;
        }

        i += (colHexCount + 1);
        continue;
      }
    }
    else if (codepoint != '\n'.ch)
    {
      index = GetGlyphIndex(font, codepoint);

      if (font.glyphs[index].advanceX > 0) textWidth += font.glyphs[index].advanceX;
      else textWidth += (font.recs[index].width + font.glyphs[index].offsetX);

      validCodepointCounter++;
      i += 1;
    }
  }

  textSize.x = textWidth*scaleFactor + (validCodepointCounter - 1)*spacing;
  textSize.y = textHeight;

  return textSize;
}