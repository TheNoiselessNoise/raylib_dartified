// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera.c
// Run it: dart run core_2d_camera.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_BUILDINGS = 100;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_2d_camera".toC);
  SetTargetFPS(60);

  final player = Rectangle$.val.At('player');
  player.ref.x = 400;
  player.ref.y = 280;
  player.ref.width = 40;
  player.ref.height = 40;

  final buildings = Rectangle$.val.At('buildings', MAX_BUILDINGS);
  final colors = Color$.val.At('colors', MAX_BUILDINGS);

  int spacing = 0;
  for (int i = 0; i < MAX_BUILDINGS; i++) {
    buildings[i].width = GetRandomValue(50, 200).toDouble();
    buildings[i].height = GetRandomValue(100, 800).toDouble();
    buildings[i].y = screenHeight - 130 - buildings[i].height;
    buildings[i].x = (-6000 + spacing).toDouble();

    spacing += buildings[i].width.toInt();

    colors[i].r = GetRandomValue(200, 240);
    colors[i].g = GetRandomValue(200, 240);
    colors[i].b = GetRandomValue(200, 240);
    colors[i].a = 255;
  }

  final camera = Camera2D$.val.$newPtr;
  camera.ref.target.set(player.ref.x + 20, player.ref.y + 20);
  camera.ref.offset.set(screenWidth / 2, screenHeight / 2);
  camera.ref.rotation = 0;
  camera.ref.zoom = 1;

  while (!WindowShouldClose()) {
    if (IsKeyDown(KeyboardKey.KEY_RIGHT.value)) {
      player.ref.x += 2;
    } else if (IsKeyDown(KeyboardKey.KEY_LEFT.value)) {
      player.ref.x -= 2;
    }

    camera.ref.target.set(player.ref.x + 20, player.ref.y + 20);

    if (IsKeyDown(KeyboardKey.KEY_A.value)) {
      camera.ref.rotation--;
    } else if (IsKeyDown(KeyboardKey.KEY_S.value)) {
      camera.ref.rotation++;
    }

    if (camera.ref.rotation > 40) {
      camera.ref.rotation = 40;
    } else if (camera.ref.rotation < -40) {
      camera.ref.rotation = -40;
    }

    camera.ref.zoom = math.exp(math.log(camera.ref.zoom) + (GetMouseWheelMove()*0.1));

    if (camera.ref.zoom > 3.0) {
      camera.ref.zoom = 3.0;
    } else if (camera.ref.zoom < 0.1) {
      camera.ref.zoom = 0.1;
    }

    if (IsKeyPressed(KeyboardKey.KEY_R.value)) {
      camera.ref.zoom = 1;
      camera.ref.rotation = 0;
    }

    BeginDrawing();

    ClearBackground(RAYWHITE);

      BeginMode2D(camera.ref);
        DrawRectangle(-6000, 320, 13000, 8000, DARKGRAY);

        for (int i = 0; i < MAX_BUILDINGS; i++) {
          DrawRectangleRec(buildings[i], colors[i]);
        }

        DrawRectangleRec(player.ref, RED);

        DrawLine(
          camera.ref.target.x.toInt(),
          -screenHeight*10,
          camera.ref.target.x.toInt(),
          screenHeight*10,
          GREEN,
        );

        DrawLine(
          -screenWidth*10,
          camera.ref.target.y.toInt(),
          screenWidth*10,
          camera.ref.target.y.toInt(),
          GREEN,
        );

      EndMode2D();

    DrawText("SCREEN AREA".toC, 640, 10, 20, RED);

    DrawRectangle(0, 0, screenWidth, 5, RED);
    DrawRectangle(0, 5, 5, screenHeight - 10, RED);
    DrawRectangle(screenWidth - 5, 5, 5, screenHeight - 10, RED);
    DrawRectangle(0, screenHeight - 5, screenWidth, 5, RED);

    DrawRectangle(10, 10, 250, 113, Fade(SKYBLUE, 0.5));
    DrawRectangleLines(10, 10, 250, 113, BLUE);

    DrawText("Free 2D camera controls:".toC, 20, 20, 10, BLACK);
    DrawText("- Right/Left to move player".toC, 40, 40, 10, DARKGRAY);
    DrawText("- Mouse Wheel to Zoom in-out".toC, 40, 60, 10, DARKGRAY);
    DrawText("- A / S to Rotate".toC, 40, 80, 10, DARKGRAY);
    DrawText("- R to reset Zoom and Rotation".toC, 40, 100, 10, DARKGRAY);

    EndDrawing();
  }

  CloseWindowAndDispose();
}