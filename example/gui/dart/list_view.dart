// Custom example, there's no original equivalent
// Run it: dart run list_view.dart
import '../../base.dart';

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(800, 450, "tab_bar");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  List<String> keyNames = KeyboardKey.values.map((v) => v.name).toList();
  int scrollIndex = 0;
  int active = 0;
  int focus = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.WHITE);

      final (_, newScrollIndex, newActive, newFocus) = rl.GuiD.GuiListViewEx(
        .rect(50, 50, 100, 200),
        keyNames,
        scrollIndex: scrollIndex,
        active: active,
        focus: focus,
      );
      scrollIndex = newScrollIndex;
      active = newActive;
      focus = newFocus;
      
      rl.CoreD.DrawText("SCROLL INDEX: $scrollIndex [ at ${keyNames[scrollIndex]} ]", 50, 280, 20, .BLACK);

      final activeName = active == -1 ? '----' : keyNames[active];
      rl.CoreD.DrawText("ACTIVE: $active [ $activeName ]", 50, 310, 20, .BLACK);
      
      final focusName = focus == -1 ? '----' : keyNames[focus];
      rl.CoreD.DrawText("FOCUS: $focus [ $focusName ]", 50, 340, 20, .BLACK);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}