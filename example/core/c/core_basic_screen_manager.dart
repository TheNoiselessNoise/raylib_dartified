// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_screen_manager.c
// Run it: dart run core_basic_screen_manager.dart
import '../../base_c.dart';

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
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_basic_screen_manager".toC);
  SetTargetFPS(60);

  while (!WindowShouldClose()) {
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
          IsKeyPressed(KeyboardKey.KEY_ENTER.value) ||
          IsGestureDetected(Gesture.GESTURE_TAP.value)
        ) {
          currentScreen = .gameplay;
        }
        break;
      case .gameplay:
        if (
          IsKeyPressed(KeyboardKey.KEY_ENTER.value) ||
          IsGestureDetected(Gesture.GESTURE_TAP.value)
        ) {
          currentScreen = .ending;
        }
        break;
      case .ending:
        if (
          IsKeyPressed(KeyboardKey.KEY_ENTER.value) ||
          IsGestureDetected(Gesture.GESTURE_TAP.value)
        ) {
          currentScreen = .title;
        }
        break;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      switch(currentScreen)
      {
        case .logo:
          DrawText(
            "LOGO SCREEN".toC,
            20, 20, 40, LIGHTGRAY
          );
          DrawText(
            "WAIT for 2 SECONDS...".toC,
            290, 220, 20, GRAY
          );
          break;
        case .title:
          DrawRectangle(0, 0, screenWidth, screenHeight, GREEN);
          DrawText(
            "TITLE SCREEN".toC,
            20, 20, 40, DARKGREEN
          );
          DrawText(
            "PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN".toC,
            120, 220, 20, DARKGREEN
          );
          break;
        case .gameplay:
          DrawRectangle(0, 0, screenWidth, screenHeight, PURPLE);
          DrawText(
            "GAMEPLAY SCREEN".toC,
            20, 20, 40, MAROON
          );
          DrawText(
            "PRESS ENTER or TAP to JUMP to ENDING SCREEN".toC,
            130, 220, 20, MAROON
          );
          break;
        case .ending:
          DrawRectangle(0, 0, screenWidth, screenHeight, BLUE);
          DrawText(
            "ENDING SCREEN".toC,
            20, 20, 40, DARKBLUE
          );
          DrawText(
            "PRESS ENTER or TAP to RETURN to TITLE SCREEN".toC,
            120, 220, 20, DARKBLUE
          );
          break;
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}
