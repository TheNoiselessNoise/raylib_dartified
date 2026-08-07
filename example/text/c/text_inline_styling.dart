// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_inline_styling.c
// Run it: dart run text_inline_styling.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_inline_styling".toC);
  SetTargetFPS(60);

  final font = GetFontDefault();
  final textSize = Vector2$.At('textSize');
  final colRandom = RED;
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

      ClearBackground(RAYWHITE);

      DrawTextStyled(font,
        "This changes the [cFF0000F]foreground color[r] of provided text!!!".toC,
        Vector2$.$1.set(100, 80), 20.0, 2.0, BLACK
      );

      DrawTextStyled(font,
        "This changes the [bFF00FFF]background color[r] of provided text!!!".toC,
        Vector2$.$1.set(100, 120), 20.0, 2.0, BLACK
      );

      DrawTextStyled(font,
        "This changes the [c00f00f][bff0000f]foreground and background colors[r]!!!".toC,
        Vector2$.$1.set(100, 160), 20.0, 2.0, BLACK
      );

      DrawTextStyled(font,
        "This changes the [c00f00f]alpha[r] relative [cffffffff][b000000f]from source[r] [cff000088]color[r]!!!".toC,
        Vector2$.$1.set(100, 200), 20.0, 2.0, Color$.$1.set(0, 0, 0, 100)
      );

      final text = "Let's be [c${colRandom.toD().toHex()}]CREATIVE[r] !!!".toC;
      DrawTextStyled(font,
        text,
        Vector2$.$1.set(100, 240), 40.0, 2.0, BLACK
      );

      textSize.ref = MeasureTextStyled(font, text, 40.0, 2.0);
      DrawRectangleLines(100, 240, textSize.ref.x.toInt(), textSize.ref.y.toInt(), GREEN);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void DrawTextStyled(FontC font, Pointer<Char> text, Vector2C position, double fontSize, double spacing, ColorC color)
{
  if (font.texture.id == 0) font = GetFontDefault();

  int textLen = TextLength(text);

  ColorC colFront = color;
  ColorC colBack = BLANK;
  int backRecPadding = 4;

  double textOffsetY = 0.0;
  double textOffsetX = 0.0;
  double textLineSpacing = 0.0;
  double scaleFactor = fontSize/font.baseSize;

  for (int i = 0; i < textLen;)
  {
    final codepointByteCount = Int$.At('codepointByteCount');
    int codepoint = GetCodepointNext(text + i, codepointByteCount);

    if (codepoint == '\n'.ch)
    {
      textOffsetY += (fontSize + textLineSpacing);
      textOffsetX = 0.0;
    }
    else
    {
      if (codepoint == '['.ch)
      {
        if (((i + 2) < textLen) && (text[i + 1] == 'r'.ch) && (text[i + 2] == ']'.ch))
        {
          colFront = color;
          colBack = BLANK;

          i += 3;
          continue;
        }
        else if (((i + 1) < textLen) && ((text[i + 1] == 'c'.ch) || (text[i + 1] == 'b'.ch)))
        {
          i += 2;

          final colHexText = Char$.At('colHexText', 9);
          final textPtr = text + i;

          int colHexCount = 0;
          while ((textPtr != nullptr) && (textPtr[colHexCount] != 0) && (textPtr[colHexCount] != ']'.ch))
          {
            if (
              ((textPtr[colHexCount] >= '0'.ch) && (textPtr[colHexCount] <= '9'.ch)) ||
              ((textPtr[colHexCount] >= 'A'.ch) && (textPtr[colHexCount] <= 'F'.ch)) ||
              ((textPtr[colHexCount] >= 'a'.ch) && (textPtr[colHexCount] <= 'f'.ch))
            ) {
              colHexText[colHexCount] = textPtr[colHexCount];
              colHexCount++;
            }
            else break;
          }

          int colHexValue = int.parse(colHexText.toD, radix: 16);
          if (text[i - 1] == 'c'.ch)
          {
            colFront = GetColor(colHexValue);
          }
          else if (text[i - 1] == 'b'.ch)
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
        Rectangle$.$1.set(position.x + textOffsetX, position.y + textOffsetY - backRecPadding, increaseX, fontSize + 2*backRecPadding),
        colBack
      );

      if ((codepoint != ' '.ch) && (codepoint != '\t'.ch))
      {
        DrawTextCodepoint(font, codepoint, Vector2$.$2.set(position.x + textOffsetX, position.y + textOffsetY), fontSize, colFront);
      }

      textOffsetX += increaseX;
    }

    i += codepointByteCount.value;
  }
}

Vector2C MeasureTextStyled(FontC font, Pointer<Char> text, double fontSize, double spacing)
{
  final textSize = Vector2$.At('textSize');

  if ((font.texture.id == 0) || (text == nullptr) || (text[0] == 0)) return textSize.ref;

  int textLen = TextLength(text);

  double textWidth = 0.0;
  double textHeight = fontSize;
  double scaleFactor = fontSize/font.baseSize;

  int codepoint = 0;
  int index = 0;
  int validCodepointCounter = 0;

  for (int i = 0; i < textLen;)
  {
    final codepointByteCount = Int$.At('codepointByteCount');
    codepoint = GetCodepointNext(text + i, codepointByteCount);

    if (codepoint == '['.ch)
    {
      if (((i + 2) < textLen) && (text[i + 1] == 'r'.ch) && (text[i + 2] == ']'.ch))
      {
        i += 3;
        continue;
      }
      else if (((i + 1) < textLen) && ((text[i + 1] == 'c'.ch) || (text[i + 1] == 'b'.ch)))
      {
        i += 2;

        final textPtr = text + i;

        int colHexCount = 0;
        while ((textPtr != nullptr) && (textPtr[colHexCount] != 0) && (textPtr[colHexCount] != ']'.ch))
        {
          if (
            ((textPtr[colHexCount] >= '0'.ch) && (textPtr[colHexCount] <= '9'.ch)) ||
            ((textPtr[colHexCount] >= 'A'.ch) && (textPtr[colHexCount] <= 'F'.ch)) ||
            ((textPtr[colHexCount] >= 'a'.ch) && (textPtr[colHexCount] <= 'f'.ch))
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
      i += codepointByteCount.value;
    }
  }

  textSize.ref.x = textWidth*scaleFactor + (validCodepointCounter - 1)*spacing;
  textSize.ref.y = textHeight;

  return textSize.ref;
}
