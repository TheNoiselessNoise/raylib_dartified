// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_highdpi_testbed.c
// Run it: dart run core_highdpi_testbed.dart
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(
    ConfigFlags.FLAG_WINDOW_HIGHDPI.value |
    ConfigFlags.FLAG_WINDOW_RESIZABLE.value
  );
  InitWindow(screenWidth, screenHeight, "core_highdpi_testbed".toC);
  SetTargetFPS(60);

  var scaleDpi = GetWindowScaleDPI();
  var mousePos = GetMousePosition();
  int currentMonitor = GetCurrentMonitor();
  var windowPos = GetWindowPosition();

  int gridSpacing = 40;

  while (!WindowShouldClose()) {
    mousePos = GetMousePosition();
    currentMonitor = GetCurrentMonitor();
    scaleDpi = GetWindowScaleDPI();
    windowPos = GetWindowPosition();

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) ToggleBorderlessWindowed();
    if (IsKeyPressed(KeyboardKey.KEY_F.value)) ToggleFullscreen();

    BeginDrawing();

      ClearBackground(RAYWHITE);

      for (int h = 0; h < GetScreenHeight()/gridSpacing + 1; h++)
      {
        DrawText("${h*gridSpacing}".toC, 4, h*gridSpacing - 4, 10, GRAY);
        DrawLine(24, h*gridSpacing, GetScreenWidth(), h*gridSpacing, LIGHTGRAY);
      }
      for (int v = 0; v < GetScreenWidth()/gridSpacing + 1; v++)
      {
        DrawText("${v*gridSpacing}".toC, v*gridSpacing - 10, 4, 10, GRAY);
        DrawLine(v*gridSpacing, 20, v*gridSpacing, GetScreenHeight(), LIGHTGRAY);
      }

      DrawText(
        "CURRENT MONITOR: ${currentMonitor + 1}/${GetMonitorCount()} (${GetMonitorWidth(currentMonitor)}x${GetMonitorHeight(currentMonitor)})".toC,
        50, 50, 20, DARKGRAY
      );
      DrawText("WINDOW POSITION: ${windowPos.x.toInt()}x${windowPos.y.toInt()}".toC, 50, 90, 20, DARKGRAY);
      DrawText("SCREEN SIZE: ${GetScreenWidth()}x${GetScreenHeight()}".toC, 50, 130, 20, DARKGRAY);
      DrawText("RENDER SIZE: ${GetRenderWidth()}x${GetRenderHeight()}".toC, 50, 170, 20, DARKGRAY);
      DrawText("SCALE FACTOR: ${scaleDpi.x.f2}x${scaleDpi.y.f2}".toC, 50, 210, 20, GRAY);

      DrawRectangle(0, 0, 30, 60, RED);
      DrawRectangle(GetScreenWidth() - 30, GetScreenHeight() - 60, 30, 60, BLUE);

      DrawCircleV(GetMousePosition(), 20, MAROON);
      DrawRectangleRec(Rectangle$.val.$1.set(mousePos.x - 25, mousePos.y, 50, 2), BLACK);
      DrawRectangleRec(Rectangle$.val.$1.set(mousePos.x, mousePos.y - 25, 2, 50), BLACK);
      DrawText(
        "[${GetMouseX()},${GetMouseY()}]".toC,
        (mousePos.x - 44).toInt(), ((mousePos.y > GetScreenHeight() - 60) ? mousePos.y - 46 : mousePos.y + 30).toInt(), 20, BLACK
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}