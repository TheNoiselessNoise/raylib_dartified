// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_monitor_detector.c
// Run it: dart run core_monitor_detector.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

class MonitorInfo {
  Vector2D position = .zero();
  String name = '';
  int width = 0;
  int height = 0;
  int physicalWidth = 0;
  int physicalHeight = 0;
  int refreshRate = 0;
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_monitor_detector");
  SetTargetFPS(60);

  final List<MonitorInfo> monitors = [];
  int currentMonitorIndex = GetCurrentMonitor();

  while (!WindowShouldClose()) {
    int maxWidth = 1;
    int maxHeight = 1;

    int monitorOffsetX = 0;

    monitors.clear();
    for (int i = 0; i < GetMonitorCount(); i++)
    {
      monitors.add(.new());
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

    if (IsKeyPressed(.KEY_ENTER) && (monitors.length > 1))
    {
      currentMonitorIndex += 1;

      if (currentMonitorIndex == monitors.length) currentMonitorIndex = 0;

      SetWindowMonitor(currentMonitorIndex);
    }
    else currentMonitorIndex = GetCurrentMonitor();

    double monitorScale = 0.6;

    if (maxHeight > (maxWidth + monitorOffsetX)) monitorScale *= (screenHeight/maxHeight);
    else monitorScale *= (screenWidth/(maxWidth + monitorOffsetX));

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("Press [Enter] to move window to next monitor available", 20, 20, 20, DARKGRAY);

      DrawRectangleLines(20, 60, screenWidth - 40, screenHeight - 100, DARKGRAY);

      for (int i = 0; i < monitors.length; i++)
      {
        final m = monitors[i];

        final RectangleD rec = .rect(
          (m.position.x + monitorOffsetX)*monitorScale + 140,
          m.position.y*monitorScale + 80,
          m.width*monitorScale,
          m.height*monitorScale
        );

        DrawText("[$i] ${m.name}", rec.x + 10, rec.y + (100*monitorScale), 120*monitorScale, BLUE);
        DrawText(
          "Resolution: [${m.width}px x ${m.height}px]\n"
          "RefreshRate: [${m.refreshRate}hz]\n"
          "Physical Size: [${m.physicalWidth}mm x ${m.physicalHeight}mm]\n"
          "Position: ${m.position.x.f0} x ${m.position.y.f0}",
        rec.x + 10, rec.y + (200*monitorScale), 120*monitorScale, DARKGRAY);

        if (i == currentMonitorIndex)
        {
          DrawRectangleLinesEx(rec, 5, RED);
          DrawRectangleV(
            .vec2((GetWindowPosition().x + monitorOffsetX)*monitorScale  + 140, GetWindowPosition().y*monitorScale + 80),
            .vec2(screenWidth*monitorScale, screenHeight*monitorScale),
            Fade(GREEN, 0.5)
          );
        }
        else DrawRectangleLinesEx(rec, 5, GRAY);
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}