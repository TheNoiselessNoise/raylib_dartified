// Run it: dart run temp_dart_string.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  // .toUnsafeC() is deprecated to make you not accidentally use it per-frame
  // but in this case, we are not in any loop, so it's safe
  // ignore: deprecated_member_use_from_same_package
  InitWindow(screenWidth, screenHeight, "temp_dart_string".toUnsafeC());
  SetTargetFPS(60);

  final inGameText = String$.ValueAt("inGameText", "inGameText: I am also not leaking any memory!");

  String$.ValueAt("inGameText2", "inGameText2: I am also not leaking any memory!");

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(RAYWHITE);

      // per-frame strings (we are inside while loop), you must use String$.Value or String$.ValueAt
      // don't use .toUnsafeC() here, you will leak memory
      
      // WRONG!!!
      // DrawText("toUnsafeC: I am leaking memory".toUnsafeC(), 50, 50, 20, BLACK);
      
      // CORRECT!!!
      DrawText(
        String$.Value("str: I am not leaking any memory!"),
        50, 100, 20, BLACK
      );

      // CORRECT!!!
      DrawText(
        String$.ValueAt("perFrameInGameText", "perFrameInGameText: I am also not leaking any memory!"),
        50, 150, 20, BLACK
      );
      // NOTE: we can reference String$.ValueAt("perFrameInGameText") later

      // CORRECT!!!
      DrawText(inGameText, 50, 200, 20, BLACK);

      // CORRECT!!!
      DrawText(String$.ValueAt('inGameText2'), 50, 250, 20, BLACK);

      // NOTE: Raylib examples (only) comes with String.toC getter which relies on loaded Raylib instance
      // NOTE: It is used throughout the examples to save some typing :)
      // CORRECT!!!
      DrawText('String.toC getter: I am also not leaking any memory!'.toC, 50, 300, 20, BLACK);

      final stringArray = String$.Array(['i: 1', 'i: 2', 'i: 3']);//, key: 'myArray');
      for (int i = 0; i < 3; i++) {
        DrawText(stringArray[i], 100*i + 50, 350, 20, BLACK);
      }

    EndDrawing();
  }

  CloseWindow();
  // automatically disposes all rl.Temp allocations
  rl.dispose();

  // or in a single call
  // CloseWindowAndDispose();
}