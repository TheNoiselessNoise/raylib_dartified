// Custom example, there's no original equivalent
// Run it: dart run tab_bar.dart
import '../../base.dart';

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(800, 450, "tab_bar");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final tabs = <String>["one", "two", "three"];

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.WHITE);

      final (result, active) = rl.GuiD.GuiTabBar(
        .rect(24, 24, 120, 30),
        tabs,
      );

      rl.CoreD.DrawText("CURRENT TAB: ${tabs[active]}", 50, 300, 20, .BLACK);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}