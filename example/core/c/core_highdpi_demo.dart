// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_highdpi_demo.c
// Run it: dart run core_highdpi_demo.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(
    ConfigFlags.FLAG_WINDOW_HIGHDPI.value |
    ConfigFlags.FLAG_WINDOW_RESIZABLE.value
  );
  InitWindow(screenWidth, screenHeight, "core_highdpi_demo".toC);
  SetWindowMinSize(450, 450);
  SetTargetFPS(60);

  int logicalGridDescY = 120;
  int logicalGridLabelY = logicalGridDescY + 30;
  int logicalGridTop = logicalGridLabelY + 30;
  int logicalGridBottom = logicalGridTop + 80;
  int pixelGridTop = logicalGridBottom - 20;
  int pixelGridBottom = pixelGridTop + 80;
  int pixelGridLabelY = pixelGridBottom + 30;
  int pixelGridDescY = pixelGridLabelY + 30;
  int cellSize = 50;
  double cellSizePx = cellSize.toDouble();

  while (!WindowShouldClose()) {
    int monitorCount = GetMonitorCount();

    if ((monitorCount > 1) && IsKeyPressed(KeyboardKey.KEY_N.value))
    {
      SetWindowMonitor((GetCurrentMonitor() + 1)%monitorCount);
    }

    int currentMonitor = GetCurrentMonitor();
    final dpiScale = GetWindowScaleDPI();
    cellSizePx = cellSize/dpiScale.x;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      int windowCenter = GetScreenWidth()~/2;
      DrawTextCenter("Dpi Scale: ${dpiScale.x}".toC, windowCenter, 30, 40, DARKGRAY);
      DrawTextCenter("Monitor: ${currentMonitor+1}/$monitorCount ([N] next monitor)".toC, windowCenter, 70, 20, LIGHTGRAY);
      DrawTextCenter("Window is ${GetScreenWidth()} \"logical points\" wide".toC, windowCenter, logicalGridDescY, 20, ORANGE);

      bool odd = true;
      for (int i = cellSize; i < GetScreenWidth(); i += cellSize, odd = !odd)
      {
        if (odd) DrawRectangle(i, logicalGridTop, cellSize, logicalGridBottom-logicalGridTop, ORANGE);

        DrawTextCenter("$i".toC, i, logicalGridLabelY, 10, LIGHTGRAY);
        DrawLine(i, logicalGridLabelY + 10, i, logicalGridBottom, GRAY);
      }

      odd = true;
      const int minTextSpace = 30;
      int lastTextX = -minTextSpace;
      for (int i = cellSize; i < GetRenderWidth(); i += cellSize, odd = !odd)
      {
        int x = i~/dpiScale.x;
        if (odd) DrawRectangle(x, pixelGridTop, cellSizePx.toInt(), pixelGridBottom - pixelGridTop, Color$.$1.set(0, 121, 241, 100));

        DrawLine(x, pixelGridTop, x, pixelGridLabelY - 10, GRAY);

        if ((x - lastTextX) >= minTextSpace)
        {
          DrawTextCenter("$i".toC, x, pixelGridLabelY, 10, LIGHTGRAY);
          lastTextX = x;
        }
      }

      DrawTextCenter("Window is ${GetRenderWidth()} \"physical pixels\" wide".toC, windowCenter, pixelGridDescY, 20, BLUE);

      final text = "Can you see this?".toC;
      final size = MeasureTextEx(GetFontDefault(), text, 20, 3);
      final pos = Vector2$.$1.set(GetScreenWidth() - size.x - 5, GetScreenHeight() - size.y - 5);
      DrawTextEx(GetFontDefault(), text, pos, 20, 3, LIGHTGRAY);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void DrawTextCenter(Pointer<Char> text, int x, int y, int fontSize, ColorC color)
{
  final size = MeasureTextEx(GetFontDefault(), text, fontSize.toDouble(), 3);
  final pos = Vector2$.$1.set(x - size.x/2, y - size.y/2);
  DrawTextEx(GetFontDefault(), text, pos, fontSize.toDouble(), 3, color);
}