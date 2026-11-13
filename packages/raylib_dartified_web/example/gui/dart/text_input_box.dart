// Custom example, there's no original equivalent
import '../../base_dart.dart';

void main() => Raylib((rl) {
  InitWindow(800, 450, "text_input_box");
  SetWindowMonitor(0);
  SetTargetFPS(60);

  String value = 'Hello, World!';

  bool secretViewActive = false;
  GuiResult lastResult = .RESULT_NONE;
  int lastBtnActive = 0;

  rl.setMainLoop(() {
    BeginDrawing();

      ClearBackground(.WHITE);

      (lastResult, value, lastBtnActive, secretViewActive!) = GuiTextInputBox(
        .rect(50, 50, 200, 120),
        'Title', // title, can be null
        'Some message', // message, can be null
        value, // text, can be null
        255, // textSize
        'OK', // buttons ';' seperated
        secretViewActive, // secretViewActive, boolean, can be omitted
      );

      DrawText("RESULT: ${lastResult.value} BTN_ACTIVE: $lastBtnActive", 50, 200, 20, .BLACK);
      DrawText("VALUE: $value", 50, 230, 20, .BLACK);

    EndDrawing();
  });
});