// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_monitor_detector.c
// Run it: dart run core_monitor_detector.dart
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_MONITORS = 10;

final class MonitorInfo extends Struct {
  external Vector2C position;
  external Pointer<Char> name;
  @Int() external int width;
  @Int() external int height;
  @Int() external int physicalWidth;
  @Int() external int physicalHeight;
  @Int() external int refreshRate;
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_monitor_detector".toC);
  SetTargetFPS(60);

  final monitors = calloc<MonitorInfo>(MAX_MONITORS);
  int currentMonitorIndex = GetCurrentMonitor();
  int monitorCount = 0;

  while (!WindowShouldClose()) {
    int maxWidth = 1;
    int maxHeight = 1;

    int monitorOffsetX = 0;

    monitorCount = GetMonitorCount();
    for (int i = 0; i < monitorCount; i++)
    {
      monitors[i].position = GetMonitorPosition(i);
      monitors[i].name = GetMonitorName(i);
      monitors[i].width = GetMonitorWidth(i);
      monitors[i].height = GetMonitorHeight(i);
      monitors[i].physicalWidth = GetMonitorPhysicalWidth(i);
      monitors[i].physicalHeight = GetMonitorPhysicalHeight(i);
      monitors[i].refreshRate = GetMonitorRefreshRate(i);

      if (monitors[i].position.x < monitorOffsetX) monitorOffsetX = -(monitors[i].position.x).toInt();

      int width = (monitors[i].position.x + monitors[i].width).toInt();
      int height = (monitors[i].position.y + monitors[i].height).toInt();

      if (maxWidth < width) maxWidth = width;
      if (maxHeight < height) maxHeight = height;
    }

    if (IsKeyPressed(KeyboardKey.KEY_ENTER.value) && (monitorCount > 1))
    {
      currentMonitorIndex += 1;

      if (currentMonitorIndex == monitorCount) currentMonitorIndex = 0;

      SetWindowMonitor(currentMonitorIndex);
    }
    else currentMonitorIndex = GetCurrentMonitor();

    double monitorScale = 0.6;

    if (maxHeight > (maxWidth + monitorOffsetX)) monitorScale *= (screenHeight/maxHeight);
    else monitorScale *= (screenWidth/(maxWidth + monitorOffsetX));

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("Press [Enter] to move window to next monitor available".toC, 20, 20, 20, DARKGRAY);

      DrawRectangleLines(20, 60, screenWidth - 40, screenHeight - 100, DARKGRAY);

      for (int i = 0; i < monitorCount; i++)
      {
        final m = monitors[i];

        final rec = Rectangle$.$1.set(
          (m.position.x + monitorOffsetX)*monitorScale + 140,
          m.position.y*monitorScale + 80,
          m.width*monitorScale,
          m.height*monitorScale
        );

        DrawText("[$i] ${m.name.toD}".toC, (rec.x + 10).toInt(), (rec.y + (100*monitorScale)).toInt(), (120*monitorScale).toInt(), BLUE);
        DrawText(
          "Resolution: [${m.width}px x ${m.height}px]\n"
          "RefreshRate: [${m.refreshRate}hz]\n"
          "Physical Size: [${m.physicalWidth}mm x ${m.physicalHeight}mm]\n"
          "Position: ${m.position.x.f0} x ${m.position.y.f0}".toC,
        (rec.x + 10).toInt(), (rec.y + (200*monitorScale)).toInt(), (120*monitorScale).toInt(), DARKGRAY);

        if (i == currentMonitorIndex)
        {
          DrawRectangleLinesEx(rec, 5, RED);
          DrawRectangleV(
            Vector2$.$1.set((GetWindowPosition().x + monitorOffsetX)*monitorScale  + 140, GetWindowPosition().y*monitorScale + 80),
            Vector2$.$2.set(screenWidth*monitorScale, screenHeight*monitorScale),
            Fade(GREEN, 0.5)
          );
        }
        else DrawRectangleLinesEx(rec, 5, GRAY);
      }

    EndDrawing();
  }

  calloc.free(monitors);

  CloseWindowAndDispose();
}