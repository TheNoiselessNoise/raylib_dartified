// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_text_file_loading.c
// Run it: dart run core_text_file_loading.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_text_file_loading");
  SetTargetFPS(60);

  final cam = Camera2DD(
    zoom: 1,
  );

  String fileName = "../resources/text_file.txt";
  final text = LoadFileText(fileName);

  final lines = LoadTextLines(text);

  int fontSize = 20;
  int textTop = 25 + fontSize;
  int wrapWidth = screenWidth - 20;

  for (int i = 0; i < lines.length; i++)
  {
    final chars = lines[i].codeUnits.toList();
    final len = chars.length;
    
    int j = 0;
    int lastSpace = 0;
    int lastWrapStart = 0;

    while (j <= len)
    {
      final isSpace = j < len && chars[j] == ' '.ch;
      final isEnd = j == len;

      if (isSpace || isEnd)
      {
        final segment = String.fromCharCodes(chars, lastWrapStart, j);

        if (MeasureText(segment, fontSize) > wrapWidth)
        {
          chars[lastSpace] = '\n'.ch;
          lastWrapStart = lastSpace + 1;
        }

        lastSpace = j;
      }

      j++;
    }

    lines[i] = String.fromCharCodes(chars);
  }

  int textHeight = 0;

  for (int i = 0; i < lines.length; i++)
  {
    final size = MeasureTextEx(GetFontDefault(), lines[i], fontSize.toDouble(), 2);
    textHeight += (size.y + 10).toInt();
  }

  final RectangleD scrollBar = .rect(
    screenWidth - 5,
    0,
    5,
    screenHeight*100.0/(textHeight - screenHeight)
  );

  while (!WindowShouldClose()) {
    final scroll = GetMouseWheelMove();
    cam.target.y -= scroll*fontSize*1.5;

    if (cam.target.y < 0) cam.target.y = 0;

    if (cam.target.y > textHeight - screenHeight + textTop)
        cam.target.y = (textHeight - screenHeight + textTop).toDouble();

    scrollBar.y = Lerp(textTop, screenHeight - scrollBar.height, (cam.target.y - textTop)/(textHeight - screenHeight));

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode2D(cam);
        for (int i = 0, t = textTop; i < lines.length; i++)
        {
          late Vector2D size;
          if(lines[i].isNotEmpty){
            size = MeasureTextEx( GetFontDefault(), lines[i], fontSize.toDouble(), 2);
          }else{
            size = MeasureTextEx( GetFontDefault(), " ", fontSize.toDouble(), 2);
          }

          DrawText(lines[i], 10, t, fontSize, RED);

          t += (size.y + 10).toInt();
        }
      EndMode2D();

      DrawRectangle(0, 0, screenWidth, textTop - 10, BEIGE);
      DrawText("File: $fileName", 10, 10, fontSize, MAROON);

      DrawRectangleRec(scrollBar, MAROON);

    EndDrawing();
  }

  CloseWindowAndDispose();
}
