// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_directory_files.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "core_directory_files");
  SetTargetFPS(60);

  var directory = GetWorkingDirectory();

  var files = LoadDirectoryFilesEx(directory, ".png;.c", false);

  bool btnBackPressed = false;

  int listScrollIndex = 0;
  int listItemActive = -1;
  int listItemFocused = -1;

  rl.setMainLoop(() {
    if (btnBackPressed)
    {
      directory = GetPrevDirectoryPath(directory);
      UnloadDirectoryFiles(files);
      files = LoadDirectoryFiles(directory);
    }

    BeginDrawing();
      ClearBackground(RAYWHITE);

      btnBackPressed = GuiButton(.rect(40.0, 10.0, 48, 28), "<") != .RESULT_NONE;

      GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SIZE, GuiGetFont().baseSize*2);
      GuiLabel(.rect(40 + 48 + 10, 10, 700, 28), directory);
      GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SIZE, GuiGetFont().baseSize);

      GuiSetStyle(.LISTVIEW, GuiControlProperty.TEXT_ALIGNMENT, GuiTextAlignment.TEXT_ALIGN_LEFT.value);
      GuiSetStyle(.LISTVIEW, GuiControlProperty.TEXT_PADDING, 40);
      (_, listScrollIndex!, listItemActive!, listItemFocused!) = GuiListViewEx(
        .rect(0, 50, GetScreenWidth(), GetScreenHeight() - 50),
        files.paths,
        scrollIndex: listScrollIndex,
        active: listItemActive,
        focus: listItemFocused
      );

    EndDrawing();
  });
});