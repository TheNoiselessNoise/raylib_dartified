// Custom example, there's no original equivalent
import '../../base_dart.dart';

void main() => Raylib((rl) {
  InitWindow(800, 450, "list_view");
  SetWindowMonitor(0);
  SetTargetFPS(60);

  List<String> keyNames = KeyboardKey.values.map((v) => v.name).toList();
  int scrollIndex = 0;
  int active = 0;
  int focus = 0;

  rl.setMainLoop(() {
    BeginDrawing();

      ClearBackground(.WHITE);

      (_, scrollIndex!, active!, focus!) = GuiListViewEx(
        .rect(50, 50, 100, 200),
        keyNames,
        scrollIndex: scrollIndex,
        active: active,
        focus: focus,
      );
      
      DrawText("SCROLL INDEX: $scrollIndex [ at ${keyNames[scrollIndex]} ]", 50, 280, 20, .BLACK);

      final activeName = active == -1 ? '----' : keyNames[active];
      DrawText("ACTIVE: $active [ $activeName ]", 50, 310, 20, .BLACK);
      
      final focusName = focus == -1 ? '----' : keyNames[focus];
      DrawText("FOCUS: $focus [ $focusName ]", 50, 340, 20, .BLACK);

    EndDrawing();
  });
});