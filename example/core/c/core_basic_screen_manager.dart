// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_screen_manager.c
// Run it: dart run core_basic_screen_manager.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

enum GameScreen {
  logo,
  title,
  gameplay,
  ending
}

GameScreen currentScreen = .logo;
int framesCounter = 0;

void main() {
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_basic_screen_manager'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  while (!rl.Core.WindowShouldClose()) {
    switch (currentScreen) {
      case .logo:
        framesCounter++;

        if (framesCounter > 120)
        {
          currentScreen = .title;
        }
        break;
      case .title:
        if (
          rl.Core.IsKeyPressed(KeyboardKey.KEY_ENTER.value) ||
          rl.Core.IsGestureDetected(Gesture.GESTURE_TAP.value)
        ) {
          currentScreen = .gameplay;
        }
        break;
      case .gameplay:
        if (
          rl.Core.IsKeyPressed(KeyboardKey.KEY_ENTER.value) ||
          rl.Core.IsGestureDetected(Gesture.GESTURE_TAP.value)
        ) {
          currentScreen = .ending;
        }
        break;
      case .ending:
        if (
          rl.Core.IsKeyPressed(KeyboardKey.KEY_ENTER.value) ||
          rl.Core.IsGestureDetected(Gesture.GESTURE_TAP.value)
        ) {
          currentScreen = .title;
        }
        break;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      switch(currentScreen)
      {
        case .logo:
          rl.Core.DrawText(
            "LOGO SCREEN".toC,
            20, 20, 40, rl.Color.LIGHTGRAY
          );
          rl.Core.DrawText(
            "WAIT for 2 SECONDS...".toC,
            290, 220, 20, rl.Color.GRAY
          );
          break;
        case .title:
          rl.Core.DrawRectangle(0, 0, screenWidth, screenHeight, rl.Color.GREEN);
          rl.Core.DrawText(
            "TITLE SCREEN".toC,
            20, 20, 40, rl.Color.DARKGREEN
          );
          rl.Core.DrawText(
            "PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN".toC,
            120, 220, 20, rl.Color.DARKGREEN
          );
          break;
        case .gameplay:
          rl.Core.DrawRectangle(0, 0, screenWidth, screenHeight, rl.Color.PURPLE);
          rl.Core.DrawText(
            "GAMEPLAY SCREEN".toC,
            20, 20, 40, rl.Color.MAROON
          );
          rl.Core.DrawText(
            "PRESS ENTER or TAP to JUMP to ENDING SCREEN".toC,
            130, 220, 20, rl.Color.MAROON
          );
          break;
        case .ending:
          rl.Core.DrawRectangle(0, 0, screenWidth, screenHeight, rl.Color.BLUE);
          rl.Core.DrawText(
            "ENDING SCREEN".toC,
            20, 20, 40, rl.Color.DARKBLUE
          );
          rl.Core.DrawText(
            "PRESS ENTER or TAP to RETURN to TITLE SCREEN".toC,
            120, 220, 20, rl.Color.DARKBLUE
          );
          break;
      }

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}
