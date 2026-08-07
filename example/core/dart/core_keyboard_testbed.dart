// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_keyboard_testbed.c
// Run it: dart run core_keyboard_testbed.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int KEY_REC_SPACING = 4;

int _k(KeyboardKey k) => k.value;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_keyboard_testbed");
  SetTargetFPS(60);
  SetExitKey(.KEY_NULL);

  // Keyboard line 01
  List<int> line01KeyWidths = .filled(15, 0);
  for (int i = 0; i < 15; i++) line01KeyWidths[i] = 45;
  line01KeyWidths[13] = 62;   // PRINTSCREEN
  List<int> line01Keys = [
    _k(.KEY_ESCAPE), _k(.KEY_F1), _k(.KEY_F2), _k(.KEY_F3), _k(.KEY_F4), _k(.KEY_F5),
    _k(.KEY_F6), _k(.KEY_F7), _k(.KEY_F8), _k(.KEY_F9), _k(.KEY_F10), _k(.KEY_F11),
    _k(.KEY_F12), _k(.KEY_PRINT_SCREEN), _k(.KEY_PAUSE)
  ];

  // Keyboard line 02
  List<int> line02KeyWidths = .filled(15, 0);
  for (int i = 0; i < 15; i++) line02KeyWidths[i] = 45;
  line02KeyWidths[0] = 25;    // GRAVE
  line02KeyWidths[13] = 82;   // BACKSPACE
  List<int> line02Keys = [
    _k(.KEY_GRAVE), _k(.KEY_ONE), _k(.KEY_TWO), _k(.KEY_THREE), _k(.KEY_FOUR),
    _k(.KEY_FIVE), _k(.KEY_SIX), _k(.KEY_SEVEN), _k(.KEY_EIGHT), _k(.KEY_NINE),
    _k(.KEY_ZERO), _k(.KEY_MINUS), _k(.KEY_EQUAL), _k(.KEY_BACKSPACE), _k(.KEY_DELETE)
  ];

  // Keyboard line 03
  List<int> line03KeyWidths = .filled(15, 0);
  for (int i = 0; i < 15; i++) line03KeyWidths[i] = 45;
  line03KeyWidths[0] = 50;    // TAB
  line03KeyWidths[13] = 57;   // BACKSLASH
  List<int> line03Keys = [
    _k(.KEY_TAB), _k(.KEY_Q), _k(.KEY_W), _k(.KEY_E), _k(.KEY_R), _k(.KEY_T), _k(.KEY_Y),
    _k(.KEY_U), _k(.KEY_I), _k(.KEY_O), _k(.KEY_P), _k(.KEY_LEFT_BRACKET),
    _k(.KEY_RIGHT_BRACKET), _k(.KEY_BACKSLASH), _k(.KEY_INSERT)
  ];

  // Keyboard line 04
  List<int> line04KeyWidths = .filled(14, 0);
  for (int i = 0; i < 14; i++) line04KeyWidths[i] = 45;
  line04KeyWidths[0] = 68;    // CAPS
  line04KeyWidths[12] = 88;   // ENTER
  List<int> line04Keys = [
    _k(.KEY_CAPS_LOCK), _k(.KEY_A), _k(.KEY_S), _k(.KEY_D), _k(.KEY_F), _k(.KEY_G),
    _k(.KEY_H), _k(.KEY_J), _k(.KEY_K), _k(.KEY_L), _k(.KEY_SEMICOLON),
    _k(.KEY_APOSTROPHE), _k(.KEY_ENTER), _k(.KEY_PAGE_UP)
  ];

  // Keyboard line 05
  List<int> line05KeyWidths = .filled(14, 0);
  for (int i = 0; i < 14; i++) line05KeyWidths[i] = 45;
  line05KeyWidths[0] = 80;    // LSHIFT
  line05KeyWidths[11] = 76;   // RSHIFT
  List<int> line05Keys = [
    _k(.KEY_LEFT_SHIFT), _k(.KEY_Z), _k(.KEY_X), _k(.KEY_C), _k(.KEY_V), _k(.KEY_B),
    _k(.KEY_N), _k(.KEY_M), _k(.KEY_COMMA), _k(.KEY_PERIOD), /*_k(.KEY_MINUS)*/
    _k(.KEY_SLASH), _k(.KEY_RIGHT_SHIFT), _k(.KEY_UP), _k(.KEY_PAGE_DOWN)
  ];

  // Keyboard line 06
  List<int> line06KeyWidths = .filled(11, 0);
  for (int i = 0; i < 11; i++) line06KeyWidths[i] = 45;
  line06KeyWidths[0] = 80;    // LCTRL
  line06KeyWidths[3] = 208;   // SPACE
  line06KeyWidths[7] = 60;    // RCTRL
  List<int> line06Keys = [
    _k(.KEY_LEFT_CONTROL), _k(.KEY_LEFT_SUPER), _k(.KEY_LEFT_ALT),
    _k(.KEY_SPACE), _k(.KEY_RIGHT_ALT), 162, _k(.KEY_NULL),
    _k(.KEY_RIGHT_CONTROL), _k(.KEY_LEFT), _k(.KEY_DOWN), _k(.KEY_RIGHT)
  ];

  final keyboardOffset = Vector2$.$new.set(26, 80);

  while (!WindowShouldClose()) {
    int key = GetKeyPressed();
    if (key > 0) TraceLog(.LOG_INFO, "KEYBOARD TESTBED: KEY PRESSED:    $key");

    int ch = GetCharPressed();
    if (ch > 0) TraceLog(.LOG_INFO, "KEYBOARD TESTBED: CHAR PRESSED:   ${String.fromCharCode(ch)} ($ch)");

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("KEYBOARD LAYOUT: ENG-US", 26, 38, 20, LIGHTGRAY);

      // Keyboard line 01 - 15 keys
      // ESC, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, IMP, CLOSE
      for (int i = 0, recOffsetX = 0; i < 15; i++)
      {
        GuiKeyboardKey(
          .rect(keyboardOffset.x + recOffsetX, keyboardOffset.y, line01KeyWidths[i], 30.0),
          line01Keys[i]
        );
        recOffsetX += line01KeyWidths[i] + KEY_REC_SPACING;
      }

      // Keyboard line 02 - 15 keys
      // `, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, -, =, BACKSPACE, DEL
      for (int i = 0, recOffsetX = 0; i < 15; i++)
      {
        GuiKeyboardKey(
          .rect(keyboardOffset.x + recOffsetX, keyboardOffset.y + 30 + KEY_REC_SPACING, line02KeyWidths[i], 38.0),
          line02Keys[i]
        );
        recOffsetX += line02KeyWidths[i] + KEY_REC_SPACING;
      }

      // Keyboard line 03 - 15 keys
      // TAB, Q, W, E, R, T, Y, U, I, O, P, [, ], \, INS
      for (int i = 0, recOffsetX = 0; i < 15; i++)
      {
        GuiKeyboardKey(
          .rect(keyboardOffset.x + recOffsetX, keyboardOffset.y + 30 + 38 + KEY_REC_SPACING*2, line03KeyWidths[i], 38.0),
          line03Keys[i]
        );
        recOffsetX += line03KeyWidths[i] + KEY_REC_SPACING;
      }

      // Keyboard line 04 - 14 keys
      // MAYUS, A, S, D, F, G, H, J, K, L, ;, ', ENTER, REPAG
      for (int i = 0, recOffsetX = 0; i < 14; i++)
      {
        GuiKeyboardKey(
          .rect(keyboardOffset.x + recOffsetX, keyboardOffset.y + 30 + 38*2 + KEY_REC_SPACING*3, line04KeyWidths[i], 38.0),
          line04Keys[i]
        );
        recOffsetX += line04KeyWidths[i] + KEY_REC_SPACING;
      }

      // Keyboard line 05 - 14 keys
      // LSHIFT, Z, X, C, V, B, N, M, ,, ., /, RSHIFT, UP, AVPAG
      for (int i = 0, recOffsetX = 0; i < 14; i++)
      {
        GuiKeyboardKey(
          .rect(keyboardOffset.x + recOffsetX, keyboardOffset.y + 30 + 38*3 + KEY_REC_SPACING*4, line05KeyWidths[i], 38.0),
          line05Keys[i]
        );
        recOffsetX += line05KeyWidths[i] + KEY_REC_SPACING;
      }

      // Keyboard line 06 - 11 keys
      // LCTRL, WIN, LALT, SPACE, ALTGR, \, FN, RCTRL, LEFT, DOWN, RIGHT
      for (int i = 0, recOffsetX = 0; i < 11; i++)
      {
        GuiKeyboardKey(
          .rect(keyboardOffset.x + recOffsetX, keyboardOffset.y + 30 + 38*4 + KEY_REC_SPACING*5, line06KeyWidths[i], 38.0),
          line06Keys[i]
        );
        recOffsetX += line06KeyWidths[i] + KEY_REC_SPACING;
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}

String GetKeyText(int key){
  try {
    return KeyboardKey.fromValue(key).name.split('_').last;
  } catch (_) {
    return "";
  }
}

void GuiKeyboardKey(RectangleD bounds, int key)
{
  if (key == KeyboardKey.KEY_NULL.value) DrawRectangleLinesEx(bounds, 2.0, LIGHTGRAY);
  else
  {
    if (rl.Core.IsKeyDown(key)) // use the FFI version
    {
      DrawRectangleLinesEx(bounds, 2.0, MAROON);
      DrawText(GetKeyText(key), (bounds.x + 4).toInt(), (bounds.y + 4).toInt(), 10, MAROON);
    }
    else
    {
      DrawRectangleLinesEx(bounds, 2.0, DARKGRAY);
      DrawText(GetKeyText(key), (bounds.x + 4).toInt(), (bounds.y + 4).toInt(), 10, DARKGRAY);
    }
  }

  if (CheckCollisionPointRec(GetMousePosition(), bounds))
  {
    DrawRectangleRec(bounds, Fade(RED, 0.2));
    DrawRectangleLinesEx(bounds, 3.0, RED);
  }
}