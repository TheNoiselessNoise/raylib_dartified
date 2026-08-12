// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_delta_time.c
// Run it: dart run core_delta_time.dart
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_delta_time".toC);

  int currentFps = 60;

  final deltaCircle = Vector2$.val.$new.set(0, screenHeight/3.0);
  final frameCircle = Vector2$.val.$new.set(0, screenHeight*(2.0/3.0));

  const double speed = 10.0;
  const double circleRadius = 32.0;

  SetTargetFPS(currentFps);

  while (!WindowShouldClose()) {
    double mouseWheel = GetMouseWheelMove();
    if (mouseWheel != 0)
    {
      currentFps += mouseWheel.toInt();
      if (currentFps < 0) currentFps = 0;
      SetTargetFPS(currentFps);
    }

    deltaCircle.x += GetFrameTime()*6.0*speed;

    frameCircle.x += 0.1*speed;

    if (deltaCircle.x > screenWidth) deltaCircle.x = 0;
    if (frameCircle.x > screenWidth) frameCircle.x = 0;

    if (IsKeyPressed(KeyboardKey.KEY_R.value))
    {
      deltaCircle.x = 0;
      frameCircle.x = 0;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawCircleV(deltaCircle, circleRadius, RED);
      DrawCircleV(frameCircle, circleRadius, BLUE);

      String fpsText = "FPS: ${GetFPS()} (target: $currentFps)";
      if (currentFps <= 0) fpsText = "FPS: unlimited (${GetFPS()})";
      DrawText(fpsText.toC, 10, 10, 20, DARKGRAY);
      DrawText("Frame time: ${GetFrameTime().f2} ms".toC, 10, 30, 20, DARKGRAY);
      DrawText("Use the scroll wheel to change the fps limit, r to reset".toC, 10, 50, 20, DARKGRAY);

      DrawText("FUNC: x += GetFrameTime()*speed".toC, 10, 90, 20, RED);
      DrawText("FUNC: x += speed".toC, 10, 240, 20, BLUE);

    EndDrawing();
  }

  CloseWindowAndDispose();
}