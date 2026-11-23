// Custom example, there's no original equivalent
import '../../_example/dart.dart';

String value = 'Hello, World!';
bool secretViewActive = false;
GuiResult lastResult = .RESULT_NONE;
int lastBtnActive = 0;

void main() => runExample(
  init: (_) {
    InitWindow(800, 450, "text_input_box");
    SetTargetFPS(60);
  },
  loop: (_) async {
    BeginDrawing();

      ClearBackground(.WHITE);

      {
        final (result, newValue, btnActive, secret) = GuiTextInputBox(
          .rect(50, 50, 200, 120),
          'Title', // title, can be null
          'Some message', // message, can be null
          value, // text, can be null
          255, // textSize
          'OK', // buttons ';' seperated
          secretViewActive, // secretViewActive, boolean, can be omitted
        );
        lastResult = result;
        value = newValue;
        lastBtnActive = btnActive;
        secretViewActive = secret!;
      }

      DrawText("RESULT: ${lastResult.value} BTN_ACTIVE: $lastBtnActive", 50, 200, 20, .BLACK);
      DrawText("VALUE: $value", 50, 230, 20, .BLACK);

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);