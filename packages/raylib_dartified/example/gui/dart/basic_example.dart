// Custom example, there's no original equivalent
// Run it: dart run basic_example.dart
import '../../base_dart.dart';

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(400, 200, "basic_example");
  SetTargetFPS(60);

  bool showMessageBox = false;

  while (!WindowShouldClose())
  {
    BeginDrawing();

      final style = GuiGetStyle(.DEFAULT, GuiDefaultProperty.BACKGROUND_COLOR);
      ClearBackground(GetColor(style));

      if (GuiButton(.rect(24, 24, 120, 30), "#191#Show Message") != .RESULT_NONE)
        showMessageBox = true;

      if (showMessageBox)
      {
        final (result, btnActive) = GuiMessageBox(
          .rect(85, 70, 250, 100),
          "#191#Message Box",
          "Hi! This is a message!",
          "Nice;Cool"
        );

        if (result != .RESULT_NONE) {
          showMessageBox = false;
        }
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}