// Custom example, there's no original equivalent
// Run it: dart run basic_example.dart
import 'dart:ffi';
import '../../base_c.dart';

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  final rect = Rectangle$.val.At('rect');

  InitWindow(400, 200, "basic_example".toC);
  SetTargetFPS(60);

  bool showMessageBox = false;

  while (!WindowShouldClose())
  {
    BeginDrawing();

      final style = GuiGetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.BACKGROUND_COLOR.value);
      ClearBackground(GetColor(style));

      rect.ref.set(24, 24, 120, 30);
      if (GuiButton(rect.ref, "#191#Show Message".toC).toBool()) {
        showMessageBox = true;
      }

      if (showMessageBox)
      {
        rect.ref.set(85, 70, 250, 100);
        int result = GuiMessageBox(
          rect.ref,
          "#191#Message Box".toC,
          "Hi! This is a message!".toC,
          "Nice;Cool".toC
        );

        if (result >= 0) {
          showMessageBox = false;
        }
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}