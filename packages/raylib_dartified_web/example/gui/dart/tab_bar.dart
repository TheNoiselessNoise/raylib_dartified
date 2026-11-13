// Custom example, there's no original equivalent
import '../../base_dart.dart';

void main() => Raylib((rl) {
  InitWindow(800, 450, "tab_bar");
  SetWindowMonitor(0);
  SetTargetFPS(60);

  final tabs = <String>["one", "two", "three"];
  int activeTab = 0;

  rl.setMainLoop(() {
    BeginDrawing();

      ClearBackground(.WHITE);

      (_, activeTab) = GuiTabBar(
        .rect(24, 24, 120, 30),
        tabs.join(';'),
        activeTab,
      );

      DrawText("CURRENT TAB: ${tabs[activeTab]}", 50, 300, 20, .BLACK);

    EndDrawing();
  });
});