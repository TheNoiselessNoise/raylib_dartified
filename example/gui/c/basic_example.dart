// Custom example, there's no original equivalent
// Run it: dart run basic_example.dart
import 'dart:ffi';
import '../../base.dart';

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  final rect = rl.Temp.Rectangle$.At('rect');

  rl.Core.InitWindow(400, 200, "basic_example".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  bool showMessageBox = false;

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      final style = rl.Gui.GuiGetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.BACKGROUND_COLOR.value);
      rl.Core.ClearBackground(rl.Core.GetColor(style));

      rect.ref.set(24, 24, 120, 30);
      if (rl.Gui.GuiButton(rect.ref, "#191#Show Message".toC).toBool()) {
        showMessageBox = true;
      }

      if (showMessageBox)
      {
        rect.ref.set(85, 70, 250, 100);
        int result = rl.Gui.GuiMessageBox(
          rect.ref,
          "#191#Message Box".toC,
          "Hi! This is a message!".toC,
          "Nice;Cool".toC
        );

        if (result >= 0) {
          showMessageBox = false;
        }
      }

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}