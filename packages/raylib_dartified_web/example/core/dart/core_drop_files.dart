// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_drop_files.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "core_drop_files");
  SetTargetFPS(60);

  final List<String> filePaths = [];

  rl.setMainLoop(() {
    if (IsFileDropped())
    {
      final droppedFiles = LoadDroppedFiles();
      filePaths.addAll(droppedFiles.paths);
      UnloadDroppedFiles(droppedFiles);
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (filePaths.isEmpty) DrawText("Drop your files to this window!", 100, 40, 20, DARKGRAY);
      else
      {
        DrawText("Dropped files:", 100, 40, 20, DARKGRAY);

        for (int i = 0; i < filePaths.length; i++)
        {
          if (i%2 == 0) DrawRectangle(0, 85 + 40*i, screenWidth, 40, Fade(LIGHTGRAY, 0.5));
          else DrawRectangle(0, 85 + 40*i, screenWidth, 40, Fade(LIGHTGRAY, 0.3));

          DrawText(filePaths[i], 120, 100 + 40*i, 10, GRAY);
        }

        DrawText("Drop new files...", 100, 110 + 40*filePaths.length, 20, DARKGRAY);
      }

    EndDrawing();
  });
});