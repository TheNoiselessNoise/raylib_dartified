// Custom example, there's no original equivalent
// Run it: dart run list_view.dart
import '../../base_dart.dart';

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(800, 450, "tab_bar");
  SetTargetFPS(60);

  String value = 'Hello, World!';

  bool? secretViewActive = false;

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(.WHITE);

      int result;
      (result, value, secretViewActive!) = GuiTextInputBox(
        .rect(50, 50, 200, 120),
        'Title', // title, can be null
        'Some message', // message, can be null
        'OK', // buttons ';' seperated
        value, // text, can be null
        255, // textMaxSize
        secretViewActive, // secretViewActive, boolean, can be null
      );

      DrawText("RESULT: $result (0 = X button, 1 = OK button)", 50, 200, 20, .BLACK);
      DrawText("VALUE: $value", 50, 230, 20, .BLACK);

    EndDrawing();
  }

  CloseWindowAndDispose();
}