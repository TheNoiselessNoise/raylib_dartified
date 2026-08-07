// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_text_file_loading.c
// Run it: dart run core_text_file_loading.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_text_file_loading".toC);
  SetTargetFPS(60);

  final cam = Camera2D$.$newPtr;
  cam.ref.zoom = 1;

  String fileName = "../resources/text_file.txt";
  final text = LoadFileText(fileName.toC);

  final lineCount = Int$.$newPtr;
  final lines = LoadTextLines(text, lineCount);

  int fontSize = 20;
  int textTop = 25 + fontSize;
  int wrapWidth = screenWidth - 20;

  for (int i = 0; i < lineCount.value; i++)
  {
    int j = 0;
    int lastSpace = 0;
    int lastWrapStart = 0;

    while (j <= strlen(lines[i].cast()))
    {
      if (lines[i][j] == ' '.ch || lines[i][j] == 0)
      {
        final before = lines[i][j];
        lines[i][j] = 0;

        if (MeasureText(lines[i] + lastWrapStart, fontSize) > wrapWidth)
        {
          lines[i][lastSpace] = '\n'.ch;
          lastWrapStart = lastSpace + 1;
        }

        if(before != 0) lines[i][j] = ' '.ch;
        lastSpace = j;
      }

      j++;
    }
  }

  int textHeight = 0;

  for (int i = 0; i < lineCount.value; i++)
  {
    final size = MeasureTextEx(GetFontDefault(), lines[i], fontSize.toDouble(), 2);
    textHeight += (size.y + 10).toInt();
  }

  final scrollBar = Rectangle$.$new.set(
    screenWidth - 5,
    0,
    5,
    screenHeight*100.0/(textHeight - screenHeight)
  );

  while (!WindowShouldClose()) {
    final scroll = GetMouseWheelMove();
    cam.ref.target.y -= scroll*fontSize*1.5;

    if (cam.ref.target.y < 0) cam.ref.target.y = 0;

    if (cam.ref.target.y > textHeight - screenHeight + textTop)
        cam.ref.target.y = (textHeight - screenHeight + textTop).toDouble();

    scrollBar.y = Lerp(textTop, screenHeight - scrollBar.height, (cam.ref.target.y - textTop)/(textHeight - screenHeight));

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode2D(cam.ref);
        for (int i = 0, t = textTop; i < lineCount.value; i++)
        {
          late Vector2C size;
          if(strcmp(lines[i].cast(), "".toC.cast()).toBool()){
            size = MeasureTextEx( GetFontDefault(), lines[i], fontSize.toDouble(), 2);
          }else{
            size = MeasureTextEx( GetFontDefault(), " ".toC, fontSize.toDouble(), 2);
          }

          DrawText(lines[i], 10, t, fontSize, RED);

          t += (size.y + 10).toInt();
        }
      EndMode2D();

      DrawRectangle(0, 0, screenWidth, textTop - 10, BEIGE);
      DrawText("File: $fileName".toC, 10, 10, fontSize, MAROON);

      DrawRectangleRec(scrollBar, MAROON);

    EndDrawing();
  }

  UnloadTextLines(lines, lineCount.value);
  UnloadFileText(text);

  CloseWindowAndDispose();
}
