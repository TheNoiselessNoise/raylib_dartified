// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_drop_files.c
// Run it: dart run core_drop_files.dart
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_FILEPATH_RECORDED = 4096;
const int MAX_FILEPATH_SIZE = 2048;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_drop_files".toC);
  SetTargetFPS(60);

  int filePathCounter = 0;
  final filePaths = calloc<Pointer<Char>>(MAX_FILEPATH_RECORDED);

  for (int i = 0; i < MAX_FILEPATH_RECORDED; i++)
  {
    filePaths[i] = calloc(MAX_FILEPATH_SIZE);
  }

  while (!WindowShouldClose()) {
    if (IsFileDropped())
    {
      final droppedFiles = LoadDroppedFiles();

      for (int i = 0, offset = filePathCounter; i < droppedFiles.count; i++)
      {
        if (filePathCounter < (MAX_FILEPATH_RECORDED - 1))
        {
          TextCopy(filePaths[offset + i], droppedFiles.paths[i]);
          filePathCounter++;
        }
      }

      UnloadDroppedFiles(droppedFiles);
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (filePathCounter == 0) DrawText("Drop your files to this window!".toC, 100, 40, 20, DARKGRAY);
      else
      {
        DrawText("Dropped files:".toC, 100, 40, 20, DARKGRAY);

        for (int i = 0; i < filePathCounter; i++)
        {
          if (i%2 == 0) DrawRectangle(0, 85 + 40*i, screenWidth, 40, Fade(LIGHTGRAY, 0.5));
          else DrawRectangle(0, 85 + 40*i, screenWidth, 40, Fade(LIGHTGRAY, 0.3));

          DrawText(filePaths[i], 120, 100 + 40*i, 10, GRAY);
        }

        DrawText("Drop new files...".toC, 100, 110 + 40*filePathCounter, 20, DARKGRAY);
      }

    EndDrawing();
  }

  for (int i = 0; i < MAX_FILEPATH_RECORDED; i++)
  {
    calloc.free(filePaths[i]);
  }

  calloc.free(filePaths);

  CloseWindowAndDispose();
}