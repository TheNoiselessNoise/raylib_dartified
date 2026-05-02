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

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_basic_screen_manager');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  while (!rl.CoreD.WindowShouldClose()) {
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
          rl.CoreD.IsKeyPressed(.KEY_ENTER) ||
          rl.CoreD.IsGestureDetected(.GESTURE_TAP)
        ) {
          currentScreen = .gameplay;
        }
        break;
      case .gameplay:
        if (
          rl.CoreD.IsKeyPressed(.KEY_ENTER) ||
          rl.CoreD.IsGestureDetected(.GESTURE_TAP)
        ) {
          currentScreen = .ending;
        }
        break;
      case .ending:
        if (
          rl.CoreD.IsKeyPressed(.KEY_ENTER) ||
          rl.CoreD.IsGestureDetected(.GESTURE_TAP)
        ) {
          currentScreen = .title;
        }
        break;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      switch(currentScreen)
      {
        case .logo:
          rl.CoreD.DrawText(
            "LOGO SCREEN",
            20, 20, 40, .LIGHTGRAY
          );
          rl.CoreD.DrawText(
            "WAIT for 2 SECONDS...",
            290, 220, 20, .GRAY
          );
          break;
        case .title:
          rl.CoreD.DrawRectangle(0, 0, screenWidth, screenHeight, .GREEN);
          rl.CoreD.DrawText(
            "TITLE SCREEN",
            20, 20, 40, .DARKGREEN
          );
          rl.CoreD.DrawText(
            "PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN",
            120, 220, 20, .DARKGREEN
          );
          break;
        case .gameplay:
          rl.CoreD.DrawRectangle(0, 0, screenWidth, screenHeight, .PURPLE);
          rl.CoreD.DrawText(
            "GAMEPLAY SCREEN",
            20, 20, 40, .MAROON
          );
          rl.CoreD.DrawText(
            "PRESS ENTER or TAP to JUMP to ENDING SCREEN",
            130, 220, 20, .MAROON
          );
          break;
        case .ending:
          rl.CoreD.DrawRectangle(0, 0, screenWidth, screenHeight, .BLUE);
          rl.CoreD.DrawText(
            "ENDING SCREEN",
            20, 20, 40, .DARKBLUE
          );
          rl.CoreD.DrawText(
            "PRESS ENTER or TAP to RETURN to TITLE SCREEN",
            120, 220, 20, .DARKBLUE
          );
          break;
      }

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}
