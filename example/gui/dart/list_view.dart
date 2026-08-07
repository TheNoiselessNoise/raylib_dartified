// Custom example, there's no original equivalent
// Run it: dart run list_view.dart
import '../../base_dart.dart';

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(800, 450, "tab_bar");
  SetTargetFPS(60);

  List<String> keyNames = KeyboardKey.values.map((v) => v.name).toList();
  int scrollIndex = 0;
  int active = 0;
  int focus = 0;

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(.WHITE);

      final (_, newScrollIndex, newActive, newFocus) = GuiListViewEx(
        .rect(50, 50, 100, 200),
        keyNames,
        scrollIndex: scrollIndex,
        active: active,
        focus: focus,
      );
      scrollIndex = newScrollIndex!;
      active = newActive!;
      focus = newFocus!;
      
      DrawText("SCROLL INDEX: $scrollIndex [ at ${keyNames[scrollIndex]} ]", 50, 280, 20, .BLACK);

      final activeName = active == -1 ? '----' : keyNames[active];
      DrawText("ACTIVE: $active [ $activeName ]", 50, 310, 20, .BLACK);
      
      final focusName = focus == -1 ? '----' : keyNames[focus];
      DrawText("FOCUS: $focus [ $focusName ]", 50, 340, 20, .BLACK);

    EndDrawing();
  }

  CloseWindowAndDispose();
}