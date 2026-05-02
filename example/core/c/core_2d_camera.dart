// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera.c
// Run it: dart run core_2d_camera.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_BUILDINGS = 100;

void main() {
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_2d_camera'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final player = rl.Temp.Rectangle$.At('player');
  player.ref.x = 400;
  player.ref.y = 280;
  player.ref.width = 40;
  player.ref.height = 40;

  final buildings = rl.Temp.Rectangle$.At('buildings', MAX_BUILDINGS);
  final colors = rl.Temp.Color$.At('colors', MAX_BUILDINGS);

  int spacing = 0;
  for (int i = 0; i < MAX_BUILDINGS; i++) {
    buildings[i].width = rl.Core.GetRandomValue(50, 200).toDouble();
    buildings[i].height = rl.Core.GetRandomValue(100, 800).toDouble();
    buildings[i].y = screenHeight - 130 - buildings[i].height;
    buildings[i].x = (-6000 + spacing).toDouble();

    spacing += buildings[i].width.toInt();

    colors[i].r = rl.Core.GetRandomValue(200, 240);
    colors[i].g = rl.Core.GetRandomValue(200, 240);
    colors[i].b = rl.Core.GetRandomValue(200, 240);
    colors[i].a = 255;
  }

  final camera = rl.Temp.Camera2D$.At('camera');
  camera.ref.target.set(player.ref.x + 20, player.ref.y + 20);
  camera.ref.offset.set(screenWidth / 2, screenHeight / 2);
  camera.ref.rotation = 0;
  camera.ref.zoom = 1;

  while (!rl.Core.WindowShouldClose()) {
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT.value)) {
      player.ref.x += 2;
    } else if (rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT.value)) {
      player.ref.x -= 2;
    }

    camera.ref.target.set(player.ref.x + 20, player.ref.y + 20);

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_A.value)) {
      camera.ref.rotation--;
    } else if (rl.Core.IsKeyDown(KeyboardKey.KEY_S.value)) {
      camera.ref.rotation++;
    }

    if (camera.ref.rotation > 40) {
      camera.ref.rotation = 40;
    } else if (camera.ref.rotation < -40) {
      camera.ref.rotation = -40;
    }

    camera.ref.zoom = math.exp(math.log(camera.ref.zoom) + (rl.Core.GetMouseWheelMove()*0.1));

    if (camera.ref.zoom > 3.0) {
      camera.ref.zoom = 3.0;
    } else if (camera.ref.zoom < 0.1) {
      camera.ref.zoom = 0.1;
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_R.value)) {
      camera.ref.zoom = 1;
      camera.ref.rotation = 0;
    }

    rl.Core.BeginDrawing();

    rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.BeginMode2D(camera.ref);
        rl.Core.DrawRectangle(-6000, 320, 13000, 8000, rl.C.DARKGRAY);

        for (int i = 0; i < MAX_BUILDINGS; i++) {
          rl.Core.DrawRectangleRec(buildings[i], colors[i]);
        }

        rl.Core.DrawRectangleRec(player.ref, rl.C.RED);

        rl.Core.DrawLine(
          camera.ref.target.x.toInt(),
          -screenHeight*10,
          camera.ref.target.x.toInt(),
          screenHeight*10,
          rl.C.GREEN,
        );

        rl.Core.DrawLine(
          -screenWidth*10,
          camera.ref.target.y.toInt(),
          screenWidth*10,
          camera.ref.target.y.toInt(),
          rl.C.GREEN,
        );

      rl.Core.EndMode2D();

    rl.Core.DrawText("SCREEN AREA".toC, 640, 10, 20, rl.C.RED);

    rl.Core.DrawRectangle(0, 0, screenWidth, 5, rl.C.RED);
    rl.Core.DrawRectangle(0, 5, 5, screenHeight - 10, rl.C.RED);
    rl.Core.DrawRectangle(screenWidth - 5, 5, 5, screenHeight - 10, rl.C.RED);
    rl.Core.DrawRectangle(0, screenHeight - 5, screenWidth, 5, rl.C.RED);

    rl.Core.DrawRectangle(10, 10, 250, 113, rl.Core.Fade(rl.C.SKYBLUE, 0.5));
    rl.Core.DrawRectangleLines(10, 10, 250, 113, rl.C.BLUE);

    rl.Core.DrawText("Free 2D camera controls:".toC, 20, 20, 10, rl.C.BLACK);
    rl.Core.DrawText("- Right/Left to move player".toC, 40, 40, 10, rl.C.DARKGRAY);
    rl.Core.DrawText("- Mouse Wheel to Zoom in-out".toC, 40, 60, 10, rl.C.DARKGRAY);
    rl.Core.DrawText("- A / S to Rotate".toC, 40, 80, 10, rl.C.DARKGRAY);
    rl.Core.DrawText("- R to reset Zoom and Rotation".toC, 40, 100, 10, rl.C.DARKGRAY);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}