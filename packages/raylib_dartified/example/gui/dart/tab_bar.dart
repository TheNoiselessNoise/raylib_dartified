// Custom example, there's no original equivalent
import '../../_example/dart.dart';

final tabs = <String>["one", "two", "three"];
int activeTab = 0;

void main() => runExample(
  init: (_) {
    InitWindow(800, 450, "tab_bar");
    SetTargetFPS(60);
  },
  loop: (_) async {
    BeginDrawing();

      ClearBackground(.WHITE);

      {
        final (_, active) = GuiTabBar(
          .rect(24, 24, 120, 30),
          tabs.join(';'),
          activeTab,
        );
        activeTab = active;
      }

      DrawText("CURRENT TAB: ${tabs[activeTab]}", 50, 300, 20, .BLACK);

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);