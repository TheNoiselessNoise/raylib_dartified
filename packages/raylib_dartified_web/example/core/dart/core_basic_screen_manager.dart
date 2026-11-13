// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_screen_manager.c
import '../../base_dart.dart';

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

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "core_basic_screen_manager");
  SetTargetFPS(60);

  rl.setMainLoop(() {
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
          IsKeyPressed(.KEY_ENTER) ||
          IsGestureDetected(.GESTURE_TAP)
        ) {
          currentScreen = .gameplay;
        }
        break;
      case .gameplay:
        if (
          IsKeyPressed(.KEY_ENTER) ||
          IsGestureDetected(.GESTURE_TAP)
        ) {
          currentScreen = .ending;
        }
        break;
      case .ending:
        if (
          IsKeyPressed(.KEY_ENTER) ||
          IsGestureDetected(.GESTURE_TAP)
        ) {
          currentScreen = .title;
        }
        break;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      switch(currentScreen)
      {
        case .logo:
          DrawText(
            "LOGO SCREEN",
            20, 20, 40, .LIGHTGRAY
          );
          DrawText(
            "WAIT for 2 SECONDS...",
            290, 220, 20, .GRAY
          );
          break;
        case .title:
          DrawRectangle(0, 0, screenWidth, screenHeight, .GREEN);
          DrawText(
            "TITLE SCREEN",
            20, 20, 40, .DARKGREEN
          );
          DrawText(
            "PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN",
            120, 220, 20, .DARKGREEN
          );
          break;
        case .gameplay:
          DrawRectangle(0, 0, screenWidth, screenHeight, .PURPLE);
          DrawText(
            "GAMEPLAY SCREEN",
            20, 20, 40, .MAROON
          );
          DrawText(
            "PRESS ENTER or TAP to JUMP to ENDING SCREEN",
            130, 220, 20, .MAROON
          );
          break;
        case .ending:
          DrawRectangle(0, 0, screenWidth, screenHeight, .BLUE);
          DrawText(
            "ENDING SCREEN",
            20, 20, 40, .DARKBLUE
          );
          DrawText(
            "PRESS ENTER or TAP to RETURN to TITLE SCREEN",
            120, 220, 20, .DARKBLUE
          );
          break;
      }

    EndDrawing();
  });
});