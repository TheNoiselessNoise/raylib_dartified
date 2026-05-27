// Run it: dart run temp_dart_string.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  // .toUnsafeC() is deprecated to make you not accidentally use it per-frame
  // but in this case, we are not in any loop, so it's safe
  // ignore: deprecated_member_use_from_same_package
  rl.Core.InitWindow(screenWidth, screenHeight, "temp_dart_string".toUnsafeC());
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final inGameText = rl.Temp.String$.ValueAt("inGameText", "inGameText: I am also not leaking any memory!");

  rl.Temp.String$.ValueAt("inGameText2", "inGameText2: I am also not leaking any memory!");

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      // per-frame strings (we are inside while loop), you must use rl.Temp.String$.Value or rl.Temp.String$.ValueAt
      // don't use .toUnsafeC() here, you will leak memory
      
      // WRONG!!!
      // rl.Core.DrawText("toUnsafeC: I am leaking memory".toUnsafeC(), 50, 50, 20, rl.Color.BLACK);
      
      // CORRECT!!!
      rl.Core.DrawText(
        rl.Temp.String$.Value("rl.Temp.str: I am not leaking any memory!"),
        50, 100, 20, rl.Color.BLACK
      );

      // CORRECT!!!
      rl.Core.DrawText(
        rl.Temp.String$.ValueAt("perFrameInGameText", "perFrameInGameText: I am also not leaking any memory!"),
        50, 150, 20, rl.Color.BLACK
      );
      // NOTE: we can reference rl.Temp.String$.ValueAt("perFrameInGameText") later

      // CORRECT!!!
      rl.Core.DrawText(inGameText, 50, 200, 20, rl.Color.BLACK);

      // CORRECT!!!
      rl.Core.DrawText(rl.Temp.String$.ValueAt('inGameText2'), 50, 250, 20, rl.Color.BLACK);

      // NOTE: Raylib examples (only) comes with String.toC getter which relies on loaded Raylib instance
      // NOTE: It is used throughout the examples to save some typing :)
      // CORRECT!!!
      rl.Core.DrawText('String.toC getter: I am also not leaking any memory!'.toC, 50, 300, 20, rl.Color.BLACK);

      final stringArray = rl.Temp.String$.Array(['i: 1', 'i: 2', 'i: 3']);//, key: 'myArray');
      for (int i = 0; i < 3; i++) {
        rl.Core.DrawText(stringArray[i], 100*i + 50, 350, 20, rl.Color.BLACK);
      }

    rl.Core.EndDrawing();
  }

  rl.Core.CloseWindow();
  // automatically disposes all rl.Temp allocations
  rl.dispose();

  // or in a single call
  // rl.CloseWindowAndDispose();
}