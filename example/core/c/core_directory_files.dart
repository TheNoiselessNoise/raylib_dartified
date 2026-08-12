// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_directory_files.c
// Run it: dart run core_directory_files.dart
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_FILEPATH_SIZE = 1024;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_directory_files".toC);
  SetTargetFPS(60);

  final directory = calloc<Char>(MAX_FILEPATH_SIZE);
  strcpy(directory.cast(), GetWorkingDirectory().cast());

  var files = LoadDirectoryFilesEx(directory, ".png;.c".toC, false);

  bool btnBackPressed = false;

  final listScrollIndex = Int$.val.ValueUnique(0);
  final listItemActive = Int$.val.ValueUnique(-1);
  final listItemFocused = Int$.val.ValueUnique(-1);

  while (!WindowShouldClose()) {
    if (btnBackPressed)
    {
      TextCopy(directory, GetPrevDirectoryPath(directory));
      UnloadDirectoryFiles(files);
      files = LoadDirectoryFiles(directory);
    }

    BeginDrawing();
      ClearBackground(RAYWHITE);

      btnBackPressed = GuiButton(Rectangle$.val.$1.set(40.0, 10.0, 48, 28), "<".toC).toBool();

      GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SIZE.value, GuiGetFont().baseSize*2);
      GuiLabel(Rectangle$.val.$1.set(40 + 48 + 10, 10, 700, 28), directory);
      GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SIZE.value, GuiGetFont().baseSize);

      GuiSetStyle(GuiControl.LISTVIEW.value, GuiControlProperty.TEXT_ALIGNMENT.value, GuiTextAlignment.TEXT_ALIGN_LEFT.value);
      GuiSetStyle(GuiControl.LISTVIEW.value, GuiControlProperty.TEXT_PADDING.value, 40);
      GuiListViewEx(
        Rectangle$.val.$1.set(0, 50, GetScreenWidth(), GetScreenHeight() - 50),
        files.paths, files.count,
        listScrollIndex, listItemActive, listItemFocused
      );

    EndDrawing();
  }

  UnloadDirectoryFiles(files);
  calloc.free(directory);

  CloseWindowAndDispose();
}