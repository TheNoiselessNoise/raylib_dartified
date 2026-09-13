// Custom example, there's no original equivalent
// Run it: dart run tab_bar.dart
import '../../base_dart.dart';

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(800, 450, "tab_bar");
  SetTargetFPS(60);

  final tabs = <String>["one", "two", "three"];
  int activeTab = 0;

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(.WHITE);

      (_, activeTab) = GuiTabBar(
        .rect(24, 24, 120, 30),
        tabs.join(';'),
        activeTab,
      );

      DrawText("CURRENT TAB: ${tabs[activeTab]}", 50, 300, 20, .BLACK);

    EndDrawing();
  }

  CloseWindowAndDispose();
}