// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_highdpi_demo.c
// Run it: dart run core_highdpi_demo.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_WINDOW_HIGHDPI, .FLAG_WINDOW_RESIZABLE]);
  InitWindow(screenWidth, screenHeight, "core_highdpi_demo");
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

    if ((monitorCount > 1) && IsKeyPressed(.KEY_N))
    {
      SetWindowMonitor((GetCurrentMonitor() + 1)%monitorCount);
    }

    int currentMonitor = GetCurrentMonitor();
    final dpiScale = GetWindowScaleDPI();
    cellSizePx = cellSize/dpiScale.x;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      int windowCenter = GetScreenWidth()~/2;
      DrawTextCenter("Dpi Scale: ${dpiScale.x}", windowCenter, 30, 40, DARKGRAY);
      DrawTextCenter("Monitor: ${currentMonitor+1}/$monitorCount ([N] next monitor)", windowCenter, 70, 20, LIGHTGRAY);
      DrawTextCenter("Window is ${GetScreenWidth()} \"logical points\" wide", windowCenter, logicalGridDescY, 20, ORANGE);

      bool odd = true;
      for (int i = cellSize; i < GetScreenWidth(); i += cellSize, odd = !odd)
      {
        if (odd) DrawRectangle(i, logicalGridTop, cellSize, logicalGridBottom-logicalGridTop, ORANGE);

        DrawTextCenter("$i", i, logicalGridLabelY, 10, LIGHTGRAY);
        DrawLine(i, logicalGridLabelY + 10, i, logicalGridBottom, GRAY);
      }

      odd = true;
      const int minTextSpace = 30;
      int lastTextX = -minTextSpace;
      for (int i = cellSize; i < GetRenderWidth(); i += cellSize, odd = !odd)
      {
        int x = i~/dpiScale.x;
        if (odd) DrawRectangle(x, pixelGridTop, cellSizePx.toInt(), pixelGridBottom - pixelGridTop, .color(0, 121, 241, 100));

        DrawLine(x, pixelGridTop, x, pixelGridLabelY - 10, GRAY);

        if ((x - lastTextX) >= minTextSpace)
        {
          DrawTextCenter("$i", x, pixelGridLabelY, 10, LIGHTGRAY);
          lastTextX = x;
        }
      }

      DrawTextCenter("Window is ${GetRenderWidth()} \"physical pixels\" wide", windowCenter, pixelGridDescY, 20, BLUE);

      final text = "Can you see this?";
      final size = MeasureTextEx(GetFontDefault(), text, 20, 3);
      final Vector2D pos = .vec2(GetScreenWidth() - size.x - 5, GetScreenHeight() - size.y - 5);
      DrawTextEx(GetFontDefault(), text, pos, 20, 3, LIGHTGRAY);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void DrawTextCenter(String text, int x, int y, int fontSize, ColorD color)
{
  final size = MeasureTextEx(GetFontDefault(), text, fontSize.toDouble(), 3);
  final Vector2D pos = .vec2(x - size.x/2, y - size.y/2);
  DrawTextEx(GetFontDefault(), text, pos, fontSize.toDouble(), 3, color);
}