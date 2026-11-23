// Custom example, there's no original equivalent
import '../../_example/dart.dart';

List<String> keyNames = KeyboardKey.values.map((v) => v.name).toList();
int scrollIndex = 0;
int activeIndex = 0;
int focusIndex = 0;

void main() => runExample(
  init: (_) {
    InitWindow(800, 450, "list_view");
    SetTargetFPS(60);
  },
  loop: (_) async {
    BeginDrawing();

      ClearBackground(.WHITE);

      final (_, scroll, active, focus) = GuiListViewEx(
        .rect(50, 50, 100, 200),
        keyNames,
        scrollIndex: scrollIndex,
        active: activeIndex,
        focus: focusIndex,
      );
      scrollIndex = scroll!;
      activeIndex = active!;
      focusIndex = focus!;
      
      DrawText("SCROLL INDEX: $scrollIndex [ at ${keyNames[scrollIndex]} ]", 50, 280, 20, .BLACK);

      final activeName = active == -1 ? '----' : keyNames[active];
      DrawText("ACTIVE: $active [ $activeName ]", 50, 310, 20, .BLACK);
      
      final focusName = focus == -1 ? '----' : keyNames[focus];
      DrawText("FOCUS: $focus [ $focusName ]", 50, 340, 20, .BLACK);

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);