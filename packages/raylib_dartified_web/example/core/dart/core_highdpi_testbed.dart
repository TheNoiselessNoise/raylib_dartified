// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_highdpi_testbed.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  SetConfigFlags([.FLAG_WINDOW_HIGHDPI, .FLAG_WINDOW_RESIZABLE]);
  InitWindow(screenWidth, screenHeight, "core_highdpi_testbed");
  SetTargetFPS(60);

  var scaleDpi = GetWindowScaleDPI();
  var mousePos = GetMousePosition();
  int currentMonitor = GetCurrentMonitor();
  var windowPos = GetWindowPosition();

  int gridSpacing = 40;

  rl.setMainLoop(() {
    mousePos = GetMousePosition();
    currentMonitor = GetCurrentMonitor();
    scaleDpi = GetWindowScaleDPI();
    windowPos = GetWindowPosition();

    if (IsKeyPressed(.KEY_SPACE)) ToggleBorderlessWindowed();
    if (IsKeyPressed(.KEY_F)) ToggleFullscreen();

    BeginDrawing();

      ClearBackground(RAYWHITE);

      for (int h = 0; h < GetScreenHeight()/gridSpacing + 1; h++)
      {
        DrawText("${h*gridSpacing}", 4, h*gridSpacing - 4, 10, GRAY);
        DrawLine(24, h*gridSpacing, GetScreenWidth(), h*gridSpacing, LIGHTGRAY);
      }
      for (int v = 0; v < GetScreenWidth()/gridSpacing + 1; v++)
      {
        DrawText("${v*gridSpacing}", v*gridSpacing - 10, 4, 10, GRAY);
        DrawLine(v*gridSpacing, 20, v*gridSpacing, GetScreenHeight(), LIGHTGRAY);
      }

      DrawText(
        "CURRENT MONITOR: ${currentMonitor + 1}/${GetMonitorCount()} (${GetMonitorWidth(currentMonitor)}x${GetMonitorHeight(currentMonitor)})",
        50, 50, 20, DARKGRAY
      );
      DrawText("WINDOW POSITION: ${windowPos.x.toInt()}x${windowPos.y.toInt()}", 50, 90, 20, DARKGRAY);
      DrawText("SCREEN SIZE: ${GetScreenWidth()}x${GetScreenHeight()}", 50, 130, 20, DARKGRAY);
      DrawText("RENDER SIZE: ${GetRenderWidth()}x${GetRenderHeight()}", 50, 170, 20, DARKGRAY);
      DrawText("SCALE FACTOR: ${scaleDpi.x.f2}x${scaleDpi.y.f2}", 50, 210, 20, GRAY);

      DrawRectangle(0, 0, 30, 60, RED);
      DrawRectangle(GetScreenWidth() - 30, GetScreenHeight() - 60, 30, 60, BLUE);

      DrawCircleV(GetMousePosition(), 20, MAROON);
      DrawRectangleRec(.rect(mousePos.x - 25, mousePos.y, 50, 2), BLACK);
      DrawRectangleRec(.rect(mousePos.x, mousePos.y - 25, 2, 50), BLACK);
      DrawText(
        "[${GetMouseX()},${GetMouseY()}]",
        (mousePos.x - 44).toInt(), ((mousePos.y > GetScreenHeight() - 60) ? mousePos.y - 46 : mousePos.y + 30).toInt(), 20, BLACK
      );

    EndDrawing();
  });
});