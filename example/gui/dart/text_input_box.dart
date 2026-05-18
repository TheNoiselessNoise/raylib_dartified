// Custom example, there's no original equivalent
// Run it: dart run list_view.dart
import '../../base.dart';

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(800, 450, "tab_bar");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  String value = 'Hello, World!';

  bool? secretViewActive = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.WHITE);

      final (result, newValue, newSecretViewActive) = rl.GuiD.GuiTextInputBox(
        .rect(50, 50, 200, 120),
        'Title', // title, can be null
        'Some message', // message, can be null
        'OK', // buttons ';' seperated
        value, // text, can be null
        255, // textMaxSize
        secretViewActive, // secretViewActive, boolean, can be null
      );
      value = newValue;
      secretViewActive = newSecretViewActive;

      rl.CoreD.DrawText("RESULT: $result (0 = X button, 1 = OK button)", 50, 200, 20, .BLACK);
      rl.CoreD.DrawText("VALUE: $value", 50, 230, 20, .BLACK);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}