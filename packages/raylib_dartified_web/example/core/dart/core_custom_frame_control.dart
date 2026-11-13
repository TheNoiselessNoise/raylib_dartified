// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_custom_frame_control.c
// WARNING: requires raylib to be built with SUPPORT_CUSTOM_FRAME_CONTROL=1
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "core_custom_frame_control");
  SetWindowMonitor(0);

  double previousTime = GetTime();
  double currentTime = 0.0;
  double updateDrawTime = 0.0;
  double waitTime = 0.0;
  double deltaTime = 0.0;

  double timeCounter = 0.0;
  double position = 0.0;
  bool pause = false;

  int targetFPS = 60;      

  rl.setMainLoop(() {
    // #ifndef PLATFORM_WEB
    //   PollInputEvents();
    // #endif

    if (IsKeyPressed(.KEY_SPACE)) pause = !pause;

    if (IsKeyPressed(.KEY_UP)) targetFPS += 20;
    else if (IsKeyPressed(.KEY_DOWN)) targetFPS -= 20;

    if (targetFPS < 0) targetFPS = 0;

    if (!pause)
    {
      position += 200*deltaTime;
      if (position >= GetScreenWidth()) position = 0;
      timeCounter += deltaTime;
    }

    // #ifdef PLATFORM_WEB
    //   PollInputEvents();
    // #endif

    BeginDrawing();

      ClearBackground(RAYWHITE);

      for (int i = 0; i < GetScreenWidth()/200; i++) DrawRectangle(200*i, 0, 1, GetScreenHeight(), SKYBLUE);

      DrawCircle(position.toInt(), GetScreenHeight()~/2 - 25, 50, RED);

      DrawText("${(timeCounter*1000).f0} ms", (position - 40).toInt(), GetScreenHeight()~/2 - 100, 20, MAROON);
      DrawText("PosX: ${position.f0}", (position - 50).toInt(), GetScreenHeight()~/2 + 40, 20, BLACK);

      DrawText("Circle is moving at a constant 200 pixels/sec,\nindependently of the frame rate.", 10, 10, 20, DARKGRAY);
      DrawText("PRESS SPACE to PAUSE MOVEMENT", 10, GetScreenHeight() - 60, 20, GRAY);
      DrawText("PRESS UP | DOWN to CHANGE TARGET FPS", 10, GetScreenHeight() - 30, 20, GRAY);
      DrawText("TARGET FPS: $targetFPS", GetScreenWidth() - 220, 10, 20, LIME);
      if (deltaTime != 0)
      {
        DrawText("CURRENT FPS: ${1.0/deltaTime}", GetScreenWidth() - 220, 40, 20, GREEN);
      }

    EndDrawing();

    SwapScreenBuffer();

    currentTime = GetTime();
    updateDrawTime = currentTime - previousTime;

    if (targetFPS > 0)
    {
      waitTime = (1.0/targetFPS) - updateDrawTime;
      if (waitTime > 0.0)
      {
        WaitTime(waitTime);
        currentTime = GetTime();
        deltaTime = currentTime - previousTime;
      }
    }
    else deltaTime = updateDrawTime;

    previousTime = currentTime;
  });
});